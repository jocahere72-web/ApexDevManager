# Code Generation Plan -- U12: Code Factory & Marketplace

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U12 -- Code Factory & Marketplace |
| **Sprint** | S11 (Fase 3, Weeks 24-25) |
| **Modules** | M16 (Full Code Generation Factory) + M18 (Accelerators Marketplace) |
| **Stories** | US-038, US-039, US-043, US-044 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Prerequisites

Before starting code generation, verify prior unit deliverables:
- [ ] U6 completed: PRD Builder (M8) and PRD-to-Page (M5) available for generation input
- [ ] U5 completed: AI Studio (M4) and AI Governance Safety Engine (M10) operational
- [ ] U8 completed: Release Manager (M9) available for deployment integration
- [ ] U4 completed: Change Manager (M6) for change recording
- [ ] U10 completed: Test Studio (M13) for utPLSQL test annotation generation
- [ ] U10 completed: Knowledge Engine (M14) for domain-specific templates and rules
- [ ] ORDS Client (C23) operational for artifact deployment
- [ ] Event bus (C25) operational

---

## Plan Checklist

### 1. Database Migrations

- [ ] `migrations/049_code_gen_previews.sql`
  - [ ] Create `code_gen_previews` table (id, tenant_id, artifact_type, name, specification, generated_code, existing_code, unified_diff, template_id, risk_level, safety_passed, safety_findings, validation_result, app_id, connection_id, tokens_input, tokens_output, status, expires_at, created_by, created_at)
  - [ ] CHECK constraint: `risk_level IN ('low', 'medium', 'high', 'critical')`
  - [ ] CHECK constraint: `status IN ('pending', 'applied', 'rejected', 'expired')`
  - [ ] Create index on `(tenant_id, app_id, created_at DESC)`
  - [ ] Create index on `(status, expires_at)` -- for expiry cleanup job
  - [ ] Enable RLS

- [ ] `migrations/050_code_templates.sql`
  - [ ] Create `code_templates` table (id, tenant_id, name, artifact_type, description, skeleton, variables JSONB, source, accelerator_id, domain, is_active, created_at, updated_at)
  - [ ] CHECK constraint: `source IN ('builtin', 'marketplace', 'custom')`
  - [ ] Create index on `(tenant_id, artifact_type)`
  - [ ] Enable RLS (tenant-scoped or global where tenant_id IS NULL)
  - [ ] Seed built-in templates for 8 artifact types

- [ ] `migrations/051_accelerators.sql`
  - [ ] Create `accelerators` table (id, name, description, long_description, domain, category, type, version, min_apex_version, max_apex_version, publisher_tenant_id, publisher_user_id, publisher_type, package_data, package_hash, install_size, thumbnail_url, screenshots, tags, rating_avg, review_count, download_count, price, status, changelog, readme, review_feedback, published_at, created_at, updated_at)
  - [ ] CHECK constraint: `category IN ('kit', 'dashboard', 'workflow', 'integration', 'template')`
  - [ ] CHECK constraint: `type IN ('template', 'plugin', 'rule_pack', 'theme', 'component')`
  - [ ] CHECK constraint: `publisher_type IN ('official', 'community', 'partner')`
  - [ ] CHECK constraint: `status IN ('pending_review', 'published', 'rejected', 'deprecated')`
  - [ ] Create index on `(status) WHERE status = 'published'`
  - [ ] Create index on `(domain, category)`
  - [ ] Create GIN index on `(tags)`
  - [ ] Create index on `(rating_avg DESC)`
  - [ ] Create index on `(download_count DESC)`
  - [ ] No RLS (platform-wide for published entries)
  - [ ] Seed data for 6 base accelerators (metadata only, package_data populated later)

- [ ] `migrations/052_accelerator_installs.sql`
  - [ ] Create `accelerator_installs` table (id, tenant_id, accelerator_id, app_id, version, status, rollback_manifest JSONB, install_log, installed_by, installed_at, uninstalled_at)
  - [ ] CHECK constraint: `status IN ('installing', 'installed', 'failed', 'uninstalled')`
  - [ ] Create UNIQUE index on `(tenant_id, accelerator_id, app_id) WHERE status = 'installed'`
  - [ ] Create index on `(tenant_id, app_id)`
  - [ ] Enable RLS

