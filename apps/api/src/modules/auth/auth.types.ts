/**
 * Auth module types.
 *
 * Re-exports shared types and defines internal auth-specific interfaces.
 */

// ── Roles ────────────────────────────────────────────────────────────────────
export const ROLES = [
  'admin', 'ops_lead', 'developer', 'tech_lead', 'release_manager',
  'knowledge_editor', 'marketplace_publisher', 'qa_analyst',
  'dba', 'devops_engineer', 'auditor',
] as const;
export type Role = (typeof ROLES)[number];

// ── JWT Payload ──────────────────────────────────────────────────────────────
export interface JwtPayload {
  sub: string; // userId
  tenantId: string;
  roles: Role[];
  iat?: number;
  exp?: number;
  jti?: string;
}

// ── Refresh Token DB record ──────────────────────────────────────────────────
export interface RefreshTokenRecord {
  id: string;
  tokenHash: string;
  userId: string;
  tenantId: string;
  familyId: string;
  isUsed: boolean;
  usedAt: Date | null;
  expiresAt: Date;
  createdAt: Date;
  replacedBy: string | null;
}

// ── Account Lockout ──────────────────────────────────────────────────────────
export interface LockoutStatus {
  isLocked: boolean;
  failedAttempts: number;
  lockedUntil: Date | null;
  attemptsRemaining: number;
}

// ── User record (DB row subset used by auth) ────────────────────────────────
export interface AuthUser {
  id: string;
  email: string;
  displayName: string;
  passwordHash: string;
  tenantId: string;
  roles: Role[];
  isActive: boolean;
  failedAttempts: number;
  lockedUntil: Date | null;
  createdAt: Date;
  updatedAt: Date;
}

// ── Auth responses ───────────────────────────────────────────────────────────
export interface TokenPair {
  accessToken: string;
  refreshToken: string;
  expiresIn: number; // seconds
}

export interface UserProfile {
  id: string;
  email: string;
  displayName: string;
  tenantId: string;
  roles: Role[];
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
}

export interface LoginResult {
  user: UserProfile;
  tokens: TokenPair;
}
