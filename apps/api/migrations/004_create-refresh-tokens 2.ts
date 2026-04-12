import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('refresh_tokens', {
    id: {
      type: 'uuid',
      primaryKey: true,
      default: pgm.func('gen_random_uuid()'),
    },
    tenant_id: {
      type: 'uuid',
      notNull: true,
      references: 'tenants',
      onDelete: 'CASCADE',
    },
    user_id: {
      type: 'uuid',
      notNull: true,
      references: 'users',
      onDelete: 'CASCADE',
    },
    token_hash: {
      type: 'varchar(64)',
      notNull: true,
    },
    family_id: {
      type: 'uuid',
      notNull: true,
    },
    is_revoked: {
      type: 'boolean',
      default: false,
    },
    expires_at: {
      type: 'timestamptz',
      notNull: true,
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('now()'),
    },
    used_at: {
      type: 'timestamptz',
    },
  });

  // Index on token_hash for fast lookups
  pgm.createIndex('refresh_tokens', 'token_hash');

  // Row Level Security
  pgm.sql('ALTER TABLE refresh_tokens ENABLE ROW LEVEL SECURITY');
  pgm.sql(`
    CREATE POLICY tenant_isolation ON refresh_tokens
      USING (tenant_id = current_setting('app.current_tenant')::uuid);
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON refresh_tokens');
  pgm.sql('ALTER TABLE refresh_tokens DISABLE ROW LEVEL SECURITY');
  pgm.dropTable('refresh_tokens');
}
