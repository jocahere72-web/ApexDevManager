import crypto from 'node:crypto';
import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ConflictError, ValidationError } from '../../lib/errors.js';
import type { CreateUserInput, UpdateUserInput, ListUsersQuery } from './users.validation.js';
import type { UserProfile } from '../auth/auth.types.js';

// ── Password Hashing ────────────────────────────────────────────────────────
const SALT_LENGTH = 32;
const KEY_LENGTH = 64;
const SCRYPT_COST = 16384;
const BLOCK_SIZE = 8;
const PARALLELISM = 1;

async function hashPassword(password: string): Promise<string> {
  return new Promise((resolve, reject) => {
    const salt = crypto.randomBytes(SALT_LENGTH);
    crypto.scrypt(
      password,
      salt,
      KEY_LENGTH,
      { N: SCRYPT_COST, r: BLOCK_SIZE, p: PARALLELISM },
      (err, derivedKey) => {
        if (err) return reject(err);
        const params = `${SCRYPT_COST}:${BLOCK_SIZE}:${PARALLELISM}`;
        resolve(`scrypt:${params}:${salt.toString('hex')}:${derivedKey.toString('hex')}`);
      },
    );
  });
}

// ── Audit Logging ────────────────────────────────────────────────────────────
async function logAudit(
  tenantId: string,
  actorId: string,
  action: string,
  targetId: string,
  details?: Record<string, unknown>,
): Promise<void> {
  try {
    await pool.query(
      `INSERT INTO audit_logs (tenant_id, actor_id, action, target_type, target_id, details, created_at)
       VALUES ($1, $2, $3, 'user', $4, $5, NOW())`,
      [tenantId, actorId, action, targetId, details ? JSON.stringify(details) : null],
    );
  } catch (err) {
    logger.error({ err, tenantId, actorId, action, targetId }, 'Failed to write audit log');
  }
}

// ── Row to Profile ───────────────────────────────────────────────────────────
function rowToProfile(row: Record<string, unknown>): UserProfile {
  return {
    id: row.id as string,
    email: row.email as string,
    displayName: row.display_name as string,
    tenantId: row.tenant_id as string,
    roles: row.roles as string[],
    isActive: row.is_active as boolean,
    createdAt: row.created_at as Date,
    updatedAt: row.updated_at as Date,
  };
}

// ── Create User ──────────────────────────────────────────────────────────────
export async function createUser(
  tenantId: string,
  data: CreateUserInput,
  actorId: string,
): Promise<UserProfile> {
  // Check for duplicate email within the tenant
  const existing = await pool.query(
    `SELECT id FROM users WHERE tenant_id = $1 AND email = $2 AND deleted_at IS NULL`,
    [tenantId, data.email],
  );

  if (existing.rowCount && existing.rowCount > 0) {
    throw new ConflictError('A user with this email already exists');
  }

  const passwordHash = await hashPassword(data.password);

  const result = await pool.query(
    `INSERT INTO users (tenant_id, email, display_name, password_hash, roles, is_active, created_at, updated_at)
     VALUES ($1, $2, $3, $4, $5, true, NOW(), NOW())
     RETURNING id, tenant_id, email, display_name, roles, is_active, created_at, updated_at`,
    [tenantId, data.email, data.displayName, passwordHash, data.roles],
  );

  const user = rowToProfile(result.rows[0]);

  await logAudit(tenantId, actorId, 'user.created', user.id, {
    email: data.email,
    roles: data.roles,
  });

  logger.info({ tenantId, userId: user.id, email: data.email }, 'User created');

  return user;
}

// ── List Users ───────────────────────────────────────────────────────────────
export async function listUsers(
  tenantId: string,
  query: ListUsersQuery,
): Promise<{ users: UserProfile[]; total: number }> {
  const conditions: string[] = ['tenant_id = $1', 'deleted_at IS NULL'];
  const params: unknown[] = [tenantId];
  let paramIndex = 2;

  if (query.search) {
    conditions.push(`(email ILIKE $${paramIndex} OR display_name ILIKE $${paramIndex})`);
    params.push(`%${query.search}%`);
    paramIndex++;
  }

  if (query.role) {
    conditions.push(`$${paramIndex} = ANY(roles)`);
    params.push(query.role);
    paramIndex++;
  }

  if (query.isActive !== undefined) {
    conditions.push(`is_active = $${paramIndex}`);
    params.push(query.isActive);
    paramIndex++;
  }

  const whereClause = conditions.join(' AND ');
  const offset = (query.page - 1) * query.limit;

  const [dataResult, countResult] = await Promise.all([
    pool.query(
      `SELECT id, tenant_id, email, display_name, roles, is_active, created_at, updated_at
       FROM users
       WHERE ${whereClause}
       ORDER BY created_at DESC
       LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`,
      [...params, query.limit, offset],
    ),
    pool.query(`SELECT COUNT(*)::int AS total FROM users WHERE ${whereClause}`, params),
  ]);

  return {
    users: dataResult.rows.map(rowToProfile),
    total: countResult.rows[0].total as number,
  };
}

