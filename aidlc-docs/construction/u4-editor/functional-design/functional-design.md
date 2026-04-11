# Functional Design -- U4: Code Editor Studio

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U4 -- Code Editor Studio |
| **Sprint** | S3 (Fase 1) |
| **Duration** | 2 weeks (Weeks 8-9) |
| **Modules** | M3 (Code Editor Studio) |
| **Stories** | US-010, US-011, US-050 |
| **Components** | C06 (Editor Service), C10 (Change Tracker -- integration), C22 (MCP Connector), C23 (ORDS Client) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. Monaco Editor Integration

### 1.1 Language Support

The editor uses Monaco Editor (the VS Code engine) with syntax highlighting, IntelliSense, and error detection for the following languages:

| Language | Monaco Language ID | Features |
|----------|-------------------|----------|
| PL/SQL | `plsql` (custom) | Syntax highlighting, keyword completion, package/procedure suggestions |
| SQL | `sql` | Syntax highlighting, keyword completion, table/column suggestions |
| JavaScript | `javascript` | Full Monaco JS support (built-in) |
| HTML | `html` | Full Monaco HTML support (built-in) |
| CSS | `css` | Full Monaco CSS support (built-in) |

#### PL/SQL Language Definition

Since Monaco does not include PL/SQL natively, a custom language definition is registered:

```typescript
interface PLSQLLanguageConfig {
  keywords: string[];           // DECLARE, BEGIN, END, EXCEPTION, CURSOR, LOOP, IF, THEN, ELSE, etc.
  typeKeywords: string[];       // VARCHAR2, NUMBER, DATE, BOOLEAN, CLOB, BLOB, etc.
  operators: string[];          // :=, ||, =, <>, >=, <=, +, -, *, /
  builtinFunctions: string[];   // NVL, NVL2, COALESCE, DECODE, TO_CHAR, TO_DATE, etc.
  symbols: RegExp;              // Token matching patterns
  tokenizer: {                  // Monarch tokenizer rules
    root: TokenRule[];
    comment: TokenRule[];
    string: TokenRule[];
  };
}
```

---

### 1.2 Editor Component Architecture

```
EditorWorkspace
  +-- TabBar
  |     +-- EditorTab (one per open component)
  |     +-- [+] New Tab
  +-- EditorPane (active tab)
  |     +-- MonacoEditor
  |     |     +-- PL/SQL Language Provider
  |     |     +-- Autocompletion Provider (MCP-driven)
  |     |     +-- Error Marker Provider
  |     +-- ProblemsPanel (errors/warnings from compilation)
  +-- DiffPane (toggle view)
  |     +-- MonacoDiffEditor (side-by-side before/after)
  +-- StatusBar
        +-- Language indicator
        +-- Line/Column position
        +-- Session lock indicator
        +-- Dirty/saved state
```

---

## 2. Tab Management

### 2.1 Tab Model

Each open component gets its own tab. Tabs persist across browser sessions via localStorage.

```typescript
interface EditorTab {
  id: string;                                // Unique tab ID
  componentType: ComponentType;
  componentId: number;
  componentName: string;
  appId: number;
  pageId: number;
  language: 'plsql' | 'javascript' | 'sql' | 'html' | 'css';
  content: string;                           // Current editor content
  originalContent: string;                   // Content at open time (for diff)
  isDirty: boolean;                          // Unsaved changes
  cursorPosition: { line: number; column: number };
  scrollPosition: { top: number; left: number };
  sessionId: string | null;                  // Backend editor session ID
  lockedBy: string | null;                   // User holding edit lock
}
```

