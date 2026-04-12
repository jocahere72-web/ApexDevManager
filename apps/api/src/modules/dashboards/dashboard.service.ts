// ---------------------------------------------------------------------------
// Dashboard & Observability Service (M17)
// ---------------------------------------------------------------------------

import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import type {
  DashboardOverview,
  ConnectionHealth,
  AIUsageStats,
  DeploymentStatus,
  ActivityItem,
  Alert,
  Incident,
  IncidentTimelineEntry,
  IncidentStatus,
  CreateIncidentRequest,
  ResolveIncidentRequest,
  HealthStatus,
  AlertSeverity,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Row mappers
// ---------------------------------------------------------------------------

function rowToAlert(row: Record<string, unknown>): Alert {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    severity: row.severity as AlertSeverity,
    title: row.title as string,
    message: row.message as string,
    source: row.source as string,
    metric: (row.metric as string) ?? undefined,
    threshold: (row.threshold as number) ?? undefined,
    currentValue: (row.current_value as number) ?? undefined,
    acknowledged: (row.acknowledged as boolean) ?? false,
    acknowledgedBy: (row.acknowledged_by as string) ?? undefined,
    acknowledgedAt: row.acknowledged_at ? (row.acknowledged_at as Date).toISOString() : undefined,
    resolvedAt: row.resolved_at ? (row.resolved_at as Date).toISOString() : undefined,
    createdAt: (row.created_at as Date).toISOString(),
  };
}

function rowToIncident(row: Record<string, unknown>, timeline: IncidentTimelineEntry[]): Incident {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    title: row.title as string,
    description: row.description as string,
    severity: row.severity as AlertSeverity,
    status: row.status as IncidentStatus,
    assignedTo: (row.assigned_to as string) ?? undefined,
    alertIds: (row.alert_ids as string[]) ?? [],
    timeline,
    rootCause: (row.root_cause as string) ?? undefined,
    resolution: (row.resolution as string) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
    resolvedAt: row.resolved_at ? (row.resolved_at as Date).toISOString() : undefined,
  };
}

// ---------------------------------------------------------------------------
// Get Dashboard Overview
// ---------------------------------------------------------------------------

/**
 * Aggregate all dashboard data: connections health, AI usage, deployments,
 * test coverage, active users, and recent activity.
 */
