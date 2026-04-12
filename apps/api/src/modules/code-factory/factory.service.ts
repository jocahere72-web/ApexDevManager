// ---------------------------------------------------------------------------
// Code Factory Service (M16 AI Code Generation)
// ---------------------------------------------------------------------------

import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import { claudeClient } from '../ai-studio/claude.client.js';
import type {
  FactorySpec,
  FactoryTemplate,
  FactoryJob,
  FactoryJobStatus,
  GeneratedOutput,
  FactoryComponentType,
  CreateTemplateRequest,
  TemplateVariable,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Row mappers
// ---------------------------------------------------------------------------

function rowToTemplate(row: Record<string, unknown>): FactoryTemplate {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    name: row.name as string,
    description: row.description as string,
    componentType: row.component_type as FactoryComponentType,
    templateContent: row.template_content as string,
    variables: (row.variables as TemplateVariable[]) ?? [],
    tags: (row.tags as string[]) ?? [],
    usageCount: (row.usage_count as number) ?? 0,
    createdBy: row.created_by as string,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

function rowToJob(row: Record<string, unknown>, outputs: GeneratedOutput[] = []): FactoryJob {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    userId: row.user_id as string,
    status: row.status as FactoryJobStatus,
    spec: (typeof row.spec === 'string' ? JSON.parse(row.spec as string) : row.spec) as FactorySpec,
    outputs,
    errorMessage: (row.error_message as string) ?? undefined,
    startedAt: row.started_at ? (row.started_at as Date).toISOString() : undefined,
    completedAt: row.completed_at ? (row.completed_at as Date).toISOString() : undefined,
    executionTimeMs: (row.execution_time_ms as number) ?? undefined,
    tokensUsed: (row.tokens_used as number) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
  };
}

function rowToOutput(row: Record<string, unknown>): GeneratedOutput {
  return {
    id: row.id as string,
    jobId: row.job_id as string,
    filename: row.filename as string,
    language: row.language as string,
    content: row.content as string,
    componentType: row.component_type as FactoryComponentType,
    description: row.description as string,
    lineCount: (row.line_count as number) ?? 0,
    applied: (row.applied as boolean) ?? false,
    appliedAt: row.applied_at ? (row.applied_at as Date).toISOString() : undefined,
  };
}

// ---------------------------------------------------------------------------
// Generate from Spec (AI-powered)
// ---------------------------------------------------------------------------

/**
 * Generate complete module code from a specification using AI.
 */
export async function generateFromSpec(
  spec: FactorySpec,
  tenantId: string,
  userId: string,
): Promise<FactoryJob> {
  logger.info({ spec: spec.name, componentType: spec.componentType, tenantId }, 'Starting code generation from spec');

  // Create the job record
  const jobResult = await pool.query(
    `INSERT INTO factory_jobs (tenant_id, user_id, status, spec, started_at)
     VALUES ($1, $2, 'processing', $3, NOW())
     RETURNING *`,
    [tenantId, userId, JSON.stringify(spec)],
  );

  const jobId = jobResult.rows[0].id as string;
  const startTime = Date.now();

  try {
    // Load template if specified
    let templateContent = '';
    if (spec.templateId) {
      const templateResult = await pool.query(
        `SELECT template_content FROM factory_templates WHERE id = $1 AND tenant_id = $2`,
        [spec.templateId, tenantId],
      );
      if (templateResult.rowCount) {
        templateContent = `\n\nUse this template as a base:\n${templateResult.rows[0].template_content}`;
        await pool.query(
          `UPDATE factory_templates SET usage_count = usage_count + 1 WHERE id = $1`,
          [spec.templateId],
        );
      }
    }

    const prompt = `You are an Oracle APEX and PL/SQL code generation expert. Generate complete, production-ready code based on this specification:

Name: ${spec.name}
Component Type: ${spec.componentType}
Description: ${spec.description}
Requirements: ${spec.requirements}
${spec.constraints?.length ? `Constraints: ${spec.constraints.join(', ')}` : ''}
${templateContent}

Generate all necessary files. Return a JSON array where each element has:
- filename: the file name (e.g., "my_package.pkb", "page_100.sql")
- language: the language ("plsql", "sql", "javascript", "css")
- content: the complete file content
- componentType: the APEX component type
- description: what this file does

Include:
1. The main component code
2. Supporting objects (tables, views, sequences if needed)
3. Grant statements
4. Installation script

Return ONLY the JSON array.`;

    const response = await claudeClient.chat(
      [{ role: 'user', content: prompt }],
      { systemPrompt: 'You are an Oracle APEX expert code generator. Return only valid JSON arrays.' },
    );

    let generatedFiles: Array<{
      filename: string;
      language: string;
      content: string;
      componentType: string;
      description: string;
    }>;

    try {
      generatedFiles = JSON.parse(response.content);
    } catch {
      throw new ValidationError('AI returned invalid code generation format');
    }

    // Save generated outputs
    const outputs: GeneratedOutput[] = [];
    for (const file of generatedFiles) {
      const lineCount = file.content.split('\n').length;
      const outputResult = await pool.query(
        `INSERT INTO factory_outputs (job_id, tenant_id, filename, language, content, component_type, description, line_count)
         VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
         RETURNING *`,
        [jobId, tenantId, file.filename, file.language, file.content, file.componentType, file.description, lineCount],
      );
      outputs.push(rowToOutput(outputResult.rows[0]));
    }

    const executionTimeMs = Date.now() - startTime;
    const tokensUsed = (response.inputTokens ?? 0) + (response.outputTokens ?? 0);

    // Update job as completed
    await pool.query(
      `UPDATE factory_jobs
       SET status = 'completed', completed_at = NOW(), execution_time_ms = $1, tokens_used = $2
       WHERE id = $3`,
      [executionTimeMs, tokensUsed, jobId],
    );

    logger.info({ jobId, outputCount: outputs.length, executionTimeMs }, 'Code generation completed');

    const updatedJob = await pool.query(`SELECT * FROM factory_jobs WHERE id = $1`, [jobId]);
    return rowToJob(updatedJob.rows[0], outputs);
  } catch (err) {
    // Update job as failed
    await pool.query(
      `UPDATE factory_jobs
       SET status = 'failed', error_message = $1, completed_at = NOW(), execution_time_ms = $2
       WHERE id = $3`,
      [(err as Error).message, Date.now() - startTime, jobId],
    );
    throw err;
  }
}

// ---------------------------------------------------------------------------
// Generate Batch
// ---------------------------------------------------------------------------

/**
 * Generate code for multiple components in batch.
 */
export async function generateBatch(
  specs: FactorySpec[],
  connectionId: string,
  tenantId: string,
  userId: string,
): Promise<FactoryJob[]> {
  logger.info({ count: specs.length, tenantId }, 'Starting batch code generation');

  const jobs: FactoryJob[] = [];
  for (const spec of specs) {
    const enrichedSpec = { ...spec, connectionId: spec.connectionId || connectionId };
    const job = await generateFromSpec(enrichedSpec, tenantId, userId);
    jobs.push(job);
  }

  return jobs;
}

// ---------------------------------------------------------------------------
// Template CRUD
// ---------------------------------------------------------------------------

/**
 * Get all templates for a tenant.
 */
export async function getTemplates(
  tenantId: string,
  componentType?: FactoryComponentType,
): Promise<FactoryTemplate[]> {
  const conditions = ['tenant_id = $1'];
  const params: unknown[] = [tenantId];

  if (componentType) {
    conditions.push('component_type = $2');
    params.push(componentType);
  }

  const result = await pool.query(
    `SELECT * FROM factory_templates WHERE ${conditions.join(' AND ')} ORDER BY usage_count DESC, name`,
    params,
  );

  return result.rows.map(rowToTemplate);
}

/**
 * Create a new template.
 */
export async function createTemplate(
  request: CreateTemplateRequest,
  tenantId: string,
  userId: string,
): Promise<FactoryTemplate> {
  const result = await pool.query(
    `INSERT INTO factory_templates (tenant_id, name, description, component_type, template_content, variables, tags, created_by)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
     RETURNING *`,
    [
      tenantId,
      request.name,
      request.description,
      request.componentType,
      request.templateContent,
      JSON.stringify(request.variables ?? []),
      request.tags ?? [],
      userId,
    ],
  );

  logger.info({ templateId: result.rows[0].id, tenantId }, 'Template created');
  return rowToTemplate(result.rows[0]);
}

/**
 * Delete a template.
 */
export async function deleteTemplate(
  id: string,
  tenantId: string,
): Promise<void> {
  const result = await pool.query(
    `DELETE FROM factory_templates WHERE id = $1 AND tenant_id = $2 RETURNING id`,
    [id, tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Template not found');
  }
}

// ---------------------------------------------------------------------------
// Jobs
// ---------------------------------------------------------------------------

/**
 * List code generation jobs for a tenant.
 */
export async function listJobs(
  tenantId: string,
  status?: FactoryJobStatus,
): Promise<FactoryJob[]> {
  const conditions = ['tenant_id = $1'];
  const params: unknown[] = [tenantId];

  if (status) {
    conditions.push('status = $2');
    params.push(status);
  }

  const result = await pool.query(
    `SELECT * FROM factory_jobs WHERE ${conditions.join(' AND ')} ORDER BY created_at DESC LIMIT 50`,
    params,
  );

  const jobs: FactoryJob[] = [];
  for (const row of result.rows) {
    const outputsResult = await pool.query(
      `SELECT * FROM factory_outputs WHERE job_id = $1 ORDER BY filename`,
      [row.id],
    );
    jobs.push(rowToJob(row, outputsResult.rows.map(rowToOutput)));
  }

  return jobs;
}

/**
 * Get a specific job by ID.
 */
export async function getJob(
  jobId: string,
  tenantId: string,
): Promise<FactoryJob> {
  const result = await pool.query(
    `SELECT * FROM factory_jobs WHERE id = $1 AND tenant_id = $2`,
    [jobId, tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Job not found');
  }

  const outputsResult = await pool.query(
    `SELECT * FROM factory_outputs WHERE job_id = $1 ORDER BY filename`,
    [jobId],
  );

  return rowToJob(result.rows[0], outputsResult.rows.map(rowToOutput));
}
