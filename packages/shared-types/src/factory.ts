// ---------------------------------------------------------------------------
// Code Factory shared types (M16 AI Code Generation)
// ---------------------------------------------------------------------------

/**
 * Status of a code generation job.
 */
export type FactoryJobStatus = 'queued' | 'processing' | 'completed' | 'failed' | 'cancelled';

/**
 * Type of component to generate.
 */
export type FactoryComponentType =
  | 'page'
  | 'region'
  | 'process'
  | 'validation'
  | 'computation'
  | 'dynamic-action'
  | 'rest-api'
  | 'plsql-package'
  | 'trigger'
  | 'view'
  | 'full-module';

/**
 * Specification for code generation.
 */
export interface FactorySpec {
  name: string;
  description: string;
  componentType: FactoryComponentType;
  connectionId: string;
  appId?: number;
  requirements: string;
  constraints?: string[];
  templateId?: string;
  options?: Record<string, unknown>;
}

/**
 * A reusable template for code generation.
 */
export interface FactoryTemplate {
  id: string;
  tenantId: string;
  name: string;
  description: string;
  componentType: FactoryComponentType;
  templateContent: string;
  variables: TemplateVariable[];
  tags: string[];
  usageCount: number;
  createdBy: string;
  createdAt: string;
  updatedAt: string;
}

/**
 * A variable within a factory template.
 */
export interface TemplateVariable {
  name: string;
  description: string;
  type: 'string' | 'number' | 'boolean' | 'select';
  defaultValue?: string;
  options?: string[];
  required: boolean;
}

/**
 * A code generation job.
 */
export interface FactoryJob {
  id: string;
  tenantId: string;
  userId: string;
  status: FactoryJobStatus;
  spec: FactorySpec;
  outputs: GeneratedOutput[];
  errorMessage?: string;
  startedAt?: string;
  completedAt?: string;
  executionTimeMs?: number;
  tokensUsed?: number;
  createdAt: string;
}

/**
 * Generated code output from a factory job.
 */
export interface GeneratedOutput {
  id: string;
  jobId: string;
  filename: string;
  language: string;
  content: string;
  componentType: FactoryComponentType;
  description: string;
  lineCount: number;
  applied: boolean;
  appliedAt?: string;
}

/**
 * Request to generate code from a spec.
 */
export interface GenerateFromSpecRequest {
  spec: FactorySpec;
}

/**
 * Request to generate multiple components in batch.
 */
export interface GenerateBatchRequest {
  specs: FactorySpec[];
  connectionId: string;
}

/**
 * Request to create a template.
 */
export interface CreateTemplateRequest {
  name: string;
  description: string;
  componentType: FactoryComponentType;
  templateContent: string;
  variables?: TemplateVariable[];
  tags?: string[];
}
