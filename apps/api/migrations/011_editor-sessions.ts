import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 011 - Create editor_sessions table.
 *
 * Tracks active editor sessions with edit-lock support.
 * A partial unique index ensures only one edit session per component at a time.
 * RLS policies scope access to the tenant.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  // ── Table ─────────────────────────────────────────────────────────────────

  pgm.createTable('editor_sessions', {
    id: {
      type: 'uuid',
      primaryKey: true,
      default: pgm.func('gen_random_uuid()'),
    },
    tenant_id: {
      type: 'uuid',
      notNull: true,
      references: 'tenants(id)',
      onDelete: 'CASCADE',
    },
    user_id: {
      type: 'uuid',
      notNull: true,
      references: 'users(id)',
      onDelete: 'CASCADE',
    },
    connection_id: {
      type: 'uuid',
      notNull: true,
      references: 'connections(id)',
      onDelete: 'CASCADE',
    },
    component_type: {
      type: 'varchar(50)',
      notNull: true,
    },
    component_id: {
      type: 'varchar(100)',
      notNull: true,
    },
    mode: {
      type: 'varchar(10)',
      notNull: true,
      check: "mode IN ('view', 'edit')",
    },
    draft_content: {
      type: 'text',
    },
    cursor_line: {
      type: 'integer',
    },
    cursor_column: {
      type: 'integer',
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('now()'),
    },
    last_active_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('now()'),
    },
    expires_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func("now() + interval '30 minutes'"),
    },
  });

  // ── Partial unique index — only one edit session per component ───────────

  pgm.createIndex('editor_sessions', ['connection_id', 'component_type', 'component_id'], {
    unique: true,
    where: "mode = 'edit'",
    name: 'uq_editor_sessions_edit_lock',
  });

  // ── Additional indexes ──────────────────────────────────────────────────

  pgm.createIndex('editor_sessions', 'tenant_id');
  pgm.createIndex('editor_sessions', 'user_id');
  pgm.createIndex('editor_sessions', 'expires_at');

  // ── RLS ──────────────────────────────────────────────────────────────────

  pgm.sql(`ALTER TABLE editor_sessions ENABLE ROW LEVEL SECURITY`);

  pgm.sql(`
    CREATE POLICY editor_sessions_tenant_isolation ON editor_sessions
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql(`DROP POLICY IF EXISTS editor_sessions_tenant_isolation ON editor_sessions`);
  pgm.dropTable('editor_sessions');
}
