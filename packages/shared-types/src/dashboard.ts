// ---------------------------------------------------------------------------
// Dashboard & Observability shared types (M17)
// ---------------------------------------------------------------------------

/**
 * Health status of a monitored resource.
 */
export type HealthStatus = 'healthy' | 'degraded' | 'down' | 'unknown';

/**
 * Severity level for alerts and incidents.
 */
export type AlertSeverity = 'info' | 'warning' | 'error' | 'critical';

/**
 * Status of an incident lifecycle.
 */
export type IncidentStatus = 'open' | 'acknowledged' | 'investigating' | 'resolved' | 'closed';

/**
 * Connection health summary for the dashboard.
 */
export interface ConnectionHealthSummary {
  connectionId: string;
  connectionName: string;
  status: HealthStatus;
  responseTimeMs: number;
  lastCheckedAt: string;
  errorMessage?: string;
}

/**
 * AI usage stats for the dashboard.
 */
export interface AIUsageStats {
  totalTokensToday: number;
  totalTokensMonth: number;
  conversationsToday: number;
  estimatedCostToday: number;
  estimatedCostMonth: number;
  topModel: string;
}

/**
 * Deployment status for the dashboard.
 */
export interface DeploymentSummary {
  totalDeployments: number;
  successfulDeployments: number;
  failedDeployments: number;
  pendingDeployments: number;
  lastDeploymentAt?: string;
  successRate: number;
}

/**
 * Overview data for the main dashboard.
 */
export interface DashboardOverview {
  tenantId: string;
  connections: ConnectionHealthSummary[];
  aiUsage: AIUsageStats;
  deployments: DeploymentSummary;
  testCoverage: { percent: number; totalSuites: number; passRate: number };
  activeUsers: { today: number; thisWeek: number; thisMonth: number };
  recentActivity: ActivityItem[];
  generatedAt: string;
}

/**
 * A recent activity item on the dashboard.
 */
export interface ActivityItem {
  id: string;
  type: 'deployment' | 'test-run' | 'ai-chat' | 'connection' | 'alert' | 'incident';
  title: string;
  description: string;
  userId?: string;
  userName?: string;
  timestamp: string;
}

/**
 * An alert triggered by threshold breaches.
 */
export interface Alert {
  id: string;
  tenantId: string;
  severity: AlertSeverity;
  title: string;
  message: string;
  source: string;
  metric?: string;
  threshold?: number;
  currentValue?: number;
  acknowledged: boolean;
  acknowledgedBy?: string;
  acknowledgedAt?: string;
  resolvedAt?: string;
  createdAt: string;
}

/**
 * An operational incident.
 */
export interface Incident {
  id: string;
  tenantId: string;
  title: string;
  description: string;
  severity: AlertSeverity;
  status: IncidentStatus;
  assignedTo?: string;
  alertIds: string[];
  timeline: IncidentTimelineEntry[];
  rootCause?: string;
  resolution?: string;
  createdAt: string;
  updatedAt: string;
  resolvedAt?: string;
}

/**
 * A timeline entry within an incident.
 */
export interface IncidentTimelineEntry {
  id: string;
  timestamp: string;
  status: IncidentStatus;
  message: string;
  userId?: string;
  userName?: string;
}

/**
 * Request to create an incident.
 */
export interface CreateIncidentRequest {
  title: string;
  description: string;
  severity: AlertSeverity;
  assignedTo?: string;
  alertIds?: string[];
}

/**
 * Request to resolve an incident.
 */
export interface ResolveIncidentRequest {
  rootCause?: string;
  resolution: string;
}