- [ ] `migrations/053_accelerator_reviews.sql`
  - [ ] Create `accelerator_reviews` table (id, tenant_id, accelerator_id, user_id, rating, title, comment, helpful_count, created_at, updated_at)
  - [ ] CHECK constraint: `rating BETWEEN 1 AND 5`
  - [ ] Create UNIQUE index on `(tenant_id, user_id, accelerator_id)`
  - [ ] Create index on `(accelerator_id, created_at DESC)`
  - [ ] Enable RLS for write; public read for reviews

---

### 2. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/code-factory.ts`
  - [ ] `ArtifactType` union type (8 types)
  - [ ] `CodeGenRequest`, `CodeGenResult`, `GeneratedCodeArtifact` interfaces
  - [ ] `CodePreview`, `ArtifactDiff` interfaces
  - [ ] `CodeApplyResult` interface
  - [ ] `CodeTemplate`, `TemplateVariable` interfaces
  - [ ] `CodeGenFilter`, `CodeGenHistoryEntry` interfaces

- [ ] `packages/shared-types/src/marketplace.ts`
  - [ ] `AcceleratorCatalog`, `AcceleratorDetail` interfaces
  - [ ] `CatalogFilter` interface
  - [ ] `InstallResult`, `UninstallResult` interfaces
  - [ ] `CompatibilityResult` interface
  - [ ] `AcceleratorReview`, `ReviewInput` interfaces
  - [ ] `AcceleratorSubmission`, `PublishResult` interfaces
  - [ ] `RollbackManifest`, `AppliedArtifact` interfaces

---

### 3. M16 Code Factory Backend Module (apps/api/src/modules/code-factory/)

- [ ] `src/modules/code-factory/code-factory.types.ts`
  - [ ] Re-export shared types with service-internal extensions
  - [ ] `CodeGenPreviewRow`, `CodeTemplateRow` DB row interfaces

- [ ] `src/modules/code-factory/code-factory.validation.ts`
  - [ ] `GenerateCodeSchema` (Zod) -- artifactType, name, specification, appId, connectionId, templateId?, options?
  - [ ] `ApplyPreviewSchema` (Zod) -- (no body, action endpoint)
  - [ ] `BatchGenerateSchema` (Zod) -- array of GenerateCodeSchema items
  - [ ] `ListHistoryQuerySchema` (Zod) -- appId?, artifactType?, page, limit
  - [ ] `ListTemplatesQuerySchema` (Zod) -- artifactType?

- [ ] `src/modules/code-factory/code-generator.service.ts`
  - [ ] `generate(request: CodeGenRequest, actorId: string): Promise<CodePreview>` -- invoke AI (M4) with knowledge rules (M14), run safety check (M10), create preview, emit CODE_GENERATED
  - [ ] `batchGenerate(requests: CodeGenRequest[], actorId: string): Promise<CodePreview[]>` -- generate multiple artifacts
  - [ ] `getPreview(previewId: string): Promise<CodePreview>`
  - [ ] `rejectPreview(previewId: string, actorId: string): Promise<void>` -- set status = rejected

- [ ] `src/modules/code-factory/code-applier.service.ts`
  - [ ] `applyPreview(previewId: string, actorId: string): Promise<CodeApplyResult>` -- validate not expired, sort by dependency order, execute via ORDS (C23) through Safety Engine (C08), compile check, record changes (M6), emit CODE_APPLIED or CODE_APPLY_FAILED
  - [ ] `rollbackApply(previewId: string, appliedArtifacts: AppliedArtifact[]): Promise<void>` -- reverse-order rollback

- [ ] `src/modules/code-factory/template.service.ts`
  - [ ] `listTemplates(artifactType?: ArtifactType): Promise<CodeTemplate[]>` -- list builtin + tenant-custom + marketplace templates
  - [ ] `getTemplateById(id: string): Promise<CodeTemplate>`
  - [ ] `renderTemplate(templateId: string, variables: Record<string, string>): string` -- replace placeholders with values

