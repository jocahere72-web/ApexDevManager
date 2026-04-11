export enum UserRole {
  ADMIN = 'ADMIN',
  DEVELOPER = 'DEVELOPER',
  TECH_LEAD = 'TECH_LEAD',
  RELEASE_MANAGER = 'RELEASE_MANAGER',
  KNOWLEDGE_EDITOR = 'KNOWLEDGE_EDITOR',
  MARKETPLACE_PUBLISHER = 'MARKETPLACE_PUBLISHER',
  QA_ANALYST = 'QA_ANALYST',
  DEVOPS_ENGINEER = 'DEVOPS_ENGINEER',
  AUDITOR = 'AUDITOR',
}

export interface User {
  id: string;
  tenantId: string;
  email: string;
  name: string;
  role: UserRole;
  isActive: boolean;
  lastLoginAt: string | null;
  createdAt: string;
  updatedAt: string;
}

export interface AuthTokens {
  accessToken: string;
  refreshToken: string;
  expiresIn: number;
}

export interface LoginRequest {
  email: string;
  password: string;
}

export interface TokenPayload {
  userId: string;
  tenantId: string;
  role: UserRole;
  iat: number;
  exp: number;
}
