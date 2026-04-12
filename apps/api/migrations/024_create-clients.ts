import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 024 - Create clients table.
 *
 * Clients represent external organizations or projects that own issues.
 * Each client has a unique code used as a prefix for issue numbering.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('clients', {
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
    name: {
      type: 'varchar(200)',
      notNull: true,
    },
    code: {
      type: 'varchar(10)',
      notNull: true,
    },
    description: {
      type: 'text',
    },
    connection_id: {
      type: 'uuid',
      references: 'connections(id)',
      onDelete: 'SET NULL',
    },
    app_id: {
      type: 'integer',
    },
    contact_name: {
      type: 'varchar(100)',
    },
    contact_email: {
      type: 'varchar(255)',
    },
    is_active: {
      type: 'boolean',
      notNull: true,
      default: true,
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
  pgm.addConstraint('clients', 'clients_tenant_code_unique', {
    unique: ['tenant_id', 'code'],
  });

  // Enable RLS
  pgm.sql('ALTER TABLE clients ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON clients
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('clients', 'tenant_id');

  // updated_at trigger
  pgm.sql(`
    CREATE TRIGGER set_clients_updated_at
      BEFORE UPDATE ON clients
      FOR EACH ROW
      EXECUTE FUNCTION set_updated_at();
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP TRIGGER IF EXISTS set_clients_updated_at ON clients');
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON clients');
  pgm.dropTable('clients');
}
