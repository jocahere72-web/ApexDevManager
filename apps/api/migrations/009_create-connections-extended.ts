import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 009 - Extend connections table for U2 connection management features.
 *
 * Adds environment, pool settings, encrypted credentials, health tracking,
 * tagging/labelling, change-log, and ownership columns.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  // ── New columns ──────────────────────────────────────────────────────

  pgm.addColumns('connections', {
    environment: {
      type: 'varchar(20)',
    },
    pool_min: {
      type: 'integer',
      default: 2,
    },
    pool_max: {
      type: 'integer',
      default: 10,
    },
    pool_increment: {
      type: 'integer',
      default: 1,
    },
    schema_name: {
      type: 'varchar(100)',
    },
    workspace_name: {
      type: 'varchar(100)',
    },
    encrypted_credentials: {
      type: 'jsonb',
    },
    status: {
      type: 'varchar(20)',
      default: "'unknown'",
    },
    last_check_at: {
      type: 'timestamptz',
    },
    last_latency_ms: {
      type: 'integer',
    },
    last_error: {
      type: 'text',
    },
    consecutive_failures: {
      type: 'integer',
      default: 0,
    },
    tags: {
      type: 'text[]',
      default: pgm.func(`ARRAY[]::text[]`),
    },
    labels: {
      type: 'jsonb',
      default: "'{}'",
    },
    change_log: {
      type: 'jsonb',
      default: "'[]'",
    },
    is_active: {
      type: 'boolean',
      default: true,
    },
    created_by: {
      type: 'uuid',
    },
  });

  // ── CHECK constraints ────────────────────────────────────────────────

  pgm.addConstraint('connections', 'connections_environment_check', {
    check: "environment IN ('dev', 'test', 'staging', 'prod')",
  });

  pgm.addConstraint('connections', 'connections_status_check', {
    check: "status IN ('connected', 'degraded', 'disconnected', 'unknown')",
  });

  // ── Indexes ──────────────────────────────────────────────────────────

  // Unique connection name per tenant (active connections only)
  pgm.sql(`
    CREATE UNIQUE INDEX connections_tenant_name_active_uidx
      ON connections (tenant_id, name)
      WHERE deleted_at IS NULL
  `);

  // Fast lookup by environment
  pgm.createIndex('connections', 'environment');

  // Fast lookup by status for health-check sweeps
  pgm.createIndex('connections', 'status');

  // GIN index on tags for array containment queries
  pgm.sql(`CREATE INDEX connections_tags_gin_idx ON connections USING GIN (tags)`);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  // ── Drop indexes ─────────────────────────────────────────────────────
  pgm.sql(`DROP INDEX IF EXISTS connections_tags_gin_idx`);
  pgm.dropIndex('connections', 'status');
  pgm.dropIndex('connections', 'environment');
  pgm.sql(`DROP INDEX IF EXISTS connections_tenant_name_active_uidx`);

  // ── Drop constraints ─────────────────────────────────────────────────
  pgm.dropConstraint('connections', 'connections_status_check');
  pgm.dropConstraint('connections', 'connections_environment_check');

  // ── Drop columns ─────────────────────────────────────────────────────
  pgm.dropColumns('connections', [
    'environment',
    'pool_min',
    'pool_max',
    'pool_increment',
    'schema_name',
    'workspace_name',
    'encrypted_credentials',
    'status',
    'last_check_at',
    'last_latency_ms',
    'last_error',
    'consecutive_failures',
    'tags',
    'labels',
    'change_log',
    'is_active',
    'created_by',
  ]);
}
