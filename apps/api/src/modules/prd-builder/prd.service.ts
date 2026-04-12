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

// ---------------------------------------------------------------------------
// Document parser imports (optional dependencies, graceful fallback)
// ---------------------------------------------------------------------------

let PDFParseClass: (new (opts: { data: Uint8Array }) => { getText: () => Promise<{ text: string }>, destroy: () => Promise<void> }) | undefined;
let mammoth: { extractRawText: (opts: { buffer: Buffer }) => Promise<{ value: string }> } | undefined;
let parsersInitialized = false;

async function initParsers(): Promise<void> {
  if (parsersInitialized) return;
  parsersInitialized = true;

  try {
    const mod = await import('pdf-parse');
    PDFParseClass = mod.PDFParse;
  } catch {
    logger.warn('pdf-parse not available, PDF parsing will store raw content');
  }

  try {
    mammoth = await import('mammoth');
  } catch {
    logger.warn('mammoth not available, DOCX parsing will store raw content');
  }
}

// ---------------------------------------------------------------------------
// Text chunking utility
// ---------------------------------------------------------------------------

function chunkText(text: string, chunkSize = 4000, overlap = 200): string[] {
  if (!text || text.length <= chunkSize) {
    return text ? [text] : [];
  }
  const chunks: string[] = [];
  let start = 0;
  while (start < text.length) {
    const end = Math.min(start + chunkSize, text.length);
    chunks.push(text.slice(start, end));
    if (end >= text.length) break;
    start = end - overlap;
  }
  return chunks;
}

// ---------------------------------------------------------------------------
// AI availability check
// ---------------------------------------------------------------------------

function isAIAvailable(): boolean {
  const key = process.env.ANTHROPIC_API_KEY;
  return !!key && key !== 'test-placeholder-key';
}
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
  'Contexto y Alcance',
  'Actores y Roles',
  'Flujos de Proceso',
  'Requisitos Funcionales',
  'Requisitos No Funcionales',
  'Modelo de Datos',
  'Páginas APEX',
  'Reglas de Negocio',
  'Integraciones',
  'Preguntas Abiertas',
];

const LEAN_SECTIONS = [
  'Contexto y Alcance',
  'Flujos de Proceso',
  'Requisitos Funcionales',
  'Modelo de Datos',
  'Páginas APEX',
  'Preguntas Abiertas',
];

const DETAILED_SECTIONS = [
  ...STANDARD_SECTIONS,
  'Arquitectura del Sistema',
  'Requisitos de Seguridad',
  'Requisitos de Rendimiento',
  'Plan de Migración y Rollback',
  'Estrategia de Pruebas',
  'Cronograma e Hitos',
  'Glosario',
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

  // If direct content is provided, store it immediately as parsed_text
  const directContent = (input as UploadSourceInput & { content?: string }).content;

  const result = await tenantQuery(client,
    `INSERT INTO prd_sources (session_id, tenant_id, filename, mime_type, file_size, storage_key, parsed_text, parse_status, chunk_count)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
     RETURNING *`,
    [
      sessionId, tenantId, input.filename, input.mimeType, input.fileSize, input.storageKey,
      directContent ?? null,
      directContent ? 'parsed' : 'pending',
      directContent ? chunkText(directContent).length : 0,
    ],
  );

  const source = rowToSource(result.rows[0]);

  // Update session status
  await tenantQuery(client,
    `UPDATE prd_sessions SET status = 'uploading', current_stage = 1, updated_at = NOW()
     WHERE id = $1`,
    [sessionId],
  );

  // Trigger async parsing only if no direct content was provided
  if (!directContent) {
    parseSourceAsync(source.id, tenantId).catch((err) => {
      logger.error({ err, sourceId: source.id }, 'Source parsing failed');
    });
  }

  logger.info({ sourceId: source.id, sessionId, tenantId }, 'PRD source uploaded');
  return source;
}

/**
 * Async document parsing. Uses pdf-parse for PDFs, mammoth for DOCX,
 * direct storage for text/markdown, and stores images as-is for later
 * Claude Vision processing.
 */
