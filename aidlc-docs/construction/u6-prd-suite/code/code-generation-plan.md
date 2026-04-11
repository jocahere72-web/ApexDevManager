# Code Generation Plan -- U6: PRD Suite

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U6 -- PRD Suite |
| **Sprint** | S5 (Fase 2) |
| **Modules** | M8 (PRD Builder), M5 (PRD-to-Page Generator) |
| **Stories** | US-014, US-015, US-016, US-017 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Prerequisites

Before starting code generation, verify prior unit deliverables:
- [ ] U2 Auth module is operational (JWT, RBAC middleware)
- [ ] U5 AI Engine is operational (Claude orchestration, streaming SSE)
- [ ] Connection Manager (M1) can test and validate ORDS connections
- [ ] MCP Connector (C22) can execute APEX operations via ORDS
- [ ] Object storage (OCI Object Storage) is configured for file uploads

---

## Plan Checklist

### 1. Database Migrations

- [ ] `migrations/016_prd_sessions.sql`
  - [ ] Create `prd_sessions` table (id, tenant_id, app_id, title, status, current_stage, extraction_data, validation_score, validation_blockers, validation_warnings, exported_at, created_by, created_at, updated_at, deleted_at)
  - [ ] Add CHECK constraint for `status IN ('draft', 'ingesting', 'extracting', 'generating', 'validating', 'validated', 'exported')`
  - [ ] Create index `idx_prd_sessions_tenant` ON (tenant_id)
  - [ ] Create index `idx_prd_sessions_tenant_status` ON (tenant_id, status) WHERE deleted_at IS NULL
  - [ ] Enable RLS on `prd_sessions`
  - [ ] Create `prd_sessions_tenant_isolation` policy

- [ ] `migrations/017_prd_sources.sql`
  - [ ] Create `prd_sources` table (id, session_id, tenant_id, filename, mime_type, file_size, storage_key, parsed_text, chunk_count, parse_status, parse_error, created_at)
  - [ ] Add CHECK constraint for `parse_status IN ('pending', 'parsing', 'parsed', 'failed')`
  - [ ] Create indexes on (session_id) and (tenant_id)
  - [ ] Enable RLS on `prd_sources`
  - [ ] Create `prd_sources_tenant_isolation` policy

- [ ] `migrations/018_prd_sections.sql`
  - [ ] Create `prd_sections` table (id, session_id, tenant_id, section_number, title, content, version, is_current, generated_by, created_at)
  - [ ] Create UNIQUE index on (session_id, section_number, version)
  - [ ] Create index on (session_id, section_number) WHERE is_current = TRUE
  - [ ] Enable RLS on `prd_sections`
  - [ ] Create `prd_sections_tenant_isolation` policy

- [ ] `migrations/019_prd_validation_results.sql`
  - [ ] Create `prd_validation_results` table (id, session_id, tenant_id, check_id, severity, passed, message, section_number, created_at)
  - [ ] Add CHECK constraint for `severity IN ('blocker', 'warning')`
  - [ ] Create indexes on (session_id) and (session_id, severity) WHERE NOT passed
  - [ ] Enable RLS on `prd_validation_results`
  - [ ] Create `prd_validation_results_tenant_isolation` policy

- [ ] `migrations/020_page_generation_jobs.sql`
  - [ ] Create `page_generation_jobs` table (id, tenant_id, prd_session_id, connection_id, app_id, input_type, input_content, status, page_definition, collision_action, preview_expires_at, applied_page_id, error_message, created_by, created_at, updated_at)
  - [ ] Add CHECK constraint for `input_type IN ('prd', 'text', 'image')`
  - [ ] Add CHECK constraint for `status IN ('pending', 'generating', 'preview', 'applying', 'applied', 'failed')`
  - [ ] Create indexes on (tenant_id), (tenant_id, status), (prd_session_id)
  - [ ] Enable RLS on `page_generation_jobs`
  - [ ] Create `page_generation_jobs_tenant_isolation` policy

---

