import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('users', {
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
    email: {
      type: 'varchar(255)',
      notNull: true,
    },
    password_hash: {
      type: 'varchar(60)',
      notNull: true,
    },
    name: {
      type: 'varchar(100)',
      notNull: true,
    },
    role: {
      type: 'varchar(50)',
      default: "'DEVELOPER'",
    },
    is_active: {
      type: 'boolean',
      default: true,
    },
    failed_attempts: {
      type: 'integer',
      default: 0,
    },
    locked_until: {
      type: 'timestamptz',
    },
    last_login_at: {
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
    deleted_at: {
      type: 'timestamptz',
    },
  });

  // Unique constraint on tenant_id + email
  pgm.addConstraint('users', 'users_tenant_id_email_unique', {
    unique: ['tenant_id', 'email'],
  });

  // Index on tenant_id for fast tenant-scoped queries
  pgm.createIndex('users', 'tenant_id');

  // Row Level Security
  pgm.sql('ALTER TABLE users ENABLE ROW LEVEL SECURITY');
  pgm.sql(`
    CREATE POLICY tenant_isolation ON users
      USING (tenant_id = current_setting('app.current_tenant')::uuid);
  `);

  // updated_at trigger
  pgm.sql(`
    CREATE TRIGGER trg_users_updated_at
      BEFORE UPDATE ON users
      FOR EACH ROW
      EXECUTE FUNCTION set_updated_at();
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP TRIGGER IF EXISTS trg_users_updated_at ON users');
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON users');
  pgm.sql('ALTER TABLE users DISABLE ROW LEVEL SECURITY');
  pgm.dropTable('users');
}
