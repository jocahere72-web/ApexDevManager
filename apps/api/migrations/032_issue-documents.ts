import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 032 - Store requirement documents attached to issues.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('issue_documents', {
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
    issue_id: {
      type: 'uuid',
      notNull: true,
      references: 'issues(id)',
      onDelete: 'CASCADE',
    },
    filename: {
      type: 'varchar(255)',
      notNull: true,
    },
    mime_type: {
      type: 'varchar(120)',
      notNull: true,
      default: "'application/octet-stream'",
    },
    file_size: {
      type: 'integer',
      notNull: true,
    },
    content: {
      type: 'bytea',
      notNull: true,
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

  pgm.createIndex('issue_documents', ['tenant_id', 'issue_id'], {
    name: 'idx_issue_documents_tenant_issue',
  });

  pgm.sql('ALTER TABLE issue_documents ENABLE ROW LEVEL SECURITY');
  pgm.sql(`
    CREATE POLICY tenant_isolation ON issue_documents
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON issue_documents');
  pgm.dropTable('issue_documents');
}
