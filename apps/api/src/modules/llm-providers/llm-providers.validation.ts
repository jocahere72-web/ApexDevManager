import { z } from 'zod';

const PROVIDER_NAMES = ['anthropic', 'openai', 'google', 'mistral', 'local'] as const;

// ── Create LLM Provider ────────────────────────────────────────────────────
export const CreateLLMProviderSchema = z.object({
  providerName: z.enum(PROVIDER_NAMES, {
    required_error: 'Provider name is required',
  }),
  displayName: z
    .string({ required_error: 'Display name is required' })
    .min(1, 'Display name is required')
    .max(100),
  apiKey: z
    .string({ required_error: 'API key is required' })
    .min(1, 'API key is required'),
  baseUrl: z.string().url('Must be a valid URL').max(500).optional(),
  defaultModel: z
    .string({ required_error: 'Default model is required' })
    .min(1, 'Default model is required')
    .max(100),
  availableModels: z.array(z.string().max(100)).optional(),
  maxTokensPerRequest: z.coerce.number().int().min(1).max(200000).optional(),
  rateLimitRpm: z.coerce.number().int().min(1).max(10000).optional(),
  monthlyBudgetUsd: z.coerce.number().min(0).max(99999999.99).optional(),
});

export type CreateLLMProviderInput = z.infer<typeof CreateLLMProviderSchema>;

// ── Update LLM Provider ────────────────────────────────────────────────────
export const UpdateLLMProviderSchema = z.object({
  displayName: z.string().min(1).max(100).optional(),
  apiKey: z.string().min(1).optional(),
  baseUrl: z.string().url('Must be a valid URL').max(500).nullable().optional(),
  defaultModel: z.string().min(1).max(100).optional(),
  availableModels: z.array(z.string().max(100)).optional(),
  maxTokensPerRequest: z.coerce.number().int().min(1).max(200000).optional(),
  rateLimitRpm: z.coerce.number().int().min(1).max(10000).optional(),
  monthlyBudgetUsd: z.coerce.number().min(0).max(99999999.99).nullable().optional(),
  config: z.record(z.unknown()).optional(),
});

export type UpdateLLMProviderInput = z.infer<typeof UpdateLLMProviderSchema>;
