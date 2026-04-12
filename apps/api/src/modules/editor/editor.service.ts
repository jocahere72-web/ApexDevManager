import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import { MCPClient, type MCPConnectionConfig } from '../../integrations/mcp/mcp-client.js';
import { decryptCredentials } from '../connections/encryption.service.js';
import type {
  ComponentSource,
  EditorSession,
  ChangeLogEntry,
  LockStatus,
  FormatResponse,
  ComponentType,
} from '@apex-dev-manager/shared-types';

// ── Types ───────────────────────────────────────────────────────────────────

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

interface SessionRow {
  id: string;
  tenant_id: string;
  user_id: string;
  connection_id: string;
  component_type: string;
  component_id: string;
  mode: 'view' | 'edit';
  draft_content: string | null;
  cursor_line: number | null;
  cursor_column: number | null;
  created_at: string;
  last_active_at: string;
  expires_at: string;
}

interface ChangeLogRow {
  id: string;
  tenant_id: string;
  connection_id: string;
  component_type: string;
  component_id: string;
  component_name: string | null;
  app_id: string | null;
  page_id: number | null;
  code_before: string | null;
  code_after: string | null;
  diff: string | null;
  applied_by: string;
  applied_at: string;
  source: string;
  ai_request_id: string | null;
  created_at: string;
}

// ── Helpers ─────────────────────────────────────────────────────────────────

