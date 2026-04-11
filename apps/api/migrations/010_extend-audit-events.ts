import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 010 - Extend audit_events for U2 observability features.
 *
 * Adds resource_type, resource_id, and correlation_id columns.
 * Adds indexes for efficient querying and an INSERT-only policy.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  // ── New columns ──────────────────────────────────────────────────────

  pgm.addColumns('audit_events', {
    resource_type: {
      type: 'varchar(50)',
    },
    resource_id: {
      type: 'varchar(100)',
    },
    correlation_id: {
      type: 'uuid',
    },
  });

  // ── Indexes ──────────────────────────────────────────────────────────

  // Composite index for event-type time-range queries
  pgm.createIndex('audit_events', ['event_type', 'created_at']);

  // Index on user_id for per-user activity lookups
  pgm.createIndex('audit_events', 'user_id');

  // Index on correlation_id for request tracing
  pgm.createIndex('audit_events', 'correlation_id', {
    where: 'correlation_id IS NOT NULL',
  });

  // ── INSERT-only policy ───────────────────────────────────────────────
  // Audit events are immutable: tenants can insert but never update or delete.
  pgm.sql(`
    CREATE POLICY audit_insert_only ON audit_events
      FOR INSERT
      WITH CHECK (tenant_id::text = current_setting('app.current_tenant', true))
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  // ── Drop policy ──────────────────────────────────────────────────────
  pgm.sql(`DROP POLICY IF EXISTS audit_insert_only ON audit_events`);

  // ── Drop indexes ─────────────────────────────────────────────────────
  pgm.dropIndex('audit_events', 'correlation_id');
  pgm.dropIndex('audit_events', 'user_id');
  pgm.dropIndex('audit_events', ['event_type', 'created_at']);

  // ── Drop columns ─────────────────────────────────────────────────────
  pgm.dropColumns('audit_events', [
    'resource_type',
    'resource_id',
    'correlation_id',
  ]);
}
