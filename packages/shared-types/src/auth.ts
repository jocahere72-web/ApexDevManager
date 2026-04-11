/**
 * Authentication and authorization types for APEX Dev Manager.
 */

/** Available user roles within a tenant. */
export type Role =
  | 'admin'
  | 'developer'
  | 'tech_lead'
  | 'release_manager'
  | 'knowledge_editor'
  | 'marketplace_publisher'
  | 'qa_analyst'
  | 'devops_engineer'
  | 'auditor';

/** Payload sent by the client to authenticate. */
export interface LoginRequest {
  email: string;
  password: string;
  tenantSlug: string;
}

/** Successful authentication response. */
export interface AuthResponse {
  accessToken: string;
  refreshToken: string;
  expiresIn: number;
  user: UserProfile;
}

/** Decoded JWT access-token payload. */
export interface TokenPayload {
  userId: string;
  tenantId: string;
  roles: Role[];
  iat: number;
  exp: number;
}

/** Public user profile returned in API responses. */
export interface UserProfile {
  id: string;
  tenantId: string;
  email: string;
  displayName: string;
  roles: Role[];
  isActive: boolean;
  lastLoginAt: string | null;
  createdAt: string;
}

/** Server-side session data stored in the session store. */
export interface SessionData {
  sessionId: string;
  userId: string;
  tenantId: string;
  roles: Role[];
  createdAt: string;
  expiresAt: string;
}
