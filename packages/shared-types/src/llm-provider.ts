// ---------------------------------------------------------------------------
// LLM Provider Types
// ---------------------------------------------------------------------------

export type LLMProviderName = 'anthropic' | 'openai' | 'google' | 'mistral' | 'local';

export interface LLMProvider {
  id: string;
  tenantId: string;
  providerName: LLMProviderName;
  displayName: string;
  baseUrl?: string;
  defaultModel: string;
  availableModels: string[];
  isActive: boolean;
  maxTokensPerRequest: number;
  rateLimitRpm: number;
  monthlyBudgetUsd?: number;
  currentMonthCostUsd: number;
  config: Record<string, unknown>;
  createdAt: string;
  updatedAt: string;
  // Never expose api_key_encrypted to frontend
}

export interface CreateLLMProviderRequest {
  providerName: LLMProviderName;
  displayName: string;
  apiKey: string; // plain text, will be encrypted
  baseUrl?: string;
  defaultModel: string;
  availableModels?: string[];
  maxTokensPerRequest?: number;
  rateLimitRpm?: number;
  monthlyBudgetUsd?: number;
}

export interface UpdateLLMProviderRequest {
  displayName?: string;
  apiKey?: string; // if provided, re-encrypt
  baseUrl?: string;
  defaultModel?: string;
  availableModels?: string[];
  maxTokensPerRequest?: number;
  rateLimitRpm?: number;
  monthlyBudgetUsd?: number;
  config?: Record<string, unknown>;
}

export const PROVIDER_MODELS: Record<LLMProviderName, string[]> = {
  anthropic: ['claude-sonnet-4-20250514', 'claude-opus-4-20250514', 'claude-haiku-4-20250414'],
  openai: ['gpt-4o', 'gpt-4o-mini', 'o3', 'o3-mini'],
  google: ['gemini-2.5-pro', 'gemini-2.5-flash'],
  mistral: ['mistral-large', 'mistral-medium', 'codestral'],
  local: ['custom'],
};
