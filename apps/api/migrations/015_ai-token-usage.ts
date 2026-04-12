import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 015 - Create ai_token_usage table.
 *
 * Tracks per-message token consumption and estimated cost for billing,
 * rate-limiting, and usage analytics.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('ai_token_usage', {
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
      references: 'ai_conversations(id)',
      onDelete: 'SET NULL',
    },
    message_id: {
      type: 'uuid',
      references: 'ai_messages(id)',
      onDelete: 'SET NULL',
    },
    model: {
      type: 'varchar(50)',
      notNull: true,
    },
    input_tokens: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    output_tokens: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    total_tokens: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    estimated_cost_usd: {
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

  // Enable RLS
  pgm.sql('ALTER TABLE ai_token_usage ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON ai_token_usage
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('ai_token_usage', ['tenant_id', 'created_at']);
  pgm.createIndex('ai_token_usage', ['tenant_id', 'user_id']);
  pgm.createIndex('ai_token_usage', 'conversation_id', {
    where: 'conversation_id IS NOT NULL',
  });
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON ai_token_usage');
  pgm.dropTable('ai_token_usage');
}
