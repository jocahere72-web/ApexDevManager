export enum EnvironmentType {
  DEV = 'DEV',
  QA = 'QA',
  STAGING = 'STAGING',
  PROD = 'PROD',
}

export enum EnvironmentStatus {
  ACTIVE = 'ACTIVE',
  INACTIVE = 'INACTIVE',
  PROVISIONING = 'PROVISIONING',
}

export interface Environment {
  id: string;
  tenantId: string;
  name: string;
  type: EnvironmentType;
  config: Record<string, unknown>;
  status: EnvironmentStatus;
  createdAt: string;
  updatedAt: string;
}