export async function getDashboardData(tenantId: string): Promise<DashboardOverview> {
  logger.info({ tenantId }, 'Fetching dashboard overview');

  // 1. Connection health
  const connResult = await pool.query(
    `SELECT id, name, status, last_tested_at, response_time_ms, error_message
     FROM connections WHERE tenant_id = $1`,
    [tenantId],
  );

  const connections: ConnectionHealth[] = connResult.rows.map((row) => ({
    connectionId: row.id as string,
    connectionName: row.name as string,
    status: (row.status as HealthStatus) ?? 'unknown',
    responseTimeMs: (row.response_time_ms as number) ?? 0,
    lastCheckedAt: row.last_tested_at ? (row.last_tested_at as Date).toISOString() : new Date().toISOString(),
    errorMessage: (row.error_message as string) ?? undefined,
  }));

  // 2. AI usage stats
  const todayStart = new Date();
  todayStart.setHours(0, 0, 0, 0);
  const monthStart = new Date();
  monthStart.setDate(1);
  monthStart.setHours(0, 0, 0, 0);

  const [aiTodayResult, aiMonthResult, convTodayResult] = await Promise.all([
    pool.query(
      `SELECT COALESCE(SUM(total_tokens), 0)::bigint AS tokens, COALESCE(SUM(estimated_cost_usd), 0)::numeric AS cost
       FROM ai_token_usage WHERE tenant_id = $1 AND created_at >= $2`,
      [tenantId, todayStart.toISOString()],
    ),
    pool.query(
      `SELECT COALESCE(SUM(total_tokens), 0)::bigint AS tokens, COALESCE(SUM(estimated_cost_usd), 0)::numeric AS cost,
              mode() WITHIN GROUP (ORDER BY model) AS top_model
       FROM ai_token_usage WHERE tenant_id = $1 AND created_at >= $2`,
      [tenantId, monthStart.toISOString()],
    ),
    pool.query(
      `SELECT COUNT(*)::int AS count FROM ai_conversations WHERE tenant_id = $1 AND created_at >= $2`,
      [tenantId, todayStart.toISOString()],
    ),
  ]);

  const aiUsage: AIUsageStats = {
    totalTokensToday: parseInt(aiTodayResult.rows[0].tokens as string, 10),
    totalTokensMonth: parseInt(aiMonthResult.rows[0].tokens as string, 10),
    conversationsToday: convTodayResult.rows[0].count as number,
    estimatedCostToday: parseFloat(aiTodayResult.rows[0].cost as string),
    estimatedCostMonth: parseFloat(aiMonthResult.rows[0].cost as string),
    topModel: (aiMonthResult.rows[0].top_model as string) ?? 'claude-sonnet-4-20250514',
  };

  // 3. Deployment stats (from audit_log or deployment table)
  const deployResult = await pool.query(
    `SELECT
       COUNT(*)::int AS total,
       COUNT(*) FILTER (WHERE status = 'success')::int AS successful,
       COUNT(*) FILTER (WHERE status = 'failed')::int AS failed,
       COUNT(*) FILTER (WHERE status = 'pending')::int AS pending,
       MAX(created_at) AS last_at
     FROM deployments
     WHERE tenant_id = $1 AND created_at >= $2`,
    [tenantId, monthStart.toISOString()],
  );

  const deployRow = deployResult.rows[0];
  const totalDeploy = (deployRow.total as number) ?? 0;
  const deployments: DeploymentStatus = {
    totalDeployments: totalDeploy,
    successfulDeployments: (deployRow.successful as number) ?? 0,
    failedDeployments: (deployRow.failed as number) ?? 0,
    pendingDeployments: (deployRow.pending as number) ?? 0,
    lastDeploymentAt: deployRow.last_at ? (deployRow.last_at as Date).toISOString() : undefined,
    successRate: totalDeploy > 0 ? Math.round(((deployRow.successful as number) / totalDeploy) * 100) : 100,
  };

  // 4. Test coverage
  const testResult = await pool.query(
    `SELECT
       COUNT(*)::int AS total_suites,
       COALESCE(AVG(coverage_percent), 0)::numeric AS avg_coverage,
       CASE WHEN SUM(total_tests) > 0
         THEN ROUND(SUM(passed_tests)::numeric / SUM(total_tests) * 100, 1)
         ELSE 100
       END AS pass_rate
     FROM test_suites
     WHERE tenant_id = $1`,
    [tenantId],
  );

  const testRow = testResult.rows[0];
  const testCoverage = {
    percent: parseFloat((testRow.avg_coverage as string) ?? '0'),
    totalSuites: (testRow.total_suites as number) ?? 0,
    passRate: parseFloat((testRow.pass_rate as string) ?? '100'),
  };

  // 5. Active users
  const [usersToday, usersWeek, usersMonth] = await Promise.all([
    pool.query(
      `SELECT COUNT(DISTINCT user_id)::int AS count FROM audit_log WHERE tenant_id = $1 AND created_at >= $2`,
      [tenantId, todayStart.toISOString()],
    ),
    pool.query(
      `SELECT COUNT(DISTINCT user_id)::int AS count FROM audit_log WHERE tenant_id = $1 AND created_at >= $2`,
      [tenantId, new Date(Date.now() - 7 * 86400000).toISOString()],
    ),
    pool.query(
      `SELECT COUNT(DISTINCT user_id)::int AS count FROM audit_log WHERE tenant_id = $1 AND created_at >= $2`,
      [tenantId, monthStart.toISOString()],
    ),
  ]);

  // 6. Recent activity
  const activityResult = await pool.query(
    `SELECT id, action_type AS type, description AS title, details AS description, user_id, created_at
     FROM audit_log
     WHERE tenant_id = $1
     ORDER BY created_at DESC
     LIMIT 20`,
    [tenantId],
  );

  const recentActivity: ActivityItem[] = activityResult.rows.map((row) => ({
    id: row.id as string,
    type: (row.type as ActivityItem['type']) ?? 'alert',
    title: row.title as string,
    description: (row.description as string) ?? '',
    userId: (row.user_id as string) ?? undefined,
    timestamp: (row.created_at as Date).toISOString(),
  }));

  return {
    tenantId,
    connections,
    aiUsage,
    deployments,
    testCoverage,
    activeUsers: {
      today: usersToday.rows[0].count as number,
      thisWeek: usersWeek.rows[0].count as number,
      thisMonth: usersMonth.rows[0].count as number,
    },
    recentActivity,
    generatedAt: new Date().toISOString(),
  };
}

// ---------------------------------------------------------------------------
// Alerts
// ---------------------------------------------------------------------------

/**
 * Get active alerts for a tenant.
 */
