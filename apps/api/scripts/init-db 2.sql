-- APEX Dev Manager - Database Initialization
-- Run: psql -h localhost -p 5434 -U apexadmin -d apexdev -f scripts/init-db.sql

-- Extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Updated_at trigger function
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Tenants
CREATE TABLE IF NOT EXISTS tenants (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) NOT NULL,
  slug VARCHAR(50) UNIQUE NOT NULL,
  plan VARCHAR(20) DEFAULT 'FREE',
  settings JSONB DEFAULT '{}',
  status VARCHAR(20) DEFAULT 'ACTIVE',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TRIGGER tenants_updated_at BEFORE UPDATE ON tenants FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- Users
CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  email VARCHAR(255) NOT NULL,
  password_hash VARCHAR(60) NOT NULL,
  display_name VARCHAR(100) NOT NULL,
  roles TEXT[] DEFAULT '{developer}',
  is_active BOOLEAN DEFAULT TRUE,
  failed_attempts INTEGER DEFAULT 0,
  locked_until TIMESTAMPTZ,
  last_login_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMPTZ
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_users_tenant_email ON users(tenant_id, email) WHERE deleted_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_users_tenant ON users(tenant_id);
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
CREATE POLICY users_tenant_isolation ON users USING (tenant_id::text = current_setting('app.current_tenant', true));
CREATE TRIGGER users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- Refresh Tokens
CREATE TABLE IF NOT EXISTS refresh_tokens (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  token_hash VARCHAR(64) NOT NULL,
  user_id UUID REFERENCES users(id),
  tenant_id UUID REFERENCES tenants(id),
  family_id UUID NOT NULL,
  is_used BOOLEAN DEFAULT FALSE,
  used_at TIMESTAMPTZ,
  is_revoked BOOLEAN DEFAULT FALSE,
  expires_at TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  replaced_by UUID
);
CREATE INDEX IF NOT EXISTS idx_rt_token_hash ON refresh_tokens(token_hash);
CREATE INDEX IF NOT EXISTS idx_rt_family ON refresh_tokens(family_id);
CREATE INDEX IF NOT EXISTS idx_rt_user_tenant ON refresh_tokens(user_id, tenant_id);
ALTER TABLE refresh_tokens ENABLE ROW LEVEL SECURITY;
CREATE POLICY rt_tenant_isolation ON refresh_tokens USING (tenant_id::text = current_setting('app.current_tenant', true));

-- Audit Events
CREATE TABLE IF NOT EXISTS audit_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID REFERENCES tenants(id),
  user_id UUID,
  event_type VARCHAR(50),
  action VARCHAR(50),
  entity_type VARCHAR(50),
  entity_id VARCHAR(100),
  resource_type VARCHAR(50),
  resource_id VARCHAR(100),
  event_payload JSONB DEFAULT '{}',
  ip_address VARCHAR(45),
  user_agent TEXT,
  correlation_id UUID,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_ae_tenant_created ON audit_events(tenant_id, created_at);
CREATE INDEX IF NOT EXISTS idx_ae_entity ON audit_events(entity_type, entity_id);
CREATE INDEX IF NOT EXISTS idx_ae_event_type ON audit_events(event_type, created_at);
CREATE INDEX IF NOT EXISTS idx_ae_user ON audit_events(user_id);
ALTER TABLE audit_events ENABLE ROW LEVEL SECURITY;
CREATE POLICY ae_tenant_read ON audit_events FOR SELECT USING (tenant_id::text = current_setting('app.current_tenant', true));
CREATE POLICY ae_tenant_insert ON audit_events FOR INSERT WITH CHECK (tenant_id::text = current_setting('app.current_tenant', true));

