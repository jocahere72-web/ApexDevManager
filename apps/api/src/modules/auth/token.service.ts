import crypto from 'node:crypto';
import jwt from 'jsonwebtoken';
import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import type { JwtPayload, Role, TokenPair } from './auth.types.js';

// ── Configuration ────────────────────────────────────────────────────────────

const JWT_PRIVATE_KEY = process.env.JWT_PRIVATE_KEY ?? null;
const JWT_PUBLIC_KEY = process.env.JWT_PUBLIC_KEY ?? null;
const JWT_SECRET = process.env.JWT_SECRET;
if (!JWT_SECRET && !process.env.JWT_PRIVATE_KEY) {
  throw new Error('JWT_SECRET or JWT_PRIVATE_KEY/JWT_PUBLIC_KEY must be configured');
}
const ACCESS_TOKEN_EXPIRY = process.env.JWT_EXPIRES_IN || '24h';
const ACCESS_TOKEN_EXPIRY_SECONDS = ACCESS_TOKEN_EXPIRY.endsWith('h')
  ? parseInt(ACCESS_TOKEN_EXPIRY) * 3600
  : ACCESS_TOKEN_EXPIRY.endsWith('d')
    ? parseInt(ACCESS_TOKEN_EXPIRY) * 86400
    : parseInt(ACCESS_TOKEN_EXPIRY) * 60; // default minutes
const REFRESH_TOKEN_EXPIRY_DAYS = 7;

/** Determine signing configuration: prefer RS256 with PEM keys, fallback to HS256. */
function getSigningConfig(): { algorithm: jwt.Algorithm; secret: jwt.Secret } {
  if (JWT_PRIVATE_KEY) {
    return { algorithm: 'RS256', secret: JWT_PRIVATE_KEY };
  }
  return { algorithm: 'HS256', secret: JWT_SECRET! };
}

function getVerifyConfig(): { algorithms: jwt.Algorithm[]; secret: jwt.Secret | jwt.GetPublicKeyOrSecret } {
  if (JWT_PUBLIC_KEY) {
    return { algorithms: ['RS256'], secret: JWT_PUBLIC_KEY };
  }
  if (JWT_PRIVATE_KEY) {
    // RS256 with private key can still verify (contains public component)
    return { algorithms: ['RS256'], secret: JWT_PRIVATE_KEY };
  }
  return { algorithms: ['HS256'], secret: JWT_SECRET! };
}

// ── Access Token ─────────────────────────────────────────────────────────────

/**
 * Generate a signed JWT access token.
 * Uses RS256 with PEM keys when JWT_PRIVATE_KEY is set, HS256 with JWT_SECRET otherwise.
 */
export function generateAccessToken(userId: string, tenantId: string, roles: Role[]): string {
  const { algorithm, secret } = getSigningConfig();

  const payload: Omit<JwtPayload, 'iat' | 'exp'> = {
    sub: userId,
    tenantId,
    roles,
  };

  return jwt.sign(payload, secret, {
    algorithm,
    expiresIn: ACCESS_TOKEN_EXPIRY,
    jwtid: crypto.randomUUID(),
  });
}

/**
 * Verify and decode a JWT access token.
 * Returns the decoded payload or throws on invalid/expired tokens.
 */
export function verifyAccessToken(token: string): JwtPayload {
  const { algorithms, secret } = getVerifyConfig();

  const decoded = jwt.verify(token, secret, { algorithms }) as unknown as JwtPayload;
  return decoded;
}

// ── Refresh Token ────────────────────────────────────────────────────────────

/**
 * Hash a raw refresh token using SHA-256 for storage.
 */
function hashToken(token: string): string {
  return crypto.createHash('sha256').update(token).digest('hex');
}

/**
 * Generate a new refresh token.
 * Stores a SHA-256 hash in the database and returns the raw token to the client.
 * If familyId is not provided, a new family is created.
 */
export async function generateRefreshToken(
  userId: string,
  tenantId: string,
  familyId?: string,
): Promise<{ rawToken: string; familyId: string }> {
  const rawToken = crypto.randomBytes(32).toString('hex');
  const tokenHash = hashToken(rawToken);
  const id = crypto.randomUUID();
  const resolvedFamilyId = familyId ?? crypto.randomUUID();
  const expiresAt = new Date(Date.now() + REFRESH_TOKEN_EXPIRY_DAYS * 24 * 60 * 60 * 1000);

  await pool.query(
    `INSERT INTO refresh_tokens (id, token_hash, user_id, tenant_id, family_id, is_used, expires_at, created_at)
     VALUES ($1, $2, $3, $4, $5, FALSE, $6, NOW())`,
    [id, tokenHash, userId, tenantId, resolvedFamilyId, expiresAt],
  );

  return { rawToken, familyId: resolvedFamilyId };
}

/**
 * Generate both access and refresh tokens as a pair.
 */
