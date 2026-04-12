import { pool, getClient } from '../../config/database.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import type { PoolClient } from 'pg';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import { claudeClient } from '../ai-studio/claude.client.js';
import type {
  PRDSession,
  PRDSource,
  PRDSection,
  ExtractionData,
  ValidationResult,
  ValidationCheck,
  PRDExport,
  PRDStage,
} from '@apex-dev-manager/shared-types';
import type {
  CreateSessionInput,
  UploadSourceInput,
  UpdateSectionInput,
  ValidatePRDInput,
  ExportPRDInput,
  ExtractRequirementsInput,
  GenerateSectionsInput,
} from './prd.validation.js';

// ---------------------------------------------------------------------------
// Row mappers
// ---------------------------------------------------------------------------

function rowToSession(row: Record<string, unknown>): PRDSession {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    appId: (row.app_id as number) ?? undefined,
    title: row.title as string,
    status: row.status as PRDSession['status'],
    currentStage: row.current_stage as PRDStage,
    extractionData: (row.extraction_data as ExtractionData) ?? undefined,
    validationScore: row.validation_score != null ? Number(row.validation_score) : undefined,
    validationBlockers: (row.validation_blockers as number) ?? 0,
    validationWarnings: (row.validation_warnings as number) ?? 0,
    exportedAt: row.exported_at ? (row.exported_at as Date).toISOString() : undefined,
    createdBy: row.created_by as string,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
    deletedAt: row.deleted_at ? (row.deleted_at as Date).toISOString() : undefined,
  };
}

function rowToSource(row: Record<string, unknown>): PRDSource {
  return {
    id: row.id as string,
    sessionId: row.session_id as string,
    tenantId: row.tenant_id as string,
    filename: row.filename as string,
    mimeType: row.mime_type as string,
    fileSize: row.file_size as number,
    storageKey: row.storage_key as string,
    parsedText: (row.parsed_text as string) ?? undefined,
    chunkCount: (row.chunk_count as number) ?? 0,
    parseStatus: row.parse_status as PRDSource['parseStatus'],
    parseError: (row.parse_error as string) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
  };
}

function rowToSection(row: Record<string, unknown>): PRDSection {
  return {
    id: row.id as string,
    sessionId: row.session_id as string,
    tenantId: row.tenant_id as string,
    sectionNumber: row.section_number as number,
    title: row.title as string,
    content: row.content as string,
    version: row.version as number,
    isCurrent: row.is_current as boolean,
    generatedBy: row.generated_by as PRDSection['generatedBy'],
    createdAt: (row.created_at as Date).toISOString(),
  };
}

// ---------------------------------------------------------------------------
// PRD Section Templates
// ---------------------------------------------------------------------------

const STANDARD_SECTIONS = [
  'Executive Summary',
  'Goals & Objectives',
  'User Personas',
  'Functional Requirements',
  'Non-Functional Requirements',
  'User Stories & Acceptance Criteria',
  'Data Model',
  'UI/UX Requirements',
  'Constraints & Assumptions',
  'Out of Scope',
  'Dependencies',
  'Success Metrics',
];

const LEAN_SECTIONS = [
  'Overview',
  'Problem Statement',
  'Proposed Solution',
  'Requirements',
  'Acceptance Criteria',
  'Risks & Assumptions',
];

const DETAILED_SECTIONS = [
  ...STANDARD_SECTIONS,
  'System Architecture Overview',
  'Integration Points',
  'Security Requirements',
  'Performance Requirements',
  'Migration & Rollback Plan',
  'Testing Strategy',
  'Timeline & Milestones',
  'Glossary',
];

// ---------------------------------------------------------------------------
// Session CRUD
// ---------------------------------------------------------------------------

/**
 * Create a new PRD session.
 */
