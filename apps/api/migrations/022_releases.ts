import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 022 - Create releases table.
 *
 * Tracks release lifecycle from draft through production deployment
 * with pipeline stage tracking and rollback support.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('releases', {
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
    version: {
      type: 'varchar(50)',
      notNull: true,
    },
    status: {
      type: 'varchar(20)',
      notNull: true,
      default: "'draft'",
      check: "status IN ('draft','building','testing','staging','production','rolled_back')",
    },
    pipeline: {
      type: 'jsonb',
      notNull: true,
      default: "'{}'::jsonb",
    },
    change_set_ids: {
      type: 'uuid[]',
      notNull: true,
      default: "'{}'",
    },
    deployed_by: {
      type: 'uuid',
      references: 'users(id)',
      onDelete: 'SET NULL',
    },
    deployed_at: {
      type: 'timestamptz',
    },
    rolled_back_at: {
      type: 'timestamptz',
    },
    rollback_reason: {
      type: 'text',
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('NOW()'),
    },
    updated_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('NOW()'),
    },
  });

  // Enable RLS
  pgm.sql('ALTER TABLE releases ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON releases
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('releases', ['tenant_id', 'status']);
  pgm.createIndex('releases', ['tenant_id', 'connection_id']);
  pgm.createIndex('releases', ['tenant_id', 'created_at']);
  pgm.createIndex('releases', 'version');
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON releases');
  pgm.dropTable('releases');
}
