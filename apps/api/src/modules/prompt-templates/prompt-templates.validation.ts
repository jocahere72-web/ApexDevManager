import { z } from 'zod';

const PROMPT_CATEGORIES = ['prd', 'page-gen', 'code', 'analysis', 'testing'] as const;

// ── Create Prompt Template ────────────────────────────────────────────────
export const CreatePromptTemplateSchema = z.object({
  slug: z
    .string({ required_error: 'Slug is required' })
    .min(1, 'Slug is required')
    .max(100)
    .regex(/^[a-z0-9-]+$/, 'Slug must contain only lowercase letters, numbers, and hyphens'),
  name: z
    .string({ required_error: 'Name is required' })
    .min(1, 'Name is required')
    .max(200),
  description: z.string().max(2000).optional(),
  category: z.enum(PROMPT_CATEGORIES, {
    required_error: 'Category is required',
  }),
  promptText: z
    .string({ required_error: 'Prompt text is required' })
    .min(1, 'Prompt text is required'),
  modelOverride: z.string().max(100).optional(),
  temperature: z.coerce.number().min(0).max(1).optional(),
  maxTokens: z.coerce.number().int().min(1).max(200000).optional(),
  variables: z.array(z.string().max(100)).optional(),
  isSystemDefault: z.boolean().optional(),
});

export type CreatePromptTemplateInput = z.infer<typeof CreatePromptTemplateSchema>;

// ── Update Prompt Template ────────────────────────────────────────────────
export const UpdatePromptTemplateSchema = z.object({
  name: z.string().min(1).max(200).optional(),
  description: z.string().max(2000).nullable().optional(),
  promptText: z.string().min(1).optional(),
  modelOverride: z.string().max(100).nullable().optional(),
  temperature: z.coerce.number().min(0).max(1).optional(),
  maxTokens: z.coerce.number().int().min(1).max(200000).optional(),
  variables: z.array(z.string().max(100)).optional(),
  isActive: z.boolean().optional(),
});

export type UpdatePromptTemplateInput = z.infer<typeof UpdatePromptTemplateSchema>;