### 2.2 Tab Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| TAB-R01 | Max tabs | Maximum 15 open tabs; prompt to close oldest when exceeded |
| TAB-R02 | Dirty indicator | Dot icon on tab when content differs from originalContent |
| TAB-R03 | Close confirmation | Prompt "Save changes?" when closing a dirty tab |
| TAB-R04 | Duplicate prevention | If component is already open, switch to existing tab |
| TAB-R05 | Session persistence | Tab state (content, cursor, scroll) saved to localStorage on change |
| TAB-R06 | Tab reorder | Tabs can be reordered via drag-and-drop |
| TAB-R07 | Context menu | Right-click tab: Close, Close Others, Close All, Close Saved |

---

## 3. Diff View

### 3.1 Diff Viewer

The diff view compares `code_before` (original content fetched from APEX) against `code_after` (current editor content). It uses Monaco's built-in diff editor.

#### Diff View Wireframe

```
+-------------------------------------------------------------------+
| Diff: Set Department Filter (PL/SQL Process)    [Close Diff]       |
+-------------------------------------------------------------------+
| Original (APEX)                 | Modified                         |
+-------------------------------------------------------------------+
|  1 | BEGIN                      |  1 | BEGIN                        |
|  2 |   IF :P1_DEPT IS NOT NULL  |  2 |   IF :P1_DEPT IS NOT NULL    |
|  3 |   THEN                     |  3 |   THEN                       |
|  4 |     :P1_FILTER := 'Y';     |  4 |     :P1_FILTER := 'Y';      |
|    |                             |  5 |     :P1_DEPT_NAME :=         |
|    |                             |  6 |       get_dept_name(:P1_DEPT);|
|  5 |   END IF;                   |  7 |   END IF;                    |
|  6 | END;                        |  8 | END;                         |
+-------------------------------------------------------------------+
| Added: 2 lines | Removed: 0 lines | Modified: 0 lines              |
+-------------------------------------------------------------------+
```

#### Diff Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| DIFF-R01 | Side-by-side default | Diff renders in side-by-side mode by default |
| DIFF-R02 | Inline toggle | User can toggle to inline diff mode |
| DIFF-R03 | Read-only left | Original pane (left) is always read-only |
| DIFF-R04 | Editable right | Modified pane (right) is editable |
| DIFF-R05 | Stats footer | Show line stats: added, removed, modified counts |
| DIFF-R06 | Navigate changes | Next/Previous change buttons to jump between diffs |

---

## 4. Apply Changes via ORDS

### 4.1 Apply Flow

When the user applies changes, the modified code is written back to APEX via the ORDS REST SQL endpoint, and a Change Log entry is created.

#### Apply Sequence Diagram

```
User            Editor UI           Editor Service       ORDS Client      Change Tracker
  |                 |                     |                    |                |
  |-- click Apply ->|                     |                    |                |
  |                 |-- validate syntax -->|                    |                |
  |                 |<-- validation OK ----|                    |                |
  |                 |                     |                    |                |
  |                 |-- POST /editor/apply|                    |                |
  |                 |                     |-- snapshot before ->|                |
  |                 |                     |<-- code_before -----|                |
  |                 |                     |                    |                |
  |                 |                     |-- execute PL/SQL -->|                |
  |                 |                     |   (write new code)  |                |
  |                 |                     |<-- compile result --|                |
  |                 |                     |                    |                |
  |                 |                     |  [IF compile OK]    |                |
  |                 |                     |-- record change --->|--------------->|
  |                 |                     |<-- changeId --------|                |
  |                 |                     |                    |                |
  |                 |                     |-- invalidate cache  |                |
  |                 |                     |   (explorer page)   |                |
  |                 |                     |                    |                |
  |                 |<-- apply result ----|                    |                |
  |<-- success msg -|                     |                    |                |
  |                 |                     |                    |                |
  |                 |  [IF compile FAIL]   |                    |                |
  |                 |<-- compile errors --|                    |                |
  |<-- error markers|                     |                    |                |
```

