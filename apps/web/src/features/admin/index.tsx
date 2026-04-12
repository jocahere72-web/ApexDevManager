import { useState, type CSSProperties } from 'react';
import { TenantManagement } from './components/TenantManagement';
import { SSOConfigPanel } from './components/SSOConfig';

const tabBarStyle: CSSProperties = {
  display: 'flex',
  borderBottom: '1px solid #e5e7eb',
  backgroundColor: '#f9fafb',
};

const tabBase: CSSProperties = {
  padding: '0.75rem 1.25rem',
  fontSize: '0.875rem',
  fontWeight: 500,
  border: 'none',
  cursor: 'pointer',
  borderBottom: '2px solid transparent',
  backgroundColor: 'transparent',
  color: '#6b7280',
};

const tabActive: CSSProperties = {
  ...tabBase,
  color: '#2563eb',
  borderBottomColor: '#2563eb',
};

type Tab = 'tenants' | 'sso';

export function AdminPage() {
  const [activeTab, setActiveTab] = useState<Tab>('tenants');

  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column' }}>
      <div style={tabBarStyle}>
        <button type="button" style={activeTab === 'tenants' ? tabActive : tabBase} onClick={() => setActiveTab('tenants')}>
          Tenant Management
        </button>
        <button type="button" style={activeTab === 'sso' ? tabActive : tabBase} onClick={() => setActiveTab('sso')}>
          SSO & Identity
        </button>
      </div>
      <div style={{ flex: 1, overflow: 'hidden' }}>
        {activeTab === 'tenants' ? <TenantManagement /> : <SSOConfigPanel />}
      </div>
    </div>
  );
}

export default AdminPage;