export async function createSession(
  input: CreateSessionInput,
  userId: string,
  tenantId: string,
  client?: PoolClient,
): Promise<PRDSession> {
  const result = await tenantQuery(client,
    `INSERT INTO prd_sessions (tenant_id, app_id, title, created_by)
     VALUES ($1, $2, $3, $4)
     RETURNING *`,
    [tenantId, input.appId ?? null, input.title, userId],
  );

  logger.info({ sessionId: result.rows[0].id, tenantId }, 'PRD session created');
  return rowToSession(result.rows[0]);
}

/**
 * List PRD sessions for a tenant.
 */
export async function listSessions(
  tenantId: string,
  page = 1,
  limit = 20,
  status?: string,
  appId?: number,
  client?: PoolClient,
): Promise<{ sessions: PRDSession[]; total: number }> {
  const conditions = ['tenant_id = $1', 'deleted_at IS NULL'];
  const params: unknown[] = [tenantId];
  let paramIdx = 2;

  if (status) {
    conditions.push(`status = $${paramIdx}`);
    params.push(status);
    paramIdx++;
  }

  if (appId) {
    conditions.push(`app_id = $${paramIdx}`);
    params.push(appId);
    paramIdx++;
  }

  const where = conditions.join(' AND ');
  const offset = (page - 1) * limit;

  const [dataResult, countResult] = await Promise.all([
    tenantQuery(client,
      `SELECT * FROM prd_sessions
       WHERE ${where}
       ORDER BY updated_at DESC
       LIMIT $${paramIdx} OFFSET $${paramIdx + 1}`,
      [...params, limit, offset],
    ),
    tenantQuery(client,
      `SELECT COUNT(*)::int AS total FROM prd_sessions WHERE ${where}`,
      params,
    ),
  ]);

  return {
    sessions: dataResult.rows.map(rowToSession),
    total: countResult.rows[0].total as number,
  };
}

/**
 * Get a single PRD session with sources and current sections.
 */
export async function getSession(
  id: string,
  tenantId: string,
  client?: PoolClient,
): Promise<PRDSession> {
  const sessionResult = await tenantQuery(client,
    `SELECT * FROM prd_sessions WHERE id = $1 AND tenant_id = $2 AND deleted_at IS NULL`,
    [id, tenantId],
  );

  if (sessionResult.rowCount === 0) {
    throw new NotFoundError('PRD session not found');
  }

  const session = rowToSession(sessionResult.rows[0]);

  // Load sources
  const sourcesResult = await tenantQuery(client,
    `SELECT * FROM prd_sources WHERE session_id = $1 AND tenant_id = $2 ORDER BY created_at ASC`,
    [id, tenantId],
  );
  session.sources = sourcesResult.rows.map(rowToSource);

  // Load current sections
  const sectionsResult = await tenantQuery(client,
    `SELECT * FROM prd_sections
     WHERE session_id = $1 AND tenant_id = $2 AND is_current = true
     ORDER BY section_number ASC`,
    [id, tenantId],
  );
  session.sections = sectionsResult.rows.map(rowToSection);

  return session;
}

// ---------------------------------------------------------------------------
// Source Upload & Parsing
// ---------------------------------------------------------------------------

/**
 * Upload a source document to a PRD session.
 * Triggers async parsing of the document content.
 */
export async function uploadSource(
  sessionId: string,
  input: UploadSourceInput,
  tenantId: string,
  client?: PoolClient,
): Promise<PRDSource> {
  // Verify session exists
  const sessionCheck = await tenantQuery(client,
    `SELECT id, status FROM prd_sessions WHERE id = $1 AND tenant_id = $2 AND deleted_at IS NULL`,
    [sessionId, tenantId],
  );

  if (sessionCheck.rowCount === 0) {
    throw new NotFoundError('PRD session not found');
  }

  const result = await tenantQuery(client,
    `INSERT INTO prd_sources (session_id, tenant_id, filename, mime_type, file_size, storage_key)
     VALUES ($1, $2, $3, $4, $5, $6)
     RETURNING *`,
    [sessionId, tenantId, input.filename, input.mimeType, input.fileSize, input.storageKey],
  );

  const source = rowToSource(result.rows[0]);

  // Update session status
  await tenantQuery(client,
    `UPDATE prd_sessions SET status = 'uploading', current_stage = 1, updated_at = NOW()
     WHERE id = $1`,
    [sessionId],
  );

  // Trigger async parsing (simulate for PDF/DOCX)
  parseSourceAsync(source.id, tenantId).catch((err) => {
    logger.error({ err, sourceId: source.id }, 'Source parsing failed');
  });

  logger.info({ sourceId: source.id, sessionId, tenantId }, 'PRD source uploaded');
  return source;
}

