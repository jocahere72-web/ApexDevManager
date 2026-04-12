import { pool, getClient } from '../../config/database.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import type { PoolClient } from 'pg';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import { claudeClient } from '../ai-studio/claude.client.js';
import type {
  PageGenerationJob,
  PageDefinition,
  PageGenInputType,
  PageGenStatus,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Row mapper
// ---------------------------------------------------------------------------

function rowToJob(row: Record<string, unknown>): PageGenerationJob {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    prdSessionId: (row.prd_session_id as string) ?? undefined,
    connectionId: (row.connection_id as string) ?? undefined,
    appId: (row.app_id as number) ?? undefined,
    inputType: row.input_type as PageGenInputType,
    inputContent: row.input_content as string,
    status: row.status as PageGenStatus,
    pageDefinition: (row.page_definition as PageDefinition) ?? undefined,
    appliedPageId: (row.applied_page_id as number) ?? undefined,
    errorMessage: (row.error_message as string) ?? undefined,
    createdBy: row.created_by as string,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

// ---------------------------------------------------------------------------
// Generate Page
// ---------------------------------------------------------------------------

/**
 * Generate an APEX page definition from a PRD section or freeform text using AI.
 */
export async function generatePage(
  input: {
    prdSessionId?: string;
    connectionId?: string;
    appId?: number;
    inputType: PageGenInputType;
    inputContent: string;
  },
  userId: string,
  tenantId: string,
  client?: PoolClient,
): Promise<PageGenerationJob> {
  // Create the job record
  const jobResult = await tenantQuery(client,
    `INSERT INTO page_generation_jobs
       (tenant_id, prd_session_id, connection_id, app_id, input_type, input_content, status, created_by)
     VALUES ($1, $2, $3, $4, $5, $6, 'generating', $7)
     RETURNING *`,
    [
      tenantId,
      input.prdSessionId ?? null,
      input.connectionId ?? null,
      input.appId ?? null,
      input.inputType,
      input.inputContent,
      userId,
    ],
  );

  const jobId = jobResult.rows[0].id as string;

  // Generate page definition via AI (async)
  generatePageAsync(jobId, input.inputContent, input.inputType, tenantId).catch((err) => {
    logger.error({ err, jobId }, 'Page generation failed');
  });

  return rowToJob(jobResult.rows[0]);
}

/**
 * Async page generation using AI.
 */
async function generatePageAsync(
  jobId: string,
  inputContent: string,
  inputType: PageGenInputType,
  tenantId: string,
  client?: PoolClient,
): Promise<void> {
  try {
    const contextLabel =
      inputType === 'prd_section'
        ? 'PRD Section'
        : inputType === 'requirements'
          ? 'Requirements'
          : 'Description';

    const systemPrompt = `You are an Oracle APEX page architect. Given a ${contextLabel}, generate a complete APEX page definition as JSON.

Return a JSON object with this exact structure:
{
  "pageName": "string",
  "pageAlias": "string (lowercase-hyphenated)",
  "pageMode": "normal|modal|drawer",
  "pageTemplate": "optional template name",
  "regions": [
    {"name": "string", "type": "body|header|footer|sidebar|sub-region", "template": "optional", "parentRegion": "optional", "displaySequence": number}
  ],
  "items": [
    {"name": "string (P<N>_ITEM_NAME format)", "regionName": "string", "itemType": "text|input|select|button|report|chart|hidden", "label": "optional", "source": "optional", "sourceType": "column|static|plsql|sql", "displaySequence": number, "isRequired": boolean, "defaultValue": "optional", "helpText": "optional", "conditions": "optional"}
  ],
  "processes": [
    {"name": "string", "type": "plsql|dml|web_service|computation", "point": "before_header|after_header|before_submit|after_submit|on_demand", "source": "PL/SQL code", "conditionType": "optional", "conditionExpression": "optional", "errorMessage": "optional"}
  ],
  "computations": [
    {"name": "string", "type": "static|plsql|sql|item_value", "point": "before_header|after_header|before_submit|after_submit", "itemName": "string", "source": "string"}
  ],
  "validations": [
    {"name": "string", "type": "item|page|tabular", "validationType": "not_null|regex|plsql|sql|func_body", "itemName": "optional", "source": "string", "errorMessage": "string", "conditionType": "optional", "conditionExpression": "optional"}
  ]
}

Generate realistic PL/SQL code for processes and validations.
Use APEX naming conventions (P<page_num>_ITEM_NAME).
Respond ONLY with the JSON object, no markdown fences or extra text.`;

    const userPrompt = `Generate an Oracle APEX page definition for the following ${contextLabel}:

${inputContent}`;

    const response = await claudeClient.chat(
      [{ role: 'user', content: userPrompt }],
      { systemPrompt },
    );

    let pageDefinition: PageDefinition;
    try {
      pageDefinition = JSON.parse(response.content) as PageDefinition;
    } catch {
      throw new Error('Failed to parse AI-generated page definition');
    }

    // Update job with result
    await tenantQuery(client,
      `UPDATE page_generation_jobs
       SET status = 'preview', page_definition = $1, updated_at = NOW()
       WHERE id = $2 AND tenant_id = $3`,
      [JSON.stringify(pageDefinition), jobId, tenantId],
    );

    logger.info({ jobId }, 'Page definition generated');
  } catch (err) {
    // Mark job as error
    await tenantQuery(client,
      `UPDATE page_generation_jobs
       SET status = 'error', error_message = $1, updated_at = NOW()
       WHERE id = $2`,
      [(err as Error).message, jobId],
    );

    throw err;
  }
}

// ---------------------------------------------------------------------------
// Preview Page
// ---------------------------------------------------------------------------

/**
 * Get the generated page definition for preview.
 */
export async function previewPage(
  jobId: string,
  tenantId: string,
  client?: PoolClient,
): Promise<PageGenerationJob> {
  const result = await tenantQuery(client,
    `SELECT * FROM page_generation_jobs WHERE id = $1 AND tenant_id = $2`,
    [jobId, tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Page generation job not found');
  }

  return rowToJob(result.rows[0]);
}

// ---------------------------------------------------------------------------
// Apply Page
// ---------------------------------------------------------------------------

/**
 * Apply the generated page definition to an APEX application via MCP/ORDS.
 * In production, this would call the APEX REST API or use MCP to create the page.
 */
export async function applyPage(
  jobId: string,
  tenantId: string,
  userId: string,
  client?: PoolClient,
): Promise<PageGenerationJob> {
  const txClient = await getClient();

  try {
    await txClient.query('BEGIN');

    const jobResult = await txClient.query(
      `SELECT * FROM page_generation_jobs WHERE id = $1 AND tenant_id = $2`,
      [jobId, tenantId],
    );

    if (jobResult.rowCount === 0) {
      throw new NotFoundError('Page generation job not found');
    }

    const job = rowToJob(jobResult.rows[0]);

    if (job.status !== 'preview') {
      throw new ValidationError(
        `Cannot apply job in status "${job.status}". Job must be in "preview" status.`,
      );
    }

    if (!job.pageDefinition) {
      throw new ValidationError('No page definition available to apply.');
    }

    if (!job.connectionId) {
      throw new ValidationError('No connection specified. Set a connection before applying.');
    }

    // Update status to applying
    await txClient.query(
      `UPDATE page_generation_jobs SET status = 'applying', updated_at = NOW() WHERE id = $1`,
      [jobId],
    );

    await txClient.query('COMMIT');

    // In production: Call APEX ORDS API or MCP to create the page
    // For now, simulate page creation
    const simulatedPageId = Math.floor(Math.random() * 9000) + 1000;

    // TODO: Replace with actual APEX API call
    // const pageId = await apexClient.createPage(job.connectionId, job.appId, job.pageDefinition);

    await tenantQuery(client,
      `UPDATE page_generation_jobs
       SET status = 'applied', applied_page_id = $1, updated_at = NOW()
       WHERE id = $2 AND tenant_id = $3`,
      [simulatedPageId, jobId, tenantId],
    );

    logger.info(
      { jobId, pageId: simulatedPageId, tenantId },
      'Page applied to APEX application',
    );

    // Return updated job
    return await previewPage(jobId, tenantId, client);
  } catch (err) {
    await txClient.query('ROLLBACK').catch(() => {});

    // Mark as error if not already
    await tenantQuery(client,
      `UPDATE page_generation_jobs
       SET status = 'error', error_message = $1, updated_at = NOW()
       WHERE id = $2 AND status = 'applying'`,
      [(err as Error).message, jobId],
    );

    throw err;
  } finally {
    txClient.release();
  }
}

// ---------------------------------------------------------------------------
// Get Job
// ---------------------------------------------------------------------------

/**
 * Get a single page generation job.
 */
export async function getJob(
  jobId: string,
  tenantId: string,
  client?: PoolClient,
): Promise<PageGenerationJob> {
  const result = await tenantQuery(client,
    `SELECT * FROM page_generation_jobs WHERE id = $1 AND tenant_id = $2`,
    [jobId, tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Page generation job not found');
  }

  return rowToJob(result.rows[0]);
}

// ---------------------------------------------------------------------------
// List Jobs
// ---------------------------------------------------------------------------

/**
 * List page generation jobs for a tenant.
 */
export async function listJobs(
  tenantId: string,
  page = 1,
  limit = 20,
  status?: string,
  client?: PoolClient,
): Promise<{ jobs: PageGenerationJob[]; total: number }> {
  const conditions = ['tenant_id = $1'];
  const params: unknown[] = [tenantId];
  let paramIdx = 2;

  if (status) {
    conditions.push(`status = $${paramIdx}`);
    params.push(status);
    paramIdx++;
  }

  const where = conditions.join(' AND ');
  const offset = (page - 1) * limit;

  const [dataResult, countResult] = await Promise.all([
    tenantQuery(client,
      `SELECT * FROM page_generation_jobs
       WHERE ${where}
       ORDER BY created_at DESC
       LIMIT $${paramIdx} OFFSET $${paramIdx + 1}`,
      [...params, limit, offset],
    ),
    tenantQuery(client,
      `SELECT COUNT(*)::int AS total FROM page_generation_jobs WHERE ${where}`,
      params,
    ),
  ]);

  return {
    jobs: dataResult.rows.map(rowToJob),
    total: countResult.rows[0].total as number,
  };
}
