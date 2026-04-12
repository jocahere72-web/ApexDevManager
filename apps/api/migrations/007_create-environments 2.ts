import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('environments', {
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
    name: {
      type: 'varchar(100)',
      notNull: true,
    },
    type: {
      type: 'varchar(20)',
      notNull: true,
    },
    config: {
      type: 'jsonb',
      default: "'{}'",
    },
    status: {
      type: 'varchar(20)',
      default: "'ACTIVE'",
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

  // CHECK constraint for type
  pgm.addConstraint('environments', 'environments_type_check', {
    check: "type IN ('dev', 'qa', 'staging', 'prod')",
  });

  // Row Level Security
  pgm.sql('ALTER TABLE environments ENABLE ROW LEVEL SECURITY');
  pgm.sql(`
    CREATE POLICY tenant_isolation ON environments
      USING (tenant_id = current_setting('app.current_tenant')::uuid);
  `);

  // Index on tenant_id
  pgm.createIndex('environments', 'tenant_id');

  // Unique constraint on tenant_id + name
  pgm.addConstraint('environments', 'environments_tenant_id_name_unique', {
    unique: ['tenant_id', 'name'],
  });

  // updated_at trigger
  pgm.sql(`
    CREATE TRIGGER trg_environments_updated_at
      BEFORE UPDATE ON environments
      FOR EACH ROW
      EXECUTE FUNCTION set_updated_at();
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP TRIGGER IF EXISTS trg_environments_updated_at ON environments');
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON environments');
  pgm.sql('ALTER TABLE environments DISABLE ROW LEVEL SECURITY');
  pgm.dropTable('environments');
}