/**
 * Async document parsing. In production, this would use a PDF/DOCX parser library.
 */
async function parseSourceAsync(sourceId: string, tenantId: string, client?: PoolClient): Promise<void> {
  const txClient = await getClient();

  try {
    await txClient.query('BEGIN');

    // Mark as parsing
    await txClient.query(
      `UPDATE prd_sources SET parse_status = 'parsing' WHERE id = $1 AND tenant_id = $2`,
      [sourceId, tenantId],
    );

    // Fetch source details
    const sourceResult = await txClient.query(
      `SELECT * FROM prd_sources WHERE id = $1 AND tenant_id = $2`,
      [sourceId, tenantId],
    );

    if (sourceResult.rowCount === 0) {
      throw new Error('Source not found');
    }

    const source = sourceResult.rows[0];
    const mimeType = source.mime_type as string;

    // Parse based on mime type
    let parsedText = '';
    let chunkCount = 0;

    if (mimeType === 'text/plain' || mimeType === 'text/markdown') {
      // Plain text / markdown: read directly from storage
      // In production, fetch from object storage using storage_key
      parsedText = `[Parsed text content from ${source.filename}]`;
      chunkCount = 1;
    } else if (mimeType === 'application/pdf') {
      // PDF: use pdf-parse or similar library
      // In production: const pdfData = await pdfParse(buffer);
      parsedText = `[Parsed PDF content from ${source.filename}]`;
      chunkCount = Math.ceil(Math.random() * 10) + 1;
    } else if (
      mimeType ===
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    ) {
      // DOCX: use mammoth or similar library
      // In production: const result = await mammoth.extractRawText({ buffer });
      parsedText = `[Parsed DOCX content from ${source.filename}]`;
      chunkCount = Math.ceil(Math.random() * 8) + 1;
    }

    // Update source with parsed content
    await txClient.query(
      `UPDATE prd_sources
       SET parsed_text = $1, chunk_count = $2, parse_status = 'parsed'
       WHERE id = $3 AND tenant_id = $4`,
      [parsedText, chunkCount, sourceId, tenantId],
    );

    await txClient.query('COMMIT');
    logger.info({ sourceId }, 'Source parsed successfully');
  } catch (err) {
    await txClient.query('ROLLBACK');

    // Mark as error
    await tenantQuery(client,
      `UPDATE prd_sources SET parse_status = 'error', parse_error = $1 WHERE id = $2`,
      [(err as Error).message, sourceId],
    );

    throw err;
  } finally {
    txClient.release();
  }
}

// ---------------------------------------------------------------------------
// AI: Extract Requirements
// ---------------------------------------------------------------------------

/**
 * Use AI to extract structured requirements from uploaded sources.
 */
