import { pool } from '../../config/database.js';
import { redis } from '../../config/redis.js';
import { logger } from '../../lib/logger.js';
import { AuthenticationError, NotFoundError } from '../../lib/errors.js';
import type { AuthUser, LoginResult, Role, UserProfile } from './auth.types.js';
import { checkLockout, incrementFailedAttempts, resetFailedAttempts, verifyPassword } from './password.service.js';
import { generateTokenPair, rotateRefreshToken, InvalidRefreshTokenError } from './token.service.js';

const SESSION_TTL_SECONDS = 7 * 24 * 60 * 60; // 7 days

// ── Helpers ──────────────────────────────────────────────────────────────────

function toUserProfile(user: AuthUser): UserProfile {
  return {
    id: user.id,
    email: user.email,
    displayName: user.displayName,
    tenantId: user.tenantId,
    roles: user.roles,
    isActive: user.isActive,
    createdAt: user.createdAt,
    updatedAt: user.updatedAt,
  };
}

function sessionKey(userId: string, tenantId: string): string {
  return `session:${tenantId}:${userId}`;
}

async function writeAuditLog(
  action: string,
  userId: string,
  tenantId: string,
  meta?: Record<string, unknown>,
): Promise<void> {
  try {
    await pool.query(
      `INSERT INTO audit_logs (id, action, user_id, tenant_id, meta, created_at)
       VALUES (gen_random_uuid(), $1, $2, $3, $4, NOW())`,
      [action, userId, tenantId, meta ? JSON.stringify(meta) : null],
    );
  } catch (err) {
    // Audit log failure should not block the operation
    logger.error({ err, action, userId }, 'Failed to write audit log');
  }
}

// ── Login ────────────────────────────────────────────────────────────────────

export async function login(email: string, password: string, tenantId: string): Promise<LoginResult> {
  // Find user by email and tenant
  const result = await pool.query<{
    id: string;
    email: string;
    display_name: string;
    password_hash: string;
    tenant_id: string;
    roles: Role[];
    is_active: boolean;
    failed_attempts: number;
    locked_until: Date | null;
    created_at: Date;
    updated_at: Date;
  }>(
    `SELECT id, email, display_name, password_hash, tenant_id, roles,
            is_active, failed_attempts, locked_until, created_at, updated_at
     FROM users
     WHERE email = $1 AND tenant_id = $2`,
    [email, tenantId],
  );

  if (result.rows.length === 0) {
    throw new AuthenticationError('Invalid email or password');
  }

  const row = result.rows[0];

  if (!row.is_active) {
    throw new AuthenticationError('Account is disabled');
  }

  const user: AuthUser = {
    id: row.id,
    email: row.email,
    displayName: row.display_name,
    passwordHash: row.password_hash,
    tenantId: row.tenant_id,
    roles: row.roles,
    isActive: row.is_active,
    failedAttempts: row.failed_attempts,
    lockedUntil: row.locked_until,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };

  // Check lockout
  const lockout = await checkLockout(user.id);
  if (lockout.isLocked) {
    throw new AuthenticationError(
      `Account is locked. Try again after ${lockout.lockedUntil?.toISOString() ?? 'some time'}`,
    );
  }

  // Verify password
  const passwordValid = await verifyPassword(password, user.passwordHash);
  if (!passwordValid) {
    await incrementFailedAttempts(user.id);
    await writeAuditLog('LOGIN_FAILED', user.id, tenantId, { reason: 'invalid_password' });
    throw new AuthenticationError('Invalid email or password');
  }

  // Success: reset failed attempts
  await resetFailedAttempts(user.id);

  // Generate tokens
  const tokenPair = await generateTokenPair(user.id, user.tenantId, user.roles);

  // Create Redis session
  const sessionData = JSON.stringify({
    userId: user.id,
    tenantId: user.tenantId,
    roles: user.roles,
    familyId: tokenPair.familyId,
    createdAt: new Date().toISOString(),
  });

  await redis.set(sessionKey(user.id, user.tenantId), sessionData, 'EX', SESSION_TTL_SECONDS);

  // Audit log
  await writeAuditLog('LOGIN_SUCCESS', user.id, tenantId);

  return {
    user: toUserProfile(user),
    tokens: {
      accessToken: tokenPair.accessToken,
      refreshToken: tokenPair.refreshToken,
      expiresIn: tokenPair.expiresIn,
    },
  };
}

// ── Refresh ──────────────────────────────────────────────────────────────────

export async function refresh(
  rawRefreshToken: string,
  tenantId: string,
): Promise<{ accessToken: string; refreshToken: string; expiresIn: number }> {
  try {
    const result = await rotateRefreshToken(rawRefreshToken, tenantId);
    return {
      accessToken: result.accessToken,
      refreshToken: result.refreshToken,
      expiresIn: result.expiresIn,
    };
  } catch (err) {
    if (err instanceof InvalidRefreshTokenError) {
      throw new AuthenticationError(err.message);
    }
    throw err;
  }
}

// ── Logout ───────────────────────────────────────────────────────────────────

export async function logout(userId: string, tenantId: string): Promise<void> {
  // Remove Redis session
  await redis.del(sessionKey(userId, tenantId));

  // Audit log
  await writeAuditLog('LOGOUT', userId, tenantId);

  logger.info({ userId, tenantId }, 'User logged out');
}

// ── Get Me ───────────────────────────────────────────────────────────────────

export async function getMe(userId: string, tenantId: string): Promise<UserProfile> {
  const result = await pool.query<{
    id: string;
    email: string;
    display_name: string;
    tenant_id: string;
    roles: Role[];
    is_active: boolean;
    created_at: Date;
    updated_at: Date;
  }>(
    `SELECT id, email, display_name, tenant_id, roles, is_active, created_at, updated_at
     FROM users
     WHERE id = $1 AND tenant_id = $2`,
    [userId, tenantId],
  );

  if (result.rows.length === 0) {
    throw new NotFoundError('User not found');
  }

  const row = result.rows[0];

  return {
    id: row.id,
    email: row.email,
    displayName: row.display_name,
    tenantId: row.tenant_id,
    roles: row.roles,
    isActive: row.is_active,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}
