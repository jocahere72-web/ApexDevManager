import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 025 - Create issues and issue_sequences tables.
 *
 * Issues track work items tied to clients, with auto-generated codes
 * (e.g. "BN-001") derived from the client code and a per-client sequence.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  // ── Issue sequences helper table ────────────────────────────────────────────
  pgm.createTable('issue_sequences', {
    tenant_id: {
      type: 'uuid',
      notNull: true,
      references: 'tenants(id)',
      onDelete: 'CASCADE',
    },
    client_id: {
      type: 'uuid',
      notNull: true,
      references: 'clients(id)',
      onDelete: 'CASCADE',
    },
    last_seq: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
  });

  pgm.addConstraint('issue_sequences', 'issue_sequences_pkey', {
    primaryKey: ['tenant_id', 'client_id'],
  });

  pgm.sql('ALTER TABLE issue_sequences ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON issue_sequences
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // ── Issues table ────────────────────────────────────────────────────────────
  pgm.createTable('issues', {
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
    client_id: {
      type: 'uuid',
      notNull: true,
      references: 'clients(id)',
      onDelete: 'CASCADE',
    },
    code: {
      type: 'varchar(20)',
      notNull: true,
    },
    title: {
      type: 'varchar(300)',
      notNull: true,
    },
    description: {
      type: 'text',
    },
    priority: {
      type: 'varchar(10)',
      notNull: true,
      default: "'medium'",
      check: "priority IN ('low','medium','high','critical')",
    },
    type: {
      type: 'varchar(20)',
      notNull: true,
      default: "'feature'",
      check: "type IN ('feature','bug','enhancement','task')",
    },
    status: {
      type: 'varchar(10)',
      notNull: true,
      default: "'intake'",
      check: "status IN ('intake','prd','design','build','review','test','deploy','done')",
    },
    connection_id: {
      type: 'uuid',
      references: 'connections(id)',
      onDelete: 'SET NULL',
    },
    app_id: {
      type: 'integer',
    },
    prd_session_id: {
      type: 'uuid',
      references: 'prd_sessions(id)',
      onDelete: 'SET NULL',
    },
    change_set_id: {
      type: 'uuid',
      references: 'change_sets(id)',
      onDelete: 'SET NULL',
    },
    release_id: {
      type: 'uuid',
      references: 'releases(id)',
      onDelete: 'SET NULL',
    },
    test_suite_id: {
      type: 'uuid',
    },
    assigned_to: {
      type: 'uuid',
      references: 'users(id)',
      onDelete: 'SET NULL',
    },
    requested_by: {
      type: 'varchar(200)',
    },
    tags: {
      type: 'text[]',
      notNull: true,
      default: "'{}'",
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
    updated_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('NOW()'),
    },
  });

  // Unique constraint: one code per tenant
  pgm.addConstraint('issues', 'issues_tenant_code_unique', {
    unique: ['tenant_id', 'code'],
  });

  // Enable RLS
  pgm.sql('ALTER TABLE issues ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON issues
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('issues', ['tenant_id', 'client_id']);
  pgm.createIndex('issues', ['tenant_id', 'status']);
  pgm.createIndex('issues', 'assigned_to', { where: 'assigned_to IS NOT NULL' });

  // updated_at trigger
  pgm.sql(`
    CREATE TRIGGER set_issues_updated_at
      BEFORE UPDATE ON issues
      FOR EACH ROW
      EXECUTE FUNCTION set_updated_at();
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP TRIGGER IF EXISTS set_issues_updated_at ON issues');
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON issues');
  pgm.dropTable('issues');
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON issue_sequences');
  pgm.dropTable('issue_sequences');
}