// ── Get User By ID ───────────────────────────────────────────────────────────
export async function getUserById(tenantId: string, id: string): Promise<UserProfile> {
  const result = await pool.query(
    `SELECT id, tenant_id, email, display_name, roles, is_active, created_at, updated_at
     FROM users
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('User not found');
  }

  return rowToProfile(result.rows[0]);
}

// ── Update User ──────────────────────────────────────────────────────────────
export async function updateUser(
  tenantId: string,
  id: string,
  data: UpdateUserInput,
  actorId: string,
): Promise<UserProfile> {
  // Last-admin guard: prevent removing admin role if this is the last admin
  if (data.roles && !data.roles.includes('admin')) {
    const currentUser = await pool.query(
      `SELECT roles FROM users WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL`,
      [tenantId, id],
    );

    if (currentUser.rowCount === 0) {
      throw new NotFoundError('User not found');
    }

    const currentRoles = currentUser.rows[0].roles as string[];
    if (currentRoles.includes('admin')) {
      const adminCount = await pool.query(
        `SELECT COUNT(*)::int AS count FROM users
         WHERE tenant_id = $1 AND 'admin' = ANY(roles) AND is_active = true AND deleted_at IS NULL`,
        [tenantId],
      );

      if (adminCount.rows[0].count <= 1) {
        throw new ValidationError('Cannot remove admin role from the last active admin');
      }
    }
  }

  // Last-admin guard: prevent deactivating last admin
  if (data.isActive === false) {
    const currentUser = await pool.query(
      `SELECT roles FROM users WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL`,
      [tenantId, id],
    );

    if (currentUser.rowCount === 0) {
      throw new NotFoundError('User not found');
    }

    const currentRoles = currentUser.rows[0].roles as string[];
    if (currentRoles.includes('admin')) {
      const adminCount = await pool.query(
        `SELECT COUNT(*)::int AS count FROM users
         WHERE tenant_id = $1 AND 'admin' = ANY(roles) AND is_active = true AND deleted_at IS NULL`,
        [tenantId],
      );

      if (adminCount.rows[0].count <= 1) {
        throw new ValidationError('Cannot deactivate the last active admin');
      }
    }
  }

  const setClauses: string[] = ['updated_at = NOW()'];
  const params: unknown[] = [tenantId, id];
  let paramIndex = 3;

  if (data.displayName !== undefined) {
    setClauses.push(`display_name = $${paramIndex}`);
    params.push(data.displayName);
    paramIndex++;
  }

  if (data.roles !== undefined) {
    setClauses.push(`roles = $${paramIndex}`);
    params.push(data.roles);
    paramIndex++;
  }

  if (data.isActive !== undefined) {
    setClauses.push(`is_active = $${paramIndex}`);
    params.push(data.isActive);
    paramIndex++;
  }

  const result = await pool.query(
    `UPDATE users SET ${setClauses.join(', ')}
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL
     RETURNING id, tenant_id, email, display_name, roles, is_active, created_at, updated_at`,
    params,
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('User not found');
  }

  const user = rowToProfile(result.rows[0]);

  await logAudit(tenantId, actorId, 'user.updated', id, data as Record<string, unknown>);

  logger.info({ tenantId, userId: id }, 'User updated');

  return user;
}

// ── Soft Delete User ─────────────────────────────────────────────────────────
export async function softDeleteUser(
  tenantId: string,
  id: string,
  actorId: string,
): Promise<void> {
  const result = await pool.query(
    `UPDATE users SET deleted_at = NOW(), updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL
     RETURNING id`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('User not found');
  }

  await logAudit(tenantId, actorId, 'user.deleted', id);

  logger.info({ tenantId, userId: id }, 'User soft-deleted');
}

// ── Unlock User ──────────────────────────────────────────────────────────────
export async function unlockUser(
  tenantId: string,
  id: string,
  actorId: string,
): Promise<void> {
  const result = await pool.query(
    `UPDATE users SET failed_attempts = 0, locked_until = NULL, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL
     RETURNING id`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('User not found');
  }

  await logAudit(tenantId, actorId, 'user.unlocked', id);

  logger.info({ tenantId, userId: id }, 'User account unlocked');
}