### 2. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/prd.ts`
  - [ ] `PRDStatus` union type
  - [ ] `PRDStage` union type (1-5)
  - [ ] `PRDSection` interface
  - [ ] `PRDSession` interface
  - [ ] `PRDSource` interface
  - [ ] `ExtractionData` interface (actors, flows, rules, pages, tables)
  - [ ] `ValidationCheck` interface
  - [ ] `PRDExport` interface (YAML frontmatter + Markdown body)

- [ ] `packages/shared-types/src/page-generator.ts`
  - [ ] `PageGenInputType` union type
  - [ ] `PageGenStatus` union type
  - [ ] `CollisionAction` union type ('overwrite' | 'new' | 'cancel')
  - [ ] `APEXPageDefinition` interface
  - [ ] `APEXRegion` interface
  - [ ] `APEXItem` interface
  - [ ] `APEXButton` interface
  - [ ] `APEXProcess` interface
  - [ ] `APEXDynamicAction` interface
  - [ ] `APEXComputation` interface
  - [ ] `APEXValidation` interface
  - [ ] `PagePreview` interface
  - [ ] `CollisionReport` interface

---

### 3. M8 PRD Builder Module (apps/api/src/modules/prd/)

- [ ] `src/modules/prd/prd.validation.ts`
  - [ ] `IngestSchema` (Zod) -- files array (1-10), sessionId optional
  - [ ] `CreateSessionSchema` (Zod) -- title, appId
  - [ ] `UpdateSectionSchema` (Zod) -- sectionNumber, content
  - [ ] `RegenerateSectionSchema` (Zod) -- sectionNumber, instructions?
  - [ ] `ListSessionsQuerySchema` (Zod) -- page, limit, status?, appId?

- [ ] `src/modules/prd/prd-ingest.service.ts`
  - [ ] `uploadFiles(sessionId: string, files: Express.Multer.File[]): Promise<IngestResult>` -- validate file types/sizes, upload to object storage, store metadata in prd_sources
  - [ ] `parseSource(sourceId: string): Promise<void>` -- extract text from .docx/.pdf, send images to Claude vision, split into chunks
  - [ ] `parseAllSources(sessionId: string): Promise<void>` -- parse all pending sources in session
  - [ ] File type detection and validation
  - [ ] Image downscaling to 2048px max dimension

- [ ] `src/modules/prd/prd-extract.service.ts`
  - [ ] `extractEntities(sessionId: string): Promise<ExtractionData>` -- send parsed chunks to Claude, extract actors/flows/rules/pages/tables
  - [ ] `deduplicateEntities(entities: ExtractionData): ExtractionData` -- merge duplicates by semantic similarity
  - [ ] `scoreConfidence(entities: ExtractionData): ExtractionData` -- assign confidence 0.0-1.0 per entity
  - [ ] Store extraction data as JSONB in prd_sessions

- [ ] `src/modules/prd/prd-generate.service.ts`
  - [ ] `generatePRD(sessionId: string): AsyncGenerator<PRDSection>` -- stream 10 sections via SSE
  - [ ] `regenerateSection(sessionId: string, sectionNumber: number, instructions?: string): Promise<PRDSection>` -- regenerate single section
  - [ ] `updateSection(sessionId: string, sectionNumber: number, content: string): Promise<PRDSection>` -- user edit, increment version
  - [ ] Store sections in prd_sections with version tracking

- [ ] `src/modules/prd/prd-validate.service.ts`
  - [ ] `validatePRD(sessionId: string): Promise<PRDValidationResult>` -- run 10 validation checks (VAL-01 through VAL-10)
  - [ ] `getValidationResults(sessionId: string): Promise<ValidationCheck[]>` -- retrieve stored validation results
  - [ ] Store results in prd_validation_results
  - [ ] Update session validation_score, validation_blockers, validation_warnings

- [ ] `src/modules/prd/prd-export.service.ts`
  - [ ] `exportToMarkdown(sessionId: string): Promise<string>` -- render .md with YAML frontmatter
  - [ ] `sendToPageGenerator(sessionId: string, connectionId: string): Promise<string>` -- create page_generation_job with type 'prd'

