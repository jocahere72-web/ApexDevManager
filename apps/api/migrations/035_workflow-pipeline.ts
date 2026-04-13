import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 035 - Workflow Pipeline
 *
 * - Expands issue statuses from 8 to 10 (adds draft, validation, prd_approval, docs; removes review, deploy)
 * - Adds AI validation fields to issues
 * - Adds return tracking fields to issues
 * - Creates issue_approvals table for dual-approval gates
 * - Creates issue_return_history table for traceability
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  // 1. Update issues status CHECK constraint ------------------------------
  pgm.sql(`ALTER TABLE issues DROP CONSTRAINT IF EXISTS issues_status_check`);

  // 2. Migrate existing data: review → test, deploy → docs ----------------
  pgm.sql(`UPDATE issues SET status = 'test' WHERE status = 'review'`);
  pgm.sql(`UPDATE issues SET status = 'docs' WHERE status = 'deploy'`);

  // 3. Re-create CHECK with the new, expanded status set ------------------
  pgm.sql(`
    ALTER TABLE issues ADD CONSTRAINT issues_status_check
    CHECK (status IN ('draft','validation','intake','prd','prd_approval','design','build','test','docs','done'))
  `);

  // 4. AI validation + return tracking columns ----------------------------
  pgm.addColumns('issues', {
    ai_validation_score: { type: 'integer' },
    ai_validation_notes: { type: 'jsonb' },
    ai_validated_at:     { type: 'timestamptz' },
    returned_reason:     { type: 'text' },
    returned_by:         { type: 'uuid', references: 'users(id)' },
    returned_at:         { type: 'timestamptz' },
  });

  // 5. issue_approvals table ---------------------------------------------
  pgm.createTable('issue_approvals', {
    id: {
      type: 'uuid',
      primaryKey: true,
      default: pgm.func('gen_random_uuid()'),
    },
    tenant_id: {
      type: 'uuid',
      notNull: true,
      references: 'tenants(id)',
    },
    issue_id: {
      type: 'uuid',
      notNull: true,
      references: 'issues(id)',
      onDelete: 'CASCADE',
    },
    stage:            { type: 'varchar(20)', notNull: true },
    approver_user_id: { type: 'uuid',        notNull: true, references: 'users(id)' },
    approver_role:    { type: 'varchar(30)', notNull: true },
    decision:         { type: 'varchar(10)', notNull: true, default: 'pending' },
    comments:         { type: 'text' },
    decided_at:       { type: 'timestamptz' },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('now()'),
    },
  });

  pgm.createIndex('issue_approvals', ['issue_id', 'stage'], {
    name: 'idx_issue_approvals_issue_stage',
  });
  pgm.createConstraint('issue_approvals', 'issue_approvals_issue_stage_role_unique', {
    unique: ['issue_id', 'stage', 'approver_role'],
  });

  pgm.sql(`ALTER TABLE issue_approvals ENABLE ROW LEVEL SECURITY`);
  pgm.sql(`
    DROP POLICY IF EXISTS issue_approvals_tenant_isolation ON issue_approvals;
    CREATE POLICY issue_approvals_tenant_isolation ON issue_approvals
      USING (tenant_id = current_setting('app.tenant_id')::uuid)
  `);

  // 6. issue_return_history table ----------------------------------------
  pgm.createTable('issue_return_history', {
    id: {
      type: 'uuid',
      primaryKey: true,
      default: pgm.func('gen_random_uuid()'),
    },
    tenant_id: {
      type: 'uuid',
      notNull: true,
      references: 'tenants(id)',
    },
    issue_id: {
      type: 'uuid',
      notNull: true,
      references: 'issues(id)',
      onDelete: 'CASCADE',
    },
    from_stage:  { type: 'varchar(20)', notNull: true },
    to_stage:    { type: 'varchar(20)', notNull: true },
    returned_by: { type: 'uuid',        notNull: true, references: 'users(id)' },
    reason:      { type: 'text',        notNull: true },
    annotations: { type: 'jsonb' },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('now()'),
    },
  });

  pgm.createIndex('issue_return_history', ['issue_id'], {
    name: 'idx_issue_return_history_issue',
  });
  pgm.createIndex('issue_return_history', ['issue_id', 'from_stage'], {
    name: 'idx_issue_return_history_issue_from',
  });

  pgm.sql(`ALTER TABLE issue_return_history ENABLE ROW LEVEL SECURITY`);
  pgm.sql(`
    DROP POLICY IF EXISTS issue_return_history_tenant_isolation ON issue_return_history;
    CREATE POLICY issue_return_history_tenant_isolation ON issue_return_history
      USING (tenant_id = current_setting('app.tenant_id')::uuid)
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql(`DROP POLICY IF EXISTS issue_return_history_tenant_isolation ON issue_return_history`);
  pgm.sql(`DROP POLICY IF EXISTS issue_approvals_tenant_isolation ON issue_approvals`);
  pgm.dropTable('issue_return_history', { ifExists: true });
  pgm.dropTable('issue_approvals', { ifExists: true });

  pgm.dropColumns('issues', [
    'ai_validation_score',
    'ai_validation_notes',
    'ai_validated_at',
    'returned_reason',
    'returned_by',
    'returned_at',
  ]);

  pgm.sql(`ALTER TABLE issues DROP CONSTRAINT IF EXISTS issues_status_check`);
  pgm.sql(`
    ALTER TABLE issues ADD CONSTRAINT issues_status_check
    CHECK (status IN ('intake','prd','design','build','review','test','deploy','done'))
  `);
}
