import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 018 - Create prd_sections table.
 *
 * Stores individual PRD sections with versioning, enabling AI-generated
 * content and user edits with full version history.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('prd_sections', {
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
    section_number: {
      type: 'integer',
      notNull: true,
    },
    title: {
      type: 'varchar(300)',
      notNull: true,
    },
    content: {
      type: 'text',
      notNull: true,
    },
    version: {
      type: 'integer',
      notNull: true,
      default: 1,
    },
    is_current: {
      type: 'boolean',
      notNull: true,
      default: true,
    },
    generated_by: {
      type: 'varchar(20)',
      notNull: true,
      default: "'ai'",
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('NOW()'),
    },
  });

  // Unique constraint for section versioning
  pgm.addConstraint('prd_sections', 'uq_prd_sections_session_number_version', {
    unique: ['session_id', 'section_number', 'version'],
  });

  // Enable RLS
  pgm.sql('ALTER TABLE prd_sections ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON prd_sections
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('prd_sections', 'session_id');
  pgm.createIndex('prd_sections', ['session_id', 'is_current'], {
    where: 'is_current = true',
  });
  pgm.createIndex('prd_sections', ['tenant_id', 'session_id']);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON prd_sections');
  pgm.dropTable('prd_sections');
}
