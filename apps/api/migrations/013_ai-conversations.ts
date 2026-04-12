import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 013 - Create ai_conversations table.
 *
 * Stores AI chat conversation metadata per tenant/user with optional
 * connection and APEX app/page context.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('ai_conversations', {
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
    connection_id: {
      type: 'uuid',
    },
    app_id: {
      type: 'integer',
    },
    page_id: {
      type: 'integer',
    },
    title: {
      type: 'varchar(200)',
      notNull: true,
      default: "'New Conversation'",
    },
    message_count: {
      type: 'integer',
      notNull: true,
      default: 0,
    },
    total_tokens: {
      type: 'integer',
      notNull: true,
      default: 0,
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
  pgm.sql('ALTER TABLE ai_conversations ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON ai_conversations
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('ai_conversations', ['tenant_id', 'user_id']);
  pgm.createIndex('ai_conversations', 'created_at');
  pgm.createIndex('ai_conversations', 'connection_id', {
    where: 'connection_id IS NOT NULL',
  });
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON ai_conversations');
  pgm.dropTable('ai_conversations');
}