- [ ] `src/modules/prd/prd.service.ts`
  - [ ] `createSession(data: CreateSessionInput, userId: string): Promise<PRDSession>` -- create prd_sessions row
  - [ ] `getSession(sessionId: string): Promise<PRDSession>` -- with sources, sections, validation
  - [ ] `listSessions(query: ListSessionsQuery): Promise<PaginatedResult<PRDSession>>` -- paginated list
  - [ ] `deleteSession(sessionId: string, userId: string): Promise<void>` -- soft delete
  - [ ] Orchestrate stage transitions (update status/current_stage)

- [ ] `src/modules/prd/prd.controller.ts`
  - [ ] `POST /api/v1/prd/sessions` -- create new PRD session
  - [ ] `GET /api/v1/prd/sessions` -- list sessions (paginated)
  - [ ] `GET /api/v1/prd/sessions/:id` -- get session with details
  - [ ] `DELETE /api/v1/prd/sessions/:id` -- soft delete session
  - [ ] `POST /api/v1/prd/sessions/:id/ingest` -- upload files (multipart)
  - [ ] `POST /api/v1/prd/sessions/:id/extract` -- trigger extraction
  - [ ] `POST /api/v1/prd/sessions/:id/generate` -- trigger PRD generation (SSE)
  - [ ] `PUT /api/v1/prd/sessions/:id/sections/:num` -- update section content
  - [ ] `POST /api/v1/prd/sessions/:id/sections/:num/regenerate` -- regenerate section (SSE)
  - [ ] `POST /api/v1/prd/sessions/:id/validate` -- trigger validation
  - [ ] `GET /api/v1/prd/sessions/:id/validation` -- get validation results
  - [ ] `POST /api/v1/prd/sessions/:id/export` -- export to markdown
  - [ ] `POST /api/v1/prd/sessions/:id/send-to-page-gen` -- send to M5
  - [ ] Wire routes with authenticate() + authorize(['admin','developer','tech_lead'])

---

### 4. M5 Page Generator Module (apps/api/src/modules/page-generator/)

- [ ] `src/modules/page-generator/page-gen.validation.ts`
  - [ ] `GenerateFromPRDSchema` (Zod) -- prdSessionId, connectionId, appId
  - [ ] `GenerateFromTextSchema` (Zod) -- textContent, connectionId, appId
  - [ ] `GenerateFromImageSchema` (Zod) -- image file, connectionId, appId
  - [ ] `ResolveCollisionSchema` (Zod) -- jobId, action ('overwrite' | 'new' | 'cancel')
  - [ ] `ApplyPageSchema` (Zod) -- jobId, pageDefinition? (optional edits)

- [ ] `src/modules/page-generator/page-gen.service.ts`
  - [ ] `generateFromPRD(prdSessionId: string, connectionId: string, appId: number, userId: string): Promise<PageGenResult>` -- load PRD sections, send to Claude, generate page definition
  - [ ] `generateFromText(textContent: string, connectionId: string, appId: number, userId: string): Promise<PageGenResult>` -- parse text, send to Claude
  - [ ] `generateFromImage(imageBuffer: Buffer, connectionId: string, appId: number, userId: string): Promise<PageGenResult>` -- Claude vision, then generate
  - [ ] `checkCollisions(appId: number, pageIds: number[], connectionId: string): Promise<CollisionReport>` -- query APEX_APPLICATION_PAGES via MCP
  - [ ] `resolveCollision(jobId: string, action: CollisionAction): Promise<void>` -- update page definition or cancel
  - [ ] `getPreview(jobId: string): Promise<PagePreview>` -- return structured preview (check 30-min expiry)
  - [ ] `applyPage(jobId: string, userId: string): Promise<ApplyResult>` -- execute via MCP/ORDS, record change
  - [ ] Connection validation before generation (test latency < 5000ms)

