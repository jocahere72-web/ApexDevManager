import { z } from 'zod';
import type { ApexComponentType, ApexSearchObjectType } from '../../integrations/mcp/mcp-apex-adapter.js';

// ── Component types ─────────────────────────────────────────────────────────
export const COMPONENT_TYPES = [
  'regions',
  'items',
  'buttons',
  'processes',
  'computations',
  'validations',
] as const;

export const SEARCH_OBJECT_TYPES = [
  'applications',
  'pages',
  'regions',
  'items',
  'buttons',
  'processes',
] as const;

// ── List Applications Params ────────────────────────────────────────────────
export const ListAppsParamsSchema = z.object({
  connectionId: z.string().uuid('Invalid connection ID'),
});

export type ListAppsParams = z.infer<typeof ListAppsParamsSchema>;

// ── List Pages Params ───────────────────────────────────────────────────────
export const ListPagesParamsSchema = z.object({
  connectionId: z.string().uuid('Invalid connection ID'),
  appId: z.coerce.number().int().positive('Application ID must be a positive integer'),
});

export type ListPagesParams = z.infer<typeof ListPagesParamsSchema>;

// ── List Components Params ──────────────────────────────────────────────────
export const ListComponentsParamsSchema = z.object({
  connectionId: z.string().uuid('Invalid connection ID'),
  pageId: z.coerce.number().int().positive('Page ID must be a positive integer'),
});

export type ListComponentsParams = z.infer<typeof ListComponentsParamsSchema>;

// ── List Components Query (optional type filter) ────────────────────────────
export const ListComponentsQuerySchema = z.object({
  type: z.enum(COMPONENT_TYPES).optional(),
});

export type ListComponentsQuery = z.infer<typeof ListComponentsQuerySchema>;

// ── Application Tree Params ─────────────────────────────────────────────────
export const AppTreeParamsSchema = z.object({
  connectionId: z.string().uuid('Invalid connection ID'),
  appId: z.coerce.number().int().positive('Application ID must be a positive integer'),
});

export type AppTreeParams = z.infer<typeof AppTreeParamsSchema>;

// ── Search Query ────────────────────────────────────────────────────────────
export const SearchQuerySchema = z.object({
  connectionId: z.string().uuid('Invalid connection ID'),
  term: z
    .string({ required_error: 'Search term is required' })
    .min(2, 'Search term must be at least 2 characters')
    .max(255),
  objectTypes: z
    .union([
      z.array(z.enum(SEARCH_OBJECT_TYPES)),
      z.enum(SEARCH_OBJECT_TYPES).transform((val) => [val]),
    ])
    .optional(),
  limit: z.coerce.number().int().min(1).max(500).default(50),
  offset: z.coerce.number().int().min(0).default(0),
});

export type SearchQuery = z.infer<typeof SearchQuerySchema>;

// ── Sync Params ─────────────────────────────────────────────────────────────
export const SyncParamsSchema = z.object({
  connectionId: z.string().uuid('Invalid connection ID'),
});

export type SyncParams = z.infer<typeof SyncParamsSchema>;
