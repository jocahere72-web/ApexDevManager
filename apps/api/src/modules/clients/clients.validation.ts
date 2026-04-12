import { z } from 'zod';

// ── Create Client ───────────────────────────────────────────────────────────
export const CreateClientSchema = z.object({
  name: z
    .string({ required_error: 'Client name is required' })
    .min(1, 'Client name is required')
    .max(200),
  code: z
    .string({ required_error: 'Client code is required' })
    .min(2, 'Code must be at least 2 characters')
    .max(10, 'Code must be at most 10 characters')
    .regex(/^[A-Z][A-Z0-9]*$/, 'Code must be uppercase alphanumeric, starting with a letter')
    .transform((v) => v.toUpperCase()),
  description: z.string().max(2000).optional(),
  connectionId: z.string().uuid('Invalid connection ID').optional(),
  appId: z.coerce.number().int().positive().optional(),
  contactName: z.string().max(100).optional(),
  contactEmail: z.string().email('Invalid email').max(255).optional(),
});

export type CreateClientInput = z.infer<typeof CreateClientSchema>;

// ── Update Client ───────────────────────────────────────────────────────────
export const UpdateClientSchema = z.object({
  name: z.string().min(1).max(200).optional(),
  description: z.string().max(2000).nullable().optional(),
  connectionId: z.string().uuid('Invalid connection ID').nullable().optional(),
  appId: z.coerce.number().int().positive().nullable().optional(),
  contactName: z.string().max(100).nullable().optional(),
  contactEmail: z.string().email('Invalid email').max(255).nullable().optional(),
});

export type UpdateClientInput = z.infer<typeof UpdateClientSchema>;

// ── List Clients Query ──────────────────────────────────────────────────────
export const ListClientsSchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  search: z.string().max(255).optional(),
  isActive: z
    .enum(['true', 'false'])
    .transform((v) => v === 'true')
    .optional(),
});

export type ListClientsQuery = z.infer<typeof ListClientsSchema>;