- [ ] `src/modules/code-factory/preview-cleanup.job.ts`
  - [ ] `registerPreviewCleanupJob(queue: Queue): void` -- Bull repeatable job (every 15 min)
  - [ ] `processCleanup(job: Job): Promise<void>` -- set expired previews status = 'expired'

- [ ] `src/modules/code-factory/code-factory.controller.ts`
  - [ ] `POST /api/v1/code-factory/generate` -- generate
  - [ ] `GET /api/v1/code-factory/preview/:id` -- getPreview
  - [ ] `POST /api/v1/code-factory/preview/:id/apply` -- applyPreview
  - [ ] `POST /api/v1/code-factory/preview/:id/reject` -- rejectPreview
  - [ ] `POST /api/v1/code-factory/batch` -- batchGenerate
  - [ ] `GET /api/v1/code-factory/history` -- getHistory
  - [ ] `GET /api/v1/code-factory/templates` -- listTemplates
  - [ ] `GET /api/v1/code-factory/templates/:id` -- getTemplateById

---

### 4. M18 Marketplace Backend Module (apps/api/src/modules/marketplace/)

- [ ] `src/modules/marketplace/marketplace.types.ts`
  - [ ] Re-export shared types with service-internal extensions
  - [ ] `AcceleratorRow`, `AcceleratorInstallRow`, `AcceleratorReviewRow` DB row interfaces

- [ ] `src/modules/marketplace/marketplace.validation.ts`
  - [ ] `CatalogFilterSchema` (Zod) -- domain?, category?, type?, apexVersion?, rating?, price?, search?, sortBy?, page, limit
  - [ ] `InstallAcceleratorSchema` (Zod) -- appId, connectionId
  - [ ] `CheckCompatibilitySchema` (Zod) -- apexVersion
  - [ ] `SubmitReviewSchema` (Zod) -- rating (1-5), title?, comment?
  - [ ] `UpdateReviewSchema` (Zod) -- rating?, title?, comment?
  - [ ] `PublishAcceleratorSchema` (Zod) -- name, description, domain, category, type, version, minApexVersion, readme, compatibility
  - [ ] `AdminReviewSchema` (Zod) -- decision ('approve' | 'reject'), feedback?

- [ ] `src/modules/marketplace/catalog.service.ts`
  - [ ] `getCatalog(filters: CatalogFilter): Promise<PaginatedResult<AcceleratorCatalog>>` -- paginated, filtered, sorted
  - [ ] `getAcceleratorDetail(id: string): Promise<AcceleratorDetail>` -- full detail view
  - [ ] `searchCatalog(query: string): Promise<AcceleratorCatalog[]>` -- full-text search

- [ ] `src/modules/marketplace/installer.service.ts`
  - [ ] `installAccelerator(acceleratorId: string, appId: number, connectionId: string, actorId: string): Promise<InstallResult>` -- check compatibility, extract package, apply in dependency order, create rollback manifest, record install, increment download_count, emit event
  - [ ] `uninstallAccelerator(installId: string, actorId: string): Promise<UninstallResult>` -- execute rollback manifest, update status
  - [ ] `checkCompatibility(acceleratorId: string, apexVersion: string): Promise<CompatibilityResult>` -- version range check
  - [ ] `getInstallations(tenantId: string): Promise<AcceleratorInstall[]>` -- list tenant installations
  - [ ] `getInstallById(installId: string): Promise<AcceleratorInstall>`

- [ ] `src/modules/marketplace/publisher.service.ts`
  - [ ] `publishAccelerator(submission: AcceleratorSubmission, actorId: string): Promise<PublishResult>` -- validate package structure, store package, set status = pending_review, notify admin
  - [ ] `adminReview(acceleratorId: string, decision: 'approve' | 'reject', feedback: string, actorId: string): Promise<void>` -- transition status, emit event
  - [ ] `getMyPackages(publisherUserId: string): Promise<AcceleratorCatalog[]>` -- publisher's own packages
  - [ ] `getPublisherAnalytics(acceleratorId: string): Promise<PublisherAnalytics>` -- installs, ratings, feedback

