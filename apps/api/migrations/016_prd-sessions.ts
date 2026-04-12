import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 016 - Create prd_sessions table.
 *
 * Stores PRD builder sessions including extraction data, validation results,
 * and export status for the M8 PRD Builder module.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('prd_sessions', {
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
    app_id: {
      type: 'integer',
    },
    title: {
      type: 'varchar(200)',
      notNull: true,
    },
    status: {
      type: 'varchar(20)',
      notNull: true,
      default: "'draft'",
      check: "status IN ('draft', 'uploading', 'extracting', 'generating', 'validating', 'validated', 'exported', 'error')",
    },
    current_stage: {
      type: 'integer',
      notNull: true,
      default: 1,
    },
    extraction_data: {
      type: 'jsonb',
    },
    validation_score: {
      type: 'numeric(5,2)',
    },
    validation_blockers: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    validation_warnings: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    exported_at: {
      type: 'timestamptz',
    },
    created_by: {
      type: 'uuid',
      notNull: true,
      references: 'users(id)',
      onDelete: 'CASCADE',
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
    deleted_at: {
      type: 'timestamptz',
    },
  });

  // Enable RLS
  pgm.sql('ALTER TABLE prd_sessions ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON prd_sessions
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('prd_sessions', ['tenant_id', 'created_at']);
  pgm.createIndex('prd_sessions', ['tenant_id', 'status']);
  pgm.createIndex('prd_sessions', 'created_by');
  pgm.createIndex('prd_sessions', 'app_id', {
    where: 'app_id IS NOT NULL',
  });
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON prd_sessions');
  pgm.dropTable('prd_sessions');
}