#### Apply Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| APPLY-R01 | Pre-validation | Client-side syntax check before sending to server |
| APPLY-R02 | Snapshot before | Always capture code_before from APEX before writing |
| APPLY-R03 | Compilation check | After ORDS write, check for compilation errors |
| APPLY-R04 | Change Log entry | Every apply creates a change_log entry (user, timestamp, code_before, code_after, diff) |
| APPLY-R05 | Cache invalidation | Invalidate explorer cache for the affected page |
| APPLY-R06 | Audit event | Log COMPONENT_MODIFIED audit event |
| APPLY-R07 | Lock required | Apply requires an active editor session lock on the component |
| APPLY-R08 | Offline disabled | Apply button disabled when connection is offline |

#### Change Log Entry Schema

```typescript
interface ChangeLogEntry {
  id: string;                  // UUID
  tenantId: string;
  connectionId: string;
  componentType: ComponentType;
  componentId: number;
  componentName: string;
  appId: number;
  pageId: number;
  codeBefore: string;
  codeAfter: string;
  diff: string;                // Unified diff format
  appliedBy: string;           // userId
  appliedAt: string;           // ISO timestamp
  source: 'manual' | 'ai';    // Whether change was manual or AI-generated
  aiRequestId?: string;        // If source is 'ai', reference to AI request
}
```

---

## 5. Editor Sessions and Persistence

### 5.1 Session Model

Editor sessions track which user is editing which component, providing edit locks and draft persistence.

```typescript
interface EditorSession {
  sessionId: string;
  userId: string;
  tenantId: string;
  componentType: ComponentType;
  componentId: number;
  mode: 'edit' | 'view';
  draftContent: string | null;    // Saved draft (auto-save every 30s)
  cursorPosition: { line: number; column: number };
  createdAt: string;
  lastActiveAt: string;
  expiresAt: string;              // Lock expires after 30 minutes of inactivity
}
```

### 5.2 Session Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| SESSION-R01 | Lock acquisition | Only one user can hold an edit lock per component |
| SESSION-R02 | Lock expiry | Locks expire after 30 minutes of inactivity |
| SESSION-R03 | Lock extension | Each editor action (keystroke, save) resets the 30-minute timer |
| SESSION-R04 | View mode | Multiple users can open in view mode simultaneously |
| SESSION-R05 | Lock conflict | If another user holds the lock, show "Locked by {user}" with view-only mode |
| SESSION-R06 | Auto-save draft | Draft content auto-saved to backend every 30 seconds |
| SESSION-R07 | Draft recovery | On reconnect/reopen, offer to restore saved draft |
| SESSION-R08 | Session cleanup | Background job cleans up expired sessions every 5 minutes |
| SESSION-R09 | Tab state sync | Tab state (cursor, scroll, content) persisted to localStorage for instant restore |

---

## 6. Auto-Format SQL/PL/SQL

### 6.1 Formatter Service

The formatter formats SQL and PL/SQL code using a server-side formatting service.

#### Format Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| FMT-R01 | Keywords uppercase | SQL/PL/SQL keywords formatted to uppercase (SELECT, BEGIN, END, etc.) |
| FMT-R02 | Identifiers lowercase | Table names, column names, variable names in lowercase |
| FMT-R03 | Indentation | 2-space indentation for nested blocks |
| FMT-R04 | Line length | Max 120 characters per line; wrap long statements |
| FMT-R05 | Comma placement | Trailing commas (column1, column2,) |
| FMT-R06 | Alignment | Align column lists and assignment operators |
| FMT-R07 | Keyboard shortcut | Shift+Alt+F triggers format (matching VS Code convention) |
| FMT-R08 | Format on save | Optional setting: auto-format before apply |

#### Format API

```typescript
interface FormatRequest {
  content: string;
  language: 'plsql' | 'sql';
  options?: {
    keywordCase: 'upper' | 'lower' | 'preserve';
    identifierCase: 'lower' | 'upper' | 'preserve';
    indentSize: number;
    maxLineLength: number;
  };
}

interface FormatResponse {
  formatted: string;
  changes: number;    // Number of formatting changes applied
}
```

---

## 7. Offline Mode