export async function extractRequirements(
  sessionId: string,
  input: ExtractRequirementsInput,
  tenantId: string,
  client?: PoolClient,
): Promise<ExtractionData> {
  const txClient = await getClient();

  try {
    await txClient.query('BEGIN');

    // Verify session and get sources
    const sessionResult = await txClient.query(
      `SELECT * FROM prd_sessions WHERE id = $1 AND tenant_id = $2 AND deleted_at IS NULL`,
      [sessionId, tenantId],
    );

    if (sessionResult.rowCount === 0) {
      throw new NotFoundError('PRD session not found');
    }

    // Get parsed sources
    const sourcesResult = await txClient.query(
      `SELECT parsed_text, filename FROM prd_sources
       WHERE session_id = $1 AND tenant_id = $2 AND parse_status = 'parsed'
       ORDER BY created_at ASC`,
      [sessionId, tenantId],
    );

    if (sourcesResult.rowCount === 0) {
      throw new ValidationError('No parsed sources available. Upload and parse documents first.');
    }

    // Update status
    await txClient.query(
      `UPDATE prd_sessions SET status = 'extracting', current_stage = 2, updated_at = NOW()
       WHERE id = $1`,
      [sessionId],
    );

    await txClient.query('COMMIT');

    // Build prompt for AI extraction
    const sourceTexts = sourcesResult.rows
      .map((r) => `--- Source: ${r.filename} ---\n${r.parsed_text}`)
      .join('\n\n');

    const focusAreasPrompt = input.focusAreas?.length
      ? `\nFocus especially on these areas: ${input.focusAreas.join(', ')}`
      : '';

    const systemPrompt = `You are a PRD requirements extraction specialist. Analyze the provided source documents and extract structured requirements data.
Return a JSON object with this exact structure:
{
  "goals": ["string array of project goals"],
  "features": [{"name": "string", "description": "string", "priority": "must|should|could|wont", "acceptanceCriteria": ["string array"]}],
  "userPersonas": ["string array of user personas"],
  "constraints": ["string array of constraints"],
  "assumptions": ["string array of assumptions"],
  "outOfScope": ["string array of out-of-scope items"],
  "rawNotes": "any additional notes"
}
Respond ONLY with the JSON object, no markdown fences or extra text.`;

    const userPrompt = `Extract structured requirements from the following source documents:${focusAreasPrompt}

${sourceTexts}`;

    const response = await claudeClient.chat(
      [{ role: 'user', content: userPrompt }],
      { systemPrompt },
    );

    // Parse AI response
    let extractionData: ExtractionData;
    try {
      extractionData = JSON.parse(response.content) as ExtractionData;
    } catch {
      logger.warn({ sessionId }, 'Failed to parse AI extraction response, using fallback');
      extractionData = {
        goals: [],
        features: [],
        userPersonas: [],
        constraints: [],
        assumptions: [],
        outOfScope: [],
        rawNotes: response.content,
      };
    }

    // Save extraction data
    await tenantQuery(client,
      `UPDATE prd_sessions
       SET extraction_data = $1, status = 'draft', current_stage = 2, updated_at = NOW()
       WHERE id = $2 AND tenant_id = $3`,
      [JSON.stringify(extractionData), sessionId, tenantId],
    );

    logger.info({ sessionId, tenantId }, 'Requirements extracted');
    return extractionData;
  } catch (err) {
    await txClient.query('ROLLBACK').catch(() => {});

    // Set error status
    await tenantQuery(client,
      `UPDATE prd_sessions SET status = 'error', updated_at = NOW() WHERE id = $1`,
      [sessionId],
    );

    throw err;
  } finally {
    txClient.release();
  }
}

// ---------------------------------------------------------------------------
// AI: Generate Sections
// ---------------------------------------------------------------------------

/**
 * Use AI to generate PRD sections based on extracted requirements.
 */
