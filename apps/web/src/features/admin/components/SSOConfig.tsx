import { useState, useEffect, useCallback, type CSSProperties } from 'react';
import type {
  SSOConfig as SSOConfigType,
  SCIMConfig,
  SSOTestResult,
  ConfigureSAMLRequest,
  ConfigureSCIMRequest,
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

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1.25rem',
  marginBottom: '1.5rem',
  backgroundColor: '#fff',
};

const inputStyle: CSSProperties = {
  width: '100%',
  padding: '0.5rem 0.75rem',
  fontSize: '0.875rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  marginBottom: '0.75rem',
  boxSizing: 'border-box' as const,
};

const textareaStyle: CSSProperties = {
  ...inputStyle,
  minHeight: 120,
  resize: 'vertical' as const,
  fontFamily: 'ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace',
  fontSize: '0.8125rem',
};

const labelStyle: CSSProperties = {
  display: 'block',
  fontSize: '0.8125rem',
  fontWeight: 500,
  color: '#374151',
  marginBottom: '0.25rem',
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

const sectionTitle: CSSProperties = {
  fontSize: '1rem',
  fontWeight: 600,
  color: '#111827',
  marginBottom: '0.75rem',
};

const statusIndicator = (success: boolean): CSSProperties => ({
  display: 'inline-flex',
  alignItems: 'center',
  gap: '0.375rem',
  padding: '0.375rem 0.75rem',
  borderRadius: '9999px',
  fontSize: '0.8125rem',
  fontWeight: 500,
  backgroundColor: success ? '#dcfce7' : '#fef2f2',
  color: success ? '#166534' : '#991b1b',
});

const checkboxLabelStyle: CSSProperties = {
  display: 'flex',
  alignItems: 'center',
  gap: '0.5rem',
  fontSize: '0.875rem',
  color: '#374151',
  marginBottom: '0.5rem',
  cursor: 'pointer',
};

const selectStyle: CSSProperties = {
  ...inputStyle,
  width: 'auto',
  minWidth: 160,
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function SSOConfigPanel() {
  const [ssoConfig, setSSOConfig] = useState<SSOConfigType | null>(null);
  const [scimConfig, setSCIMConfig] = useState<SCIMConfig | null>(null);
  const [testResult, setTestResult] = useState<SSOTestResult | null>(null);
  const [loading, setLoading] = useState(true);
  const [testing, setTesting] = useState(false);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // SAML form state
  const [issuer, setIssuer] = useState('');
  const [ssoUrl, setSsoUrl] = useState('');
  const [certificate, setCertificate] = useState('');
  const [entityId, setEntityId] = useState('');
  const [nameIdFormat, setNameIdFormat] = useState('urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress');
  const [allowIdpInitiated, setAllowIdpInitiated] = useState(false);
  const [signRequests, setSignRequests] = useState(true);

  // SCIM form state
  const [scimEnabled, setScimEnabled] = useState(false);
  const [syncUsers, setSyncUsers] = useState(true);
  const [syncGroups, setSyncGroups] = useState(false);
  const [defaultRole, setDefaultRole] = useState('developer');

  useEffect(() => {
    loadConfig();
  }, []);

  const loadConfig = useCallback(async () => {
    setLoading(true);
    try {
      const config = await adminApi.getSSOConfig();
      setSSOConfig(config.sso);
      setSCIMConfig(config.scim);

      // Populate form from existing config
      if (config.sso) {
        setIssuer(config.sso.issuer);
        setSsoUrl(config.sso.ssoUrl);
        setCertificate(config.sso.certificate);
        setEntityId(config.sso.entityId);
        setNameIdFormat(config.sso.nameIdFormat);
        setAllowIdpInitiated(config.sso.allowIdpInitiated);
        setSignRequests(config.sso.signRequests);
      }

      if (config.scim) {
        setScimEnabled(config.scim.enabled);
        setSyncUsers(config.scim.syncUsers);
        setSyncGroups(config.scim.syncGroups);
        setDefaultRole(config.scim.defaultRole);
      }
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setLoading(false);
    }
  }, []);

  const handleSaveSAML = useCallback(async () => {
    if (!issuer || !ssoUrl || !certificate || !entityId) return;
    setSaving(true);
    setError(null);
    try {
      const config = await adminApi.configureSAML({
        issuer,
        ssoUrl,
        certificate,
        entityId,
        nameIdFormat,
        allowIdpInitiated,
        signRequests,
      });
      setSSOConfig(config);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setSaving(false);
    }
  }, [issuer, ssoUrl, certificate, entityId, nameIdFormat, allowIdpInitiated, signRequests]);

  const handleSaveSCIM = useCallback(async () => {
    setSaving(true);
    setError(null);
    try {
      const config = await adminApi.configureSCIM({
        enabled: scimEnabled,
        syncUsers,
        syncGroups,
        defaultRole,
      });
      setSCIMConfig(config);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setSaving(false);
    }
  }, [scimEnabled, syncUsers, syncGroups, defaultRole]);

  const handleTestConnection = useCallback(async () => {
    setTesting(true);
    setTestResult(null);
    setError(null);
    try {
      const result = await adminApi.testSSOConnection();
      setTestResult(result);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setTesting(false);
    }
  }, []);

  if (loading) {
    return (
      <div style={containerStyle}>
        <div style={{ textAlign: 'center', padding: '3rem', color: '#6b7280' }}>Loading SSO configuration...</div>
      </div>
    );
  }

  return (
    <div style={containerStyle}>
      <h2 style={{ fontSize: '1.25rem', fontWeight: 600, color: '#111827', marginBottom: '1.5rem' }}>
        SSO & Identity Configuration
      </h2>

      {error && (
        <div style={{ padding: '0.75rem', backgroundColor: '#fef2f2', border: '1px solid #fecaca', borderRadius: '0.375rem', color: '#991b1b', marginBottom: '1rem', fontSize: '0.875rem' }}>
          {error}
        </div>
      )}

      {/* SSO Status */}
      <div style={{ display: 'flex', gap: '1rem', marginBottom: '1.5rem' }}>
        <span style={statusIndicator(!!ssoConfig?.enabled)}>
          <span style={{ width: 8, height: 8, borderRadius: '50%', backgroundColor: ssoConfig?.enabled ? '#22c55e' : '#ef4444' }} />
          SSO: {ssoConfig?.enabled ? 'Active' : 'Not Configured'}
        </span>
        <span style={statusIndicator(!!scimConfig?.enabled)}>
          <span style={{ width: 8, height: 8, borderRadius: '50%', backgroundColor: scimConfig?.enabled ? '#22c55e' : '#ef4444' }} />
          SCIM: {scimConfig?.enabled ? 'Active' : 'Disabled'}
        </span>
        {testResult && (
          <span style={statusIndicator(testResult.success)}>
            Test: {testResult.success ? 'Passed' : 'Failed'}
          </span>
        )}
      </div>

      {/* SAML Configuration */}
      <div style={cardStyle}>
        <div style={sectionTitle}>SAML 2.0 Configuration</div>

        <label style={labelStyle}>Issuer (Identity Provider Entity ID) *</label>
        <input type="text" style={inputStyle} value={issuer} onChange={(e) => setIssuer(e.target.value)} placeholder="https://idp.example.com/metadata" />

        <label style={labelStyle}>SSO URL (Single Sign-On Service URL) *</label>
        <input type="text" style={inputStyle} value={ssoUrl} onChange={(e) => setSsoUrl(e.target.value)} placeholder="https://idp.example.com/sso" />

        <label style={labelStyle}>Entity ID (Service Provider) *</label>
        <input type="text" style={inputStyle} value={entityId} onChange={(e) => setEntityId(e.target.value)} placeholder="https://apexdev.example.com/saml/metadata" />

        <label style={labelStyle}>X.509 Certificate (PEM format) *</label>
        <textarea style={textareaStyle} value={certificate} onChange={(e) => setCertificate(e.target.value)} placeholder="-----BEGIN CERTIFICATE-----&#10;...&#10;-----END CERTIFICATE-----" />

        <label style={labelStyle}>Name ID Format</label>
        <select style={{ ...selectStyle, width: '100%' }} value={nameIdFormat} onChange={(e) => setNameIdFormat(e.target.value)}>
          <option value="urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress">Email Address</option>
          <option value="urn:oasis:names:tc:SAML:2.0:nameid-format:persistent">Persistent</option>
          <option value="urn:oasis:names:tc:SAML:2.0:nameid-format:transient">Transient</option>
        </select>

        <div style={{ marginTop: '0.5rem' }}>
          <label style={checkboxLabelStyle}>
            <input type="checkbox" checked={allowIdpInitiated} onChange={(e) => setAllowIdpInitiated(e.target.checked)} />
            Allow IdP-initiated SSO
          </label>
          <label style={checkboxLabelStyle}>
            <input type="checkbox" checked={signRequests} onChange={(e) => setSignRequests(e.target.checked)} />
            Sign authentication requests
          </label>
        </div>

        <div style={{ display: 'flex', gap: '0.5rem', marginTop: '0.5rem' }}>
          <button type="button" style={buttonStyle} onClick={handleSaveSAML} disabled={saving || !issuer || !ssoUrl || !certificate || !entityId}>
            {saving ? 'Saving...' : 'Save SAML Configuration'}
          </button>
          <button type="button" style={secondaryButton} onClick={handleTestConnection} disabled={testing || !ssoConfig}>
            {testing ? 'Testing...' : 'Test Connection'}
          </button>
        </div>

        {/* Test result */}
        {testResult && (
          <div style={{ marginTop: '0.75rem', padding: '0.75rem', backgroundColor: testResult.success ? '#f0fdf4' : '#fef2f2', borderRadius: '0.375rem', fontSize: '0.8125rem' }}>
            <div style={{ fontWeight: 500, color: testResult.success ? '#166534' : '#991b1b', marginBottom: '0.25rem' }}>
              {testResult.success ? 'Connection Successful' : 'Connection Failed'}
            </div>
            <div style={{ color: '#4b5563' }}>{testResult.message}</div>
            <div style={{ fontSize: '0.75rem', color: '#9ca3af', marginTop: '0.25rem' }}>
              Tested at: {new Date(testResult.testedAt).toLocaleString()}
            </div>
          </div>
        )}
      </div>

      {/* SCIM Configuration */}
      <div style={cardStyle}>
        <div style={sectionTitle}>SCIM User Provisioning</div>

        <label style={checkboxLabelStyle}>
          <input type="checkbox" checked={scimEnabled} onChange={(e) => setScimEnabled(e.target.checked)} />
          Enable SCIM provisioning
        </label>

        {scimEnabled && (
          <>
            <label style={checkboxLabelStyle}>
              <input type="checkbox" checked={syncUsers} onChange={(e) => setSyncUsers(e.target.checked)} />
              Sync users from IdP
            </label>
            <label style={checkboxLabelStyle}>
              <input type="checkbox" checked={syncGroups} onChange={(e) => setSyncGroups(e.target.checked)} />
              Sync groups from IdP
            </label>

            <label style={labelStyle}>Default role for provisioned users</label>
            <select style={selectStyle} value={defaultRole} onChange={(e) => setDefaultRole(e.target.value)}>
              <option value="viewer">Viewer</option>
              <option value="developer">Developer</option>
              <option value="tech_lead">Tech Lead</option>
              <option value="admin">Admin</option>
            </select>

            {scimConfig && (
              <div style={{ marginTop: '0.75rem', padding: '0.75rem', backgroundColor: '#f9fafb', borderRadius: '0.375rem', fontSize: '0.8125rem' }}>
                <div style={{ fontWeight: 500, marginBottom: '0.25rem' }}>SCIM Endpoint</div>
                <code style={{ fontSize: '0.75rem', color: '#4b5563' }}>{scimConfig.endpoint}</code>
                <div style={{ marginTop: '0.5rem', display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '0.25rem', color: '#6b7280' }}>
                  <span>Status: <strong>{scimConfig.status}</strong></span>
                  <span>Synced Users: <strong>{scimConfig.syncedUsers}</strong></span>
                  <span>Synced Groups: <strong>{scimConfig.syncedGroups}</strong></span>
                  {scimConfig.lastSyncAt && <span>Last Sync: {new Date(scimConfig.lastSyncAt).toLocaleString()}</span>}
                </div>
              </div>
            )}
          </>
        )}

        <button type="button" style={{ ...buttonStyle, marginTop: '0.75rem' }} onClick={handleSaveSCIM} disabled={saving}>
          {saving ? 'Saving...' : 'Save SCIM Configuration'}
        </button>
      </div>
    </div>
  );
}

export default SSOConfigPanel;
