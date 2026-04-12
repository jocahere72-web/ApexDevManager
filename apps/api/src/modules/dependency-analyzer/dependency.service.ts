import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import { MCPClient, type MCPConnectionConfig } from '../../integrations/mcp/mcp-client.js';
import { decryptCredentials } from '../connections/encryption.service.js';
import type {
  DependencyNode,
  DependencyEdge,
  DependencyGraph,
  ImpactAssessment,
} from '@apex-dev-manager/shared-types';

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

interface ConnectionRow {
  id: string;
  tenant_id: string;
  type: 'ords' | 'jdbc';
  config: Record<string, unknown>;
  encrypted_credentials: {
    iv: string;
    encrypted: string;
    authTag: string;
    keyId: string;
  };
}

async function getConnectionDetails(
  tenantId: string,
  connectionId: string,
): Promise<ConnectionRow> {
  const result = await pool.query<ConnectionRow>(
    `SELECT id, tenant_id, type, config, encrypted_credentials
     FROM connections
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL AND is_active = true`,
    [tenantId, connectionId],
  );
  if (result.rowCount === 0) {
    throw new NotFoundError('Connection not found or inactive');
  }
  return result.rows[0];
}

async function executeSql(
  tenantId: string,
  connectionId: string,
  sql: string,
): Promise<Record<string, unknown>[]> {
  const conn = await getConnectionDetails(tenantId, connectionId);
  const creds = decryptCredentials(conn.encrypted_credentials, tenantId);
  const config = conn.config as Record<string, unknown>;
  const mcpConfig: MCPConnectionConfig = {
    baseUrl: (config.mcpBaseUrl ?? config.ordsBaseUrl ?? '') as string,
    username: creds.username,
    password: creds.password,
    schema: config.schema as string | undefined,
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
  `);

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
  `);

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
): Promise<ImpactAssessment> {
  logger.info({ connectionId, objectType, objectId }, 'Assessing impact');

  const graph = await getDependencyGraph(tenantId, connectionId, objectType, objectId);
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
