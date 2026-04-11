# Code Generation Plan -- U4: Code Editor Studio

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U4 -- Code Editor Studio |
| **Sprint** | S3 (Fase 1, Weeks 8-9) |
| **Modules** | M3 (Code Editor Studio) |
| **Stories** | US-010, US-011, US-050 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Prerequisites

Before starting code generation, verify U3 Explorer & UI deliverables:
- [ ] Connection Manager UI is functional (list, detail, create, edit, delete)
- [ ] Application Explorer tree renders and lazy-loads correctly
- [ ] MCP connector is operational for metadata reads
- [ ] Explorer cache (Redis) is working with TTL-based invalidation
- [ ] Explorer search returns results across APEX objects
- [ ] Offline mode fallback is functional

---

## Plan Checklist

### 1. Database Migrations

- [ ] `migrations/011_editor_sessions.sql`
  - [ ] Create `editor_sessions` table (id, tenant_id, user_id, connection_id, component_type, component_id, mode, draft_content, cursor_line, cursor_column, created_at, last_active_at, expires_at)
  - [ ] Create partial unique index for edit locks: `UNIQUE (connection_id, component_type, component_id) WHERE mode = 'edit'`
  - [ ] Enable RLS on `editor_sessions`
  - [ ] Create `editor_sessions_tenant_isolation` policy
  - [ ] Create index on `expires_at WHERE mode = 'edit'` for cleanup job

- [ ] `migrations/012_change_log.sql`
  - [ ] Create `change_log` table (id, tenant_id, connection_id, component_type, component_id, component_name, app_id, page_id, code_before, code_after, diff, applied_by, applied_at, source, ai_request_id, created_at)
  - [ ] Enable RLS on `change_log`
  - [ ] Create `change_log_tenant_isolation` policy
  - [ ] Create index on `(connection_id, component_type, component_id)` for component history
  - [ ] Create index on `(tenant_id, applied_at)` for audit reports
  - [ ] Create index on `(applied_by)` for user activity
  - [ ] No UPDATE or DELETE policies (append-only enforcement)

---

### 2. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/editor.ts`
  - [ ] `ComponentType` union type (plsql_package, plsql_trigger, plsql_view, page_process, dynamic_action, computation, validation, lov)
  - [ ] `EditorSession` interface (sessionId, userId, componentType, componentId, mode, draftContent, cursorPosition, createdAt, lastActiveAt, expiresAt)
  - [ ] `EditorTab` interface (id, componentType, componentId, componentName, appId, pageId, language, content, originalContent, isDirty, cursorPosition, scrollPosition, sessionId, lockedBy)
  - [ ] `ComponentSource` interface (componentId, componentType, name, source, language, lastModified, lastModifiedBy)
  - [ ] `ChangeLogEntry` interface (id, tenantId, connectionId, componentType, componentId, componentName, appId, pageId, codeBefore, codeAfter, diff, appliedBy, appliedAt, source, aiRequestId)
  - [ ] `LockStatus` interface (locked, lockedBy, lockedAt, expiresAt)
  - [ ] `FormatRequest` / `FormatResponse` interfaces
  - [ ] `ApplyRequest` / `ApplyResponse` interfaces
  - [ ] `CompilationError` interface (line, column, message, severity)
  - [ ] Re-export from `index.ts`

---

### 3. Monaco Editor React Wrapper (apps/web/src/features/editor/)

- [ ] `components/MonacoEditorWrapper.tsx`
  - [ ] React wrapper around `@monaco-editor/react`
  - [ ] Register custom PL/SQL language definition (keywords, operators, tokenizer)
  - [ ] Register SQL language extensions (APEX-specific keywords)
  - [ ] Theme configuration matching application design tokens
  - [ ] Controlled component: value, onChange, language props
  - [ ] Keyboard shortcut registration (Ctrl+S save, Shift+Alt+F format)
  - [ ] Read-only mode support (for view-only sessions)
  - [ ] Minimap toggle
  - [ ] Line numbers and gutter configuration

- [ ] `lib/plsql-language.ts`
  - [ ] Monarch tokenizer definition for PL/SQL
  - [ ] Keywords list (DECLARE, BEGIN, END, EXCEPTION, CURSOR, LOOP, etc.)
  - [ ] Type keywords (VARCHAR2, NUMBER, DATE, BOOLEAN, etc.)
  - [ ] Built-in functions (NVL, COALESCE, TO_CHAR, etc.)
  - [ ] Comment rules (single-line --, multi-line /* */)
  - [ ] String literal rules (single quotes, q-quoting)
  - [ ] Language configuration (brackets, auto-closing pairs, comments)