- [ ] `src/modules/page-generator/page-gen.controller.ts`
  - [ ] `POST /api/v1/page-generator/from-prd` -- generate from PRD session
  - [ ] `POST /api/v1/page-generator/from-text` -- generate from text input
  - [ ] `POST /api/v1/page-generator/from-image` -- generate from image (multipart)
  - [ ] `GET /api/v1/page-generator/jobs/:id/preview` -- get preview
  - [ ] `POST /api/v1/page-generator/jobs/:id/resolve-collision` -- resolve collision
  - [ ] `POST /api/v1/page-generator/jobs/:id/apply` -- apply page to APEX
  - [ ] `GET /api/v1/page-generator/jobs/:id` -- get job status
  - [ ] Wire routes with authenticate() + authorize(['admin','developer','tech_lead'])

---

### 5. React UI Components (apps/web/src/)

- [ ] `src/features/prd/pages/PRDListPage.tsx`
  - [ ] Data table of PRD sessions with status, title, app, date
  - [ ] Create new session button
  - [ ] Filter by status

- [ ] `src/features/prd/pages/PRDBuilderPage.tsx`
  - [ ] 5-stage stepper/wizard component
  - [ ] Stage-aware navigation (cannot skip stages)
  - [ ] Session state management

- [ ] `src/features/prd/components/IngestPanel.tsx`
  - [ ] Drag-and-drop file upload zone
  - [ ] File list with type icons, sizes, parse status
  - [ ] File type and size validation (client-side)
  - [ ] Upload progress indicator
  - [ ] Max 10 files / 25 MB each enforcement

- [ ] `src/features/prd/components/ExtractPanel.tsx`
  - [ ] Extracted entities grouped by type (actors, flows, rules, pages, tables)
  - [ ] Confidence score badge per entity
  - [ ] Low-confidence warnings highlighted
  - [ ] Entity edit/delete capability

- [ ] `src/features/prd/components/GeneratePanel.tsx`
  - [ ] Streaming section display (SSE)
  - [ ] 10-section accordion with expand/collapse
  - [ ] Inline Markdown editor per section
  - [ ] Regenerate button per section
  - [ ] Edit/save per section

- [ ] `src/features/prd/components/ValidatePanel.tsx`
  - [ ] Checklist view (VAL-01 through VAL-10)
  - [ ] Blocker items in red, warnings in amber
  - [ ] Re-validate button
  - [ ] Blocker count badge

- [ ] `src/features/prd/components/ExportPanel.tsx`
  - [ ] Markdown preview with YAML frontmatter
  - [ ] Download .md button
  - [ ] "Send to Page Generator" button
  - [ ] Validation summary

- [ ] `src/features/prd/hooks/usePRDSession.ts`
  - [ ] React Query hooks for CRUD operations
  - [ ] SSE streaming hook for generation
  - [ ] Session state polling

- [ ] `src/features/page-generator/pages/PageGeneratorPage.tsx`
  - [ ] Input mode selector (PRD / Text / Image)
  - [ ] Connection selector dropdown
  - [ ] Application selector dropdown
  - [ ] Generate button

- [ ] `src/features/page-generator/components/PagePreview.tsx`
  - [ ] Structured page definition viewer
  - [ ] Region tree visualization
  - [ ] Item/process/validation tables
  - [ ] Edit capability before apply
  - [ ] Apply / Cancel buttons

- [ ] `src/features/page-generator/components/CollisionDialog.tsx`
  - [ ] Modal dialog for collision resolution
  - [ ] Overwrite / New / Cancel options
  - [ ] Existing page details display

- [ ] `src/features/page-generator/hooks/usePageGenerator.ts`
  - [ ] React Query mutations for generation and apply
  - [ ] Polling for job status

---

### 6. Unit Tests (apps/api/tests/)

- [ ] `tests/modules/prd/prd-ingest.service.test.ts`
  - [ ] Upload valid .docx file
  - [ ] Upload valid .pdf file
  - [ ] Upload image file (PNG, JPG)
  - [ ] Reject file > 25 MB
  - [ ] Reject > 10 files per session
  - [ ] Reject unsupported format
  - [ ] Parse .docx extracts text
  - [ ] Parse .pdf extracts text
  - [ ] Image sent to Claude vision

