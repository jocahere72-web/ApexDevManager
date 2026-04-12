import type { MigrationBuilder, ColumnDefinitions } from 'node-pg-migrate';

export const shorthands: ColumnDefinitions | undefined = undefined;

/**
 * Migration 030 - Process Params.
 *
 * Creates process_params table so each tenant can configure per-stage
 * parameters for the issue pipeline (intake, prd, design, build, review,
 * test, deploy).
 */
export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.sql(`
    CREATE TABLE IF NOT EXISTS process_params (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      tenant_id UUID NOT NULL REFERENCES tenants(id),
      stage VARCHAR(20) NOT NULL CHECK (stage IN ('intake','prd','design','build','review','test','deploy')),
      name VARCHAR(200) NOT NULL,
      description TEXT,
      prompt_template TEXT,
      model_override VARCHAR(100),
      temperature NUMERIC(3,2) DEFAULT 0.7,
      max_tokens INTEGER DEFAULT 4096,
      reference_document TEXT,
      checklist JSONB DEFAULT '[]',
      required_fields JSONB DEFAULT '[]',
      approval_rules JSONB DEFAULT '{}',
      config JSONB DEFAULT '{}',
      is_active BOOLEAN DEFAULT TRUE,
      created_by UUID,
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
      updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    )
  `);

  pgm.sql(`CREATE UNIQUE INDEX IF NOT EXISTS idx_pp_tenant_stage ON process_params(tenant_id, stage) WHERE is_active = TRUE`);

  pgm.sql(`ALTER TABLE process_params ENABLE ROW LEVEL SECURITY`);
  pgm.sql(`CREATE POLICY process_params_tenant ON process_params USING (tenant_id::text = current_setting('app.current_tenant', true))`);

  pgm.sql(`CREATE TRIGGER process_params_updated_at BEFORE UPDATE ON process_params FOR EACH ROW EXECUTE FUNCTION set_updated_at()`);
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.sql('DROP TRIGGER IF EXISTS process_params_updated_at ON process_params');
  pgm.sql('DROP POLICY IF EXISTS process_params_tenant ON process_params');
  pgm.sql('DROP INDEX IF EXISTS idx_pp_tenant_stage');
  pgm.dropTable('process_params', { ifExists: true });
}