- [ ] `src/modules/marketplace/review.service.ts`
  - [ ] `getReviews(acceleratorId: string): Promise<AcceleratorReview[]>` -- list reviews sorted by date
  - [ ] `submitReview(acceleratorId: string, review: ReviewInput, actorId: string): Promise<AcceleratorReview>` -- validate install exists, no self-review, no duplicate, insert, recalculate rating_avg
  - [ ] `updateReview(reviewId: string, updates: Partial<ReviewInput>, actorId: string): Promise<AcceleratorReview>` -- own reviews only, recalculate rating_avg
  - [ ] `deleteReview(reviewId: string, actorId: string): Promise<void>` -- own reviews only, recalculate rating_avg

- [ ] `src/modules/marketplace/marketplace.controller.ts`
  - [ ] `GET /api/v1/marketplace/catalog` -- getCatalog
  - [ ] `GET /api/v1/marketplace/catalog/:id` -- getAcceleratorDetail
  - [ ] `POST /api/v1/marketplace/catalog/:id/install` -- installAccelerator
  - [ ] `POST /api/v1/marketplace/catalog/:id/uninstall` -- uninstallAccelerator
  - [ ] `POST /api/v1/marketplace/catalog/:id/check-compatibility` -- checkCompatibility
  - [ ] `GET /api/v1/marketplace/installs` -- getInstallations
  - [ ] `GET /api/v1/marketplace/installs/:id` -- getInstallById
  - [ ] `GET /api/v1/marketplace/reviews/:acceleratorId` -- getReviews
  - [ ] `POST /api/v1/marketplace/reviews/:acceleratorId` -- submitReview
  - [ ] `PATCH /api/v1/marketplace/reviews/:reviewId` -- updateReview
  - [ ] `DELETE /api/v1/marketplace/reviews/:reviewId` -- deleteReview
  - [ ] `POST /api/v1/marketplace/publish` -- publishAccelerator
  - [ ] `GET /api/v1/marketplace/my-packages` -- getMyPackages
  - [ ] `GET /api/v1/marketplace/my-packages/:id/analytics` -- getPublisherAnalytics
  - [ ] `POST /api/v1/marketplace/admin/review/:id` -- adminReview

---

### 5. M16 Code Factory Frontend (apps/web/src/features/code-factory/)

- [ ] `features/code-factory/api/code-factory.api.ts`
  - [ ] API client functions for all code-factory endpoints
  - [ ] TanStack Query hooks: `usePreview`, `useHistory`, `useTemplates`
  - [ ] Mutations: `useGenerate`, `useApplyPreview`, `useRejectPreview`, `useBatchGenerate`

- [ ] `features/code-factory/pages/CodeFactoryPage.tsx`
  - [ ] Main page with tabs: Generate, History, Templates
  - [ ] Connection + app selector

- [ ] `features/code-factory/components/GenerateForm.tsx`
  - [ ] Artifact type selector (8 types with icons)
  - [ ] Name input
  - [ ] Specification textarea (or PRD reference picker)
  - [ ] Template selector (optional)
  - [ ] Options: include error handling, logging, comments, coding standard
  - [ ] "Generate" button

- [ ] `features/code-factory/components/CodePreviewPanel.tsx`
  - [ ] Side-by-side diff viewer (react-diff-viewer or Monaco diff editor)
  - [ ] Risk level badge (color-coded)
  - [ ] Safety check results panel
  - [ ] Validation warnings/errors
  - [ ] Apply / Reject buttons
  - [ ] Expiry countdown timer

- [ ] `features/code-factory/components/GenerationHistory.tsx`
  - [ ] Table: artifact type, name, date, status (applied/rejected/expired), tokens used
  - [ ] Filter by artifact type, date range
  - [ ] Click to view preview details

- [ ] `features/code-factory/components/TemplateList.tsx`
  - [ ] Grid of templates grouped by artifact type
  - [ ] Template details: skeleton preview, variables list
  - [ ] "Use Template" button linking to generate form

---

### 6. M18 Marketplace Frontend (apps/web/src/features/marketplace/)