---

### 4. Tab Manager Component (apps/web/src/features/editor/)

- [ ] `components/TabBar.tsx`
  - [ ] Render horizontal tab bar with scrolling overflow
  - [ ] Tab with icon (language-specific), label, dirty indicator (dot), close button
  - [ ] Active tab highlighting
  - [ ] Drag-and-drop reorder
  - [ ] Right-click context menu: Close, Close Others, Close All, Close Saved
  - [ ] "+" button to open component picker
  - [ ] Max 15 tabs enforcement with prompt

- [ ] `components/EditorTab.tsx`
  - [ ] Individual tab component with state indicators
  - [ ] Language icon (PL/SQL, JS, SQL, HTML, CSS)
  - [ ] Dirty dot indicator
  - [ ] Close button with save confirmation for dirty tabs
  - [ ] Tooltip: full component path (App > Page > Component)

---

### 5. Diff Viewer Component (apps/web/src/features/editor/)

- [ ] `components/DiffViewer.tsx`
  - [ ] Monaco DiffEditor integration (side-by-side mode)
  - [ ] Toggle inline diff mode
  - [ ] Original (left) pane read-only, modified (right) pane editable
  - [ ] Navigate changes: Next/Previous change buttons
  - [ ] Stats footer: added, removed, modified line counts
  - [ ] Close diff button to return to normal editor

---

### 6. Apply Change Flow (apps/web + apps/api)

#### Frontend

- [ ] `components/ApplyButton.tsx`
  - [ ] "Apply to APEX" button with loading state
  - [ ] Disabled when offline or no edit lock
  - [ ] Pre-apply confirmation dialog showing diff summary
  - [ ] Success toast with change log link
  - [ ] Error display with compilation errors mapped to editor markers

- [ ] `lib/applyService.ts`
  - [ ] `applyChanges(sessionId, content): Promise<ApplyResponse>` -- POST to /editor/apply
  - [ ] Map compilation errors to Monaco marker format
  - [ ] Handle offline gracefully (save as draft)

#### Backend

- [ ] `src/modules/editor/editor.apply.ts`
  - [ ] `applyChanges(sessionId, content, userId, tenantId): Promise<ApplyResult>`
  - [ ] Validate edit lock ownership
  - [ ] Snapshot code_before from APEX via ORDS
  - [ ] Write new code to APEX via ORDS
  - [ ] Check compilation status via ORDS
  - [ ] Record change_log entry (code_before, code_after, diff)
  - [ ] Emit COMPONENT_MODIFIED event
  - [ ] Invalidate explorer cache for affected page
  - [ ] Log audit event

---

### 7. Editor Session Service (apps/api/src/modules/editor/)

- [ ] `src/modules/editor/editor.session.service.ts`
  - [ ] `createSession(request: SessionRequest): Promise<EditorSession>` -- check for existing lock, create session
  - [ ] `updateSession(sessionId, updates): Promise<void>` -- save draft, update cursor, extend lock
  - [ ] `closeSession(sessionId): Promise<void>` -- release lock, clean up
  - [ ] `getSession(sessionId): Promise<EditorSession | null>`
  - [ ] `getActiveSessions(connectionId, appId): Promise<EditorSession[]>` -- for presence indicators
  - [ ] `checkLock(connectionId, componentType, componentId): Promise<LockStatus>`
  - [ ] `cleanupExpiredSessions(): Promise<number>` -- scheduled cleanup job (every 5 min)

- [ ] `src/modules/editor/editor.session.job.ts`
  - [ ] Register Bull job for expired session cleanup
  - [ ] Process: find sessions where expires_at < now(), delete them
  - [ ] Log cleanup count

---

### 8. SQL/PL/SQL Formatter Service (apps/api/src/modules/editor/)

- [ ] `src/modules/editor/editor.formatter.ts`
  - [ ] `formatCode(content, language, options): Promise<FormatResponse>`
  - [ ] PL/SQL formatting: keyword uppercase, identifier lowercase, 2-space indent, 120-char line wrap
  - [ ] SQL formatting: same rules
  - [ ] Use `sql-formatter` library as base, with custom PL/SQL enhancements
  - [ ] Return formatted content and change count

---

### 9. Backend Endpoints (apps/api/src/modules/editor/)