- [ ] `tests/modules/prd/prd-extract.service.test.ts`
  - [ ] Extract entities from parsed text
  - [ ] Deduplicate similar actors
  - [ ] Confidence scoring assigns 0.0-1.0
  - [ ] Low-confidence entities flagged
  - [ ] Extraction stored as JSONB

- [ ] `tests/modules/prd/prd-generate.service.test.ts`
  - [ ] Generate all 10 sections
  - [ ] Streaming yields sections progressively
  - [ ] Regenerate single section
  - [ ] User edit increments version
  - [ ] Previous version marked is_current = FALSE

- [ ] `tests/modules/prd/prd-validate.service.test.ts`
  - [ ] VAL-01: Detect missing sections -> blocker
  - [ ] VAL-02: Detect no actors -> blocker
  - [ ] VAL-06: Detect missing page types -> blocker
  - [ ] VAL-03 through VAL-10: Warning checks
  - [ ] Validation score calculation
  - [ ] Cannot export with blockers

- [ ] `tests/modules/prd/prd-export.service.test.ts`
  - [ ] Export generates valid Markdown with YAML frontmatter
  - [ ] Frontmatter includes all required fields
  - [ ] Send to M5 creates page_generation_job

- [ ] `tests/modules/prd/prd.controller.test.ts`
  - [ ] POST /sessions as developer -> 201
  - [ ] POST /sessions as auditor -> 403
  - [ ] GET /sessions -> 200 (paginated)
  - [ ] POST /sessions/:id/ingest with files -> 200
  - [ ] POST /sessions/:id/export with blockers -> 422
  - [ ] DELETE /sessions/:id -> 204

- [ ] `tests/modules/page-generator/page-gen.service.test.ts`
  - [ ] Generate from PRD produces page definition
  - [ ] Generate from text produces page definition
  - [ ] Generate from image invokes Claude vision
  - [ ] Collision detected when page ID exists
  - [ ] Overwrite replaces existing page
  - [ ] New assigns next available ID
  - [ ] Preview expires after 30 minutes
  - [ ] Connection validation rejects inactive connection
  - [ ] Connection validation rejects high latency (>5000ms)

- [ ] `tests/modules/page-generator/page-gen.controller.test.ts`
  - [ ] POST /from-prd as developer -> 200
  - [ ] POST /from-text as developer -> 200
  - [ ] POST /from-image as developer -> 200
  - [ ] GET /jobs/:id/preview -> 200
  - [ ] POST /jobs/:id/apply -> 200
  - [ ] POST /jobs/:id/resolve-collision -> 200
  - [ ] Expired preview -> 410

---

### 7. Integration Tests

- [ ] `tests/integration/prd-workflow.integration.test.ts`
  - [ ] Full 5-stage workflow: create session, ingest files, extract, generate, validate, export
  - [ ] Resume interrupted session at correct stage
  - [ ] Validation blocks export when blockers present
  - [ ] User edits create new section versions
  - [ ] Soft delete cascades to sources/sections

- [ ] `tests/integration/page-generation.integration.test.ts`
  - [ ] Generate page from PRD session, preview, apply
  - [ ] Generate page from text input, preview, apply
  - [ ] Collision detection and resolution (overwrite)
  - [ ] Collision detection and resolution (new page)
  - [ ] Connection validation failure blocks generation

---

## File Summary

| Category | File Count |
|----------|------------|
| Database migrations | 5 |
| Shared types | 2 |
| PRD Builder module | 7 |
| Page Generator module | 3 |
| React UI components | 12 |
| Unit tests | 8 |
| Integration tests | 2 |
| **Total** | **39** |

---

## Execution Order

The plan should be executed in the following order to respect dependencies:

1. Database migrations (016-020) -- schema must exist before service code
2. Shared types -- interfaces used by both modules
3. PRD Builder services (prd-ingest -> prd-extract -> prd-generate -> prd-validate -> prd-export -> prd.service -> prd.controller)
4. Page Generator services (page-gen.service -> page-gen.controller)
5. React UI components (PRD pages and components, then Page Generator pages and components)
6. Unit tests (parallel per module)
7. Integration tests (sequential, requires running DB + AI service)
