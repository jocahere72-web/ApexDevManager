import { pool } from '../../config/database.js';
import { PoolClient } from 'pg';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import { MCPClient, type MCPConnectionConfig } from '../../integrations/mcp/mcp-client.js';
import { decryptCredentials } from '../connections/encryption.service.js';
import { getConnectionForTenant, type ResolvedConnection } from '../connections/connections.repository.js';
import type {
  DependencyNode,
  DependencyEdge,
  DependencyGraph,
  ImpactAssessment,
  PRDImpactRequest,
  PRDImpactAnalysis,
} from '@apex-dev-manager/shared-types';
import { getIssueById } from '../issues/issues.service.js';
import { getSession as getPRDSession } from '../prd-builder/prd.service.js';
import { listApplications, listPages, listComponents } from '../explorer/explorer.service.js';
import { getConnectionById } from '../connections/connections.service.js';

// ── Oracle identifier validation ────────────────────────────────────────────

const VALID_ORACLE_TYPES = ['TABLE', 'VIEW', 'PACKAGE', 'PACKAGE BODY', 'PROCEDURE', 'FUNCTION', 'TRIGGER', 'SEQUENCE', 'INDEX', 'SYNONYM', 'TYPE', 'TYPE BODY'];
function assertOracleIdentifier(name: string): string {
  const normalized = name.toUpperCase().replace(/[^A-Z0-9_$#]/g, '');
  if (!normalized || normalized.length > 128) throw new Error(`Invalid Oracle identifier: ${name}`);
  return normalized;
}
function assertOracleType(type: string): string {
  const normalized = type.toUpperCase();
  if (!VALID_ORACLE_TYPES.includes(normalized)) throw new Error(`Invalid Oracle type: ${type}`);
  return normalized;
}

// ── Helpers ──────────────────────────────────────────────────────────────────

async function getConnectionDetails(
  tenantId: string,
  connectionId: string,
  client?: PoolClient,
): Promise<ResolvedConnection> {
  const conn = await getConnectionForTenant(tenantId, connectionId, client);
  if (!conn) throw new NotFoundError('Connection not found or inactive');
  return conn;
}

async function executeSql(
  tenantId: string,
  connectionId: string,
  sql: string,
  client?: PoolClient,
): Promise<Record<string, unknown>[]> {
  const conn = await getConnectionDetails(tenantId, connectionId, client);
  const creds = decryptCredentials(conn.encryptedCredentials, conn.tenantId);
  const mcpConfig: MCPConnectionConfig = {
    baseUrl: (conn.config.ordsBaseUrl ?? '') as string,
    username: creds.username,
    password: creds.password,
    schema: conn.config.schema,
    tenantId,
    connectionId,
  };
  const mcp = new MCPClient(mcpConfig);
  try {
    await mcp.connect();
    const result = await mcp.query(sql);
    return result.rows ?? [];
  } finally {
    await mcp.disconnect();
  }
}

// ── Service functions ───────────────────────────────────────────────────────

export async function analyzeDependencies(
  tenantId: string,
  connectionId: string,
  client?: PoolClient,
): Promise<DependencyGraph> {
  logger.info({ connectionId }, 'Analyzing dependencies');

  // Fetch dependency information from Oracle's data dictionary
  const depRows = await executeSql(tenantId, connectionId, `
    SELECT
      d.name AS source_name,
      d.type AS source_type,
      d.referenced_name AS target_name,
      d.referenced_type AS target_type,
      d.referenced_owner AS target_owner
    FROM all_dependencies d
    WHERE d.owner = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
      AND d.referenced_owner = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    ORDER BY d.name, d.referenced_name
  `, client);

  const nodeMap = new Map<string, DependencyNode>();
  const edges: DependencyEdge[] = [];

  for (const row of depRows) {
    const sourceKey = `${row.source_type}:${row.source_name}`;
    const targetKey = `${row.target_type}:${row.target_name}`;

    if (!nodeMap.has(sourceKey)) {
      nodeMap.set(sourceKey, {
        id: sourceKey,
        name: row.source_name as string,
        objectType: row.source_type as string,
        schema: row.target_owner as string,
      });
    }

    if (!nodeMap.has(targetKey)) {
      nodeMap.set(targetKey, {
        id: targetKey,
        name: row.target_name as string,
        objectType: row.target_type as string,
        schema: row.target_owner as string,
      });
    }

    edges.push({
      sourceId: sourceKey,
      targetId: targetKey,
      dependencyType: mapDependencyType(
        row.source_type as string,
        row.target_type as string,
      ),
    });
  }

  const nodes = Array.from(nodeMap.values());

  return {
    nodes,
    edges,
    metadata: {
      totalNodes: nodes.length,
      totalEdges: edges.length,
      analyzedAt: new Date().toISOString(),
    },
  };
}

function mapDependencyType(
  sourceType: string,
  targetType: string,
): DependencyEdge['dependencyType'] {
  if (targetType === 'PACKAGE' || targetType === 'PACKAGE BODY') return 'calls';
  if (targetType === 'TABLE' || targetType === 'VIEW') return 'references';
  if (targetType === 'TYPE') return 'uses';
  return 'references';
}

export async function getDependencyGraph(
  tenantId: string,
  connectionId: string,
  objectType: string,
  objectId: string,
  client?: PoolClient,
): Promise<DependencyGraph> {
  logger.info({ connectionId, objectType, objectId }, 'Fetching dependency graph');

  // Fetch direct dependencies for a specific object
  const depRows = await executeSql(tenantId, connectionId, `
    SELECT
      d.name AS source_name,
      d.type AS source_type,
      d.referenced_name AS target_name,
      d.referenced_type AS target_type,
      d.referenced_owner AS target_owner
    FROM all_dependencies d
    WHERE d.owner = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
      AND (
        (d.name = '${assertOracleIdentifier(objectId)}' AND d.type = '${assertOracleType(objectType)}')
        OR (d.referenced_name = '${assertOracleIdentifier(objectId)}' AND d.referenced_type = '${assertOracleType(objectType)}')
      )
  `, client);

  const nodeMap = new Map<string, DependencyNode>();
  const edges: DependencyEdge[] = [];
  const rootKey = `${objectType.toUpperCase()}:${objectId.toUpperCase()}`;

  // Add root node
  nodeMap.set(rootKey, {
    id: rootKey,
    name: objectId.toUpperCase(),
    objectType: objectType.toUpperCase(),
    schema: '',
  });

  for (const row of depRows) {
    const sourceKey = `${row.source_type}:${row.source_name}`;
    const targetKey = `${row.target_type}:${row.target_name}`;

    if (!nodeMap.has(sourceKey)) {
      nodeMap.set(sourceKey, {
        id: sourceKey,
        name: row.source_name as string,
        objectType: row.source_type as string,
        schema: row.target_owner as string,
      });
    }

    if (!nodeMap.has(targetKey)) {
      nodeMap.set(targetKey, {
        id: targetKey,
        name: row.target_name as string,
        objectType: row.target_type as string,
        schema: row.target_owner as string,
      });
    }

    edges.push({
      sourceId: sourceKey,
      targetId: targetKey,
      dependencyType: mapDependencyType(
        row.source_type as string,
        row.target_type as string,
      ),
    });
  }

  const nodes = Array.from(nodeMap.values());

  return {
    nodes,
    edges,
    rootNodeId: rootKey,
    metadata: {
      totalNodes: nodes.length,
      totalEdges: edges.length,
      analyzedAt: new Date().toISOString(),
    },
  };
}

export async function getImpactAssessment(
  tenantId: string,
  connectionId: string,
  objectType: string,
  objectId: string,
  client?: PoolClient,
): Promise<ImpactAssessment> {
  logger.info({ connectionId, objectType, objectId }, 'Assessing impact');

  const graph = await getDependencyGraph(tenantId, connectionId, objectType, objectId, client);
  const rootKey = `${objectType.toUpperCase()}:${objectId.toUpperCase()}`;
  const rootNode = graph.nodes.find((n) => n.id === rootKey);

  if (!rootNode) {
    throw new NotFoundError('Object not found in dependency graph');
  }

  // Find direct dependents (objects that reference/call this object)
  const directDependentIds = new Set(
    graph.edges
      .filter((e) => e.targetId === rootKey)
      .map((e) => e.sourceId),
  );

  const directDependents = graph.nodes.filter((n) => directDependentIds.has(n.id));

  // Find transitive dependents (BFS)
  const visited = new Set<string>([rootKey]);
  const queue = [...directDependentIds];
  const transitiveDependentIds = new Set<string>();

  for (const id of queue) {
    if (visited.has(id)) continue;
    visited.add(id);
    transitiveDependentIds.add(id);

    // Find objects that depend on this dependent
    const nextDeps = graph.edges
      .filter((e) => e.targetId === id)
      .map((e) => e.sourceId);
    queue.push(...nextDeps);
  }

  // Remove direct dependents from transitive set
  for (const id of directDependentIds) {
    transitiveDependentIds.delete(id);
  }

  const transitiveDependents = graph.nodes.filter((n) => transitiveDependentIds.has(n.id));

  // Determine impact level
  const totalDependents = directDependents.length + transitiveDependents.length;
  let impactLevel: ImpactAssessment['impactLevel'];
  if (totalDependents === 0) impactLevel = 'low';
  else if (totalDependents <= 3) impactLevel = 'medium';
  else if (totalDependents <= 10) impactLevel = 'high';
  else impactLevel = 'critical';

  const breakingChanges = directDependents.map((dep) => ({
    dependent: dep,
    reason: `${dep.objectType} "${dep.name}" directly references ${objectType} "${objectId}"`,
  }));

  return {
    targetObject: rootNode,
    directDependents,
    transitiveDependents,
    impactLevel,
    summary: `${totalDependents} dependent object(s) found. ${directDependents.length} direct, ${transitiveDependents.length} transitive.`,
    breakingChanges,
  };
}

export async function exportGraph(
  graph: DependencyGraph,
  format: 'dot' | 'mermaid' = 'mermaid',
): Promise<string> {
  if (format === 'dot') {
    const lines = ['digraph Dependencies {', '  rankdir=LR;'];
    for (const node of graph.nodes) {
      lines.push(`  "${node.id}" [label="${node.name}\\n(${node.objectType})"];`);
    }
    for (const edge of graph.edges) {
      lines.push(`  "${edge.sourceId}" -> "${edge.targetId}" [label="${edge.dependencyType}"];`);
    }
    lines.push('}');
    return lines.join('\n');
  }

  // Mermaid format
  const lines = ['graph LR'];
  for (const node of graph.nodes) {
    const shape = node.objectType === 'TABLE' ? `[("${node.name}")]` : `["${node.name}"]`;
    lines.push(`    ${sanitizeMermaidId(node.id)}${shape}`);
  }
  for (const edge of graph.edges) {
    lines.push(
      `    ${sanitizeMermaidId(edge.sourceId)} -->|${edge.dependencyType}| ${sanitizeMermaidId(edge.targetId)}`,
    );
  }
  return lines.join('\n');
}

function sanitizeMermaidId(id: string): string {
  return id.replace(/[^a-zA-Z0-9_]/g, '_');
}

// ── PRD Impact Analysis ────────────────────────────────────────────────────

function normalizeForComparison(name: string): string {
  return name.toUpperCase().replace(/[^A-Z0-9]/g, '');
}

function nameSimilarity(a: string, b: string): boolean {
  const na = normalizeForComparison(a);
  const nb = normalizeForComparison(b);
  return na === nb || na.includes(nb) || nb.includes(na);
}

function calculateRiskScore(params: {
  newTables: number;
  modifiedTables: number;
  modifiedPages: number;
  dependencies: number;
}): number {
  const score =
    params.newTables * 5 +
    params.modifiedTables * 10 +
    params.modifiedPages * 8 +
    params.dependencies * 3;
  return Math.min(score, 100);
}

function riskLevelFromScore(score: number): 'low' | 'medium' | 'high' | 'critical' {
  if (score <= 25) return 'low';
  if (score <= 50) return 'medium';
  if (score <= 75) return 'high';
  return 'critical';
}

export async function analyzePRDImpact(
  tenantId: string,
  request: PRDImpactRequest,
  client?: PoolClient,
): Promise<PRDImpactAnalysis> {
  logger.info({ tenantId, issueId: request.issueId }, 'Analyzing PRD impact');

  // 1. Load issue
  const issue = await getIssueById(tenantId, request.issueId, client);

  // 2. Check PRD link
  if (!issue.prdSessionId) {
    throw new AppError('Issue has no linked PRD', 400, 'NO_PRD_LINKED');
  }

  // 3. Load PRD session (with sections and extraction data)
  const prdSession = await getPRDSession(issue.prdSessionId, tenantId, client);
  const extraction = prdSession.extractionData ?? {};

  // 4. Load connection details (for name)
  const connProfile = await getConnectionById(tenantId, request.connectionId, client);

  // 5. Try to fetch existing APEX data via ORDS
  let existingPages: Array<{ pageId: number; pageName: string }> = [];
  let existingPageComponents: Map<number, string[]> = new Map();
  let applicationName: string | undefined;

  try {
    if (request.applicationId) {
      // Fetch pages for this app
      const apexPages = await listPages(tenantId, request.connectionId, request.applicationId, client);
      existingPages = apexPages.map((p) => ({ pageId: p.pageId, pageName: p.pageName }));

      // Get app name
      const apps = await listApplications(tenantId, request.connectionId, client);
      const app = apps.find((a) => a.applicationId === request.applicationId);
      applicationName = app?.applicationName;

      // Fetch components for specific pages if provided
      if (request.pageIds && request.pageIds.length > 0) {
        for (const pageId of request.pageIds) {
          try {
            const components = await listComponents(tenantId, request.connectionId, pageId, undefined, request.applicationId, client);
            existingPageComponents.set(pageId, components.map((c) => c.componentName ?? c.componentType));
          } catch {
            // Individual page component fetch failure is non-critical
          }
        }
      }
    } else {
      // Fetch all apps for reference
      try {
        await listApplications(tenantId, request.connectionId, client);
      } catch {
        // Non-critical
      }
    }
  } catch (err) {
    logger.warn({ err }, 'ORDS fetch failed, proceeding with PRD data + user context only');
  }

  // 6. Cross-reference PRD extraction data with existing system + user context
  const prdPages = extraction.apexPages ?? [];
  const prdTables = extraction.genesysTables ?? [];
  const prdFlows = extraction.flows ?? [];

  const newPages: PRDImpactAnalysis['functionalImpact']['newPages'] = [];
  const modifiedPages: PRDImpactAnalysis['functionalImpact']['modifiedPages'] = [];
  const affectedFlows: PRDImpactAnalysis['functionalImpact']['affectedFlows'] = [];

  const newTables: PRDImpactAnalysis['databaseImpact']['newTables'] = [];
  const modifiedTables: PRDImpactAnalysis['databaseImpact']['modifiedTables'] = [];
  const affectedIndexes: string[] = [];
  const affectedTriggers: string[] = [];
  const dependencies: PRDImpactAnalysis['dependencies'] = [];

  // Match PRD apexPages against existing pages
  for (const prdPage of prdPages) {
    const match = existingPages.find((ep) => nameSimilarity(ep.pageName, prdPage.name));
    if (match) {
      const regions = existingPageComponents.get(match.pageId) ?? [];
      modifiedPages.push({
        pageId: match.pageId,
        pageName: match.pageName,
        reason: `PRD defines changes: ${prdPage.description}`,
        affectedRegions: regions.length > 0 ? regions : prdPage.components ?? [],
      });
      dependencies.push({
        sourceType: 'PRD Page',
        sourceName: prdPage.name,
        targetType: 'APEX Page',
        targetName: match.pageName,
        impact: 'Modification required',
      });
    } else {
      newPages.push({
        name: prdPage.name,
        type: prdPage.type,
        description: prdPage.description,
      });
    }
  }

  // If user provided pageIds, check those pages for potential modification
  if (request.pageIds && request.pageIds.length > 0) {
    for (const pageId of request.pageIds) {
      const existingMatch = existingPages.find((ep) => ep.pageId === pageId);
      if (existingMatch && !modifiedPages.some((mp) => mp.pageId === pageId)) {
        const regions = existingPageComponents.get(pageId) ?? [];
        modifiedPages.push({
          pageId,
          pageName: existingMatch.pageName,
          reason: 'User indicated this page is affected',
          affectedRegions: regions,
        });
      }
    }
  }

  // Match PRD genesysTables against user-provided affectedTables
  const userTables = (request.affectedTables ?? []).map((t) => t.trim().toUpperCase());

  for (const prdTable of prdTables) {
    const matchedByUser = userTables.some((ut) => nameSimilarity(ut, prdTable.name));
    if (matchedByUser) {
      modifiedTables.push({
        name: prdTable.name,
        reason: 'Exists in system and referenced in PRD',
        changes: prdTable.columns.map((c) => `Column: ${c}`),
      });
      dependencies.push({
        sourceType: 'PRD Table',
        sourceName: prdTable.name,
        targetType: 'DB Table',
        targetName: prdTable.name,
        impact: 'Schema modification',
      });
    } else {
      newTables.push({
        name: prdTable.name,
        description: prdTable.description,
        columns: prdTable.columns,
      });
    }
  }

  // If user provided affectedObjects, include them in dependencies
  if (request.affectedObjects && request.affectedObjects.length > 0) {
    for (const obj of request.affectedObjects) {
      const trimmed = obj.trim();
      if (!trimmed) continue;

      const objUpper = trimmed.toUpperCase();
      if (objUpper.startsWith('TRG_') || objUpper.startsWith('TRIGGER_')) {
        affectedTriggers.push(trimmed);
      } else if (objUpper.startsWith('IDX_') || objUpper.startsWith('IX_')) {
        affectedIndexes.push(trimmed);
      }

      dependencies.push({
        sourceType: 'User Context',
        sourceName: trimmed,
        targetType: 'DB Object',
        targetName: trimmed,
        impact: 'Potentially affected per user context',
      });
    }
  }

  // Process flows
  for (const flow of prdFlows) {
    affectedFlows.push({
      flowName: flow.name,
      impact: `Trigger: ${flow.triggerEvent}. Steps: ${flow.steps.length}`,
    });

    // Link flow to pages
    for (const mp of modifiedPages) {
      dependencies.push({
        sourceType: 'Flow',
        sourceName: flow.name,
        targetType: 'APEX Page',
        targetName: mp.pageName,
        impact: 'Flow involves this page',
      });
    }
  }

  // 8. Calculate risk score
  const riskScore = calculateRiskScore({
    newTables: newTables.length,
    modifiedTables: modifiedTables.length,
    modifiedPages: modifiedPages.length,
    dependencies: dependencies.length,
  });
  const riskLevel = riskLevelFromScore(riskScore);

  // 9. Generate recommendations
  const recommendations: string[] = [];

  if (newTables.length > 0) {
    recommendations.push(
      `Create ${newTables.length} new table(s): ${newTables.map((t) => t.name).join(', ')}. Review column definitions and constraints before DDL execution.`,
    );
  }
  if (modifiedTables.length > 0) {
    recommendations.push(
      `${modifiedTables.length} existing table(s) require schema changes. Generate ALTER scripts and test with production-like data volumes.`,
    );
  }
  if (modifiedPages.length > 0) {
    recommendations.push(
      `${modifiedPages.length} existing page(s) will be modified. Back up current page definitions before applying changes.`,
    );
  }
  if (newPages.length > 0) {
    recommendations.push(
      `${newPages.length} new page(s) to create. Use the PRD-to-Page generator to scaffold initial structure.`,
    );
  }
  if (affectedTriggers.length > 0) {
    recommendations.push(
      `${affectedTriggers.length} trigger(s) may be affected. Verify firing order and logic after changes.`,
    );
  }
  if (riskLevel === 'high' || riskLevel === 'critical') {
    recommendations.push(
      'High-risk change detected. Consider staging the deployment in phases and performing regression testing.',
    );
  }
  if (dependencies.length > 10) {
    recommendations.push(
      'Large dependency chain detected. Map the deployment order carefully to avoid broken references.',
    );
  }
  if (recommendations.length === 0) {
    recommendations.push('Low-impact change. Standard review and testing procedures apply.');
  }

  // Resolve page names for user context
  const userPageNames = (request.pageIds ?? []).map((pid) => {
    const found = existingPages.find((ep) => ep.pageId === pid);
    return found ? found.pageName : `Page ${pid}`;
  });

  return {
    issueCode: issue.code,
    issueTitle: issue.title,
    prdTitle: prdSession.title,
    connectionName: connProfile.name,
    userContext: {
      applicationName,
      pageNames: userPageNames.length > 0 ? userPageNames : undefined,
      tables: request.affectedTables,
      objects: request.affectedObjects,
      notes: request.notes,
    },
    summary: {
      totalAffectedPages: modifiedPages.length,
      totalAffectedTables: modifiedTables.length,
      totalNewPages: newPages.length,
      totalNewTables: newTables.length,
      riskLevel,
      riskScore,
    },
    functionalImpact: {
      newPages,
      modifiedPages,
      affectedFlows,
    },
    databaseImpact: {
      newTables,
      modifiedTables,
      affectedIndexes,
      affectedTriggers,
    },
    dependencies,
    recommendations,
    analyzedAt: new Date().toISOString(),
  };
}