- [ ] `src/modules/editor/editor.validation.ts`
  - [ ] `CreateSessionSchema` (Zod) -- connectionId UUID, componentType enum, componentId positive int, mode enum
  - [ ] `UpdateSessionSchema` (Zod) -- draftContent string, cursorLine int, cursorColumn int
  - [ ] `ApplySchema` (Zod) -- sessionId UUID, content string (max 1MB)
  - [ ] `FormatSchema` (Zod) -- content string (max 1MB), language enum, options object
  - [ ] `ComponentParamsSchema` (Zod) -- connectionId UUID, type ComponentType enum, id positive int

- [ ] `src/modules/editor/editor.service.ts`
  - [ ] `getComponentSource(connectionId, type, id, tenantId): Promise<ComponentSource>` -- fetch via MCP/ORDS
  - [ ] `getDiff(connectionId, type, id, draftContent): Promise<DiffResult>` -- fetch original, compute diff
  - [ ] `getChangeHistory(connectionId, type, id, limit): Promise<ChangeLogEntry[]>` -- query change_log

- [ ] `src/modules/editor/editor.controller.ts`
  - [ ] `POST /api/v1/editor/sessions` -- authenticate(), validate CreateSessionSchema, create session
  - [ ] `PUT /api/v1/editor/sessions/:id` -- authenticate(), validate UpdateSessionSchema, update session
  - [ ] `DELETE /api/v1/editor/sessions/:id` -- authenticate(), close session
  - [ ] `GET /api/v1/editor/component/:connectionId/:type/:id` -- authenticate(), fetch source
  - [ ] `POST /api/v1/editor/apply` -- authorize(['developer','tech_lead','admin']), validate ApplySchema, apply changes
  - [ ] `POST /api/v1/editor/format` -- authenticate(), validate FormatSchema, format code
  - [ ] `GET /api/v1/editor/diff/:connectionId/:type/:id` -- authenticate(), get diff
  - [ ] `GET /api/v1/editor/locks/:componentId` -- authenticate(), check lock
  - [ ] `GET /api/v1/editor/sessions/active` -- authenticate(), list active sessions
  - [ ] Mount routes on Express Router

---

### 10. MCP Autocompletion Provider (apps/web + apps/api)

#### Frontend

- [ ] `lib/completionProvider.ts`
  - [ ] Register Monaco completion item provider for PL/SQL and SQL
  - [ ] Trigger on `.` (dot) for schema.table, table.column, package.procedure
  - [ ] Trigger on `:P` for page item suggestions
  - [ ] Debounce: 150ms
  - [ ] Fetch metadata from backend completion endpoint
  - [ ] Cache metadata in memory (1 hour TTL)
  - [ ] Fallback to keyword-only completion when offline

#### Backend

- [ ] `src/modules/editor/editor.completion.ts`
  - [ ] `getTableNames(connectionId, schema): Promise<CompletionItem[]>` -- from MCP/ORDS
  - [ ] `getColumnNames(connectionId, schema, table): Promise<CompletionItem[]>` -- from MCP/ORDS
  - [ ] `getPackageMembers(connectionId, schema, packageName): Promise<CompletionItem[]>` -- from MCP/ORDS
  - [ ] `getPageItems(connectionId, appId, pageId): Promise<CompletionItem[]>` -- from explorer cache
  - [ ] `GET /api/v1/editor/completions/:connectionId` -- query param: type (tables|columns|packages|page_items), prefix, schema, table, appId, pageId

---

### 11. State Management (apps/web/src/stores/)

- [ ] `stores/editorStore.ts`
  - [ ] State: tabs[], activeTabId, isApplying, formatInProgress
  - [ ] Actions: openTab, closeTab, closeOtherTabs, closeAllTabs, closeSavedTabs, setActiveTab, reorderTabs, updateTabContent, markTabDirty, markTabClean
  - [ ] Persist tabs to localStorage (Zustand persist middleware)
  - [ ] Enforce max 15 tabs

- [ ] `stores/editorSessionStore.ts`
  - [ ] State: sessions (by componentId), activeLocks
  - [ ] Actions: createSession, closeSession, saveDraft, refreshLock, getActiveSessions
  - [ ] Auto-save draft every 30 seconds
  - [ ] Lock refresh every 5 minutes

---

### 12. Tests

#### Frontend Tests (apps/web/src/__tests__/features/editor/)

- [ ] `MonacoEditorWrapper.test.tsx`
  - [ ] Renders editor with correct language mode
  - [ ] PL/SQL syntax highlighting applies
  - [ ] Ctrl+S triggers save callback
  - [ ] Read-only mode prevents editing
  - [ ] Language switch updates tokenizer