export async function generateSections(
  sessionId: string,
  input: GenerateSectionsInput,
  tenantId: string,
  client?: PoolClient,
): Promise<PRDSection[]> {
  // Get session with extraction data
  const sessionResult = await tenantQuery(client,
    `SELECT * FROM prd_sessions WHERE id = $1 AND tenant_id = $2 AND deleted_at IS NULL`,
    [sessionId, tenantId],
  );

  if (sessionResult.rowCount === 0) {
    throw new NotFoundError('PRD session not found');
  }

  const session = rowToSession(sessionResult.rows[0]);

  if (!session.extractionData) {
    throw new ValidationError('Extract requirements before generating sections.');
  }

  // Update status
  await tenantQuery(client,
    `UPDATE prd_sessions SET status = 'generating', current_stage = 3, updated_at = NOW()
     WHERE id = $1`,
    [sessionId],
  );

  // Determine section templates
  const templateMap = {
    standard: STANDARD_SECTIONS,
    lean: LEAN_SECTIONS,
    detailed: DETAILED_SECTIONS,
  };
  const sectionTitles = input.customSections?.length
    ? input.customSections
    : templateMap[input.templateStyle];

  // Mark existing current sections as non-current
  await tenantQuery(client,
    `UPDATE prd_sections SET is_current = false WHERE session_id = $1 AND tenant_id = $2`,
    [sessionId, tenantId],
  );

  const sections: PRDSection[] = [];
  const txClient = await getClient();

  try {
    await txClient.query('BEGIN');

    for (let i = 0; i < sectionTitles.length; i++) {
      const sectionTitle = sectionTitles[i];
      const sectionNumber = i + 1;

      // Get max version for this section
      const versionResult = await txClient.query(
        `SELECT COALESCE(MAX(version), 0)::int AS max_version
         FROM prd_sections
         WHERE session_id = $1 AND section_number = $2`,
        [sessionId, sectionNumber],
      );
      const newVersion = (versionResult.rows[0].max_version as number) + 1;

      // Generate section content via AI
      const systemPrompt = `You are a technical writer creating a PRD section.
Write professional, clear, detailed content for the specified section.
Use the extraction data provided for context and requirements.
Output ONLY the section content as formatted markdown (no title heading, just the body content).`;

      const userPrompt = `Write the "${sectionTitle}" section for a PRD.

Extraction data:
${JSON.stringify(session.extractionData, null, 2)}

Section number: ${sectionNumber} of ${sectionTitles.length}
Section title: ${sectionTitle}

Write comprehensive content for this section.`;

      const response = await claudeClient.chat(
        [{ role: 'user', content: userPrompt }],
        { systemPrompt },
      );

      // Insert section
      const sectionResult = await txClient.query(
        `INSERT INTO prd_sections (session_id, tenant_id, section_number, title, content, version, is_current, generated_by)
         VALUES ($1, $2, $3, $4, $5, $6, true, 'ai')
         RETURNING *`,
        [sessionId, tenantId, sectionNumber, sectionTitle, response.content, newVersion],
      );

      sections.push(rowToSection(sectionResult.rows[0]));
    }

    // Update session
    await txClient.query(
      `UPDATE prd_sessions SET status = 'draft', current_stage = 3, updated_at = NOW()
       WHERE id = $1`,
      [sessionId],
    );

    await txClient.query('COMMIT');

    logger.info(
      { sessionId, tenantId, sectionCount: sections.length },
      'PRD sections generated',
    );

    return sections;
  } catch (err) {
    await txClient.query('ROLLBACK');

    await tenantQuery(client,
      `UPDATE prd_sessions SET status = 'error', updated_at = NOW() WHERE id = $1`,
      [sessionId],
    );

    throw err;
  } finally {
    txClient.release();
  }
}

// ---------------------------------------------------------------------------
// Update Section
// ---------------------------------------------------------------------------

/**
 * Update a PRD section (creates a new version).
 */
export async function updateSection(
  sectionId: string,
  input: UpdateSectionInput,
  tenantId: string,
  client?: PoolClient,
): Promise<PRDSection> {
  const txClient = await getClient();

  try {
    await txClient.query('BEGIN');

    // Get existing section
    const existing = await txClient.query(
      `SELECT * FROM prd_sections WHERE id = $1 AND tenant_id = $2`,
      [sectionId, tenantId],
    );

    if (existing.rowCount === 0) {
      throw new NotFoundError('Section not found');
    }

    const row = existing.rows[0];
    const sessionId = row.session_id as string;
    const sectionNumber = row.section_number as number;

    // Get max version
    const versionResult = await txClient.query(
      `SELECT COALESCE(MAX(version), 0)::int AS max_version
       FROM prd_sections
       WHERE session_id = $1 AND section_number = $2`,
      [sessionId, sectionNumber],
    );
    const newVersion = (versionResult.rows[0].max_version as number) + 1;

    // Mark old versions as non-current
    await txClient.query(
      `UPDATE prd_sections SET is_current = false
       WHERE session_id = $1 AND section_number = $2 AND tenant_id = $3`,
      [sessionId, sectionNumber, tenantId],
    );

    // Insert new version
    const result = await txClient.query(
      `INSERT INTO prd_sections (session_id, tenant_id, section_number, title, content, version, is_current, generated_by)
       VALUES ($1, $2, $3, $4, $5, $6, true, $7)
       RETURNING *`,
      [
        sessionId,
        tenantId,
        sectionNumber,
        input.title ?? row.title,
        input.content ?? row.content,
        newVersion,
        input.generatedBy ?? 'user',
      ],
    );

    // Update session timestamp
    await txClient.query(
      `UPDATE prd_sessions SET updated_at = NOW() WHERE id = $1`,
      [sessionId],
    );

    await txClient.query('COMMIT');

    logger.info({ sectionId: result.rows[0].id, sessionId, newVersion }, 'Section updated');
    return rowToSection(result.rows[0]);
  } catch (err) {
    await txClient.query('ROLLBACK');
    throw err;
  } finally {
    txClient.release();
  }
}

