import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 008 - Extend users and refresh_tokens tables for U2 auth features.
 *
 * Users table (003): Add display_name, roles (TEXT[]), and adjust constraints.
 * Refresh tokens table (004): Add replaced_by, is_used columns.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  // ── Users table extensions ───────────────────────────────────────────

  // Add display_name column, back-fill from existing "name" column
  pgm.addColumn('users', {
    display_name: {
      type: 'varchar(100)',
    },
  });

  pgm.sql(`UPDATE users SET display_name = name WHERE display_name IS NULL`);

  pgm.alterColumn('users', 'display_name', { notNull: true });

  // Add roles array column (replaces single-value "role" varchar)
  pgm.addColumn('users', {
    roles: {
      type: 'text[]',
      default: pgm.func(`ARRAY['developer']::text[]`),
    },
  });

  // Back-fill roles from the legacy role column (lower-case to match new enum)
  pgm.sql(`UPDATE users SET roles = ARRAY[LOWER(role)]::text[] WHERE role IS NOT NULL`);

  // Drop the old unique constraint and replace with partial unique index
  // (the original migration used a plain UNIQUE constraint without WHERE)
  pgm.sql(`ALTER TABLE users DROP CONSTRAINT IF EXISTS users_tenant_id_email_unique`);

  pgm.sql(`
    CREATE UNIQUE INDEX users_tenant_email_active_uidx
      ON users (tenant_id, email)
      WHERE deleted_at IS NULL
  `);

  // Drop the legacy single-value role column now that data has been migrated
  pgm.dropColumn('users', 'role');

  // Update RLS policy to use the safer current_setting with missing_ok = true
  pgm.sql(`DROP POLICY IF EXISTS tenant_isolation ON users`);
  pgm.sql(`
    CREATE POLICY tenant_isolation ON users
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // ── Refresh tokens table extensions ──────────────────────────────────

  // Add replaced_by (self-referencing FK for token rotation chain)
  pgm.addColumn('refresh_tokens', {
    replaced_by: {
      type: 'uuid',
    },
  });

  // Add is_used flag (for reuse detection alongside is_revoked)
  pgm.addColumn('refresh_tokens', {
    is_used: {
      type: 'boolean',
      default: false,
    },
  });

  // Add index on family_id for fast family-wide revocation queries
  pgm.createIndex('refresh_tokens', 'family_id');

  // Add composite index on (user_id, tenant_id) for per-user token listing
  pgm.createIndex('refresh_tokens', ['user_id', 'tenant_id']);

  // Update RLS policy to use the safer current_setting with missing_ok = true
  pgm.sql(`DROP POLICY IF EXISTS tenant_isolation ON refresh_tokens`);
  pgm.sql(`
    CREATE POLICY tenant_isolation ON refresh_tokens
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  // ── Revert refresh_tokens ────────────────────────────────────────────

  // Restore original RLS policy
  pgm.sql(`DROP POLICY IF EXISTS tenant_isolation ON refresh_tokens`);
  pgm.sql(`
    CREATE POLICY tenant_isolation ON refresh_tokens
      USING (tenant_id = current_setting('app.current_tenant')::uuid)
  `);

  pgm.dropIndex('refresh_tokens', ['user_id', 'tenant_id']);
  pgm.dropIndex('refresh_tokens', 'family_id');
  pgm.dropColumn('refresh_tokens', 'is_used');
  pgm.dropColumn('refresh_tokens', 'replaced_by');

  // ── Revert users ────────────────────────────────────────────────────

  // Restore original RLS policy
  pgm.sql(`DROP POLICY IF EXISTS tenant_isolation ON users`);
  pgm.sql(`
    CREATE POLICY tenant_isolation ON users
      USING (tenant_id = current_setting('app.current_tenant')::uuid)
  `);

  // Re-add legacy role column
  pgm.addColumn('users', {
    role: {
      type: 'varchar(50)',
      default: "'DEVELOPER'",
    },
  });

  // Back-fill role from roles array
  pgm.sql(`UPDATE users SET role = UPPER(roles[1]) WHERE roles IS NOT NULL AND array_length(roles, 1) > 0`);

  // Drop partial unique index, restore plain unique constraint
  pgm.sql(`DROP INDEX IF EXISTS users_tenant_email_active_uidx`);
  pgm.sql(`ALTER TABLE users ADD CONSTRAINT users_tenant_id_email_unique UNIQUE (tenant_id, email)`);

  // Drop new columns
  pgm.dropColumn('users', 'roles');
  pgm.dropColumn('users', 'display_name');
}
