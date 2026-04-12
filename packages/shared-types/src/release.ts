// ---------------------------------------------------------------------------
// Release Manager types (M9)
// ---------------------------------------------------------------------------

export type DeploymentStatus =
  | 'draft'
  | 'building'
  | 'testing'
  | 'staging'
  | 'production'
  | 'rolled_back';

export interface PipelineStage {
  name: string;
  status: 'pending' | 'running' | 'passed' | 'failed' | 'skipped';
  startedAt?: string;
  completedAt?: string;
  logs?: string[];
  artifacts?: string[];
}

export interface Pipeline {
  stages: PipelineStage[];
  currentStage: string;
  startedAt?: string;
  completedAt?: string;
}

export interface RollbackInfo {
  rolledBackAt: string;
  rolledBackBy: string;
  reason: string;
  previousVersion: string;
}

export interface Release {
  id: string;
  tenantId: string;
  connectionId: string;
  version: string;
  status: DeploymentStatus;
  pipeline: Pipeline;
  changeSetIds: string[];
  deployedBy: string | null;
  deployedAt: string | null;
  rolledBackAt: string | null;
  rollbackReason: string | null;
  createdAt: string;
  updatedAt: string;
}