async function parseSourceAsync(sourceId: string, tenantId: string, client?: PoolClient): Promise<void> {
  await initParsers();
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
    const storageKey = source.storage_key as string;
    // If direct content was provided via upload, use it
    const directContent = source.content as string | undefined;

    // Parse based on mime type
    let parsedText = '';
    let chunkCount = 0;

    if (mimeType === 'text/plain' || mimeType === 'text/markdown') {
      // Plain text / markdown: use direct content or fetch from storage
      if (directContent) {
        parsedText = directContent;
      } else {
        // In production, fetch from object storage using storage_key
        // For now, attempt to read file if storageKey looks like a local path
        try {
          const fs = await import('node:fs/promises');
          parsedText = await fs.readFile(storageKey, 'utf-8');
        } catch {
          parsedText = `[Content pending retrieval from storage: ${source.filename}]`;
        }
      }
      const chunks = chunkText(parsedText);
      chunkCount = chunks.length;
    } else if (mimeType === 'application/pdf') {
      // PDF: use pdf-parse v2 if available
      if (PDFParseClass) {
        try {
          const fs = await import('node:fs/promises');
          const buffer = await fs.readFile(storageKey);
          const parser = new PDFParseClass({ data: new Uint8Array(buffer) });
          const textResult = await parser.getText();
          parsedText = textResult.text;
          await parser.destroy();
        } catch (parseErr) {
          logger.warn({ sourceId, err: parseErr }, 'pdf-parse failed, storing placeholder');
          parsedText = `[PDF content from ${source.filename} — parsing failed, raw file stored at ${storageKey}]`;
        }
      } else {
        parsedText = `[PDF content from ${source.filename} — pdf-parse not installed, raw file stored at ${storageKey}]`;
      }
      const chunks = chunkText(parsedText);
      chunkCount = chunks.length;
    } else if (
      mimeType ===
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    ) {
      // DOCX: use mammoth if available
      if (mammoth) {
        try {
          const fs = await import('node:fs/promises');
          const buffer = await fs.readFile(storageKey);
          const result = await mammoth.extractRawText({ buffer });
          parsedText = result.value;
        } catch (parseErr) {
          logger.warn({ sourceId, err: parseErr }, 'mammoth failed, storing placeholder');
          parsedText = `[DOCX content from ${source.filename} — parsing failed, raw file stored at ${storageKey}]`;
        }
      } else {
        parsedText = `[DOCX content from ${source.filename} — mammoth not installed, raw file stored at ${storageKey}]`;
      }
      const chunks = chunkText(parsedText);
      chunkCount = chunks.length;
    } else if (mimeType.startsWith('image/')) {
      // Images: store as-is, will need Claude Vision for text extraction later
      parsedText = `[Image: ${source.filename} — stored at ${storageKey}, requires Vision API for text extraction]`;
      chunkCount = 1;
    }

    // Update source with parsed content
    await txClient.query(
      `UPDATE prd_sources
       SET parsed_text = $1, chunk_count = $2, parse_status = 'parsed'
       WHERE id = $3 AND tenant_id = $4`,
      [parsedText, chunkCount, sourceId, tenantId],
    );

    await txClient.query('COMMIT');
    logger.info({ sourceId, chunkCount }, 'Source parsed successfully');
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

    let extractionData: ExtractionData;

    if (isAIAvailable()) {
      const systemPrompt = `You are a PRD requirements extraction specialist for Oracle APEX and Genesys applications. Analyze the provided source documents and extract structured requirements data for the APEX/GENESYS domain.
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
Respond ONLY with the JSON object, no markdown fences or extra text.`;

      const userPrompt = `Extract structured APEX/Genesys domain requirements from the following source documents:${focusAreasPrompt}

${sourceTexts}`;

      const response = await claudeClient.chat(
        [{ role: 'user', content: userPrompt }],
        { systemPrompt },
      );

      // Parse AI response
      try {
        extractionData = JSON.parse(response.content) as ExtractionData;
      } catch {
        logger.warn({ sessionId }, 'Failed to parse AI extraction response, using fallback');
        extractionData = {
          actors: [],
          flows: [],
          businessRules: [],
          apexPages: [],
          genesysTables: [],
          constraints: [],
          assumptions: [],
          rawNotes: response.content,
        };
      }
    } else {
      // No AI available — generate mock extraction from parsed text
      logger.info({ sessionId }, 'AI not available, generating mock extraction from parsed text');
      extractionData = generateMockExtraction(sourceTexts);
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

      // Generate section content
      let sectionContent: string;

      if (isAIAvailable()) {
        const systemPrompt = `You are a technical writer creating a PRD section for an Oracle APEX / Genesys application.
Write professional, clear, detailed content for the specified section in Spanish.
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
        sectionContent = response.content;
      } else {
        // No AI available — generate section from extraction data
        sectionContent = generateSectionFromExtraction(sectionTitle, sectionNumber, session.extractionData!);
      }

      // Insert section
      const generatedBy = isAIAvailable() ? 'ai' : 'user';
      const sectionResult = await txClient.query(
        `INSERT INTO prd_sections (session_id, tenant_id, section_number, title, content, version, is_current, generated_by)
         VALUES ($1, $2, $3, $4, $5, $6, true, $7)
         RETURNING *`,
        [sessionId, tenantId, sectionNumber, sectionTitle, sectionContent, newVersion, generatedBy],
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
 * Validate the PRD using 10 domain-specific checks (VAL-01 to VAL-10).
 */
export async function validatePRD(
  sessionId: string,
  _input: ValidatePRDInput,
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

  // Run the 10 domain-specific validation checks
  const checks = runDomainValidationChecks(session);

  const passed = checks.filter((c) => c.passed).length;
  const total = checks.length;
  const score = total > 0 ? Math.round((passed / total) * 100) : 0;
  const blockers = checks.filter((c) => !c.passed && c.severity === 'blocker').length;
  const warnings = checks.filter((c) => !c.passed && c.severity === 'warning').length;

  const validationResult: ValidationResult = {
    score,
    checks,
    blockers,
    warnings,
    summary: `PRD validation: ${passed}/${total} checks passed. Score: ${score}/100. Blockers: ${blockers}, Warnings: ${warnings}.`,
  };

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

/**
 * Run 10 domain-specific validation checks (VAL-01 to VAL-10).
 */
function runDomainValidationChecks(session: PRDSession): ValidationCheck[] {
  const sections = session.sections ?? [];
  const extraction = session.extractionData;

  const sectionByNumber = new Map(sections.map((s) => [s.sectionNumber, s]));
  const sectionByTitle = new Map(sections.map((s) => [s.title, s]));

  const expectedTitles = STANDARD_SECTIONS;

  function hasContent(sectionNum: number): boolean {
    const s = sectionByNumber.get(sectionNum);
    return !!s && !!s.content && s.content.trim().length > 0;
  }

  const checks: ValidationCheck[] = [];

  // VAL-01: All 10 sections present and non-empty
  const allPresent = expectedTitles.every((_title, idx) => hasContent(idx + 1));
  checks.push({
    id: 'VAL-01',
    checkId: 'VAL-01',
    category: 'completeness',
    severity: 'blocker',
    passed: allPresent,
    message: allPresent
      ? 'All 10 required sections are present and non-empty.'
      : `Missing or empty sections: ${expectedTitles.filter((_t, i) => !hasContent(i + 1)).join(', ')}`,
    sectionNumber: undefined,
    resolved: allPresent,
  });

  // VAL-02: At least 1 actor defined in extraction
  const hasActors = !!extraction?.actors && extraction.actors.length > 0;
  checks.push({
    id: 'VAL-02',
    checkId: 'VAL-02',
    category: 'completeness',
    severity: 'blocker',
    passed: hasActors,
    message: hasActors
      ? `${extraction!.actors!.length} actor(s) defined.`
      : 'No actors defined in extraction data. At least 1 actor is required.',
    sectionNumber: 2,
    resolved: hasActors,
  });

  // VAL-03: At least 1 flow defined in extraction
  const hasFlows = !!extraction?.flows && extraction.flows.length > 0;
  checks.push({
    id: 'VAL-03',
    checkId: 'VAL-03',
    category: 'completeness',
    severity: 'blocker',
    passed: hasFlows,
    message: hasFlows
      ? `${extraction!.flows!.length} flow(s) defined.`
      : 'No flows defined in extraction data. At least 1 flow is required.',
    sectionNumber: 3,
    resolved: hasFlows,
  });

  // VAL-04: At least 1 business rule defined
  const hasRules = !!extraction?.businessRules && extraction.businessRules.length > 0;
  checks.push({
    id: 'VAL-04',
    checkId: 'VAL-04',
    category: 'completeness',
    severity: 'blocker',
    passed: hasRules,
    message: hasRules
      ? `${extraction!.businessRules!.length} business rule(s) defined.`
      : 'No business rules defined in extraction data. At least 1 is required.',
    sectionNumber: 8,
    resolved: hasRules,
  });

  // VAL-05: Functional requirements section has numbered items (RF-XX)
  const funcReqSection = sectionByNumber.get(4);
  const hasRfItems = !!funcReqSection && /RF-\d{2,}/i.test(funcReqSection.content);
  checks.push({
    id: 'VAL-05',
    checkId: 'VAL-05',
    category: 'consistency',
    severity: 'warning',
    passed: hasRfItems,
    message: hasRfItems
      ? 'Functional requirements contain numbered items (RF-XX format).'
      : 'Functional requirements section (4) should contain numbered items in RF-XX format.',
    sectionNumber: 4,
    resolved: hasRfItems,
  });

  // VAL-06: Non-functional requirements present
  const nfrPresent = hasContent(5);
  checks.push({
    id: 'VAL-06',
    checkId: 'VAL-06',
    category: 'completeness',
    severity: 'warning',
    passed: nfrPresent,
    message: nfrPresent
      ? 'Non-functional requirements section is present and non-empty.'
      : 'Non-functional requirements section (5) is missing or empty.',
    sectionNumber: 5,
    resolved: nfrPresent,
  });

  // VAL-07: At least 1 APEX page defined
  const hasApexPages = !!extraction?.apexPages && extraction.apexPages.length > 0;
  checks.push({
    id: 'VAL-07',
    checkId: 'VAL-07',
    category: 'completeness',
    severity: 'blocker',
    passed: hasApexPages,
    message: hasApexPages
      ? `${extraction!.apexPages!.length} APEX page(s) defined.`
      : 'No APEX pages defined in extraction data. At least 1 is required.',
    sectionNumber: 7,
    resolved: hasApexPages,
  });

  // VAL-08: Data model section references tables
  const dataModelSection = sectionByNumber.get(6);
  const hasTableRefs = !!dataModelSection && /tabl[ea]/i.test(dataModelSection.content);
  checks.push({
    id: 'VAL-08',
    checkId: 'VAL-08',
    category: 'completeness',
    severity: 'warning',
    passed: hasTableRefs,
    message: hasTableRefs
      ? 'Data model section references tables.'
      : 'Data model section (6) should reference database tables.',
    sectionNumber: 6,
    resolved: hasTableRefs,
  });

  // VAL-09: Integrations section present and non-empty
  const integrationsPresent = hasContent(9);
  checks.push({
    id: 'VAL-09',
    checkId: 'VAL-09',
    category: 'completeness',
    severity: 'warning',
    passed: integrationsPresent,
    message: integrationsPresent
      ? 'Integrations section is present and non-empty.'
      : 'Integrations section (9) is missing or empty.',
    sectionNumber: 9,
    resolved: integrationsPresent,
  });

  // VAL-10: No unresolved questions in section 10
  const questionsSection = sectionByNumber.get(10);
  const hasUnresolved = !!questionsSection &&
    questionsSection.content.trim().length > 0 &&
    /\?\s*$/m.test(questionsSection.content);
  checks.push({
    id: 'VAL-10',
    checkId: 'VAL-10',
    category: 'clarity',
    severity: 'warning',
    passed: !hasUnresolved,
    message: !hasUnresolved
      ? 'No unresolved questions detected in section 10.'
      : 'Section 10 (Preguntas Abiertas) contains unresolved questions.',
    sectionNumber: 10,
    resolved: !hasUnresolved,
  });

  return checks;
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

  // Block export if there are unresolved validation blockers
  if (session.validationBlockers > 0) {
    throw new ValidationError(
      `Cannot export PRD with unresolved blockers. There are ${session.validationBlockers} blocker(s) that must be resolved first.`,
    );
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
// Mock extraction generator (when AI is not available)
// ---------------------------------------------------------------------------

function generateMockExtraction(sourceTexts: string): ExtractionData {
  // Simple heuristic: extract names/keywords from source text
  const lines = sourceTexts.split('\n').filter((l) => l.trim().length > 0);
  const textSample = sourceTexts.substring(0, 2000);

  return {
    actors: [
      {
        name: 'Administrador',
        role: 'admin',
        description: 'Usuario administrador del sistema con acceso completo.',
      },
      {
        name: 'Usuario Final',
        role: 'end-user',
        description: 'Usuario que interactúa con la aplicación APEX.',
      },
    ],
    flows: [
      {
        name: 'Flujo Principal',
        steps: [
          'El usuario accede al sistema',
          'El sistema muestra el dashboard',
          'El usuario realiza la operación',
          'El sistema confirma la acción',
        ],
        triggerEvent: 'Acceso al sistema',
      },
    ],
    businessRules: [
      {
        id: 'BR-01',
        description: 'Las operaciones deben ser validadas antes de su procesamiento.',
        priority: 'must',
      },
    ],
    apexPages: [
      {
        name: 'Dashboard Principal',
        type: 'dashboard',
        description: 'Página principal con resumen de actividades.',
        components: ['report', 'chart', 'navigation'],
      },
    ],
    genesysTables: [
      {
        name: 'DATOS_PRINCIPALES',
        description: 'Tabla principal de datos del sistema.',
        columns: ['ID', 'NOMBRE', 'ESTADO', 'FECHA_CREACION'],
      },
    ],
    constraints: ['Sistema basado en Oracle APEX'],
    assumptions: ['Los usuarios tienen acceso a navegador web moderno'],
    rawNotes: `Extracted from ${lines.length} lines of source text. Preview: ${textSample.substring(0, 200)}...`,
  };
}

// ---------------------------------------------------------------------------
// Section content generator from extraction data (when AI is not available)
// ---------------------------------------------------------------------------

function generateSectionFromExtraction(
  sectionTitle: string,
  sectionNumber: number,
  extraction: ExtractionData,
): string {
  switch (sectionNumber) {
    case 1: // Contexto y Alcance
      return [
        'Este documento describe los requisitos del sistema.',
        '',
        extraction.constraints?.length
          ? `**Restricciones**: ${extraction.constraints.join(', ')}`
          : '',
        extraction.assumptions?.length
          ? `**Supuestos**: ${extraction.assumptions.join(', ')}`
          : '',
        extraction.rawNotes ? `\n**Notas**: ${extraction.rawNotes}` : '',
      ].filter(Boolean).join('\n');

    case 2: // Actores y Roles
      if (!extraction.actors?.length) return '_No se definieron actores._';
      return extraction.actors
        .map((a) => `### ${a.name}\n- **Rol**: ${a.role}\n- **Descripción**: ${a.description}`)
        .join('\n\n');

    case 3: // Flujos de Proceso
      if (!extraction.flows?.length) return '_No se definieron flujos._';
      return extraction.flows
        .map((f) => {
          const steps = f.steps.map((s, i) => `${i + 1}. ${s}`).join('\n');
          return `### ${f.name}\n**Evento disparador**: ${f.triggerEvent}\n\n${steps}`;
        })
        .join('\n\n');

    case 4: // Requisitos Funcionales
      if (!extraction.businessRules?.length && !extraction.flows?.length) {
        return '_No se extrajeron requisitos funcionales._';
      }
      const rfItems: string[] = [];
      extraction.flows?.forEach((f, i) => {
        rfItems.push(`- **RF-${String(i + 1).padStart(2, '0')}**: El sistema debe soportar el flujo "${f.name}".`);
      });
      extraction.businessRules?.forEach((br, i) => {
        rfItems.push(`- **RF-${String(extraction.flows?.length ?? 0 + i + 1).padStart(2, '0')}**: ${br.description} (Prioridad: ${br.priority})`);
      });
      return rfItems.join('\n');

    case 5: // Requisitos No Funcionales
      return [
        '- **RNF-01**: El sistema debe responder en menos de 3 segundos para operaciones estándar.',
        '- **RNF-02**: El sistema debe soportar al menos 50 usuarios concurrentes.',
        '- **RNF-03**: Los datos deben estar protegidos según las políticas de seguridad.',
      ].join('\n');

    case 6: // Modelo de Datos
      if (!extraction.genesysTables?.length) return '_No se definieron tablas._';
      return extraction.genesysTables
        .map((t) => `### Tabla: ${t.name}\n${t.description}\n\n**Columnas**: ${t.columns.join(', ')}`)
        .join('\n\n');

    case 7: // Páginas APEX
      if (!extraction.apexPages?.length) return '_No se definieron páginas APEX._';
      return extraction.apexPages
        .map((p) => `### ${p.name}\n- **Tipo**: ${p.type}\n- **Descripción**: ${p.description}\n- **Componentes**: ${p.components.join(', ')}`)
        .join('\n\n');

    case 8: // Reglas de Negocio
      if (!extraction.businessRules?.length) return '_No se definieron reglas de negocio._';
      return extraction.businessRules
        .map((br) => `- **${br.id}**: ${br.description} (Prioridad: ${br.priority})`)
        .join('\n');

    case 9: // Integraciones
      return 'Las integraciones del sistema se definirán durante la fase de diseño detallado.';

    case 10: // Preguntas Abiertas
      return 'No hay preguntas abiertas en este momento.';

    default:
      return `Contenido pendiente para la sección "${sectionTitle}".`;
  }
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
