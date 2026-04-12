import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 020 - Create change_sets table.
 *
 * Tracks grouped schema/object changes through a review-and-apply lifecycle.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('change_sets', {
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
    name: {
      type: 'varchar(255)',
      notNull: true,
    },
    description: {
      type: 'text',
    },
    status: {
      type: 'varchar(20)',
      notNull: true,
      default: "'draft'",
      check: "status IN ('draft','review','approved','applied','rejected')",
    },
    objects: {
      type: 'jsonb',
      notNull: true,
      default: "'[]'::jsonb",
    },
    conflict_count: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    created_by: {
      type: 'uuid',
      references: 'users(id)',
      onDelete: 'SET NULL',
    },
    approved_by: {
      type: 'uuid',
      references: 'users(id)',
      onDelete: 'SET NULL',
    },
    applied_at: {
      type: 'timestamptz',
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
  pgm.sql('ALTER TABLE change_sets ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON change_sets
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('change_sets', ['tenant_id', 'status']);
  pgm.createIndex('change_sets', ['tenant_id', 'connection_id']);
  pgm.createIndex('change_sets', ['tenant_id', 'created_at']);
  pgm.createIndex('change_sets', 'created_by', { where: 'created_by IS NOT NULL' });
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON change_sets');
  pgm.dropTable('change_sets');
}
