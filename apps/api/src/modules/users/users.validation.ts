import { z } from 'zod';
import { ROLES } from '../auth/auth.types.js';

// ── Password complexity helper ───────────────────────────────────────────────
const passwordRegex =
  /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?`~])/;

// ── Create User ──────────────────────────────────────────────────────────────
export const CreateUserSchema = z.object({
  email: z
    .string({ required_error: 'Email is required' })
    .email('Invalid email format')
    .max(255)
    .transform((v) => v.toLowerCase().trim()),
  displayName: z
    .string({ required_error: 'Display name is required' })
    .min(1, 'Display name is required')
    .max(255),
  roles: z
    .array(z.enum(ROLES), { required_error: 'At least one role is required' })
    .min(1, 'At least one role is required'),
  password: z
    .string({ required_error: 'Password is required' })
    .min(12, 'Password must be at least 12 characters')
    .max(128, 'Password must be at most 128 characters')
    .regex(
      passwordRegex,
      'Password must contain at least one lowercase letter, one uppercase letter, one digit, and one special character',
    ),
});

export type CreateUserInput = z.infer<typeof CreateUserSchema>;

// ── Update User ──────────────────────────────────────────────────────────────
export const UpdateUserSchema = z.object({
  displayName: z.string().min(1).max(255).optional(),
  roles: z.array(z.enum(ROLES)).min(1).optional(),
  isActive: z.boolean().optional(),
});

export type UpdateUserInput = z.infer<typeof UpdateUserSchema>;

// ── List Users Query ─────────────────────────────────────────────────────────
export const ListUsersQuerySchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  search: z.string().max(255).optional(),
  role: z.enum(ROLES).optional(),
  isActive: z
    .enum(['true', 'false'])
    .transform((v) => v === 'true')
    .optional(),
});

export type ListUsersQuery = z.infer<typeof ListUsersQuerySchema>;
