import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 033 - Store the display name of the selected APEX application.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.addColumn('issues', {
    app_name: {
      type: 'varchar(300)',
    },
  });
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.dropColumn('issues', 'app_name');
}