-- Connections
CREATE TABLE IF NOT EXISTS connections (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  connection_type VARCHAR(10) NOT NULL CHECK (connection_type IN ('ords', 'jdbc')),
  name VARCHAR(100) NOT NULL,
  environment VARCHAR(20) CHECK (environment IN ('dev', 'test', 'staging', 'prod')),
  ords_url TEXT,
  db_host VARCHAR(255),
  service_name VARCHAR(100),
  schema_name VARCHAR(100),
  workspace_name VARCHAR(100),
  secret_ref VARCHAR(255),
  encrypted_credentials JSONB,
  health_status VARCHAR(20) DEFAULT 'UNKNOWN',
  status VARCHAR(20) DEFAULT 'unknown' CHECK (status IN ('connected', 'degraded', 'disconnected', 'unknown')),
  last_check_at TIMESTAMPTZ,
  last_latency_ms INTEGER,
  last_error TEXT,
  consecutive_failures INTEGER DEFAULT 0,
  pool_min INTEGER DEFAULT 2,
  pool_max INTEGER DEFAULT 10,
  pool_increment INTEGER DEFAULT 1,
  tags TEXT[] DEFAULT '{}',
  labels JSONB DEFAULT '{}',
  change_log JSONB DEFAULT '[]',
  is_active BOOLEAN DEFAULT TRUE,
  created_by UUID,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMPTZ
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_conn_tenant_name ON connections(tenant_id, name) WHERE deleted_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_conn_tenant_env ON connections(tenant_id, environment);
CREATE INDEX IF NOT EXISTS idx_conn_status ON connections(status) WHERE is_active = TRUE;
ALTER TABLE connections ENABLE ROW LEVEL SECURITY;
CREATE POLICY conn_tenant_isolation ON connections USING (tenant_id::text = current_setting('app.current_tenant', true));
CREATE TRIGGER conn_updated_at BEFORE UPDATE ON connections FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- Environments
CREATE TABLE IF NOT EXISTS environments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  name VARCHAR(100) NOT NULL,
  type VARCHAR(20) NOT NULL CHECK (type IN ('dev', 'qa', 'staging', 'prod')),
  config JSONB DEFAULT '{}',
  status VARCHAR(20) DEFAULT 'ACTIVE',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_env_tenant_name ON environments(tenant_id, name);
ALTER TABLE environments ENABLE ROW LEVEL SECURITY;
CREATE POLICY env_tenant_isolation ON environments USING (tenant_id::text = current_setting('app.current_tenant', true));
CREATE TRIGGER env_updated_at BEFORE UPDATE ON environments FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- Editor Sessions
CREATE TABLE IF NOT EXISTS editor_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  user_id UUID NOT NULL REFERENCES users(id),
  connection_id UUID NOT NULL REFERENCES connections(id),
  component_type VARCHAR(50) NOT NULL,
  component_id VARCHAR(100) NOT NULL,
  mode VARCHAR(10) NOT NULL CHECK (mode IN ('view', 'edit')),
  draft_content TEXT,
  cursor_line INTEGER,
  cursor_column INTEGER,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  last_active_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  expires_at TIMESTAMPTZ
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_es_edit_lock ON editor_sessions(connection_id, component_type, component_id) WHERE mode = 'edit';
ALTER TABLE editor_sessions ENABLE ROW LEVEL SECURITY;
CREATE POLICY es_tenant_isolation ON editor_sessions USING (tenant_id::text = current_setting('app.current_tenant', true));

-- Change Log
CREATE TABLE IF NOT EXISTS change_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  connection_id UUID NOT NULL,
  component_type VARCHAR(50) NOT NULL,
  component_id VARCHAR(100) NOT NULL,
  component_name VARCHAR(200),
  app_id INTEGER,
  page_id INTEGER,
  code_before TEXT,
  code_after TEXT,
  diff TEXT,
  applied_by UUID,
  applied_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  source VARCHAR(20),
  ai_request_id UUID,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
ALTER TABLE change_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY cl_tenant_read ON change_log FOR SELECT USING (tenant_id::text = current_setting('app.current_tenant', true));
CREATE POLICY cl_tenant_insert ON change_log FOR INSERT WITH CHECK (tenant_id::text = current_setting('app.current_tenant', true));

-- AI Conversations
CREATE TABLE IF NOT EXISTS ai_conversations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  user_id UUID NOT NULL REFERENCES users(id),
  connection_id UUID,
  app_id INTEGER,
  page_id INTEGER,
  title VARCHAR(200),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  message_count INTEGER DEFAULT 0,
  total_tokens INTEGER DEFAULT 0
);
ALTER TABLE ai_conversations ENABLE ROW LEVEL SECURITY;
CREATE POLICY aic_tenant_isolation ON ai_conversations USING (tenant_id::text = current_setting('app.current_tenant', true));

-- AI Messages
CREATE TABLE IF NOT EXISTS ai_messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  conversation_id UUID NOT NULL REFERENCES ai_conversations(id) ON DELETE CASCADE,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  role VARCHAR(20) NOT NULL CHECK (role IN ('user', 'assistant', 'system')),
  content TEXT,
  action VARCHAR(50),
  tokens_input INTEGER,
  tokens_output INTEGER,
  model VARCHAR(50),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_aim_conv_created ON ai_messages(conversation_id, created_at);
ALTER TABLE ai_messages ENABLE ROW LEVEL SECURITY;
CREATE POLICY aim_tenant_isolation ON ai_messages USING (tenant_id::text = current_setting('app.current_tenant', true));

