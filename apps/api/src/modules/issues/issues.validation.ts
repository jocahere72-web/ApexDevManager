import { z } from 'zod';

// ── Create Issue ───────────────────────────────────────────────────────────
export const CreateIssueSchema = z.object({
  clientId: z.string().uuid('Invalid client ID'),
  title: z
    .string({ required_error: 'Title is required' })
    .min(1, 'Title is required')
    .max(300),
  description: z.string().max(5000).optional(),
  priority: z.enum(['low', 'medium', 'high', 'critical']).optional(),
  type: z.enum(['feature', 'bug', 'enhancement', 'task']).optional(),
  requestedBy: z.string().max(200).optional(),
  tags: z.array(z.string().max(50)).max(20).optional(),
});

export type CreateIssueInput = z.infer<typeof CreateIssueSchema>;

// ── Update Issue ───────────────────────────────────────────────────────────
export const UpdateIssueSchema = z.object({
  title: z.string().min(1).max(300).optional(),
  description: z.string().max(5000).nullable().optional(),
  priority: z.enum(['low', 'medium', 'high', 'critical']).optional(),
  type: z.enum(['feature', 'bug', 'enhancement', 'task']).optional(),
  assignedTo: z.string().uuid('Invalid user ID').nullable().optional(),
  requestedBy: z.string().max(200).nullable().optional(),
  tags: z.array(z.string().max(50)).max(20).optional(),
  prdSessionId: z.string().uuid().nullable().optional(),
  changeSetId: z.string().uuid().nullable().optional(),
  releaseId: z.string().uuid().nullable().optional(),
  testSuiteId: z.string().uuid().nullable().optional(),
});

export type UpdateIssueInput = z.infer<typeof UpdateIssueSchema>;

// ── List Issues Query ──────────────────────────────────────────────────────
export const ListIssuesSchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  clientId: z.string().uuid('Invalid client ID').optional(),
  status: z.enum(['intake', 'prd', 'design', 'build', 'review', 'test', 'deploy', 'done']).optional(),
  priority: z.enum(['low', 'medium', 'high', 'critical']).optional(),
  type: z.enum(['feature', 'bug', 'enhancement', 'task']).optional(),
  assignedTo: z.string().uuid('Invalid user ID').optional(),
  search: z.string().max(255).optional(),
});

export type ListIssuesQuery = z.infer<typeof ListIssuesSchema>;

// ── Transition Issue ───────────────────────────────────────────────────────
export const TransitionSchema = z.object({
  status: z.enum(['intake', 'prd', 'design', 'build', 'review', 'test', 'deploy', 'done']),
});

export type TransitionInput = z.infer<typeof TransitionSchema>;
