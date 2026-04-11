import bcrypt from 'bcrypt';
import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import type { LockoutStatus } from './auth.types.js';

const BCRYPT_ROUNDS = 12;
const MAX_FAILED_ATTEMPTS = 5;
const LOCKOUT_DURATION_MINUTES = 15;

/**
 * Hash a plaintext password using bcrypt with 12 rounds.
 */
export async function hashPassword(password: string): Promise<string> {
  return bcrypt.hash(password, BCRYPT_ROUNDS);
}

/**
 * Verify a plaintext password against a bcrypt hash.
 */
export async function verifyPassword(password: string, hash: string): Promise<boolean> {
  return bcrypt.compare(password, hash);
}

/**
 * Check the lockout status for a user by querying failed_attempts and locked_until.
 */
export async function checkLockout(userId: string): Promise<LockoutStatus> {
  const result = await pool.query<{ failed_attempts: number; locked_until: Date | null }>(
    'SELECT failed_attempts, locked_until FROM users WHERE id = $1',
    [userId],
  );

  if (result.rows.length === 0) {
    return {
      isLocked: false,
      failedAttempts: 0,
      lockedUntil: null,
      attemptsRemaining: MAX_FAILED_ATTEMPTS,
    };
  }

  const { failed_attempts, locked_until } = result.rows[0];
  const now = new Date();

  // If there is a lockout timestamp and it has not passed yet, the account is locked
  const isLocked = locked_until !== null && locked_until > now;

  // If the lockout period has expired, the attempts should be considered reset
  const effectiveAttempts = isLocked ? failed_attempts : (locked_until !== null ? 0 : failed_attempts);
  const attemptsRemaining = Math.max(0, MAX_FAILED_ATTEMPTS - effectiveAttempts);

  return {
    isLocked,
    failedAttempts: effectiveAttempts,
    lockedUntil: isLocked ? locked_until : null,
    attemptsRemaining,
  };
}

/**
 * Increment failed login attempts for a user.
 * Automatically locks the account when MAX_FAILED_ATTEMPTS is reached.
 */
export async function incrementFailedAttempts(userId: string): Promise<LockoutStatus> {
  const result = await pool.query<{ failed_attempts: number; locked_until: Date | null }>(
    `UPDATE users
     SET failed_attempts = failed_attempts + 1,
         updated_at = NOW()
     WHERE id = $1
     RETURNING failed_attempts, locked_until`,
    [userId],
  );

  if (result.rows.length === 0) {
    logger.warn({ userId }, 'Attempted to increment failed attempts for non-existent user');
    return {
      isLocked: false,
      failedAttempts: 0,
      lockedUntil: null,
      attemptsRemaining: MAX_FAILED_ATTEMPTS,
    };
  }

  const { failed_attempts } = result.rows[0];

  // Auto-lock at threshold
  if (failed_attempts >= MAX_FAILED_ATTEMPTS) {
    const lockedUntil = new Date(Date.now() + LOCKOUT_DURATION_MINUTES * 60 * 1000);

    await pool.query(
      `UPDATE users
       SET locked_until = $1, updated_at = NOW()
       WHERE id = $2`,
      [lockedUntil, userId],
    );

    logger.warn(
      { userId, failedAttempts: failed_attempts, lockedUntil },
      'Account locked due to too many failed login attempts',
    );

    return {
      isLocked: true,
      failedAttempts: failed_attempts,
      lockedUntil,
      attemptsRemaining: 0,
    };
  }

  return {
    isLocked: false,
    failedAttempts: failed_attempts,
    lockedUntil: null,
    attemptsRemaining: MAX_FAILED_ATTEMPTS - failed_attempts,
  };
}

/**
 * Reset failed login attempts after a successful login.
 */
export async function resetFailedAttempts(userId: string): Promise<void> {
  await pool.query(
    `UPDATE users
     SET failed_attempts = 0, locked_until = NULL, updated_at = NOW()
     WHERE id = $1`,
    [userId],
  );
}

/**
 * Manually lock a user account for the configured lockout duration.
 */
export async function lockAccount(userId: string): Promise<void> {
  const lockedUntil = new Date(Date.now() + LOCKOUT_DURATION_MINUTES * 60 * 1000);

  await pool.query(
    `UPDATE users
     SET locked_until = $1, updated_at = NOW()
     WHERE id = $2`,
    [lockedUntil, userId],
  );

  logger.info({ userId, lockedUntil }, 'Account manually locked');
}

/**
 * Unlock a user account by clearing the lockout timestamp and resetting failed attempts.
 */
export async function unlockAccount(userId: string): Promise<void> {
  await pool.query(
    `UPDATE users
     SET locked_until = NULL, failed_attempts = 0, updated_at = NOW()
     WHERE id = $1`,
    [userId],
  );

  logger.info({ userId }, 'Account unlocked');
}
