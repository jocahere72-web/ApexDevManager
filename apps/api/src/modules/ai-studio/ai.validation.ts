import { z } from 'zod';

// ---------------------------------------------------------------------------
// Chat request
// ---------------------------------------------------------------------------

export const ChatRequestSchema = z.object({
  conversationId: z.string().uuid().optional(),
  message: z
    .string({ required_error: 'Message is required' })
    .min(1, 'Message cannot be empty')
    .max(32_000, 'Message too long (max 32,000 characters)'),
  connectionId: z.string().uuid().optional(),
  appId: z.coerce.number().int().positive().optional(),
  pageId: z.coerce.number().int().positive().optional(),
  appName: z.string().max(200).optional(),
  pageName: z.string().max(200).optional(),
  componentSource: z.string().max(100_000).optional(),
  model: z.string().max(100).optional(),
});

export type ChatRequestInput = z.infer<typeof ChatRequestSchema>;

// ---------------------------------------------------------------------------
// Quick action request
// ---------------------------------------------------------------------------

export const QuickActionSchema = z.object({
  action: z.enum(['explain', 'refactor', 'find-bugs', 'document', 'optimize', 'security'], {
    required_error: 'Action is required',
  }),
  code: z
    .string({ required_error: 'Code is required' })
    .min(1, 'Code cannot be empty')
    .max(100_000, 'Code too long (max 100,000 characters)'),
  language: z.string().max(50).optional(),
  connectionId: z.string().uuid().optional(),
  appId: z.coerce.number().int().positive().optional(),
  pageId: z.coerce.number().int().positive().optional(),
  appName: z.string().max(200).optional(),
  pageName: z.string().max(200).optional(),
});

export type QuickActionInput = z.infer<typeof QuickActionSchema>;

// ---------------------------------------------------------------------------
// List conversations query
// ---------------------------------------------------------------------------

export const ListConversationsSchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  connectionId: z.string().uuid().optional(),
});

export type ListConversationsQuery = z.infer<typeof ListConversationsSchema>;
