import { logger } from '../../lib/logger.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import { NotFoundError, ConflictError } from '../../lib/errors.js';
import type { CreatePromptTemplateInput, UpdatePromptTemplateInput } from './prompt-templates.validation.js';
import type { PoolClient } from 'pg';

// ── Types ────────────────────────────────────────────────────────────────────

export interface PromptTemplateRow {
  id: string;
  tenantId: string;
  slug: string;
  name: string;
  description: string | null;
  category: string;
  promptText: string;
  modelOverride: string | null;
  temperature: number;
  maxTokens: number;
  variables: string[];
  isSystemDefault: boolean;
  isActive: boolean;
  version: number;
  createdBy: string | null;
  createdAt: string;
  updatedAt: string;
}

// ── Row mapper ──────────────────────────────────────────────────────────────

function rowToTemplate(row: Record<string, unknown>): PromptTemplateRow {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    slug: row.slug as string,
    name: row.name as string,
    description: (row.description as string) ?? null,
    category: row.category as string,
    promptText: row.prompt_text as string,
    modelOverride: (row.model_override as string) ?? null,
    temperature: Number(row.temperature ?? 0.7),
    maxTokens: (row.max_tokens as number) ?? 4096,
    variables: (row.variables as string[]) ?? [],
    isSystemDefault: row.is_system_default as boolean,
    isActive: row.is_active as boolean,
    version: row.version as number,
    createdBy: (row.created_by as string) ?? null,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

// ── Audit Logging ───────────────────────────────────────────────────────────

async function logAudit(
  tenantId: string,
  actorId: string,
  action: string,
  targetId: string,
  details?: Record<string, unknown>,
  client?: PoolClient,
): Promise<void> {
  try {
    await tenantQuery(
      client,
      `INSERT INTO audit_events (tenant_id, user_id, event_type, action, entity_type, entity_id, event_payload, created_at)
       VALUES ($1, $2, 'prompt_template_management', $3, 'prompt_template', $4, $5, NOW())`,
      [tenantId, actorId, action, targetId, details ? JSON.stringify(details) : null],
    );
  } catch (err) {
    logger.error({ err, tenantId, actorId, action, targetId }, 'Failed to write audit log');
  }
}

// ── Select columns ──────────────────────────────────────────────────────────

const SELECT_COLS = `id, tenant_id, slug, name, description, category, prompt_text,
  model_override, temperature, max_tokens, variables, is_system_default,
  is_active, version, created_by, created_at, updated_at`;

// ── Create Template ─────────────────────────────────────────────────────────

export async function createTemplate(
  tenantId: string,
  data: CreatePromptTemplateInput,
  actorId: string,
  client?: PoolClient,
): Promise<PromptTemplateRow> {
  // Get max version for this slug
  const versionResult = await tenantQuery(
    client,
    `SELECT COALESCE(MAX(version), 0)::int AS max_version
     FROM prompt_templates WHERE tenant_id = $1 AND slug = $2`,
    [tenantId, data.slug],
  );
  const newVersion = (versionResult.rows[0].max_version as number) + 1;

  // Extract variables from prompt text
  const extractedVars = extractVariables(data.promptText);
  const variables = data.variables?.length ? data.variables : extractedVars;

  const result = await tenantQuery(
    client,
    `INSERT INTO prompt_templates (
       tenant_id, slug, name, description, category, prompt_text,
       model_override, temperature, max_tokens, variables,
       is_system_default, is_active, version, created_by
     ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, TRUE, $12, $13)
     RETURNING ${SELECT_COLS}`,
    [
      tenantId,
      data.slug,
      data.name,
      data.description ?? null,
      data.category,
      data.promptText,
      data.modelOverride ?? null,
      data.temperature ?? 0.7,
      data.maxTokens ?? 4096,
      JSON.stringify(variables),
      data.isSystemDefault ?? false,
      newVersion,
      actorId,
    ],
  );

  const created = rowToTemplate(result.rows[0]);

  await logAudit(tenantId, actorId, 'prompt_template.created', created.id, {
    slug: data.slug,
    name: data.name,
    category: data.category,
  }, client);

  logger.info({ tenantId, templateId: created.id, slug: data.slug }, 'Prompt template created');

  return created;
}

// ── List Templates ──────────────────────────────────────────────────────────

export async function listTemplates(
  tenantId: string,
  category?: string,
  client?: PoolClient,
): Promise<PromptTemplateRow[]> {
  let sql = `SELECT ${SELECT_COLS} FROM prompt_templates WHERE tenant_id = $1 AND is_active = TRUE`;
  const params: unknown[] = [tenantId];

  if (category) {
    sql += ` AND category = $2`;
    params.push(category);
  }

  sql += ` ORDER BY category ASC, name ASC`;

  const result = await tenantQuery(client, sql, params);
  return result.rows.map(rowToTemplate);
}

// ── Get Template ────────────────────────────────────────────────────────────

export async function getTemplate(
  tenantId: string,
  id: string,
  client?: PoolClient,
): Promise<PromptTemplateRow> {
  const result = await tenantQuery(
    client,
    `SELECT ${SELECT_COLS} FROM prompt_templates WHERE tenant_id = $1 AND id = $2`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Prompt template not found');
  }

  return rowToTemplate(result.rows[0]);
}

// ── Get Template by Slug ────────────────────────────────────────────────────

export async function getTemplateBySlug(
  tenantId: string,
  slug: string,
  client?: PoolClient,
): Promise<PromptTemplateRow | null> {
  const result = await tenantQuery(
    client,
    `SELECT ${SELECT_COLS} FROM prompt_templates
     WHERE tenant_id = $1 AND slug = $2 AND is_active = TRUE
     ORDER BY version DESC LIMIT 1`,
    [tenantId, slug],
  );

  if (result.rowCount === 0) {
    return null;
  }

  return rowToTemplate(result.rows[0]);
}

// ── Update Template ─────────────────────────────────────────────────────────

export async function updateTemplate(
  tenantId: string,
  id: string,
  data: UpdatePromptTemplateInput,
  actorId: string,
  client?: PoolClient,
): Promise<PromptTemplateRow> {
  // Get the current template
  const current = await getTemplate(tenantId, id, client);

  // Deactivate old version
  await tenantQuery(
    client,
    `UPDATE prompt_templates SET is_active = FALSE, updated_at = NOW()
     WHERE id = $1 AND tenant_id = $2`,
    [id, tenantId],
  );

  // Determine new prompt text and variables
  const newPromptText = data.promptText ?? current.promptText;
  const extractedVars = extractVariables(newPromptText);
  const variables = data.variables?.length ? data.variables : extractedVars;

  // Get max version for this slug
  const versionResult = await tenantQuery(
    client,
    `SELECT COALESCE(MAX(version), 0)::int AS max_version
     FROM prompt_templates WHERE tenant_id = $1 AND slug = $2`,
    [tenantId, current.slug],
  );
  const newVersion = (versionResult.rows[0].max_version as number) + 1;

  // Insert new version
  const result = await tenantQuery(
    client,
    `INSERT INTO prompt_templates (
       tenant_id, slug, name, description, category, prompt_text,
       model_override, temperature, max_tokens, variables,
       is_system_default, is_active, version, created_by
     ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
     RETURNING ${SELECT_COLS}`,
    [
      tenantId,
      current.slug,
      data.name ?? current.name,
      data.description !== undefined ? data.description : current.description,
      current.category,
      newPromptText,
      data.modelOverride !== undefined ? data.modelOverride : current.modelOverride,
      data.temperature ?? current.temperature,
      data.maxTokens ?? current.maxTokens,
      JSON.stringify(variables),
      current.isSystemDefault,
      data.isActive !== undefined ? data.isActive : true,
      newVersion,
      actorId,
    ],
  );

  const updated = rowToTemplate(result.rows[0]);

  await logAudit(tenantId, actorId, 'prompt_template.updated', updated.id, {
    slug: current.slug,
    previousVersion: current.version,
    newVersion,
  }, client);

  logger.info({ tenantId, templateId: updated.id, slug: current.slug, newVersion }, 'Prompt template updated');

  return updated;
}

// ── Delete Template ─────────────────────────────────────────────────────────

export async function deleteTemplate(
  tenantId: string,
  id: string,
  actorId: string,
  client?: PoolClient,
): Promise<void> {
  const result = await tenantQuery(
    client,
    `DELETE FROM prompt_templates WHERE tenant_id = $1 AND id = $2 RETURNING id, slug`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Prompt template not found');
  }

  await logAudit(tenantId, actorId, 'prompt_template.deleted', id, {
    slug: result.rows[0].slug,
  }, client);

  logger.info({ tenantId, templateId: id }, 'Prompt template deleted');
}

// ── Reset to Default ────────────────────────────────────────────────────────

export async function resetToDefault(
  tenantId: string,
  slug: string,
  actorId: string,
  client?: PoolClient,
): Promise<PromptTemplateRow> {
  const defaultTemplate = SYSTEM_DEFAULT_TEMPLATES.find((t) => t.slug === slug);
  if (!defaultTemplate) {
    throw new NotFoundError(`No system default found for slug: ${slug}`);
  }

  // Deactivate all existing versions for this slug
  await tenantQuery(
    client,
    `UPDATE prompt_templates SET is_active = FALSE, updated_at = NOW()
     WHERE tenant_id = $1 AND slug = $2`,
    [tenantId, slug],
  );

  // Get max version
  const versionResult = await tenantQuery(
    client,
    `SELECT COALESCE(MAX(version), 0)::int AS max_version
     FROM prompt_templates WHERE tenant_id = $1 AND slug = $2`,
    [tenantId, slug],
  );
  const newVersion = (versionResult.rows[0].max_version as number) + 1;

  // Insert default
  const result = await tenantQuery(
    client,
    `INSERT INTO prompt_templates (
       tenant_id, slug, name, description, category, prompt_text,
       model_override, temperature, max_tokens, variables,
       is_system_default, is_active, version, created_by
     ) VALUES ($1, $2, $3, $4, $5, $6, NULL, $7, $8, $9, TRUE, TRUE, $10, $11)
     RETURNING ${SELECT_COLS}`,
    [
      tenantId,
      defaultTemplate.slug,
      defaultTemplate.name,
      defaultTemplate.description,
      defaultTemplate.category,
      defaultTemplate.promptText,
      defaultTemplate.temperature,
      defaultTemplate.maxTokens,
      JSON.stringify(defaultTemplate.variables),
      newVersion,
      actorId,
    ],
  );

  const reset = rowToTemplate(result.rows[0]);

  await logAudit(tenantId, actorId, 'prompt_template.reset_to_default', reset.id, {
    slug,
    newVersion,
  }, client);

  logger.info({ tenantId, templateId: reset.id, slug }, 'Prompt template reset to default');

  return reset;
}

// ── Seed Defaults ───────────────────────────────────────────────────────────

export async function seedDefaults(
  tenantId: string,
  client?: PoolClient,
): Promise<void> {
  // Check if tenant already has templates
  const existing = await tenantQuery(
    client,
    `SELECT COUNT(*)::int AS total FROM prompt_templates WHERE tenant_id = $1`,
    [tenantId],
  );

  if ((existing.rows[0].total as number) > 0) {
    logger.debug({ tenantId }, 'Prompt templates already seeded, skipping');
    return;
  }

  for (const template of SYSTEM_DEFAULT_TEMPLATES) {
    await tenantQuery(
      client,
      `INSERT INTO prompt_templates (
         tenant_id, slug, name, description, category, prompt_text,
         model_override, temperature, max_tokens, variables,
         is_system_default, is_active, version, created_by
       ) VALUES ($1, $2, $3, $4, $5, $6, NULL, $7, $8, $9, TRUE, TRUE, 1, NULL)`,
      [
        tenantId,
        template.slug,
        template.name,
        template.description,
        template.category,
        template.promptText,
        template.temperature,
        template.maxTokens,
        JSON.stringify(template.variables),
      ],
    );
  }

  logger.info({ tenantId, count: SYSTEM_DEFAULT_TEMPLATES.length }, 'Prompt template defaults seeded');
}

// ── Variable Extraction ─────────────────────────────────────────────────────

function extractVariables(promptText: string): string[] {
  const matches = promptText.match(/\{\{(\w+)\}\}/g);
  if (!matches) return [];
  const unique = new Set(matches.map((m) => m.replace(/\{\{|\}\}/g, '')));
  return Array.from(unique);
}

// ── System Default Templates ────────────────────────────────────────────────
// These are the actual prompts currently hardcoded in prd.service.ts and
// ai-studio/prompt-builder.ts, extracted as configurable defaults.

interface DefaultTemplate {
  slug: string;
  name: string;
  description: string;
  category: string;
  promptText: string;
  temperature: number;
  maxTokens: number;
  variables: string[];
}

export const SYSTEM_DEFAULT_TEMPLATES: DefaultTemplate[] = [
  // ── PRD Templates ─────────────────────────────────────────────────────────
  {
    slug: 'prd-extract',
    name: 'PRD Requirements Extraction',
    description: 'Extracts structured requirements from uploaded source documents for Oracle APEX / Genesys applications.',
    category: 'prd',
    promptText: `You are a PRD requirements extraction specialist for Oracle APEX and Genesys applications. Analyze the provided source documents and extract structured requirements data for the APEX/GENESYS domain.
Return a JSON object with this exact structure:
{
  "actors": [{"name": "string", "role": "string", "description": "string"}],
  "flows": [{"name": "string", "steps": ["string array"], "triggerEvent": "string"}],
  "businessRules": [{"id": "BR-01", "description": "string", "priority": "must|should|could"}],
  "apexPages": [{"name": "string", "type": "form|report|dashboard|wizard", "description": "string", "components": ["string array"]}],
  "genesysTables": [{"name": "string", "description": "string", "columns": ["string array"]}],
  "constraints": ["string array of constraints"],
  "assumptions": ["string array of assumptions"],
  "rawNotes": "any additional notes"
}
Respond ONLY with the JSON object, no markdown fences or extra text.`,
    temperature: 0.3,
    maxTokens: 8192,
    variables: [],
  },
  {
    slug: 'prd-generate',
    name: 'PRD Section Generation',
    description: 'Generates individual PRD sections based on extracted requirements data.',
    category: 'prd',
    promptText: `You are a technical writer creating a PRD section for an Oracle APEX / Genesys application.
Write professional, clear, detailed content for the specified section in Spanish.
Use the extraction data provided for context and requirements.
Output ONLY the section content as formatted markdown (no title heading, just the body content).`,
    temperature: 0.5,
    maxTokens: 4096,
    variables: [],
  },
  {
    slug: 'prd-validate',
    name: 'PRD Validation',
    description: 'Validates PRD completeness and consistency using domain-specific checks.',
    category: 'prd',
    promptText: `You are a PRD quality assurance specialist for Oracle APEX applications. Validate the provided PRD sections against the following domain-specific checks:
- All required sections present and non-empty
- Actors and roles well-defined
- Process flows documented
- Business rules with priorities
- Functional requirements with RF-XX identifiers
- APEX pages with component details
- Data model completeness
- Integration points documented
Return a JSON array of validation checks with structure: [{"id": "VAL-XX", "category": "completeness|consistency|quality", "severity": "blocker|warning", "passed": boolean, "message": "string"}]`,
    temperature: 0.2,
    maxTokens: 4096,
    variables: [],
  },

  // ── Page Generation Templates ─────────────────────────────────────────────
  {
    slug: 'page-generate',
    name: 'APEX Page Generation',
    description: 'Generates Oracle APEX page definitions from PRD specifications.',
    category: 'page-gen',
    promptText: `You are an Oracle APEX expert. Generate a complete APEX page definition based on the provided PRD specification.
Include regions, items, buttons, processes, validations, and dynamic actions.
Follow Oracle APEX best practices for {{pageType}} pages.
Output structured JSON with the page component hierarchy.`,
    temperature: 0.4,
    maxTokens: 8192,
    variables: ['pageType'],
  },

  // ── Code Templates ────────────────────────────────────────────────────────
  {
    slug: 'code-explain',
    name: 'Code Explanation',
    description: 'Explains code in detail with APEX-specific context.',
    category: 'code',
    promptText: `Explain the following {{language}} in detail. Break down what each section does, identify key patterns, and note any APEX-specific features:\n\n\`\`\`{{language}}\n{{code}}\n\`\`\``,
    temperature: 0.5,
    maxTokens: 4096,
    variables: ['language', 'code'],
  },
  {
    slug: 'code-refactor',
    name: 'Code Refactoring',
    description: 'Refactors code to improve readability and adherence to Oracle APEX best practices.',
    category: 'code',
    promptText: `Refactor the following {{language}} to improve readability, maintainability, and adherence to Oracle APEX best practices. Explain each change you make:\n\n\`\`\`{{language}}\n{{code}}\n\`\`\``,
    temperature: 0.5,
    maxTokens: 4096,
    variables: ['language', 'code'],
  },
  {
    slug: 'code-document',
    name: 'Code Documentation',
    description: 'Generates comprehensive documentation for code.',
    category: 'code',
    promptText: `Generate comprehensive documentation for the following {{language}}. Include:\n- A summary of purpose and functionality\n- Parameter descriptions (if applicable)\n- Return value descriptions (if applicable)\n- Usage examples\n- Any important notes or caveats\n\n\`\`\`{{language}}\n{{code}}\n\`\`\``,
    temperature: 0.5,
    maxTokens: 4096,
    variables: ['language', 'code'],
  },
  {
    slug: 'code-optimize',
    name: 'Code Optimization',
    description: 'Optimizes code for performance with APEX-specific tips.',
    category: 'code',
    promptText: `Optimize the following {{language}} for performance. Consider:\n- Query optimization (if SQL/PL/SQL)\n- Reducing unnecessary operations\n- Caching opportunities\n- Index usage recommendations\n- APEX-specific performance tips\n\nExplain each optimization and its expected impact:\n\n\`\`\`{{language}}\n{{code}}\n\`\`\``,
    temperature: 0.4,
    maxTokens: 4096,
    variables: ['language', 'code'],
  },
  {
    slug: 'code-security',
    name: 'Security Review',
    description: 'Performs a security review of code for common vulnerabilities.',
    category: 'code',
    promptText: `Perform a security review of the following {{language}}. Check for:\n- SQL injection vulnerabilities\n- Cross-site scripting (XSS)\n- Authorization bypass risks\n- Sensitive data exposure\n- APEX security best practices violations\n\nFor each finding, rate its severity (Critical/High/Medium/Low) and provide a remediation:\n\n\`\`\`{{language}}\n{{code}}\n\`\`\``,
    temperature: 0.3,
    maxTokens: 4096,
    variables: ['language', 'code'],
  },
  {
    slug: 'code-bugs',
    name: 'Bug Detection',
    description: 'Analyzes code for bugs, logic errors, and potential runtime issues.',
    category: 'code',
    promptText: `Analyze the following {{language}} for bugs, logic errors, edge cases, and potential runtime issues. For each issue found, explain the problem and provide a fix:\n\n\`\`\`{{language}}\n{{code}}\n\`\`\``,
    temperature: 0.3,
    maxTokens: 4096,
    variables: ['language', 'code'],
  },

  // ── Testing Templates ─────────────────────────────────────────────────────
  {
    slug: 'test-generate',
    name: 'Test Generation',
    description: 'Generates test cases for APEX components and PL/SQL code.',
    category: 'testing',
    promptText: `Generate comprehensive test cases for the following {{language}} code. Include:\n- Unit tests for individual functions/procedures\n- Edge case testing\n- Boundary value testing\n- Error handling verification\n- Expected inputs and outputs\n\nFormat as structured test specifications:\n\n\`\`\`{{language}}\n{{code}}\n\`\`\``,
    temperature: 0.4,
    maxTokens: 8192,
    variables: ['language', 'code'],
  },

  // ── Documentation Templates ───────────────────────────────────────────────
  {
    slug: 'doc-generate',
    name: 'Documentation Generation',
    description: 'Generates technical documentation for APEX applications and components.',
    category: 'analysis',
    promptText: `Generate detailed technical documentation for the following Oracle APEX component or application feature. Include:\n- Overview and purpose\n- Architecture and design decisions\n- Component relationships\n- Configuration details\n- Usage instructions\n- Troubleshooting guide\n\nContext: {{context}}`,
    temperature: 0.5,
    maxTokens: 8192,
    variables: ['context'],
  },
];

// ── Default prompt text constants (used as fallbacks in services) ────────────

export const DEFAULT_PRD_EXTRACT_PROMPT = SYSTEM_DEFAULT_TEMPLATES.find(
  (t) => t.slug === 'prd-extract',
)!.promptText;

export const DEFAULT_PRD_GENERATE_PROMPT = SYSTEM_DEFAULT_TEMPLATES.find(
  (t) => t.slug === 'prd-generate',
)!.promptText;

export const DEFAULT_PRD_VALIDATE_PROMPT = SYSTEM_DEFAULT_TEMPLATES.find(
  (t) => t.slug === 'prd-validate',
)!.promptText;
