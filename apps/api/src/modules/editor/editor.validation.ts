import { z } from 'zod';

// ── Component type enum ────────────────────────────────────────────────────

export const EDITOR_COMPONENT_TYPES = [
  'package_spec',
  'package_body',
  'procedure',
  'function',
  'trigger',
  'view',
  'type_spec',
  'type_body',
  'region_source',
  'process_source',
  'computation_source',
  'validation_source',
  'dynamic_action_source',
] as const;

// ── Open Session ───────────────────────────────────────────────────────────

export const OpenSessionSchema = z.object({
  connectionId: z.string().uuid('Invalid connection ID'),
  componentType: z.enum(EDITOR_COMPONENT_TYPES, {
    errorMap: () => ({ message: 'Invalid component type' }),
  }),
  componentId: z.string().min(1, 'Component ID is required').max(100),
  mode: z.enum(['view', 'edit']).default('view'),
});

export type OpenSessionInput = z.infer<typeof OpenSessionSchema>;

// ── Save Draft ─────────────────────────────────────────────────────────────

export const SaveDraftSchema = z.object({
  draftContent: z.string(),
  cursorLine: z.number().int().min(0).optional(),
  cursorColumn: z.number().int().min(0).optional(),
});

export type SaveDraftInput = z.infer<typeof SaveDraftSchema>;

// ── Apply Code ─────────────────────────────────────────────────────────────

export const ApplyCodeSchema = z.object({
  code: z.string().min(1, 'Code is required'),
  componentName: z.string().max(255).optional(),
  appId: z.string().max(100).optional(),
  pageId: z.number().int().positive().optional(),
  source: z.enum(['manual', 'ai']).default('manual'),
  aiRequestId: z.string().uuid().optional(),
});

export type ApplyCodeInput = z.infer<typeof ApplyCodeSchema>;

// ── Format Code ────────────────────────────────────────────────────────────

export const FormatCodeSchema = z.object({
  source: z.string().min(1, 'Source code is required'),
  language: z.string().min(1).max(50).default('plsql'),
});

export type FormatCodeInput = z.infer<typeof FormatCodeSchema>;

// ── List Change Log ────────────────────────────────────────────────────────

export const ListChangeLogSchema = z.object({
  connectionId: z.string().uuid('Invalid connection ID'),
  componentType: z.enum(EDITOR_COMPONENT_TYPES, {
    errorMap: () => ({ message: 'Invalid component type' }),
  }),
  componentId: z.string().min(1).max(100),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  offset: z.coerce.number().int().min(0).default(0),
});

export type ListChangeLogInput = z.infer<typeof ListChangeLogSchema>;

// ── Route param schemas ────────────────────────────────────────────────────

export const SourceParamsSchema = z.object({
  connectionId: z.string().uuid('Invalid connection ID'),
  componentType: z.enum(EDITOR_COMPONENT_TYPES, {
    errorMap: () => ({ message: 'Invalid component type' }),
  }),
  componentId: z.string().min(1).max(100),
});

export type SourceParams = z.infer<typeof SourceParamsSchema>;

export const SessionIdParamSchema = z.object({
  id: z.string().uuid('Invalid session ID'),
});

export type SessionIdParam = z.infer<typeof SessionIdParamSchema>;