export async function getAlerts(
  tenantId: string,
  acknowledged?: boolean,
): Promise<Alert[]> {
  const conditions = ['tenant_id = $1', 'resolved_at IS NULL'];
  const params: unknown[] = [tenantId];

  if (acknowledged !== undefined) {
    conditions.push(`acknowledged = $${params.length + 1}`);
    params.push(acknowledged);
  }

  const result = await pool.query(
    `SELECT * FROM alerts WHERE ${conditions.join(' AND ')} ORDER BY created_at DESC`,
    params,
  );

  return result.rows.map(rowToAlert);
}

// ---------------------------------------------------------------------------
// Incidents CRUD
// ---------------------------------------------------------------------------

/**
 * Get incidents for a tenant.
 */
export async function getIncidents(
  tenantId: string,
  status?: IncidentStatus,
): Promise<Incident[]> {
  const conditions = ['i.tenant_id = $1'];
  const params: unknown[] = [tenantId];

  if (status) {
    conditions.push(`i.status = $${params.length + 1}`);
    params.push(status);
  }

  const result = await pool.query(
    `SELECT i.* FROM incidents i WHERE ${conditions.join(' AND ')} ORDER BY i.created_at DESC`,
    params,
  );

  const incidents: Incident[] = [];
  for (const row of result.rows) {
    const timelineResult = await pool.query(
      `SELECT * FROM incident_timeline WHERE incident_id = $1 ORDER BY timestamp ASC`,
      [row.id],
    );

    const timeline: IncidentTimelineEntry[] = timelineResult.rows.map((t) => ({
      id: t.id as string,
      timestamp: (t.timestamp as Date).toISOString(),
      status: t.status as IncidentStatus,
      message: t.message as string,
      userId: (t.user_id as string) ?? undefined,
      userName: (t.user_name as string) ?? undefined,
    }));

    incidents.push(rowToIncident(row, timeline));
  }

  return incidents;
}

/**
 * Create a new incident.
 */
export async function createIncident(
  request: CreateIncidentRequest,
  tenantId: string,
  userId: string,
): Promise<Incident> {
  const result = await pool.query(
    `INSERT INTO incidents (tenant_id, title, description, severity, status, assigned_to, alert_ids)
     VALUES ($1, $2, $3, $4, 'open', $5, $6)
     RETURNING *`,
    [
      tenantId,
      request.title,
      request.description,
      request.severity,
      request.assignedTo ?? null,
      request.alertIds ?? [],
    ],
  );

  const incidentId = result.rows[0].id as string;

  // Add initial timeline entry
  await pool.query(
    `INSERT INTO incident_timeline (incident_id, status, message, user_id)
     VALUES ($1, 'open', 'Incident created', $2)`,
    [incidentId, userId],
  );

  const timeline: IncidentTimelineEntry[] = [
    {
      id: 'initial',
      timestamp: new Date().toISOString(),
      status: 'open',
      message: 'Incident created',
      userId,
    },
  ];

  logger.info({ incidentId, tenantId }, 'Incident created');
  return rowToIncident(result.rows[0], timeline);
}

/**
 * Resolve an incident.
 */
export async function resolveIncident(
  incidentId: string,
  request: ResolveIncidentRequest,
  tenantId: string,
  userId: string,
): Promise<Incident> {
  const result = await pool.query(
    `UPDATE incidents
     SET status = 'resolved', root_cause = $1, resolution = $2, resolved_at = NOW(), updated_at = NOW()
     WHERE id = $3 AND tenant_id = $4
     RETURNING *`,
    [request.rootCause ?? null, request.resolution, incidentId, tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Incident not found');
  }

  // Add timeline entry
  await pool.query(
    `INSERT INTO incident_timeline (incident_id, status, message, user_id)
     VALUES ($1, 'resolved', $2, $3)`,
    [incidentId, `Resolved: ${request.resolution}`, userId],
  );

  // Fetch full incident with timeline
  const timelineResult = await pool.query(
    `SELECT * FROM incident_timeline WHERE incident_id = $1 ORDER BY timestamp ASC`,
    [incidentId],
  );

  const timeline: IncidentTimelineEntry[] = timelineResult.rows.map((t) => ({
    id: t.id as string,
    timestamp: (t.timestamp as Date).toISOString(),
    status: t.status as IncidentStatus,
    message: t.message as string,
    userId: (t.user_id as string) ?? undefined,
    userName: (t.user_name as string) ?? undefined,
  }));

  logger.info({ incidentId, tenantId }, 'Incident resolved');
  return rowToIncident(result.rows[0], timeline);
}
