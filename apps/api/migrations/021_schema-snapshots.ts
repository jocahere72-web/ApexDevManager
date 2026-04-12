import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 021 - Create schema_snapshots table.
 *
 * Stores point-in-time snapshots of database schema metadata for
 * comparison and drift detection.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('schema_snapshots', {
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
    snapshot_data: {
      type: 'jsonb',
      notNull: true,
      default: "'{}'::jsonb",
    },
    tables_count: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    views_count: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    indexes_count: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    created_by: {
      type: 'uuid',
      references: 'users(id)',
      onDelete: 'SET NULL',
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('NOW()'),
    },
  });

  // Enable RLS
  pgm.sql('ALTER TABLE schema_snapshots ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON schema_snapshots
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('schema_snapshots', ['tenant_id', 'connection_id']);
  pgm.createIndex('schema_snapshots', ['tenant_id', 'created_at']);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON schema_snapshots');
  pgm.dropTable('schema_snapshots');
}
