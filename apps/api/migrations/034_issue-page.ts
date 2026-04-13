import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 034 - Store the optional selected APEX page on an issue.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.addColumns('issues', {
    page_id: {
      type: 'integer',
    },
    page_name: {
      type: 'varchar(300)',
    },
  });
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.dropColumns('issues', ['page_id', 'page_name']);
}