- [ ] `features/marketplace/api/marketplace.api.ts`
  - [ ] API client functions for all marketplace endpoints
  - [ ] TanStack Query hooks: `useCatalog`, `useAcceleratorDetail`, `useInstallations`, `useReviews`, `useMyPackages`
  - [ ] Mutations: `useInstallAccelerator`, `useUninstallAccelerator`, `useSubmitReview`, `usePublishAccelerator`

- [ ] `features/marketplace/pages/MarketplacePage.tsx`
  - [ ] Catalog grid with filter sidebar
  - [ ] Search bar
  - [ ] Featured/popular section at top

- [ ] `features/marketplace/pages/AcceleratorDetailPage.tsx`
  - [ ] Hero section: thumbnail, name, publisher badge, rating stars, download count
  - [ ] Description tabs: Overview, Screenshots, Changelog, Reviews
  - [ ] Install button with app selector dialog
  - [ ] Compatibility check display

- [ ] `features/marketplace/pages/PublisherDashboardPage.tsx`
  - [ ] My packages list with analytics summaries
  - [ ] Publish new package button
  - [ ] Install count, rating, feedback per package

- [ ] `features/marketplace/components/CatalogGrid.tsx`
  - [ ] Card grid: thumbnail, name, domain badge, rating, download count, price tag
  - [ ] Responsive layout (3 columns desktop, 2 tablet, 1 mobile)

- [ ] `features/marketplace/components/FilterSidebar.tsx`
  - [ ] Domain filter checkboxes
  - [ ] APEX version dropdown
  - [ ] Category filter
  - [ ] Rating slider
  - [ ] Price filter (free/paid)
  - [ ] Sort selector

- [ ] `features/marketplace/components/InstallDialog.tsx`
  - [ ] App selector
  - [ ] Compatibility check result
  - [ ] Install progress indicator
  - [ ] Success/failure result with details

- [ ] `features/marketplace/components/ReviewSection.tsx`
  - [ ] Star rating input
  - [ ] Review form (title, comment)
  - [ ] Review list with helpful votes
  - [ ] Own review edit/delete

- [ ] `features/marketplace/components/PublishAcceleratorForm.tsx`
  - [ ] Multi-step form: metadata -> upload -> compatibility -> preview -> submit
  - [ ] Package file upload (max 50 MB)
  - [ ] Readme editor

---

### 7. Unit Tests (apps/api/tests/)

- [ ] `tests/modules/code-factory/code-generator.service.test.ts`
  - [ ] Generate code returns preview with safety check
  - [ ] Generation uses knowledge rules from M14
  - [ ] Template-based generation replaces variables
  - [ ] Safety block returns findings
  - [ ] Preview includes utPLSQL test annotations

- [ ] `tests/modules/code-factory/code-applier.service.test.ts`
  - [ ] Apply preview in dependency order
  - [ ] Apply expired preview fails
  - [ ] Apply with compilation error triggers rollback
  - [ ] Change recording in M6 after apply
  - [ ] Safety Engine gate blocks critical findings

- [ ] `tests/modules/code-factory/template.service.test.ts`
  - [ ] List templates by artifact type
  - [ ] Render template replaces all variables
  - [ ] Missing required variable fails

- [ ] `tests/modules/code-factory/preview-cleanup.job.test.ts`
  - [ ] Expired previews set to expired status
  - [ ] Non-expired previews untouched

- [ ] `tests/modules/marketplace/catalog.service.test.ts`
  - [ ] Get catalog with filters returns matching entries
  - [ ] Search by name and description
  - [ ] Sort by popularity, rating, date
  - [ ] Paginated results

- [ ] `tests/modules/marketplace/installer.service.test.ts`
  - [ ] Install compatible accelerator succeeds
  - [ ] Install incompatible version fails
  - [ ] Install already-installed fails
  - [ ] Failed install triggers automatic rollback
  - [ ] Uninstall executes rollback manifest
  - [ ] Download count incremented on install
  - [ ] Knowledge rules imported from accelerator

- [ ] `tests/modules/marketplace/publisher.service.test.ts`
  - [ ] Publish accelerator sets pending_review
  - [ ] Admin approve sets published
  - [ ] Admin reject sets rejected with feedback
  - [ ] Publisher analytics returns correct counts