### 7.1 Editor Offline Behavior

| Feature | Online | Offline |
|---------|--------|---------|
| Open component | Fetches live source from APEX | Opens from cached/draft content |
| Edit code | Full editing with auto-save | Full editing with local draft |
| Apply changes | ORDS write + Change Log | Disabled (greyed out, tooltip: "Connect to apply") |
| Format code | Server-side format | Disabled (consider client-side fallback) |
| Diff view | Live before vs current | Cached before vs current |
| Auto-completion | MCP-driven suggestions | Local keyword-only suggestions |
| Session lock | Server-managed | Local-only (no conflict detection) |

---

## 8. MCP Autocompletion for Table/Column Names

### 8.1 Autocompletion Architecture

The autocompletion provider uses MCP to fetch schema metadata (table names, column names, package names, procedure/function signatures) and provides them as Monaco completion items.

```
User types "emp."     Monaco Provider      Explorer Cache       MCP Connector
       |                    |                    |                     |
       |-- trigger -------->|                    |                     |
       |                    |-- get metadata --->|                     |
       |                    |                    |-- HIT ------------->|
       |                    |<-- columns[] ------|                     |
       |<-- completion list-|                    |                     |
       |                    |                    |                     |
       |  [IF cache miss]   |                    |                     |
       |                    |-- get metadata --->|                     |
       |                    |                    |-- MISS              |
       |                    |                    |-- fetch via MCP --->|
       |                    |                    |<-- metadata --------|
       |                    |<-- columns[] ------|                     |
       |<-- completion list-|                    |                     |
```

#### Completion Categories

| Trigger | Suggestions | Source |
|---------|------------|--------|
| `schema_name.` | Table names, view names | APEX_WORKSPACE_DATA_DICTIONARY |
| `table_name.` | Column names with types | ALL_TAB_COLUMNS |
| `package_name.` | Procedure/function names | ALL_PROCEDURES |
| No prefix (PL/SQL keywords) | Keywords, built-in functions | Static list |
| `:P{n}_` | Page item names | APEX_APPLICATION_PAGE_ITEMS |

#### Completion Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| COMP-R01 | Debounce | 150ms debounce on completion trigger |
| COMP-R02 | Cache metadata | Schema metadata cached for 1 hour (same TTL as explorer) |
| COMP-R03 | Relevance sorting | Schema-driven suggestions ranked above keyword suggestions |
| COMP-R04 | Detail on hover | Show column type, nullable flag, and comment on hover |
| COMP-R05 | Page context | When editing a page component, page items (:P{n}_*) are prioritized |

---

## 9. API Endpoints (Editor Backend)

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| `POST` | `/api/v1/editor/sessions` | authenticate() | Create editor session with lock |
| `PUT` | `/api/v1/editor/sessions/:id` | authenticate() | Update session (save draft) |
| `DELETE` | `/api/v1/editor/sessions/:id` | authenticate() | Close session, release lock |
| `GET` | `/api/v1/editor/component/:connectionId/:type/:id` | authenticate() | Fetch component source code |
| `POST` | `/api/v1/editor/apply` | authorize(['developer','tech_lead','admin']) | Apply changes to APEX via ORDS |
| `POST` | `/api/v1/editor/format` | authenticate() | Format SQL/PL/SQL code |
| `GET` | `/api/v1/editor/diff/:connectionId/:type/:id` | authenticate() | Get diff (before vs current draft) |
| `GET` | `/api/v1/editor/locks/:componentId` | authenticate() | Check lock status |
| `GET` | `/api/v1/editor/sessions/active` | authenticate() | List active sessions for current app |

---

## 10. Database Schema

### 10.1 editor_sessions Table