// ---------------------------------------------------------------------------
// AI: Validate PRD
// ---------------------------------------------------------------------------

/**
 * Use AI to validate the PRD for completeness, consistency, and quality.
 */
export async function validatePRD(
  sessionId: string,
  input: ValidatePRDInput,
  tenantId: string,
  client?: PoolClient,
): Promise<ValidationResult> {
  // Get session with current sections
  const session = await getSession(sessionId, tenantId, client);

  if (!session.sections || session.sections.length === 0) {
    throw new ValidationError('No sections to validate. Generate sections first.');
  }

  // Update status
  await tenantQuery(client,
    `UPDATE prd_sessions SET status = 'validating', current_stage = 4, updated_at = NOW()
     WHERE id = $1`,
    [sessionId],
  );

  const categories = input.checkCategories ?? [
    'completeness',
    'consistency',
    'clarity',
    'feasibility',
    'testability',
  ];

  const sectionsText = session.sections
    .map((s) => `## Section ${s.sectionNumber}: ${s.title}\n${s.content}`)
    .join('\n\n');

  const systemPrompt = `You are a PRD quality auditor. Analyze the provided PRD sections and return validation checks.
Return a JSON object with this exact structure:
{
  "score": <number 0-100>,
  "summary": "<brief summary of PRD quality>",
  "checks": [
    {
      "id": "<unique-id>",
      "category": "completeness|consistency|clarity|feasibility|testability",
      "severity": "blocker|warning|info",
      "message": "<description of the issue>",
      "sectionNumber": <optional section number>,
      "suggestion": "<how to fix>",
      "resolved": false
    }
  ]
}
Categories to check: ${categories.join(', ')}
Respond ONLY with the JSON object, no markdown fences or extra text.`;

  const userPrompt = `Validate this PRD:\n\n${sectionsText}`;

  const response = await claudeClient.chat(
    [{ role: 'user', content: userPrompt }],
    { systemPrompt },
  );

  let validationResult: ValidationResult;
  try {
    const parsed = JSON.parse(response.content) as {
      score: number;
      summary: string;
      checks: ValidationCheck[];
    };
    const blockers = parsed.checks.filter((c) => c.severity === 'blocker').length;
    const warnings = parsed.checks.filter((c) => c.severity === 'warning').length;

    validationResult = {
      score: parsed.score,
      checks: parsed.checks,
      blockers,
      warnings,
      summary: parsed.summary,
    };
  } catch {
    logger.warn({ sessionId }, 'Failed to parse validation response');
    validationResult = {
      score: 0,
      checks: [],
      blockers: 0,
      warnings: 0,
      summary: 'Validation parsing failed. Please retry.',
    };
  }

  // Save validation results
  await tenantQuery(client,
    `UPDATE prd_sessions
     SET status = 'validated',
         current_stage = 4,
         validation_score = $1,
         validation_blockers = $2,
         validation_warnings = $3,
         updated_at = NOW()
     WHERE id = $4 AND tenant_id = $5`,
    [
      validationResult.score,
      validationResult.blockers,
      validationResult.warnings,
      sessionId,
      tenantId,
    ],
  );

  logger.info(
    { sessionId, score: validationResult.score, blockers: validationResult.blockers },
    'PRD validated',
  );

  return validationResult;
}

