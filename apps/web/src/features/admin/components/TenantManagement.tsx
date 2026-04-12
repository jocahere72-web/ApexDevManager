import { useState, useCallback, type CSSProperties } from 'react';
import type {
  TenantOnboarding,
  TenantStatus,
  CreateTenantRequest,
  UpdateTenantConfigRequest,
} from '@apex-dev-manager/shared-types';
import * as adminApi from '@/services/admin.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  height: '100%',
  overflowY: 'auto',
};

const headerStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  marginBottom: '1.5rem',
};

const buttonStyle: CSSProperties = {
  padding: '0.5rem 1rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  backgroundColor: '#2563eb',
  color: '#fff',
};

const secondaryButton: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#f3f4f6',
  color: '#374151',
  border: '1px solid #d1d5db',
};

const dangerButton: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#ef4444',
};

const warningButton: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#eab308',
  color: '#1c1917',
};

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1.25rem',
  marginBottom: '0.75rem',
  backgroundColor: '#fff',
};

const inputStyle: CSSProperties = {
  width: '100%',
  padding: '0.5rem 0.75rem',
  fontSize: '0.875rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  marginBottom: '0.5rem',
  boxSizing: 'border-box' as const,
};

const selectStyle: CSSProperties = {
  ...inputStyle,
};

const labelStyle: CSSProperties = {
  display: 'block',
  fontSize: '0.8125rem',
  fontWeight: 500,
  color: '#374151',
  marginBottom: '0.25rem',
};

const badgeBase: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.5rem',
  borderRadius: '9999px',
  fontSize: '0.6875rem',
  fontWeight: 600,
};

const statusColors: Record<TenantStatus, { bg: string; color: string }> = {
  provisioning: { bg: '#dbeafe', color: '#1e40af' },
  active: { bg: '#dcfce7', color: '#166534' },
  suspended: { bg: '#fefce8', color: '#854d0e' },
  deleting: { bg: '#fef2f2', color: '#991b1b' },
  deleted: { bg: '#f3f4f6', color: '#6b7280' },
};

const quotaBarOuter: CSSProperties = {
  width: '100%',
  height: '0.375rem',
  backgroundColor: '#e5e7eb',
  borderRadius: '9999px',
  overflow: 'hidden',
};

