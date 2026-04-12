// ---------------------------------------------------------------------------
// Prompt Template Types
// ---------------------------------------------------------------------------

export type PromptCategory = 'prd' | 'page-gen' | 'code' | 'analysis' | 'testing';

export interface PromptTemplate {
  id: string;
  tenantId: string;
  slug: string;
  name: string;
  description?: string;
  category: PromptCategory;
  promptText: string;
  modelOverride?: string;
  temperature: number;
  maxTokens: number;
  variables: string[];
  isSystemDefault: boolean;
  isActive: boolean;
  version: number;
  createdBy?: string;
  createdAt: string;
  updatedAt: string;
}

export interface CreatePromptTemplateRequest {
  slug: string;
  name: string;
  description?: string;
  category: PromptCategory;
  promptText: string;
  modelOverride?: string;
  temperature?: number;
  maxTokens?: number;
  variables?: string[];
  isSystemDefault?: boolean;
}

export interface UpdatePromptTemplateRequest {
  name?: string;
  description?: string;
  promptText?: string;
  modelOverride?: string | null;
  temperature?: number;
  maxTokens?: number;
  variables?: string[];
  isActive?: boolean;
}

export const DEFAULT_PROMPT_SLUGS = {
  PRD_EXTRACT: 'prd-extract',
  PRD_GENERATE: 'prd-generate',
  PRD_VALIDATE: 'prd-validate',
  PAGE_GENERATE: 'page-generate',
  CODE_EXPLAIN: 'code-explain',
  CODE_REFACTOR: 'code-refactor',
  CODE_DOCUMENT: 'code-document',
  CODE_OPTIMIZE: 'code-optimize',
  CODE_SECURITY: 'code-security',
  CODE_BUGS: 'code-bugs',
  TEST_GENERATE: 'test-generate',
  DOC_GENERATE: 'doc-generate',
} as const;

export type PromptSlug = typeof DEFAULT_PROMPT_SLUGS[keyof typeof DEFAULT_PROMPT_SLUGS];
