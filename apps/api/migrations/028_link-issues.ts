import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 028 - Issue-centric flow.
 *
 * Adds issue_id FK to prd_sessions, change_sets, releases,
 * ai_conversations, and editor_sessions so every artifact can
 * optionally link back to an issue.
 *
 * Creates issue_activities table for a rich activity timeline.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  // ── Add issue_id columns ─────────────────────────────────────────────────
  pgm.sql(`ALTER TABLE prd_sessions ADD COLUMN IF NOT EXISTS issue_id UUID REFERENCES issues(id)`);
  pgm.sql(`ALTER TABLE change_sets ADD COLUMN IF NOT EXISTS issue_id UUID REFERENCES issues(id)`);
  pgm.sql(`ALTER TABLE releases ADD COLUMN IF NOT EXISTS issue_id UUID REFERENCES issues(id)`);
  pgm.sql(`ALTER TABLE ai_conversations ADD COLUMN IF NOT EXISTS issue_id UUID REFERENCES issues(id)`);
  pgm.sql(`ALTER TABLE editor_sessions ADD COLUMN IF NOT EXISTS issue_id UUID REFERENCES issues(id)`);

  // ── Partial indexes ──────────────────────────────────────────────────────
  pgm.sql(`CREATE INDEX IF NOT EXISTS idx_prd_issue ON prd_sessions(issue_id) WHERE issue_id IS NOT NULL`);
  pgm.sql(`CREATE INDEX IF NOT EXISTS idx_cs_issue ON change_sets(issue_id) WHERE issue_id IS NOT NULL`);
  pgm.sql(`CREATE INDEX IF NOT EXISTS idx_rel_issue ON releases(issue_id) WHERE issue_id IS NOT NULL`);
  pgm.sql(`CREATE INDEX IF NOT EXISTS idx_conv_issue ON ai_conversations(issue_id) WHERE issue_id IS NOT NULL`);

  // ── issue_activities table ───────────────────────────────────────────────
  pgm.createTable('issue_activities', {
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
    activity_type: {
      type: 'varchar(50)',
      notNull: true,
      check: "activity_type IN ('status_change','prd_created','prd_exported','change_set_created','release_created','test_created','code_edited','comment','artifact_linked')",
    },
    description: {
      type: 'text',
      notNull: true,
    },
    artifact_type: {
      type: 'varchar(50)',
    },
    artifact_id: {
      type: 'uuid',
    },
    actor_id: {
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

  pgm.createIndex('issue_activities', ['issue_id', 'created_at'], {
    name: 'idx_issue_activities_issue_created',
  });

  // ── RLS ──────────────────────────────────────────────────────────────────
  pgm.sql('ALTER TABLE issue_activities ENABLE ROW LEVEL SECURITY');
  pgm.sql(`
    CREATE POLICY tenant_isolation ON issue_activities
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON issue_activities');
  pgm.dropTable('issue_activities');

  pgm.sql('DROP INDEX IF EXISTS idx_conv_issue');
  pgm.sql('DROP INDEX IF EXISTS idx_rel_issue');
  pgm.sql('DROP INDEX IF EXISTS idx_cs_issue');
  pgm.sql('DROP INDEX IF EXISTS idx_prd_issue');

  pgm.sql('ALTER TABLE editor_sessions DROP COLUMN IF EXISTS issue_id');
  pgm.sql('ALTER TABLE ai_conversations DROP COLUMN IF EXISTS issue_id');
  pgm.sql('ALTER TABLE releases DROP COLUMN IF EXISTS issue_id');
  pgm.sql('ALTER TABLE change_sets DROP COLUMN IF EXISTS issue_id');
  pgm.sql('ALTER TABLE prd_sessions DROP COLUMN IF EXISTS issue_id');
}
