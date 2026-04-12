import { useState } from 'react';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { TenantManagement } from './components/TenantManagement';
import { SSOConfigPanel } from './components/SSOConfig';
import { LLMProviders } from './components/LLMProviders';

type Tab = 'tenants' | 'sso' | 'llm-providers';

export function AdminPage() {
  const [activeTab, setActiveTab] = useState<Tab>('tenants');

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Administration"
        title="Admin Console"
        description="Manage tenants, identity, and access controls from one workspace."
      />
      <div className="app-tabs" role="tablist" aria-label="Admin sections">
        <button
          type="button"
          className={`app-tab${activeTab === 'tenants' ? ' app-tab-active' : ''}`}
          onClick={() => setActiveTab('tenants')}
        >
          Tenant Management
        </button>
        <button
          type="button"
          className={`app-tab${activeTab === 'sso' ? ' app-tab-active' : ''}`}
          onClick={() => setActiveTab('sso')}
        >
          SSO & Identity
        </button>
        <button
          type="button"
          className={`app-tab${activeTab === 'llm-providers' ? ' app-tab-active' : ''}`}
          onClick={() => setActiveTab('llm-providers')}
        >
          LLM Providers
        </button>
      </div>
      <div>
        {activeTab === 'tenants' && <TenantManagement />}
        {activeTab === 'sso' && <SSOConfigPanel />}
        {activeTab === 'llm-providers' && <LLMProviders />}
      </div>
    </AppPage>
  );
}

export default AdminPage;
