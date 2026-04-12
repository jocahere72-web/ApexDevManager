import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('connections', {
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
    connection_type: {
      type: 'varchar(10)',
      notNull: true,
    },
    name: {
      type: 'varchar(100)',
      notNull: true,
    },
    ords_url: {
      type: 'text',
    },
    db_host: {
      type: 'varchar(255)',
    },
    service_name: {
      type: 'varchar(100)',
    },
    secret_ref: {
      type: 'varchar(255)',
    },
    health_status: {
      type: 'varchar(20)',
      default: "'UNKNOWN'",
    },
    last_health_check_at: {
      type: 'timestamptz',
    },
    deleted_at: {
      type: 'timestamptz',
    },
    created_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('now()'),
    },
    updated_at: {
      type: 'timestamptz',
      notNull: true,
      default: pgm.func('now()'),
    },
  });

  // CHECK constraint for connection_type
  pgm.addConstraint('connections', 'connections_type_check', {
    check: "connection_type IN ('ords', 'jdbc')",
  });

  // Row Level Security
  pgm.sql('ALTER TABLE connections ENABLE ROW LEVEL SECURITY');
  pgm.sql(`
    CREATE POLICY tenant_isolation ON connections
      USING (tenant_id = current_setting('app.current_tenant')::uuid);
  `);

  // Index on tenant_id
  pgm.createIndex('connections', 'tenant_id');

  // updated_at trigger
  pgm.sql(`
    CREATE TRIGGER trg_connections_updated_at
      BEFORE UPDATE ON connections
      FOR EACH ROW
      EXECUTE FUNCTION set_updated_at();
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP TRIGGER IF EXISTS trg_connections_updated_at ON connections');
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON connections');
  pgm.sql('ALTER TABLE connections DISABLE ROW LEVEL SECURITY');
  pgm.dropTable('connections');
}
