import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 014 - Create ai_messages table.
 *
 * Stores individual messages within AI conversations. Each message tracks
 * role, content, optional action type, token counts, and model used.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('ai_messages', {
    id: {
      type: 'uuid',
      primaryKey: true,
      default: pgm.func('gen_random_uuid()'),
    },
    conversation_id: {
      type: 'uuid',
      notNull: true,
      references: 'ai_conversations(id)',
      onDelete: 'CASCADE',
    },
    tenant_id: {
      type: 'uuid',
      notNull: true,
      references: 'tenants(id)',
      onDelete: 'CASCADE',
    },
    role: {
      type: 'varchar(20)',
      notNull: true,
      check: "role IN ('user', 'assistant', 'system')",
    },
    content: {
      type: 'text',
      notNull: true,
    },
    action: {
      type: 'varchar(50)',
    },
    tokens_input: {
      type: 'integer',
    },
    tokens_output: {
      type: 'integer',
    },
    model: {
      type: 'varchar(50)',
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('NOW()'),
    },
  });

  // Enable RLS
  pgm.sql('ALTER TABLE ai_messages ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON ai_messages
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Index for fetching messages in conversation order
  pgm.createIndex('ai_messages', ['conversation_id', 'created_at']);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON ai_messages');
  pgm.dropTable('ai_messages');
}
