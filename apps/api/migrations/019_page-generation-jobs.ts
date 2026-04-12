import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 019 - Create page_generation_jobs table.
 *
 * Tracks PRD-to-Page generation jobs including input, status,
 * generated page definitions, and application results.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('page_generation_jobs', {
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
    prd_session_id: {
      type: 'uuid',
      references: 'prd_sessions(id)',
      onDelete: 'SET NULL',
    },
    connection_id: {
      type: 'uuid',
    },
    app_id: {
      type: 'integer',
    },
    input_type: {
      type: 'varchar(20)',
      notNull: true,
      check: "input_type IN ('prd_section', 'freeform', 'requirements')",
    },
    input_content: {
      type: 'text',
      notNull: true,
    },
    status: {
      type: 'varchar(20)',
      notNull: true,
      default: "'pending'",
      check: "status IN ('pending', 'generating', 'preview', 'applying', 'applied', 'error')",
    },
    page_definition: {
      type: 'jsonb',
    },
    applied_page_id: {
      type: 'integer',
    },
    error_message: {
      type: 'text',
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
  });

  // Enable RLS
  pgm.sql('ALTER TABLE page_generation_jobs ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON page_generation_jobs
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('page_generation_jobs', ['tenant_id', 'created_at']);
  pgm.createIndex('page_generation_jobs', ['tenant_id', 'status']);
  pgm.createIndex('page_generation_jobs', 'prd_session_id', {
    where: 'prd_session_id IS NOT NULL',
  });
  pgm.createIndex('page_generation_jobs', 'created_by');
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON page_generation_jobs');
  pgm.dropTable('page_generation_jobs');
}
