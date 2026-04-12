// ---------------------------------------------------------------------------
// Editor Types -- Code Editor Studio (U4-M3)
// ---------------------------------------------------------------------------

// ── Component Types ────────────────────────────────────────────────────────

export type ComponentType =
  | 'package_spec'
  | 'package_body'
  | 'procedure'
  | 'function'
  | 'trigger'
  | 'view'
  | 'type_spec'
  | 'type_body'
  | 'region_source'
  | 'process_source'
  | 'computation_source'
  | 'validation_source'
  | 'dynamic_action_source';

// ── Editor Session ─────────────────────────────────────────────────────────

export interface EditorSession {
  id: string;
  tenantId: string;
  userId: string;
  connectionId: string;
  componentType: ComponentType;
  componentId: string;
  mode: 'view' | 'edit';
  draftContent: string | null;
  cursorLine: number | null;
  cursorColumn: number | null;
  createdAt: string;
  lastActiveAt: string;
  expiresAt: string;
}

// ── Editor Tab ─────────────────────────────────────────────────────────────

export interface EditorTab {
  id: string;
  sessionId: string | null;
  connectionId: string;
  componentType: ComponentType;
  componentId: string;
  componentName: string;
  mode: 'view' | 'edit';
  content: string;
  originalContent: string;
  isDirty: boolean;
  cursorLine: number;
  cursorColumn: number;
}

// ── Component Source ───────────────────────────────────────────────────────

export interface ComponentSource {
  connectionId: string;
  componentType: ComponentType;
  componentId: string;
  componentName: string;
  appId?: string;
  pageId?: number;
  source: string;
  language: string;
  lastModified: string | null;
  modifiedBy: string | null;
}

// ── Change Log ─────────────────────────────────────────────────────────────

export interface EditorChangeLogEntry {
  id: string;
  tenantId: string;
  connectionId: string;
  componentType: ComponentType;
  componentId: string;
  componentName: string | null;
  appId: string | null;
  pageId: number | null;
  codeBefore: string | null;
  codeAfter: string | null;
  diff: string | null;
  appliedBy: string;
  appliedAt: string;
  source: 'manual' | 'ai';
  aiRequestId: string | null;
  createdAt: string;
}

// ── Lock Status ────────────────────────────────────────────────────────────

export interface LockStatus {
  isLocked: boolean;
  lockedBy: string | null;
  lockedByName: string | null;
  sessionId: string | null;
  expiresAt: string | null;
}

// ── Format Request / Response ──────────────────────────────────────────────

export interface FormatRequest {
  source: string;
  language: string;
}

export interface FormatResponse {
  formatted: string;
  changed: boolean;
}

// ── Apply Request / Response ───────────────────────────────────────────────

export interface ApplyRequest {
  sessionId: string;
  code: string;
  componentName?: string;
  appId?: string;
  pageId?: number;
  source?: 'manual' | 'ai';
  aiRequestId?: string;
}

export interface ApplyResponse {
  success: boolean;
  changeLogId: string;
  appliedAt: string;
}

// ── Compilation Error ──────────────────────────────────────────────────────

export interface CompilationError {
  line: number;
  column: number;
  message: string;
  severity: 'error' | 'warning';
  errorCode?: string;
}