async function getConnectionDetails(
  tenantId: string,
  connectionId: string,
): Promise<ConnectionRow> {
  const result = await pool.query(
    `SELECT id, tenant_id, type, config, encrypted_credentials
     FROM connections
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL AND is_active = true`,
    [tenantId, connectionId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Connection not found or inactive');
  }

  return result.rows[0] as ConnectionRow;
}

function buildMCPConfig(conn: ConnectionRow): MCPConnectionConfig {
  const creds = decryptCredentials(conn.encrypted_credentials, conn.tenant_id);
  const config = conn.config as Record<string, unknown>;
  const mcpBaseUrl = (config.mcpBaseUrl ?? config.ordsBaseUrl ?? '') as string;

  return {
    baseUrl: mcpBaseUrl,
    username: creds.username,
    password: creds.password,
    schema: config.schema as string | undefined,
  };
}

function mapSessionRow(row: SessionRow): EditorSession {
  return {
    id: row.id,
    tenantId: row.tenant_id,
    userId: row.user_id,
    connectionId: row.connection_id,
    componentType: row.component_type as ComponentType,
    componentId: row.component_id,
    mode: row.mode,
    draftContent: row.draft_content,
    cursorLine: row.cursor_line,
    cursorColumn: row.cursor_column,
    createdAt: row.created_at,
    lastActiveAt: row.last_active_at,
    expiresAt: row.expires_at,
  };
}

function mapChangeLogRow(row: ChangeLogRow): ChangeLogEntry {
  return {
    id: row.id,
    tenantId: row.tenant_id,
    connectionId: row.connection_id,
    componentType: row.component_type as ComponentType,
    componentId: row.component_id,
    componentName: row.component_name,
    appId: row.app_id,
    pageId: row.page_id,
    codeBefore: row.code_before,
    codeAfter: row.code_after,
    diff: row.diff,
    appliedBy: row.applied_by,
    appliedAt: row.applied_at,
    source: row.source as 'manual' | 'ai',
    aiRequestId: row.ai_request_id,
    createdAt: row.created_at,
  };
}

/**
 * Compute a simple unified diff between two strings.
 */
function computeDiff(before: string, after: string): string {
  const beforeLines = before.split('\n');
  const afterLines = after.split('\n');
  const diffLines: string[] = [];

  const maxLen = Math.max(beforeLines.length, afterLines.length);
  for (let i = 0; i < maxLen; i++) {
    const bLine = beforeLines[i];
    const aLine = afterLines[i];

    if (bLine === undefined && aLine !== undefined) {
      diffLines.push(`+ ${aLine}`);
    } else if (bLine !== undefined && aLine === undefined) {
      diffLines.push(`- ${bLine}`);
    } else if (bLine !== aLine) {
      diffLines.push(`- ${bLine}`);
      diffLines.push(`+ ${aLine}`);
    }
  }

  return diffLines.join('\n');
}

// ── Service Functions ───────────────────────────────────────────────────────

/**
 * Fetch the source code of a component via MCP/ORDS.
 */
export async function getComponentSource(
  tenantId: string,
  connectionId: string,
  componentType: string,
  componentId: string,
): Promise<ComponentSource> {
  const conn = await getConnectionDetails(tenantId, connectionId);
  const mcpConfig = buildMCPConfig(conn);

  let source = '';
  let componentName = componentId;
  let language = 'plsql';
  let lastModified: string | null = null;
  let modifiedBy: string | null = null;

  if (mcpConfig.baseUrl) {
    const client = new MCPClient(mcpConfig);
    try {
      await client.connect();
      const result = await client.callTool('get_component_source', {
        componentType,
        componentId,
      });

      if (result && typeof result === 'object') {
        const data = result as Record<string, unknown>;
        source = (data.source as string) ?? '';
        componentName = (data.name as string) ?? componentId;
        language = (data.language as string) ?? 'plsql';
        lastModified = (data.lastModified as string) ?? null;
        modifiedBy = (data.modifiedBy as string) ?? null;
      }
    } catch (err) {
      logger.warn(
        { err, connectionId, componentType, componentId },
        'Editor: MCP fetch source failed, returning empty source',
      );
    }
  }

  logger.info(
    { tenantId, connectionId, componentType, componentId },
    'Editor: component source fetched',
  );

  return {
    connectionId,
    componentType: componentType as ComponentType,
    componentId,
    componentName,
    source,
    language,
    lastModified,
    modifiedBy,
  };
}

/**
 * Open a new editor session. For edit mode, checks for existing edit locks.
 * If a lock exists by another user, returns the lock info.
 */
export async function openSession(
  tenantId: string,
  userId: string,
  connectionId: string,
  componentType: string,
  componentId: string,
  mode: 'view' | 'edit',
): Promise<EditorSession> {
  // Clean up expired sessions first
  await pool.query(
    `DELETE FROM editor_sessions WHERE expires_at < now()`,
  );

  if (mode === 'edit') {
    // Check for existing edit lock
    const existing = await pool.query(
      `SELECT es.*, u.email as locked_by_name
       FROM editor_sessions es
       LEFT JOIN users u ON u.id = es.user_id
       WHERE es.tenant_id = $1
         AND es.connection_id = $2
         AND es.component_type = $3
         AND es.component_id = $4
         AND es.mode = 'edit'
         AND es.expires_at > now()`,
      [tenantId, connectionId, componentType, componentId],
    );

    if (existing.rowCount && existing.rowCount > 0) {
      const lock = existing.rows[0] as SessionRow & { locked_by_name: string };
      if (lock.user_id !== userId) {
        throw new AppError(
          `Component is locked for editing by ${lock.locked_by_name ?? 'another user'}`,
          409,
          'EDIT_LOCK_CONFLICT',
        );
      }
      // Same user already has a lock — refresh it
      const refreshed = await pool.query(
        `UPDATE editor_sessions
         SET last_active_at = now(),
             expires_at = now() + interval '30 minutes'
         WHERE id = $1
         RETURNING *`,
        [lock.id],
      );
      return mapSessionRow(refreshed.rows[0] as SessionRow);
    }
  }

  // Create new session
  const result = await pool.query(
    `INSERT INTO editor_sessions
       (tenant_id, user_id, connection_id, component_type, component_id, mode)
     VALUES ($1, $2, $3, $4, $5, $6)
     RETURNING *`,
    [tenantId, userId, connectionId, componentType, componentId, mode],
  );

  const session = mapSessionRow(result.rows[0] as SessionRow);

  logger.info(
    { tenantId, userId, connectionId, componentType, componentId, mode, sessionId: session.id },
    'Editor: session opened',
  );

  return session;
}

/**
 * Save draft content and cursor position for an active session.
 */
export async function saveDraft(
  tenantId: string,
  sessionId: string,
  draftContent: string,
  cursorLine?: number,
  cursorColumn?: number,
): Promise<EditorSession> {
  const result = await pool.query(
    `UPDATE editor_sessions
     SET draft_content = $1,
         cursor_line = $2,
         cursor_column = $3,
         last_active_at = now(),
         expires_at = now() + interval '30 minutes'
     WHERE id = $4 AND tenant_id = $5
     RETURNING *`,
    [draftContent, cursorLine ?? null, cursorColumn ?? null, sessionId, tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Editor session not found');
  }

  return mapSessionRow(result.rows[0] as SessionRow);
}

/**
 * Apply code changes: write via MCP/ORDS, create a change_log entry,
 * and release the edit lock.
 */
export async function applyCode(
  tenantId: string,
  userId: string,
  sessionId: string,
  code: string,
  componentName?: string,
  appId?: string,
  pageId?: number,
  source: 'manual' | 'ai' = 'manual',
  aiRequestId?: string,
): Promise<{ changeLogId: string; appliedAt: string }> {
  // Fetch the session
  const sessionResult = await pool.query(
    `SELECT * FROM editor_sessions WHERE id = $1 AND tenant_id = $2`,
    [sessionId, tenantId],
  );

  if (sessionResult.rowCount === 0) {
    throw new NotFoundError('Editor session not found');
  }

  const session = sessionResult.rows[0] as SessionRow;

  if (session.mode !== 'edit') {
    throw new AppError('Cannot apply code in view-only session', 400, 'VIEW_ONLY_SESSION');
  }

  if (session.user_id !== userId) {
    throw new AppError('Session belongs to another user', 403, 'SESSION_OWNER_MISMATCH');
  }

  // Fetch current source for the "before" snapshot
  const currentSource = await getComponentSource(
    tenantId,
    session.connection_id,
    session.component_type,
    session.component_id,
  );

  const codeBefore = currentSource.source;
  const diff = computeDiff(codeBefore, code);

  // Write the new code via MCP
  const conn = await getConnectionDetails(tenantId, session.connection_id);
  const mcpConfig = buildMCPConfig(conn);

  if (mcpConfig.baseUrl) {
    const client = new MCPClient(mcpConfig);
    try {
      await client.connect();
      await client.callTool('apply_component_source', {
        componentType: session.component_type,
        componentId: session.component_id,
        source: code,
      });
    } catch (err) {
      logger.error(
        { err, sessionId, componentType: session.component_type, componentId: session.component_id },
        'Editor: failed to apply code via MCP',
      );
      throw new AppError('Failed to apply code to the database', 502, 'MCP_APPLY_FAILED');
    }
  }

  // Insert change log entry
  const changeLogResult = await pool.query(
    `INSERT INTO change_log
       (tenant_id, connection_id, component_type, component_id, component_name,
        app_id, page_id, code_before, code_after, diff, applied_by, source, ai_request_id)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
     RETURNING id, applied_at`,
    [
      tenantId,
      session.connection_id,
      session.component_type,
      session.component_id,
      componentName ?? currentSource.componentName,
      appId ?? null,
      pageId ?? null,
      codeBefore,
      code,
      diff,
      userId,
      source,
      aiRequestId ?? null,
    ],
  );

  const changeLog = changeLogResult.rows[0] as { id: string; applied_at: string };

  // Release the edit lock
  await releaseLock(tenantId, sessionId);

  logger.info(
    { tenantId, sessionId, changeLogId: changeLog.id },
    'Editor: code applied and change logged',
  );

  return {
    changeLogId: changeLog.id,
    appliedAt: changeLog.applied_at,
  };
}

/**
 * Release an editor session / lock.
 */
export async function releaseLock(
  tenantId: string,
  sessionId: string,
): Promise<void> {
  const result = await pool.query(
    `DELETE FROM editor_sessions WHERE id = $1 AND tenant_id = $2`,
    [sessionId, tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Editor session not found');
  }

  logger.info({ tenantId, sessionId }, 'Editor: session released');
}

/**
 * Get the lock status for a component.
 */
export async function getLockStatus(
  tenantId: string,
  connectionId: string,
  componentType: string,
  componentId: string,
): Promise<LockStatus> {
  const result = await pool.query(
    `SELECT es.id, es.user_id, es.expires_at, u.email as user_name
     FROM editor_sessions es
     LEFT JOIN users u ON u.id = es.user_id
     WHERE es.tenant_id = $1
       AND es.connection_id = $2
       AND es.component_type = $3
       AND es.component_id = $4
       AND es.mode = 'edit'
       AND es.expires_at > now()`,
    [tenantId, connectionId, componentType, componentId],
  );

  if (result.rowCount === 0) {
    return {
      isLocked: false,
      lockedBy: null,
      lockedByName: null,
      sessionId: null,
      expiresAt: null,
    };
  }

  const row = result.rows[0] as {
    id: string;
    user_id: string;
    expires_at: string;
    user_name: string | null;
  };

  return {
    isLocked: true,
    lockedBy: row.user_id,
    lockedByName: row.user_name,
    sessionId: row.id,
    expiresAt: row.expires_at,
  };
}

/**
 * Format source code. Currently returns the source as-is with basic
 * whitespace normalization. Extend with a real PL/SQL formatter later.
 */
export async function formatCode(
  source: string,
  _language: string,
): Promise<FormatResponse> {
  // Basic formatting: normalize trailing whitespace, ensure final newline
  let formatted = source
    .split('\n')
    .map((line) => line.trimEnd())
    .join('\n');

  if (!formatted.endsWith('\n')) {
    formatted += '\n';
  }

  const changed = formatted !== source;

  return { formatted, changed };
}

/**
 * Get paginated change log for a component.
 */
export async function getChangeLog(
  tenantId: string,
  connectionId: string,
  componentType: string,
  componentId: string,
  limit = 20,
  offset = 0,
): Promise<{ entries: ChangeLogEntry[]; total: number }> {
  const countResult = await pool.query(
    `SELECT count(*)::int as total
     FROM change_log
     WHERE tenant_id = $1
       AND connection_id = $2
       AND component_type = $3
       AND component_id = $4`,
    [tenantId, connectionId, componentType, componentId],
  );

  const total = (countResult.rows[0] as { total: number }).total;

  const result = await pool.query(
    `SELECT *
     FROM change_log
     WHERE tenant_id = $1
       AND connection_id = $2
       AND component_type = $3
       AND component_id = $4
     ORDER BY applied_at DESC
     LIMIT $5 OFFSET $6`,
    [tenantId, connectionId, componentType, componentId, limit, offset],
  );

  const entries = (result.rows as ChangeLogRow[]).map(mapChangeLogRow);

  return { entries, total };
}

/**
 * Compute a diff between two code strings.
 */
export function diffCode(before: string, after: string): string {
  return computeDiff(before, after);
}
