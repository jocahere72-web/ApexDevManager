import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('audit_events', {
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
      references: 'users',
      onDelete: 'SET NULL',
    },
    event_type: {
      type: 'varchar(50)',
    },
    action: {
      type: 'varchar(50)',
    },
    entity_type: {
      type: 'varchar(50)',
    },
    entity_id: {
      type: 'varchar(100)',
    },
    event_payload: {
      type: 'jsonb',
      default: "'{}'",
    },
    ip_address: {
      type: 'varchar(45)',
    },
    user_agent: {
      type: 'text',
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('now()'),
    },
  });

  // Row Level Security
  pgm.sql('ALTER TABLE audit_events ENABLE ROW LEVEL SECURITY');
  pgm.sql(`
    CREATE POLICY tenant_isolation ON audit_events
      USING (tenant_id = current_setting('app.current_tenant')::uuid);
  `);

  // Index on tenant_id + created_at for time-range queries per tenant
  pgm.createIndex('audit_events', ['tenant_id', 'created_at']);

  // Index on entity_type + entity_id for entity lookups
  pgm.createIndex('audit_events', ['entity_type', 'entity_id']);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON audit_events');
  pgm.sql('ALTER TABLE audit_events DISABLE ROW LEVEL SECURITY');
  pgm.dropTable('audit_events');
}
