export enum TenantPlan {
  FREE = 'FREE',
  STARTER = 'STARTER',
  PROFESSIONAL = 'PROFESSIONAL',
  ENTERPRISE = 'ENTERPRISE',
}

export enum TenantStatus {
  ACTIVE = 'ACTIVE',
  SUSPENDED = 'SUSPENDED',
  TRIAL = 'TRIAL',
}

export interface TenantSettings {
  maxUsers: number;
  maxConnections: number;
  maxEnvironments: number;
  aiCreditsMonthly: number;
  features: string[];
}

export interface Tenant {
  id: string;
  name: string;
  slug: string;
  plan: TenantPlan;
  settings: TenantSettings;
  status: TenantStatus;
  createdAt: string;
  updatedAt: string;
}
