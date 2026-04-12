import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 026 - Create llm_providers table.
 *
 * Stores LLM provider configurations per tenant with encrypted API keys,
 * model settings, rate limits, and budget tracking. Only one provider
 * can be active per tenant at a time.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable('llm_providers', {
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
    provider_name: {
      type: 'varchar(50)',
      notNull: true,
      check: "provider_name IN ('anthropic','openai','google','mistral','local')",
    },
    display_name: {
      type: 'varchar(100)',
      notNull: true,
    },
    api_key_encrypted: {
      type: 'jsonb',
    },
    base_url: {
      type: 'varchar(500)',
    },
    default_model: {
      type: 'varchar(100)',
      notNull: true,
    },
    available_models: {
      type: 'text[]',
      notNull: true,
      default: "'{}'",
    },
    is_active: {
      type: 'boolean',
      notNull: true,
      default: false,
    },
    max_tokens_per_request: {
      type: 'integer',
      notNull: true,
      default: 4096,
    },
    rate_limit_rpm: {
      type: 'integer',
      notNull: true,
      default: 60,
    },
    monthly_budget_usd: {
      type: 'numeric(10,2)',
    },
    current_month_cost_usd: {
      type: 'numeric(10,2)',
      notNull: true,
      default: 0,
    },
    config: {
      type: 'jsonb',
      notNull: true,
      default: "'{}'",
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

  // Unique: one config per provider per tenant
  pgm.addConstraint('llm_providers', 'llm_providers_tenant_provider_unique', {
    unique: ['tenant_id', 'provider_name'],
  });

  // Enable RLS
  pgm.sql('ALTER TABLE llm_providers ENABLE ROW LEVEL SECURITY');

  pgm.sql(`
    CREATE POLICY tenant_isolation ON llm_providers
      USING (tenant_id::text = current_setting('app.current_tenant', true))
  `);

  // Indexes
  pgm.createIndex('llm_providers', 'tenant_id');
  pgm.createIndex('llm_providers', ['tenant_id', 'is_active'], {
    where: 'is_active = TRUE',
  });

  // updated_at trigger
  pgm.sql(`
    CREATE TRIGGER set_llm_providers_updated_at
      BEFORE UPDATE ON llm_providers
      FOR EACH ROW
      EXECUTE FUNCTION set_updated_at();
  `);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP TRIGGER IF EXISTS set_llm_providers_updated_at ON llm_providers');
  pgm.sql('DROP POLICY IF EXISTS tenant_isolation ON llm_providers');
  pgm.dropTable('llm_providers');
}