```sql
CREATE TABLE editor_sessions (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id     UUID NOT NULL REFERENCES tenants(id),
  user_id       UUID NOT NULL REFERENCES users(id),
  connection_id UUID NOT NULL REFERENCES connections(id),
  component_type VARCHAR(50) NOT NULL,
  component_id   INTEGER NOT NULL,
  mode           VARCHAR(10) NOT NULL CHECK (mode IN ('edit', 'view')),
  draft_content  TEXT,
  cursor_line    INTEGER DEFAULT 1,
  cursor_column  INTEGER DEFAULT 1,
  created_at     TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  last_active_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  expires_at     TIMESTAMPTZ NOT NULL DEFAULT NOW() + INTERVAL '30 minutes',
  CONSTRAINT unique_edit_lock UNIQUE (connection_id, component_type, component_id)
    WHERE mode = 'edit'
);

-- RLS policy
ALTER TABLE editor_sessions ENABLE ROW LEVEL SECURITY;
CREATE POLICY editor_sessions_tenant_isolation ON editor_sessions
  USING (tenant_id::text = current_setting('app.current_tenant', true));

-- Index for cleanup job
CREATE INDEX idx_editor_sessions_expires ON editor_sessions(expires_at)
  WHERE mode = 'edit';
```

### 10.2 change_log Table

```sql
CREATE TABLE change_log (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id       UUID NOT NULL REFERENCES tenants(id),
  connection_id   UUID NOT NULL REFERENCES connections(id),
  component_type  VARCHAR(50) NOT NULL,
  component_id    INTEGER NOT NULL,
  component_name  VARCHAR(255) NOT NULL,
  app_id          INTEGER NOT NULL,
  page_id         INTEGER NOT NULL,
  code_before     TEXT NOT NULL,
  code_after      TEXT NOT NULL,
  diff            TEXT NOT NULL,
  applied_by      UUID NOT NULL REFERENCES users(id),
  applied_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  source          VARCHAR(10) NOT NULL CHECK (source IN ('manual', 'ai')),
  ai_request_id   UUID,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS policy
ALTER TABLE change_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY change_log_tenant_isolation ON change_log
  USING (tenant_id::text = current_setting('app.current_tenant', true));

-- Indexes
CREATE INDEX idx_change_log_component ON change_log(connection_id, component_type, component_id);
CREATE INDEX idx_change_log_tenant_date ON change_log(tenant_id, applied_at);
CREATE INDEX idx_change_log_user ON change_log(applied_by);
```

---

## 11. Error Handling

| Error Code | HTTP Status | Condition | User Message |
|------------|-------------|-----------|-------------|
| `EDITOR_LOCK_CONFLICT` | 409 | Another user holds edit lock | "Component is being edited by {user}. Open in view mode?" |
| `EDITOR_LOCK_EXPIRED` | 410 | Session lock expired during edit | "Your edit session expired. Save your draft and re-open." |
| `EDITOR_COMPILE_FAILED` | 422 | ORDS compilation returned errors | "Compilation failed: {errors}. Fix errors and retry." |
| `EDITOR_COMPONENT_NOT_FOUND` | 404 | Component does not exist in APEX | "Component not found. It may have been deleted." |
| `EDITOR_APPLY_OFFLINE` | 503 | Connection is offline during apply | "Connection is offline. Changes saved as draft." |
| `EDITOR_FORMAT_FAILED` | 500 | Formatter service error | "Formatting failed. Please try again." |
| `EDITOR_SESSION_LIMIT` | 429 | User has too many active sessions (>15) | "Too many open editors. Close some tabs first." |

---

## 12. Security Considerations

| Concern | Mitigation |
|---------|-----------|
| Code injection via editor content | Editor content is PL/SQL/JS; ORDS executes via parameterized calls, not raw SQL |
| Lock bypass | Server validates lock ownership before allowing apply |
| Draft data exposure | Drafts stored per-tenant with RLS; localStorage keyed by tenantId |
| CSRF on apply | CSRF token required on POST /editor/apply |
| Session hijacking | Session ID is UUID; validated against userId and tenantId |
| Change log tampering | change_log table is append-only; no UPDATE or DELETE policies |