- [ ] `tests/modules/marketplace/review.service.test.ts`
  - [ ] Submit review with valid rating
  - [ ] Duplicate review fails
  - [ ] Review without install fails
  - [ ] Self-review fails
  - [ ] Rating recalculated after new review
  - [ ] Update own review succeeds
  - [ ] Delete own review recalculates rating

- [ ] `tests/modules/code-factory/code-factory.controller.test.ts`
  - [ ] POST /code-factory/generate as developer -> 200
  - [ ] POST /code-factory/generate as auditor -> 403
  - [ ] POST /code-factory/preview/:id/apply -> 200
  - [ ] POST /code-factory/preview/:id/apply expired -> 410
  - [ ] GET /code-factory/templates -> 200

- [ ] `tests/modules/marketplace/marketplace.controller.test.ts`
  - [ ] GET /marketplace/catalog -> 200
  - [ ] POST /marketplace/catalog/:id/install as developer -> 200
  - [ ] POST /marketplace/catalog/:id/install incompatible -> 422
  - [ ] POST /marketplace/reviews/:id as installed user -> 201
  - [ ] POST /marketplace/reviews/:id as non-installed user -> 403
  - [ ] POST /marketplace/publish as publisher -> 201
  - [ ] POST /marketplace/admin/review/:id as admin -> 200

---

### 8. Integration Tests

- [ ] `tests/integration/code-factory.integration.test.ts`
  - [ ] Full lifecycle: generate -> preview -> apply -> verify in Oracle DB
  - [ ] Batch generation: generate 3 artifacts -> apply all in dependency order
  - [ ] Template-based generation with custom template
  - [ ] Safety Engine blocks dangerous SQL (DROP TABLE)
  - [ ] Compilation failure triggers rollback
  - [ ] Change Manager records all applied artifacts
  - [ ] utPLSQL annotations present in generated PL/SQL

- [ ] `tests/integration/marketplace.integration.test.ts`
  - [ ] Full install lifecycle: browse catalog -> check compatibility -> install -> verify artifacts -> uninstall
  - [ ] Publishing flow: submit package -> admin review -> approve -> appears in catalog
  - [ ] Review flow: install -> submit review -> rating recalculated
  - [ ] Rollback on partial install failure
  - [ ] Knowledge rules imported during accelerator install

- [ ] `tests/integration/factory-marketplace-cross.integration.test.ts`
  - [ ] Template from marketplace accelerator used in Code Factory generation
  - [ ] Tenant isolation: Tenant A installs not visible to Tenant B

---

### 9. Route Registration

- [ ] `src/routes/index.ts`
  - [ ] Mount code-factory routes at `/api/v1/code-factory`
  - [ ] Mount marketplace routes at `/api/v1/marketplace`

---

## File Summary

| Category | File Count |
|----------|------------|
| Database migrations | 5 |
| Shared types | 2 |
| Code Factory backend module | 6 |
| Marketplace backend module | 6 |
| Code Factory frontend | 6 |
| Marketplace frontend | 9 |
| Unit tests | 10 |
| Integration tests | 3 |
| Route registration | 1 |
| **Total** | **48** |

---

## Execution Order

1. Database migrations (049-053) -- schema must exist before service code
2. Shared types (code-factory.ts, marketplace.ts) -- interfaces used by all modules
3. Code Factory backend (code-factory.types -> code-factory.validation -> template.service -> code-generator.service -> code-applier.service -> preview-cleanup.job -> code-factory.controller)
4. Marketplace backend (marketplace.types -> marketplace.validation -> catalog.service -> installer.service -> publisher.service -> review.service -> marketplace.controller)
5. Route registration
6. Code Factory frontend (api -> pages -> components)
7. Marketplace frontend (api -> pages -> components)
8. Unit tests (parallel per module)
9. Integration tests (sequential, requires running DB + ORDS mock + Safety Engine)

---

## Approval

**Please review this code generation plan.**

**Options**:
1. **Request Changes** - Modify the plan before execution
2. **Approve Plan** - Proceed to Part 2 (Code Generation execution)
