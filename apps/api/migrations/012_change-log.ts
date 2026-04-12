import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 012 - Create change_log table.
 *
 * Immutable append-only log of every code change applied through the editor.
 * INSERT-only RLS policy prevents modification or deletion by tenants.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  // ── Table ─────────────────────────────────────────────────────────────────

  pgm.createTable('change_log', {
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
    component_name: {
      type: 'varchar(255)',
    },
    app_id: {
      type: 'varchar(100)',
    },
    page_id: {
      type: 'integer',
    },
    code_before: {
      type: 'text',
    },
    code_after: {
      type: 'text',
    },
    diff: {
      type: 'text',
    },
    applied_by: {
      type: 'uuid',
      notNull: true,
      references: 'users(id)',
      onDelete: 'SET NULL',
    },
    applied_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('now()'),
    },
    source: {
      type: 'varchar(20)',
      notNull: true,
      default: "'manual'",
    },
    ai_request_id: {
      type: 'uuid',
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('now()'),
    },
  });

  // ── Indexes ─────────────────────────────────────────────────────────────

  pgm.createIndex('change_log', 'tenant_id');
  pgm.createIndex('change_log', ['connection_id', 'component_type', 'component_id']);
  pgm.createIndex('change_log', 'applied_by');
  pgm.createIndex('change_log', 'applied_at');
  pgm.createIndex('change_log', 'ai_request_id', {
    where: 'ai_request_id IS NOT NULL',
  });

  // ── RLS ──────────────────────────────────────────────────────────────────

  pgm.sql(`ALTER TABLE change_log ENABLE ROW LEVEL SECURITY`);

  // Tenant isolation: read-only for the tenant
  pgm.sql(`
    CREATE POLICY change_log_tenant_read ON change_log
      FOR SELECT
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Append-only: tenants can INSERT but never UPDATE or DELETE
  pgm.sql(`
    CREATE POLICY change_log_insert_only ON change_log
      FOR INSERT
      WITH CHECK (tenant_id::text = current_setting('app.current_tenant', true))
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql(`DROP POLICY IF EXISTS change_log_insert_only ON change_log`);
  pgm.sql(`DROP POLICY IF EXISTS change_log_tenant_read ON change_log`);
  pgm.dropTable('change_log');
}