export async function generateTokenPair(
  userId: string,
  tenantId: string,
  roles: Role[],
  familyId?: string,
): Promise<TokenPair & { familyId: string }> {
  const accessToken = generateAccessToken(userId, tenantId, roles);
  const { rawToken, familyId: resolvedFamilyId } = await generateRefreshToken(userId, tenantId, familyId);

  return {
    accessToken,
    refreshToken: rawToken,
    expiresIn: ACCESS_TOKEN_EXPIRY_SECONDS,
    familyId: resolvedFamilyId,
  };
}

/**
 * Rotate a refresh token.
 *
 * 1. Look up the token by its SHA-256 hash.
 * 2. If the token has already been used, this indicates token theft (reuse detection).
 *    Invalidate the entire token family.
 * 3. If the token is valid and unused, mark it as used and issue a new token in the same family.
 */
export async function rotateRefreshToken(
  rawToken: string,
  tenantId: string,
): Promise<{
  accessToken: string;
  refreshToken: string;
  expiresIn: number;
  userId: string;
  roles: Role[];
}> {
  const tokenHash = hashToken(rawToken);

  // Find the token record
  const result = await pool.query<{
    id: string;
    user_id: string;
    tenant_id: string;
    family_id: string;
    is_used: boolean;
    expires_at: Date;
  }>(
    `SELECT id, user_id, tenant_id, family_id, is_used, expires_at
     FROM refresh_tokens
     WHERE token_hash = $1 AND tenant_id = $2`,
    [tokenHash, tenantId],
  );

  if (result.rows.length === 0) {
    throw new InvalidRefreshTokenError('Refresh token not found');
  }

  const record = result.rows[0];

  // Reuse detection: if already used, someone may have stolen the token
  if (record.is_used) {
    logger.warn(
      { userId: record.user_id, familyId: record.family_id },
      'Refresh token reuse detected — invalidating entire token family',
    );
    await invalidateFamily(record.family_id);
    throw new InvalidRefreshTokenError('Refresh token has already been used (possible token theft)');
  }

  // Check expiration
  if (record.expires_at < new Date()) {
    throw new InvalidRefreshTokenError('Refresh token has expired');
  }

  // Mark current token as used
  await pool.query(
    `UPDATE refresh_tokens
     SET is_used = TRUE, used_at = NOW()
     WHERE id = $1`,
    [record.id],
  );

  // Fetch user roles for the new access token
  const userResult = await pool.query<{ roles: Role[] }>(
    'SELECT roles FROM users WHERE id = $1 AND tenant_id = $2 AND is_active = TRUE',
    [record.user_id, record.tenant_id],
  );

  if (userResult.rows.length === 0) {
    await invalidateFamily(record.family_id);
    throw new InvalidRefreshTokenError('User not found or inactive');
  }

  const { roles } = userResult.rows[0];

  // Generate new token pair in the same family
  const { rawToken: newRawToken } = await generateRefreshToken(
    record.user_id,
    record.tenant_id,
    record.family_id,
  );

  // Update old token to point to replacement
  await pool.query(
    `UPDATE refresh_tokens
     SET replaced_by = (
       SELECT id FROM refresh_tokens
       WHERE family_id = $1 AND is_used = FALSE
       ORDER BY created_at DESC
       LIMIT 1
     )
     WHERE id = $2`,
    [record.family_id, record.id],
  );

  const accessToken = generateAccessToken(record.user_id, record.tenant_id, roles);

  return {
    accessToken,
    refreshToken: newRawToken,
    expiresIn: ACCESS_TOKEN_EXPIRY_SECONDS,
    userId: record.user_id,
    roles,
  };
}

/**
 * Invalidate an entire refresh token family.
 * Used when token reuse is detected (possible theft).
 */
export async function invalidateFamily(familyId: string): Promise<void> {
  const result = await pool.query(
    `UPDATE refresh_tokens
     SET is_used = TRUE, used_at = NOW()
     WHERE family_id = $1 AND is_used = FALSE`,
    [familyId],
  );

  logger.info(
    { familyId, invalidatedCount: result.rowCount },
    'Invalidated refresh token family',
  );
}

/**
 * Delete all expired refresh tokens from the database.
 * Should be called periodically (e.g. via cron) to keep the table clean.
 */
export async function cleanupExpiredTokens(): Promise<number> {
  const result = await pool.query(
    `DELETE FROM refresh_tokens WHERE expires_at < NOW()`,
  );

  const count = result.rowCount ?? 0;
  if (count > 0) {
    logger.info({ deletedCount: count }, 'Cleaned up expired refresh tokens');
  }

  return count;
}

// ── Error class ──────────────────────────────────────────────────────────────

export class InvalidRefreshTokenError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'InvalidRefreshTokenError';
    Error.captureStackTrace(this, this.constructor);
  }
}
