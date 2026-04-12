import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 023 - Create AI governance tables.
 *
 * ai_audit_log  - Records every AI interaction for compliance and cost tracking.
 * ai_safety_rules - Configurable rules to block, warn, or log risky prompts/outputs.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  // ── ai_audit_log ──────────────────────────────────────────────────────
  pgm.createTable('ai_audit_log', {
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
    user_id: {
      type: 'uuid',
      notNull: true,
      references: 'users(id)',
      onDelete: 'CASCADE',
    },
    conversation_id: {
      type: 'uuid',
    },
    prompt_hash: {
      type: 'varchar(64)',
    },
    prompt_risk_level: {
      type: 'varchar(10)',
    },
    output_risk_level: {
      type: 'varchar(10)',
    },
    blocked: {
      type: 'boolean',
      notNull: true,
      default: false,
    },
    block_reason: {
      type: 'text',
    },
    model: {
      type: 'varchar(50)',
    },
    tokens_used: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    cost_usd: {
      type: 'numeric(10,6)',
      notNull: true,
      default: 0,
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('NOW()'),
    },
  });

  pgm.sql('ALTER TABLE ai_audit_log ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON ai_audit_log
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  pgm.createIndex('ai_audit_log', ['tenant_id', 'created_at']);
  pgm.createIndex('ai_audit_log', ['tenant_id', 'user_id']);
  pgm.createIndex('ai_audit_log', 'prompt_hash', { where: 'prompt_hash IS NOT NULL' });
  pgm.createIndex('ai_audit_log', 'blocked', { where: 'blocked = true' });

  // ── ai_safety_rules ───────────────────────────────────────────────────
  pgm.createTable('ai_safety_rules', {
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
    rule_name: {
      type: 'varchar(255)',
      notNull: true,
    },
    pattern: {
      type: 'text',
      notNull: true,
    },
    action: {
      type: 'varchar(10)',
      notNull: true,
      default: "'log'",
      check: "action IN ('block','warn','log')",
    },
    enabled: {
      type: 'boolean',
      notNull: true,
      default: true,
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('NOW()'),
    },
  });

  pgm.sql('ALTER TABLE ai_safety_rules ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON ai_safety_rules
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  pgm.createIndex('ai_safety_rules', ['tenant_id', 'enabled']);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON ai_safety_rules');
  pgm.dropTable('ai_safety_rules');

  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON ai_audit_log');
  pgm.dropTable('ai_audit_log');
}
