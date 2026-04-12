#!/usr/bin/env node
import 'dotenv/config';
import path from 'node:path';
import runner from 'node-pg-migrate';
import { logger } from '../logger.js';

const __dirname = path.dirname(__filename);

const MIGRATIONS_DIR = path.resolve(__dirname, '../../migrations');

function getDatabaseUrl(): string {
  const url = process.env.DATABASE_URL;
  if (!url) {
    logger.fatal('DATABASE_URL environment variable is not set');
    process.exit(1);
  }
  return url;
}

async function runMigrations(direction: 'up' | 'down'): Promise<void> {
  const databaseUrl = getDatabaseUrl();
  const count = direction === 'up' ? Infinity : 1;

  logger.info({ direction, migrationsDir: MIGRATIONS_DIR }, `Running migrations: ${direction}`);

  try {
    const migrations = await runner({
      databaseUrl,
      dir: MIGRATIONS_DIR,
      direction,
      count,
      migrationsTable: 'pgmigrations',
      log: (msg: string) => logger.debug(msg),
      logger: {
        info: (msg: string) => logger.info(msg),
        warn: (msg: string) => logger.warn(msg),
        error: (msg: string) => logger.error(msg),
      },
    });

    if (migrations.length === 0) {
      logger.info('No migrations to run');
    } else {
      logger.info(
        { count: migrations.length, migrations: migrations.map((m) => m.name) },
        `Successfully ran ${migrations.length} migration(s)`,
      );
    }
  } catch (err) {
    logger.fatal({ err }, 'Migration failed');
    process.exit(1);
  }
}

async function createMigration(name: string): Promise<void> {
  if (!name) {
    logger.fatal('Migration name is required. Usage: migrate create <name>');
    process.exit(1);
  }

  // Sanitize the name: lowercase, replace spaces with hyphens
  const sanitized = name
    .toLowerCase()
    .replace(/\s+/g, '-')
    .replace(/[^a-z0-9-]/g, '');
  const timestamp = new Date().toISOString().replace(/[-:T]/g, '').slice(0, 14);
  const fileName = `${timestamp}_${sanitized}.ts`;

  const template = `import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

export async function up(pgm: MigrationBuilder): Promise<void> {
  // TODO: Add migration logic
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  // TODO: Add rollback logic
}
`;

  const fs = await import('node:fs/promises');
  const filePath = path.join(MIGRATIONS_DIR, fileName);
  await fs.writeFile(filePath, template, 'utf-8');
  logger.info({ filePath }, `Created migration: ${fileName}`);
}

async function main(): Promise<void> {
  const [command, ...args] = process.argv.slice(2);

  switch (command) {
    case 'up':
      await runMigrations('up');
      break;
    case 'down':
      await runMigrations('down');
      break;
    case 'create':
      await createMigration(args.join(' '));
      break;
    default:
      console.log(`
APEX Dev Manager - Migration Runner

Usage:
  migrate up              Run all pending migrations
  migrate down            Rollback the last migration
  migrate create <name>   Create a new migration file

Environment:
  DATABASE_URL            PostgreSQL connection string (required)
`);
      process.exit(command ? 1 : 0);
  }
}

main().catch((err) => {
  logger.fatal({ err }, 'Unexpected migration error');
  process.exit(1);
});