- [ ] `TabBar.test.tsx`
  - [ ] Renders tabs with correct labels and icons
  - [ ] Active tab is highlighted
  - [ ] Dirty indicator shown for modified tabs
  - [ ] Close button prompts save confirmation for dirty tab
  - [ ] Max 15 tabs enforcement
  - [ ] Context menu actions work (Close, Close Others, etc.)

- [ ] `DiffViewer.test.tsx`
  - [ ] Renders side-by-side diff
  - [ ] Original pane is read-only
  - [ ] Toggle inline mode works
  - [ ] Stats footer shows correct counts
  - [ ] Navigate changes buttons work

- [ ] `ApplyButton.test.tsx`
  - [ ] Apply button enabled when online and locked
  - [ ] Apply button disabled when offline
  - [ ] Apply button disabled without edit lock
  - [ ] Success shows toast with change log link
  - [ ] Compilation errors mapped to editor markers

- [ ] `editorStore.test.ts`
  - [ ] Open tab adds to tabs array
  - [ ] Duplicate component reuses existing tab
  - [ ] Close dirty tab triggers confirmation
  - [ ] Tab content persists to localStorage
  - [ ] Max 15 tabs enforced

#### Backend Tests (apps/api/tests/modules/editor/)

- [ ] `editor.session.service.test.ts`
  - [ ] Create session acquires edit lock
  - [ ] Create session fails if lock held by another user (EDITOR_LOCK_CONFLICT)
  - [ ] Multiple view sessions allowed for same component
  - [ ] Update session saves draft and extends lock
  - [ ] Close session releases lock
  - [ ] Cleanup job removes expired sessions

- [ ] `editor.apply.test.ts`
  - [ ] Apply validates lock ownership
  - [ ] Apply snapshots code_before, writes code_after
  - [ ] Apply creates change_log entry
  - [ ] Apply returns compilation errors from ORDS
  - [ ] Apply invalidates explorer cache for page
  - [ ] Apply fails without edit lock
  - [ ] Apply fails when connection offline

- [ ] `editor.formatter.test.ts`
  - [ ] PL/SQL keywords uppercased
  - [ ] Identifiers lowercased
  - [ ] Indentation normalized to 2 spaces
  - [ ] Long lines wrapped at 120 chars
  - [ ] Change count returned correctly

- [ ] `editor.controller.test.ts`
  - [ ] POST /editor/sessions returns 201 with session
  - [ ] POST /editor/sessions returns 409 on lock conflict
  - [ ] PUT /editor/sessions/:id returns 200
  - [ ] DELETE /editor/sessions/:id returns 204
  - [ ] GET /editor/component/:connId/:type/:id returns source
  - [ ] POST /editor/apply as developer returns 200
  - [ ] POST /editor/apply as auditor returns 403
  - [ ] POST /editor/format returns formatted code

- [ ] `editor.completion.test.ts`
  - [ ] Returns table names for schema prefix
  - [ ] Returns column names for table prefix
  - [ ] Returns page items for :P prefix
  - [ ] Empty result for unknown prefix
  - [ ] Cached results served on second call

---

## File Summary

| Category | File Count |
|----------|------------|
| Database migrations | 2 |
| Shared types | 1 |
| Monaco editor components | 2 |
| Tab manager components | 2 |
| Diff viewer | 1 |
| Apply flow (frontend) | 2 |
| Editor backend services | 5 |
| Backend endpoints (validation, service, controller) | 3 |
| MCP completion (frontend + backend) | 2 |
| Zustand stores | 2 |
| Frontend tests | 5 |
| Backend tests | 5 |
| **Total** | **32** |

---

## Execution Order

1. Database migrations (011, 012) -- schema must exist before service code
2. Shared types (editor.ts) -- interfaces used by frontend and backend
3. Editor backend services (session service -> formatter -> apply -> completion)
4. Editor backend endpoints (validation -> service -> controller)
5. Zustand stores (editorStore, editorSessionStore)
6. Monaco editor components (plsql-language -> MonacoEditorWrapper)
7. Tab manager (EditorTab -> TabBar)
8. Diff viewer (DiffViewer)
9. Apply flow (applyService -> ApplyButton)
10. MCP completion provider (backend completion -> frontend completionProvider)
11. Frontend tests (parallel per component)
12. Backend tests (parallel per module)

---

## Approval

**Please review this code generation plan.**

**Options**:
1. **Request Changes** -- Modify the plan before execution
2. **Approve Plan** -- Proceed to Part 2 (Code Generation execution)
