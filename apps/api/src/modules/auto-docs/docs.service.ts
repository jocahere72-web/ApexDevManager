import { pool } from '../../config/database.js';
import { PoolClient } from 'pg';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import { MCPClient, type MCPConnectionConfig } from '../../integrations/mcp/mcp-client.js';
import { decryptCredentials } from '../connections/encryption.service.js';
import { getConnectionForTenant, type ResolvedConnection } from '../connections/connections.repository.js';
import type {
  DocGenRequest,
  GeneratedDoc,
  DocExportFormat,
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

// In-memory doc store (would be a DB table in production)
const docStore = new Map<string, GeneratedDoc>();

// ── Service functions ───────────────────────────────────────────────────────

export async function generateDocs(
  tenantId: string,
  userId: string,
  request: DocGenRequest,
  client?: PoolClient,
): Promise<GeneratedDoc> {
  logger.info(
    { connectionId: request.connectionId, objectType: request.objectType, objectName: request.objectName },
    'Generating documentation',
  );

  // Fetch the source code for the object
  let sourceCode = '';
  try {
    const rows = await executeSql(tenantId, request.connectionId, `
      SELECT DBMS_METADATA.GET_DDL('${assertOracleType(request.objectType)}', '${assertOracleIdentifier(request.objectName)}') AS ddl
      FROM DUAL
    `, client);
    sourceCode = (rows[0]?.ddl as string) ?? '';
  } catch (err) {
    logger.warn({ err }, 'Failed to fetch DDL, attempting source fetch');
    // Fallback: try fetching from all_source for PL/SQL objects
    const rows = await executeSql(tenantId, request.connectionId, `
      SELECT text FROM all_source
      WHERE owner = '${assertOracleIdentifier(request.schema)}'
        AND name = '${assertOracleIdentifier(request.objectName)}'
        AND type = '${assertOracleType(request.objectType)}'
      ORDER BY line
    `, client);
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
  client?: PoolClient,
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
  `, client);

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
      throw new AppError(`Unsupported export format: ${format}`, 400, 'BAD_REQUEST');
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
