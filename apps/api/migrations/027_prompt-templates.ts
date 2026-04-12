import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 027 - Create prompt_templates table.
 *
 * Stores configurable AI prompt templates per tenant, allowing admins
 * to customise prompts used by PRD extraction, page generation, code
 * analysis and other AI-powered modules. Each template can optionally
 * override the LLM model used by the active provider.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('prompt_templates', {
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
    slug: {
      type: 'varchar(100)',
      notNull: true,
    },
    name: {
      type: 'varchar(200)',
      notNull: true,
    },
    description: {
      type: 'text',
    },
    category: {
      type: 'varchar(50)',
      notNull: true,
      check: "category IN ('prd','page-gen','code','analysis','testing')",
    },
    prompt_text: {
      type: 'text',
      notNull: true,
    },
    model_override: {
      type: 'varchar(100)',
    },
    temperature: {
      type: 'numeric(3,2)',
      notNull: true,
      default: 0.7,
    },
    max_tokens: {
      type: 'integer',
      notNull: true,
      default: 4096,
    },
    variables: {
      type: 'jsonb',
      notNull: true,
      default: "'[]'",
    },
    is_system_default: {
      type: 'boolean',
      notNull: true,
      default: false,
    },
    is_active: {
      type: 'boolean',
      notNull: true,
      default: true,
    },
    version: {
      type: 'integer',
      notNull: true,
      default: 1,
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

  // Unique: one slug+version per tenant (versioned)
  pgm.addConstraint('prompt_templates', 'prompt_templates_tenant_slug_version_unique', {
    unique: ['tenant_id', 'slug', 'version'],
  });

  // Enable RLS
  pgm.sql('ALTER TABLE prompt_templates ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON prompt_templates
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('prompt_templates', 'tenant_id');
  pgm.createIndex('prompt_templates', ['tenant_id', 'slug']);
  pgm.createIndex('prompt_templates', ['tenant_id', 'category']);
  pgm.createIndex('prompt_templates', ['tenant_id', 'is_active'], {
    where: 'is_active = TRUE',
  });

  // updated_at trigger
  pgm.sql(`
    CREATE TRIGGER set_prompt_templates_updated_at
      BEFORE UPDATE ON prompt_templates
      FOR EACH ROW
      EXECUTE FUNCTION set_updated_at();
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP TRIGGER IF EXISTS set_prompt_templates_updated_at ON prompt_templates');
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON prompt_templates');
  pgm.dropTable('prompt_templates');
}
