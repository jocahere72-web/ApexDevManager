import { Pool } from 'pg';
import * as bcrypt from 'bcrypt';
import * as path from 'path';
import * as fs from 'fs';

// ---------------------------------------------------------------------------
// APEX Dev Manager - Database Seed Script
// ---------------------------------------------------------------------------
// Inserts default tenant, admin user, sample users for all roles, and sample
// connection/environment records. Uses ON CONFLICT DO NOTHING for idempotency.
// ---------------------------------------------------------------------------

interface TenantSeed {
  name: string;
  slug: string;
  plan: string;
  status: string;
  settings: Record<string, unknown>;
}

interface UserSeed {
  name: string;
  email: string;
  role: string;
  password: string;
}

const BCRYPT_ROUNDS = 12;

async function loadJson<T>(filename: string): Promise<T> {
  const filePath = path.join(__dirname, 'seed-data', filename);
  const raw = fs.readFileSync(filePath, 'utf-8');
  return JSON.parse(raw) as T;
}

async function hashPassword(password: string): Promise<string> {
  return bcrypt.hash(password, BCRYPT_ROUNDS);
}

async function seed(): Promise<void> {
  const databaseUrl = process.env.DATABASE_URL || process.env.DB_URL;
  if (!databaseUrl) {
    console.error('ERROR: DATABASE_URL or DB_URL environment variable is required.');
    process.exit(1);
  }

  const pool = new Pool({ connectionString: databaseUrl });

  try {
    console.log('============================================');
    console.log('  APEX Seed: Starting');
    console.log(`  Timestamp: ${new Date().toISOString()}`);
    console.log('============================================');

    // ----------------------------------------------------------------------
    // 1. Seed Tenants
    // ----------------------------------------------------------------------
    console.log('\n[1/4] Seeding tenants...');
    const tenants = await loadJson<TenantSeed[]>('tenants.json');

    for (const tenant of tenants) {
      const result = await pool.query(
        `INSERT INTO tenants (name, slug, plan, status, settings, created_at, updated_at)
         VALUES ($1, $2, $3, $4, $5, NOW(), NOW())
         ON CONFLICT (slug) DO NOTHING
         RETURNING id`,
        [tenant.name, tenant.slug, tenant.plan, tenant.status, JSON.stringify(tenant.settings)],
      );

      if (result.rowCount && result.rowCount > 0) {
        console.log(`  Created tenant: ${tenant.name} (${tenant.slug})`);
      } else {
        console.log(`  Tenant already exists: ${tenant.name} (${tenant.slug})`);
      }
    }

    // Get the demo tenant ID for user association
    const tenantResult = await pool.query(`SELECT id FROM tenants WHERE slug = $1`, ['apex-demo']);
    const tenantId = tenantResult.rows[0]?.id;

    if (!tenantId) {
      console.error('ERROR: Could not find apex-demo tenant.');
      process.exit(1);
    }

    // ----------------------------------------------------------------------
    // 2. Seed Admin User
    // ----------------------------------------------------------------------
    console.log('\n[2/4] Seeding admin user...');
    const adminPasswordHash = await hashPassword('Admin123!');

    const adminResult = await pool.query(
      `INSERT INTO users (tenant_id, name, email, password_hash, role, is_active, created_at, updated_at)
       VALUES ($1, $2, $3, $4, $5, true, NOW(), NOW())
       ON CONFLICT (tenant_id, email) DO NOTHING
       RETURNING id`,
      [tenantId, 'APEX Administrator', 'admin@apex.local', adminPasswordHash, 'admin'],
    );

    if (adminResult.rowCount && adminResult.rowCount > 0) {
      console.log('  Created admin user: admin@apex.local');
    } else {
      console.log('  Admin user already exists: admin@apex.local');
    }

    // ----------------------------------------------------------------------
    // 3. Seed Sample Users (one per role)
    // ----------------------------------------------------------------------
    console.log('\n[3/4] Seeding sample users...');
    const users = await loadJson<UserSeed[]>('users.json');
    const demoPasswordHash = await hashPassword('Demo123!');

    for (const user of users) {
      const result = await pool.query(
        `INSERT INTO users (tenant_id, name, email, password_hash, role, is_active, created_at, updated_at)
         VALUES ($1, $2, $3, $4, $5, true, NOW(), NOW())
         ON CONFLICT (tenant_id, email) DO NOTHING
         RETURNING id`,
        [tenantId, user.name, user.email, demoPasswordHash, user.role],
      );

      if (result.rowCount && result.rowCount > 0) {
        console.log(`  Created user: ${user.name} (${user.email}) [${user.role}]`);
      } else {
        console.log(`  User already exists: ${user.email}`);
      }
    }

    // ----------------------------------------------------------------------
    // 4. Seed Sample Connection and Environment
    // ----------------------------------------------------------------------
    console.log('\n[4/4] Seeding sample connection and environment...');

    const connResult = await pool.query(
      `INSERT INTO connections (tenant_id, name, connection_type, db_host, service_name, health_status, created_at, updated_at)
       VALUES ($1, $2, $3, $4, $5, 'UNKNOWN', NOW(), NOW())
       ON CONFLICT (tenant_id, name) DO NOTHING
       RETURNING id`,
      [tenantId, 'Demo Oracle DB', 'jdbc', 'demo-db.apex.local', 'ORCL'],
    );

    let connectionId: string | undefined;
    if (connResult.rowCount && connResult.rowCount > 0) {
      connectionId = connResult.rows[0].id;
      console.log('  Created connection: Demo Oracle DB');
    } else {
      console.log('  Connection already exists: Demo Oracle DB');
      const existing = await pool.query(
        `SELECT id FROM connections WHERE tenant_id = $1 AND name = $2`,
        [tenantId, 'Demo Oracle DB'],
      );
      connectionId = existing.rows[0]?.id;
    }

    if (connectionId) {
      const envResult = await pool.query(
        `INSERT INTO environments (tenant_id, connection_id, name, label, status, created_at, updated_at)
         VALUES ($1, $2, $3, $4, 'ACTIVE', NOW(), NOW())
         ON CONFLICT (tenant_id, name) DO NOTHING
         RETURNING id`,
        [tenantId, connectionId, 'Development', 'DEV'],
      );

      if (envResult.rowCount && envResult.rowCount > 0) {
        console.log('  Created environment: Development (DEV)');
      } else {
        console.log('  Environment already exists: Development (DEV)');
      }
    }

    console.log('\n============================================');
    console.log('  APEX Seed: Completed Successfully');
    console.log('============================================');
  } catch (error) {
    console.error('\nERROR: Seed script failed:', error);
    process.exit(1);
  } finally {
    await pool.end();
  }
}

seed();
