import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import { MCPClient, type MCPConnectionConfig } from '../../integrations/mcp/mcp-client.js';
import { decryptCredentials } from '../connections/encryption.service.js';
import type {
  DocGenRequest,
  GeneratedDoc,
  DocExportFormat,
} from '@apex-dev-manager/shared-types';

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
  const creds = decryptCredentials(conn.encrypted_credentials);
  const mcpConfig: MCPConnectionConfig = {
    type: conn.type,
    config: conn.config,
    credentials: creds,
  };
  const mcp = new MCPClient(mcpConfig);
  try {
    const result = await mcp.executeSQL(sql);
    return result.rows ?? [];
  } finally {
    await mcp.disconnect();
  }
}

// In-memory doc store (would be a DB table in production)
const docStore = new Map<string, GeneratedDoc>();

// ── Service functions ───────────────────────────────────────────────────────

export async function generateDocs(
  tenantId: string,
  userId: string,
  request: DocGenRequest,
): Promise<GeneratedDoc> {
  logger.info(
    { connectionId: request.connectionId, objectType: request.objectType, objectName: request.objectName },
    'Generating documentation',
  );

  // Fetch the source code for the object
  let sourceCode = '';
  try {
    const rows = await executeSql(tenantId, request.connectionId, `
      SELECT DBMS_METADATA.GET_DDL('${request.objectType.toUpperCase()}', '${request.objectName.toUpperCase()}') AS ddl
      FROM DUAL
    `);
    sourceCode = (rows[0]?.ddl as string) ?? '';
  } catch (err) {
    logger.warn({ err }, 'Failed to fetch DDL, attempting source fetch');
    // Fallback: try fetching from all_source for PL/SQL objects
    const rows = await executeSql(tenantId, request.connectionId, `
      SELECT text FROM all_source
      WHERE owner = '${request.schema.toUpperCase()}'
        AND name = '${request.objectName.toUpperCase()}'
        AND type = '${request.objectType.toUpperCase()}'
      ORDER BY line
    `);
    sourceCode = rows.map((r) => r.text as string).join('');
  }

  // Generate markdown documentation via AI analysis
  // In production, this would call an LLM to analyze and document the code
  const title = `${request.objectType}: ${request.objectName}`;
  const content = generateMarkdownDoc(request, sourceCode);

  const doc: GeneratedDoc = {
    id: crypto.randomUUID(),
    tenantId,
    connectionId: request.connectionId,
    objectType: request.objectType,
    objectName: request.objectName,
    schema: request.schema,
    title,
    content,
    format: 'markdown',
    generatedBy: userId,
    createdAt: new Date().toISOString(),
    updatedAt: new Date().toISOString(),
  };

  docStore.set(doc.id, doc);
  logger.info({ docId: doc.id }, 'Documentation generated');
  return doc;
}

function generateMarkdownDoc(request: DocGenRequest, sourceCode: string): string {
  const lines: string[] = [
    `# ${request.objectType}: ${request.objectName}`,
    '',
    `**Schema**: ${request.schema}`,
    `**Type**: ${request.objectType}`,
    `**Generated**: ${new Date().toISOString()}`,
    '',
    '## Overview',
    '',
    `This document describes the \`${request.objectName}\` ${request.objectType.toLowerCase()} in the \`${request.schema}\` schema.`,
    '',
    '## Source Code',
    '',
    '```sql',
    sourceCode || '-- Source code not available',
    '```',
    '',
  ];

  if (request.includeExamples) {
    lines.push(
      '## Usage Examples',
      '',
      '```sql',
      `-- Example usage of ${request.objectName}`,
      `SELECT * FROM ${request.schema}.${request.objectName};`,
      '```',
      '',
    );
  }

  return lines.join('\n');
}

export async function generateAPIDoc(
  tenantId: string,
  userId: string,
  connectionId: string,
): Promise<GeneratedDoc> {
  logger.info({ connectionId }, 'Generating API documentation from ORDS endpoints');

  // Fetch ORDS module and template metadata
  const modules = await executeSql(tenantId, connectionId, `
    SELECT m.name AS module_name, m.uri_prefix,
           t.uri_template, h.source_type, h.method
    FROM user_ords_modules m
    LEFT JOIN user_ords_templates t ON m.id = t.module_id
    LEFT JOIN user_ords_handlers h ON t.id = h.template_id
    ORDER BY m.name, t.uri_template
  `);

  const lines: string[] = [
    '# ORDS API Documentation',
    '',
    `**Generated**: ${new Date().toISOString()}`,
    '',
    '## Endpoints',
    '',
  ];

  for (const mod of modules) {
    lines.push(
      `### ${mod.method ?? 'GET'} ${mod.uri_prefix}${mod.uri_template ?? ''}`,
      '',
      `- **Module**: ${mod.module_name}`,
      `- **Source Type**: ${mod.source_type ?? 'N/A'}`,
      '',
    );
  }

  const doc: GeneratedDoc = {
    id: crypto.randomUUID(),
    tenantId,
    connectionId,
    objectType: 'API',
    objectName: 'ORDS_ENDPOINTS',
    schema: '',
    title: 'ORDS API Documentation',
    content: lines.join('\n'),
    format: 'markdown',
    generatedBy: userId,
    createdAt: new Date().toISOString(),
    updatedAt: new Date().toISOString(),
  };

  docStore.set(doc.id, doc);
  return doc;
}

export async function exportDoc(
  docId: string,
  format: DocExportFormat,
): Promise<{ content: string; mimeType: string }> {
  const doc = docStore.get(docId);
  if (!doc) {
    throw new NotFoundError('Document not found');
  }

  switch (format) {
    case 'markdown':
      return { content: doc.content, mimeType: 'text/markdown' };

    case 'html': {
      // Simple markdown-to-HTML conversion
      const html = `<!DOCTYPE html>
<html><head><title>${doc.title}</title></head>
<body>
<pre>${doc.content}</pre>
</body></html>`;
      return { content: html, mimeType: 'text/html' };
    }

    case 'pdf':
      // In production, use a PDF generation library
      logger.info({ docId }, 'PDF export requested - returning markdown as placeholder');
      return { content: doc.content, mimeType: 'text/markdown' };

    case 'confluence':
      // In production, push to Confluence via API
      logger.info({ docId }, 'Confluence export requested - returning markdown as placeholder');
      return { content: doc.content, mimeType: 'text/markdown' };

    default:
      throw new AppError(`Unsupported export format: ${format}`, 400);
  }
}

export function listDocs(tenantId: string): GeneratedDoc[] {
  return Array.from(docStore.values())
    .filter((d) => d.tenantId === tenantId)
    .sort((a, b) => b.createdAt.localeCompare(a.createdAt));
}

export function getDoc(tenantId: string, docId: string): GeneratedDoc {
  const doc = docStore.get(docId);
  if (!doc || doc.tenantId !== tenantId) {
    throw new NotFoundError('Document not found');
  }
  return doc;
}
