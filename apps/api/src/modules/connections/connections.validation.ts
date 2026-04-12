import { z } from 'zod';

// ── Connection environments ──────────────────────────────────────────────────
export const ENVIRONMENTS = ['dev', 'test', 'staging', 'prod'] as const;
export type Environment = (typeof ENVIRONMENTS)[number];

// ── Connection statuses ──────────────────────────────────────────────────────
export const CONNECTION_STATUSES = ['connected', 'degraded', 'disconnected', 'unknown'] as const;
export type ConnectionStatus = (typeof CONNECTION_STATUSES)[number];

// ── Connection types ─────────────────────────────────────────────────────────
export const CONNECTION_TYPES = ['ords', 'jdbc'] as const;
export type ConnectionType = (typeof CONNECTION_TYPES)[number];

// ── Base connection fields ───────────────────────────────────────────────────
const baseConnectionFields = {
  name: z
    .string({ required_error: 'Connection name is required' })
    .min(1, 'Connection name is required')
    .max(255),
  environment: z.enum(ENVIRONMENTS, {
    required_error: 'Environment is required',
  }),
  username: z
    .string({ required_error: 'Username is required' })
    .min(1, 'Username is required')
    .max(255),
  password: z
    .string({ required_error: 'Password is required' })
    .min(1, 'Password is required'),
  tags: z.array(z.string().max(100)).max(20).optional(),
  labels: z.record(z.string().max(255)).optional(),
};

// ── ORDS connection schema ───────────────────────────────────────────────────
const OrdsConnectionSchema = z.object({
  ...baseConnectionFields,
  type: z.literal('ords'),
  ordsBaseUrl: z
    .string({ required_error: 'ORDS base URL is required' })
    .url('Invalid ORDS base URL'),
});

// ── JDBC connection schema ───────────────────────────────────────────────────
const JdbcConnectionSchema = z.object({
  ...baseConnectionFields,
  type: z.literal('jdbc'),
  host: z
    .string({ required_error: 'Host is required' })
    .min(1, 'Host is required')
    .max(255),
  port: z.coerce
    .number({ required_error: 'Port is required' })
    .int()
    .min(1)
    .max(65535),
  serviceName: z
    .string({ required_error: 'Service name is required' })
    .min(1, 'Service name is required')
    .max(255),
});

// ── Create Connection (discriminated union) ──────────────────────────────────
export const CreateConnectionSchema = z.discriminatedUnion('type', [
  OrdsConnectionSchema,
  JdbcConnectionSchema,
]);

export type CreateConnectionInput = z.infer<typeof CreateConnectionSchema>;

// ── Update Connection ────────────────────────────────────────────────────────
export const UpdateConnectionSchema = z.object({
  name: z.string().min(1).max(255).optional(),
  environment: z.enum(ENVIRONMENTS).optional(),
  tags: z.array(z.string().max(100)).max(20).optional(),
  labels: z.record(z.string().max(255)).optional(),
});

export type UpdateConnectionInput = z.infer<typeof UpdateConnectionSchema>;

// ── List Connections Query ───────────────────────────────────────────────────
export const ListConnectionsQuerySchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  environment: z.enum(ENVIRONMENTS).optional(),
  status: z.enum(CONNECTION_STATUSES).optional(),
  search: z.string().max(255).optional(),
});

export type ListConnectionsQuery = z.infer<typeof ListConnectionsQuerySchema>;

// ── Test Connection ──────────────────────────────────────────────────────────
export const TestConnectionSchema = z.object({
  id: z.string().uuid('Invalid connection ID'),
});

export type TestConnectionInput = z.infer<typeof TestConnectionSchema>;

// ── Test Result ──────────────────────────────────────────────────────────────
export interface TestResult {
  success: boolean;
  latencyMs: number;
  message: string;
  details?: Record<string, unknown>;
}