// ---------------------------------------------------------------------------
// Export PRD
// ---------------------------------------------------------------------------

/**
 * Export the PRD as markdown, YAML, or JSON.
 */
export async function exportPRD(
  sessionId: string,
  input: ExportPRDInput,
  tenantId: string,
  client?: PoolClient,
): Promise<{ content: string; format: string; filename: string }> {
  const session = await getSession(sessionId, tenantId, client);

  if (!session.sections || session.sections.length === 0) {
    throw new ValidationError('No sections to export. Generate sections first.');
  }

  const exportData: PRDExport = {
    metadata: {
      title: session.title,
      version: '1.0',
      exportedAt: new Date().toISOString(),
      sessionId: session.id,
      validationScore: session.validationScore,
    },
    sections: session.sections.map((s) => ({
      number: s.sectionNumber,
      title: s.title,
      content: s.content,
    })),
    extractionData: input.includeExtractionData ? session.extractionData : undefined,
  };

  let content: string;
  let filename: string;

  switch (input.format) {
    case 'json':
      content = JSON.stringify(exportData, null, 2);
      filename = `${slugify(session.title)}-prd.json`;
      break;

    case 'yaml': {
      // Simple YAML serialization
      const yamlLines: string[] = [];
      yamlLines.push('---');
      if (input.includeMeta) {
        yamlLines.push('metadata:');
        yamlLines.push(`  title: "${exportData.metadata.title}"`);
        yamlLines.push(`  version: "${exportData.metadata.version}"`);
        yamlLines.push(`  exportedAt: "${exportData.metadata.exportedAt}"`);
        yamlLines.push(`  sessionId: "${exportData.metadata.sessionId}"`);
        if (exportData.metadata.validationScore != null) {
          yamlLines.push(`  validationScore: ${exportData.metadata.validationScore}`);
        }
        yamlLines.push('');
      }
      yamlLines.push('sections:');
      for (const section of exportData.sections) {
        yamlLines.push(`  - number: ${section.number}`);
        yamlLines.push(`    title: "${section.title}"`);
        yamlLines.push(`    content: |`);
        const contentLines = section.content.split('\n');
        for (const line of contentLines) {
          yamlLines.push(`      ${line}`);
        }
      }
      content = yamlLines.join('\n');
      filename = `${slugify(session.title)}-prd.yaml`;
      break;
    }

    case 'markdown':
    default: {
      const mdLines: string[] = [];
      mdLines.push(`# ${exportData.metadata.title}`);
      mdLines.push('');
      if (input.includeMeta) {
        mdLines.push(`> **Version**: ${exportData.metadata.version}`);
        mdLines.push(`> **Exported**: ${exportData.metadata.exportedAt}`);
        if (exportData.metadata.validationScore != null) {
          mdLines.push(`> **Validation Score**: ${exportData.metadata.validationScore}/100`);
        }
        mdLines.push('');
        mdLines.push('---');
        mdLines.push('');
      }
      for (const section of exportData.sections) {
        mdLines.push(`## ${section.number}. ${section.title}`);
        mdLines.push('');
        mdLines.push(section.content);
        mdLines.push('');
      }
      content = mdLines.join('\n');
      filename = `${slugify(session.title)}-prd.md`;
      break;
    }
  }

  // Mark as exported
  await tenantQuery(client,
    `UPDATE prd_sessions
     SET status = 'exported', current_stage = 5, exported_at = NOW(), updated_at = NOW()
     WHERE id = $1 AND tenant_id = $2`,
    [sessionId, tenantId],
  );

  logger.info({ sessionId, format: input.format, tenantId }, 'PRD exported');

  return { content, format: input.format, filename };
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function slugify(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .substring(0, 100);
}