-- AI Token Usage
CREATE TABLE IF NOT EXISTS ai_token_usage (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  user_id UUID NOT NULL,
  conversation_id UUID REFERENCES ai_conversations(id),
  message_id UUID REFERENCES ai_messages(id),
  model VARCHAR(50),
  input_tokens INTEGER,
  output_tokens INTEGER,
  total_tokens INTEGER,
  estimated_cost_usd NUMERIC(10,6),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_atu_tenant_created ON ai_token_usage(tenant_id, created_at);
ALTER TABLE ai_token_usage ENABLE ROW LEVEL SECURITY;
CREATE POLICY atu_tenant_isolation ON ai_token_usage USING (tenant_id::text = current_setting('app.current_tenant', true));

-- PRD Sessions
CREATE TABLE IF NOT EXISTS prd_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  app_id INTEGER,
  title VARCHAR(200),
  status VARCHAR(20) DEFAULT 'draft' CHECK (status IN ('draft', 'ingesting', 'extracting', 'generating', 'validating', 'validated', 'exported')),
  current_stage INTEGER DEFAULT 1,
  extraction_data JSONB,
  validation_score NUMERIC,
  validation_blockers INTEGER DEFAULT 0,
  validation_warnings INTEGER DEFAULT 0,
  exported_at TIMESTAMPTZ,
  created_by UUID,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMPTZ
);
ALTER TABLE prd_sessions ENABLE ROW LEVEL SECURITY;
CREATE POLICY prd_tenant_isolation ON prd_sessions USING (tenant_id::text = current_setting('app.current_tenant', true));

-- Change Sets
CREATE TABLE IF NOT EXISTS change_sets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  connection_id UUID,
  name VARCHAR(200) NOT NULL,
  description TEXT,
  status VARCHAR(20) DEFAULT 'draft' CHECK (status IN ('draft', 'review', 'approved', 'applied', 'rejected')),
  objects JSONB DEFAULT '[]',
  conflict_count INTEGER DEFAULT 0,
  created_by UUID,
  approved_by UUID,
  applied_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
ALTER TABLE change_sets ENABLE ROW LEVEL SECURITY;
CREATE POLICY cs_tenant_isolation ON change_sets USING (tenant_id::text = current_setting('app.current_tenant', true));

-- Releases
CREATE TABLE IF NOT EXISTS releases (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  connection_id UUID,
  version VARCHAR(50),
  status VARCHAR(20) DEFAULT 'draft' CHECK (status IN ('draft', 'building', 'testing', 'staging', 'production', 'rolled_back')),
  pipeline JSONB DEFAULT '{}',
  change_set_ids UUID[] DEFAULT '{}',
  deployed_by UUID,
  deployed_at TIMESTAMPTZ,
  rolled_back_at TIMESTAMPTZ,
  rollback_reason TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
ALTER TABLE releases ENABLE ROW LEVEL SECURITY;
CREATE POLICY rel_tenant_isolation ON releases USING (tenant_id::text = current_setting('app.current_tenant', true));

-- AI Governance
CREATE TABLE IF NOT EXISTS ai_audit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  user_id UUID,
  conversation_id UUID,
  prompt_hash VARCHAR(64),
  prompt_risk_level VARCHAR(10),
  output_risk_level VARCHAR(10),
  blocked BOOLEAN DEFAULT FALSE,
  block_reason TEXT,
  model VARCHAR(50),
  tokens_used INTEGER,
  cost_usd NUMERIC(10,6),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
ALTER TABLE ai_audit_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY aal_tenant_isolation ON ai_audit_log USING (tenant_id::text = current_setting('app.current_tenant', true));

CREATE TABLE IF NOT EXISTS ai_safety_rules (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  rule_name VARCHAR(100) NOT NULL,
  pattern TEXT NOT NULL,
  action VARCHAR(10) DEFAULT 'warn' CHECK (action IN ('block', 'warn', 'log')),
  enabled BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
ALTER TABLE ai_safety_rules ENABLE ROW LEVEL SECURITY;
CREATE POLICY asr_tenant_isolation ON ai_safety_rules USING (tenant_id::text = current_setting('app.current_tenant', true));

-- Schema Snapshots
CREATE TABLE IF NOT EXISTS schema_snapshots (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  connection_id UUID,
  snapshot_data JSONB,
  tables_count INTEGER,
  views_count INTEGER,
  indexes_count INTEGER,
  created_by UUID,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
ALTER TABLE schema_snapshots ENABLE ROW LEVEL SECURITY;
CREATE POLICY ss_tenant_isolation ON schema_snapshots USING (tenant_id::text = current_setting('app.current_tenant', true));

-- Seed: demo tenant
INSERT INTO tenants (name, slug, plan, status, settings) VALUES
  ('APEX Demo', 'apex-demo', 'PROFESSIONAL', 'ACTIVE', '{"maxUsers": 50, "maxConnections": 10, "maxEnvironments": 4, "aiCreditsMonthly": 1000000, "features": ["ai-studio", "prd-builder", "change-manager"]}')
ON CONFLICT (slug) DO NOTHING;

-- Seed: admin user (password: Admin123!)
INSERT INTO users (tenant_id, email, password_hash, display_name, roles, is_active) VALUES
  ((SELECT id FROM tenants WHERE slug = 'apex-demo'), 'admin@apex.local', '$2b$12$LJ3m4ys3LQtFGBrMkEqXZeQY7QIj8Y0MHv2yL9bfGsYmJTl3VB6U6', 'Admin User', '{admin}', TRUE)
ON CONFLICT DO NOTHING;

SELECT 'Database initialized successfully!' AS result;