const gridStyle: CSSProperties = {
  display: 'grid',
  gridTemplateColumns: 'repeat(auto-fill, minmax(150px, 1fr))',
  gap: '0.75rem',
  marginTop: '0.75rem',
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function TenantManagement() {
  const [tenants, setTenants] = useState<TenantOnboarding[]>([]);
  const [selectedTenant, setSelectedTenant] = useState<TenantOnboarding | null>(null);
  const [showCreateForm, setShowCreateForm] = useState(false);
  const [showConfigEditor, setShowConfigEditor] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Create form state
  const [formName, setFormName] = useState('');
  const [formSlug, setFormSlug] = useState('');
  const [formEmail, setFormEmail] = useState('');
  const [formPlan, setFormPlan] = useState<'free' | 'starter' | 'professional' | 'enterprise'>('starter');

  // Config editor state
  const [configName, setConfigName] = useState('');
  const [configPlan, setConfigPlan] = useState<'free' | 'starter' | 'professional' | 'enterprise'>('starter');

  const handleLoadTenant = useCallback(async (tenantId: string) => {
    setLoading(true);
    setError(null);
    try {
      const tenant = await adminApi.getTenantConfig(tenantId);
      setSelectedTenant(tenant);
      setConfigName(tenant.name);
      setConfigPlan(tenant.plan);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setLoading(false);
    }
  }, []);

  const handleCreate = useCallback(async () => {
    if (!formName || !formSlug || !formEmail) return;
    setError(null);
    try {
      const tenant = await adminApi.createTenant({
        name: formName,
        slug: formSlug,
        adminEmail: formEmail,
        plan: formPlan,
      });
      setTenants((prev) => [...prev, tenant]);
      setSelectedTenant(tenant);
      setShowCreateForm(false);
      setFormName('');
      setFormSlug('');
      setFormEmail('');
    } catch (err) {
      setError((err as Error).message);
    }
  }, [formName, formSlug, formEmail, formPlan]);

  const handleUpdateConfig = useCallback(async () => {
    if (!selectedTenant) return;
    setError(null);
    try {
      const updated = await adminApi.updateTenantConfig(selectedTenant.id, {
        name: configName,
        plan: configPlan,
      });
      setSelectedTenant(updated);
      setTenants((prev) => prev.map((t) => (t.id === updated.id ? updated : t)));
      setShowConfigEditor(false);
    } catch (err) {
      setError((err as Error).message);
    }
  }, [selectedTenant, configName, configPlan]);

  const handleSuspend = useCallback(async (tenantId: string) => {
    if (!confirm('Are you sure you want to suspend this tenant?')) return;
    setError(null);
    try {
      const updated = await adminApi.suspendTenant(tenantId);
      setSelectedTenant(updated);
      setTenants((prev) => prev.map((t) => (t.id === updated.id ? updated : t)));
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  const handleDelete = useCallback(async (tenantId: string) => {
    if (!confirm('WARNING: This will permanently delete all tenant data. Are you sure?')) return;
    if (!confirm('This action cannot be undone. Type the tenant ID to confirm.')) return;
    setError(null);
    try {
      await adminApi.deleteTenant(tenantId);
      setTenants((prev) => prev.filter((t) => t.id !== tenantId));
      setSelectedTenant(null);
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  const renderQuotaBar = (current: number, max: number, label: string) => {
    const percent = max > 0 ? Math.min((current / max) * 100, 100) : 0;
    const unlimited = max === -1;
    return (
      <div>
        <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '0.75rem', color: '#6b7280' }}>
          <span>{label}</span>
          <span>{unlimited ? `${current} / Unlimited` : `${current} / ${max}`}</span>
        </div>
        <div style={quotaBarOuter}>
          <div style={{
            width: unlimited ? '5%' : `${percent}%`,
            height: '100%',
            backgroundColor: percent > 90 ? '#ef4444' : percent > 70 ? '#eab308' : '#22c55e',
            borderRadius: '9999px',
          }} />
        </div>
      </div>
    );
  };

  return (
    <div style={containerStyle}>
      <div style={headerStyle}>
        <h2 style={{ fontSize: '1.25rem', fontWeight: 600, color: '#111827' }}>Tenant Management</h2>
        <button type="button" style={buttonStyle} onClick={() => setShowCreateForm(!showCreateForm)}>
          {showCreateForm ? 'Cancel' : 'Create Tenant'}
        </button>
      </div>

      {error && (
        <div style={{ padding: '0.75rem', backgroundColor: '#fef2f2', border: '1px solid #fecaca', borderRadius: '0.375rem', color: '#991b1b', marginBottom: '1rem', fontSize: '0.875rem' }}>
          {error}
        </div>
      )}

      {/* Create form */}
      {showCreateForm && (
        <div style={{ ...cardStyle, borderColor: '#2563eb' }}>
          <div style={{ fontWeight: 600, marginBottom: '0.75rem' }}>Create New Tenant</div>
          <label style={labelStyle}>Organization Name *</label>
          <input type="text" style={inputStyle} value={formName} onChange={(e) => setFormName(e.target.value)} placeholder="Acme Corp" />
          <label style={labelStyle}>Slug * (URL-friendly identifier)</label>
          <input type="text" style={inputStyle} value={formSlug} onChange={(e) => setFormSlug(e.target.value.toLowerCase().replace(/[^a-z0-9-]/g, '-'))} placeholder="acme-corp" />
          <label style={labelStyle}>Admin Email *</label>
          <input type="email" style={inputStyle} value={formEmail} onChange={(e) => setFormEmail(e.target.value)} placeholder="admin@acme.com" />
          <label style={labelStyle}>Plan</label>
          <select style={selectStyle} value={formPlan} onChange={(e) => setFormPlan(e.target.value as any)}>
            <option value="free">Free</option>
            <option value="starter">Starter</option>
            <option value="professional">Professional</option>
            <option value="enterprise">Enterprise</option>
          </select>
          <button type="button" style={buttonStyle} onClick={handleCreate} disabled={!formName || !formSlug || !formEmail}>
            Create Tenant
          </button>
        </div>
      )}

      {/* Tenant list */}
      {tenants.length === 0 && !selectedTenant ? (
        <div style={{ textAlign: 'center', padding: '2rem', color: '#6b7280' }}>
          No tenants loaded. Create a new tenant or enter a tenant ID to view.
          <div style={{ marginTop: '1rem', display: 'flex', gap: '0.5rem', justifyContent: 'center' }}>
            <input type="text" style={{ ...inputStyle, width: 300, marginBottom: 0 }} placeholder="Enter tenant ID" id="tenant-id-input" />
            <button type="button" style={secondaryButton} onClick={() => {
              const input = document.getElementById('tenant-id-input') as HTMLInputElement;
              if (input?.value) handleLoadTenant(input.value);
            }}>Load</button>
          </div>
        </div>
      ) : null}

      {tenants.map((tenant) => {
        const sColor = statusColors[tenant.status] ?? statusColors.active;
        return (
          <div key={tenant.id} style={{ ...cardStyle, cursor: 'pointer' }} onClick={() => setSelectedTenant(tenant)}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <div>
                <span style={{ fontWeight: 600, marginRight: '0.5rem' }}>{tenant.name}</span>
                <span style={{ ...badgeBase, backgroundColor: sColor.bg, color: sColor.color }}>{tenant.status}</span>
              </div>
              <span style={{ fontSize: '0.75rem', color: '#6b7280' }}>{tenant.plan} plan</span>
            </div>
          </div>
        );
      })}

      {/* Selected tenant detail */}
      {selectedTenant && (
        <div style={{ ...cardStyle, marginTop: '1rem', borderColor: '#2563eb' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1rem' }}>
            <div>
              <h3 style={{ fontSize: '1.125rem', fontWeight: 600 }}>{selectedTenant.name}</h3>
              <div style={{ fontSize: '0.8125rem', color: '#6b7280' }}>
                {selectedTenant.slug} | {selectedTenant.adminEmail}
              </div>
              <div style={{ marginTop: '0.25rem' }}>
                <span style={{ ...badgeBase, ...(statusColors[selectedTenant.status] ?? {}) }}>{selectedTenant.status}</span>
                <span style={{ marginLeft: '0.5rem', fontSize: '0.75rem', color: '#6b7280' }}>{selectedTenant.plan} plan</span>
              </div>
            </div>
            <div style={{ display: 'flex', gap: '0.5rem' }}>
              <button type="button" style={secondaryButton} onClick={() => setShowConfigEditor(!showConfigEditor)}>Edit Config</button>
              {selectedTenant.status === 'active' && (
                <button type="button" style={warningButton} onClick={() => handleSuspend(selectedTenant.id)}>Suspend</button>
              )}
              <button type="button" style={dangerButton} onClick={() => handleDelete(selectedTenant.id)}>Delete</button>
            </div>
          </div>

          {/* Config editor */}
          {showConfigEditor && (
            <div style={{ padding: '1rem', backgroundColor: '#f9fafb', borderRadius: '0.375rem', marginBottom: '1rem' }}>
              <div style={{ fontWeight: 500, marginBottom: '0.5rem' }}>Edit Configuration</div>
              <label style={labelStyle}>Name</label>
              <input type="text" style={inputStyle} value={configName} onChange={(e) => setConfigName(e.target.value)} />
              <label style={labelStyle}>Plan</label>
              <select style={selectStyle} value={configPlan} onChange={(e) => setConfigPlan(e.target.value as any)}>
                <option value="free">Free</option>
                <option value="starter">Starter</option>
                <option value="professional">Professional</option>
                <option value="enterprise">Enterprise</option>
              </select>
              <button type="button" style={buttonStyle} onClick={handleUpdateConfig}>Save Changes</button>
            </div>
          )}

          {/* Quotas */}
          <div style={{ fontWeight: 500, marginBottom: '0.5rem' }}>Resource Quotas</div>
          <div style={gridStyle}>
            {renderQuotaBar(selectedTenant.quota.currentUsers, selectedTenant.quota.maxUsers, 'Users')}
            {renderQuotaBar(selectedTenant.quota.currentConnections, selectedTenant.quota.maxConnections, 'Connections')}
            {renderQuotaBar(selectedTenant.quota.currentApps, selectedTenant.quota.maxApps, 'Applications')}
          </div>

          {/* Settings summary */}
          <div style={{ marginTop: '1rem', fontSize: '0.8125rem' }}>
            <div style={{ fontWeight: 500, marginBottom: '0.5rem' }}>Settings</div>
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '0.375rem', color: '#4b5563' }}>
              <div>SSO: <strong>{selectedTenant.ssoConfigured ? 'Configured' : 'Not configured'}</strong></div>
              <div>SCIM: <strong>{selectedTenant.scimConfigured ? 'Enabled' : 'Disabled'}</strong></div>
              <div>Timezone: <strong>{selectedTenant.settings.defaultTimezone}</strong></div>
              <div>Locale: <strong>{selectedTenant.settings.defaultLocale}</strong></div>
              <div>Enforce SSO: <strong>{selectedTenant.settings.enforceSSO ? 'Yes' : 'No'}</strong></div>
              <div>Public Signup: <strong>{selectedTenant.settings.allowPublicSignup ? 'Yes' : 'No'}</strong></div>
            </div>
          </div>

          {selectedTenant.provisionedAt && (
            <div style={{ marginTop: '0.75rem', fontSize: '0.75rem', color: '#9ca3af' }}>
              Provisioned: {new Date(selectedTenant.provisionedAt).toLocaleString()} | Created: {new Date(selectedTenant.createdAt).toLocaleString()}
            </div>
          )}
        </div>
      )}
    </div>
  );
}

export default TenantManagement;
