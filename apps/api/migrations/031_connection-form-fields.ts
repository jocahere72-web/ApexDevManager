import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.addColumns('connections', {
    db_port: {
      type: 'integer',
      default: 1521,
    },
    db_username: {
      type: 'varchar(100)',
    },
    db_sid: {
      type: 'varchar(100)',
    },
    apex_workspace: {
      type: 'varchar(100)',
    },
    apex_app_id: {
      type: 'integer',
    },
    apex_base_url: {
      type: 'text',
    },
    apex_version: {
      type: 'varchar(20)',
    },
    ords_username: {
      type: 'varchar(100)',
    },
    description: {
      type: 'varchar(500)',
    },
    db_password_encrypted: {
      type: 'jsonb',
    },
  });
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.dropColumns('connections', [
    'db_port',
    'db_username',
    'db_sid',
    'apex_workspace',
    'apex_app_id',
    'apex_base_url',
    'apex_version',
    'ords_username',
    'description',
    'db_password_encrypted',
  ]);
}
