import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 029 - PRD Config.
 *
 * Creates prd_configs table so each tenant can store reference PRD documents
 * and custom prompts used by the AI when generating PRD sections.
 *
 * Links config to sessions via config_id on prd_sessions.
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.sql(`
    CREATE TABLE IF NOT EXISTS prd_configs (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      tenant_id UUID NOT NULL REFERENCES tenants(id),
      name VARCHAR(200) NOT NULL DEFAULT 'Default',
      example_document TEXT NOT NULL,
      generation_prompt TEXT NOT NULL,
      extraction_prompt TEXT,
      validation_prompt TEXT,
      is_default BOOLEAN DEFAULT FALSE,
      created_by UUID,
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
      updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    )
  `);

  pgm.sql(`CREATE UNIQUE INDEX IF NOT EXISTS idx_prd_config_tenant_default ON prd_configs(tenant_id) WHERE is_default = TRUE`);

  pgm.sql(`ALTER TABLE prd_configs ENABLE ROW LEVEL SECURITY`);
  pgm.sql(`CREATE POLICY prd_config_tenant ON prd_configs USING (tenant_id::text = current_setting('app.current_tenant', true))`);

  pgm.sql(`CREATE TRIGGER prd_config_updated_at BEFORE UPDATE ON prd_configs FOR EACH ROW EXECUTE FUNCTION set_updated_at()`);

  // Link config to sessions
  pgm.sql(`ALTER TABLE prd_sessions ADD COLUMN IF NOT EXISTS config_id UUID REFERENCES prd_configs(id)`);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('ALTER TABLE prd_sessions DROP COLUMN IF EXISTS config_id');
  pgm.sql('DROP TRIGGER IF EXISTS prd_config_updated_at ON prd_configs');
  pgm.sql('DROP POLICY IF EXISTS prd_config_tenant ON prd_configs');
  pgm.sql('DROP INDEX IF EXISTS idx_prd_config_tenant_default');
  pgm.dropTable('prd_configs', { ifExists: true });
}
