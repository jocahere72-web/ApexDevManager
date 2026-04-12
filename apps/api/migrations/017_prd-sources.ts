import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 017 - Create prd_sources table.
 *
 * Stores uploaded source documents (PDF, DOCX, etc.) for PRD extraction,
 * including parsed text and chunking metadata.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('prd_sources', {
    id: {
      type: 'uuid',
      primaryKey: true,
      default: pgm.func('gen_random_uuid()'),
    },
    session_id: {
      type: 'uuid',
      notNull: true,
      references: 'prd_sessions(id)',
      onDelete: 'CASCADE',
    },
    tenant_id: {
      type: 'uuid',
      notNull: true,
      references: 'tenants(id)',
      onDelete: 'CASCADE',
    },
    filename: {
      type: 'varchar(500)',
      notNull: true,
    },
    mime_type: {
      type: 'varchar(100)',
      notNull: true,
    },
    file_size: {
      type: 'integer',
      notNull: true,
    },
    storage_key: {
      type: 'varchar(1000)',
      notNull: true,
    },
    parsed_text: {
      type: 'text',
    },
    chunk_count: {
      type: 'integer',
      default: 0,
    },
    parse_status: {
      type: 'varchar(20)',
      notNull: true,
      default: "'pending'",
      check: "parse_status IN ('pending', 'parsing', 'parsed', 'error')",
    },
    parse_error: {
      type: 'text',
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('NOW()'),
    },
  });

  // Enable RLS
  pgm.sql('ALTER TABLE prd_sources ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON prd_sources
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('prd_sources', 'session_id');
  pgm.createIndex('prd_sources', ['tenant_id', 'session_id']);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON prd_sources');
  pgm.dropTable('prd_sources');
}
