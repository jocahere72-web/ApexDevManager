import { useState } from 'react';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { TenantManagement } from './components/TenantManagement';
import { SSOConfigPanel } from './components/SSOConfig';
import { LLMProviders } from './components/LLMProviders';
import { PromptTemplates } from './components/PromptTemplates';
import { ProcessParams } from './components/ProcessParams';

type Tab = 'tenants' | 'sso' | 'llm-providers' | 'prompt-templates' | 'process-params';

export function AdminPage() {
  const [activeTab, setActiveTab] = useState<Tab>('tenants');
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('admin.eyebrow')}
        title={t('admin.title')}
        description={t('admin.description')}
      />
      <div className="app-tabs" role="tablist" aria-label="Admin sections">
        <button
          type="button"
          className={`app-tab${activeTab === 'tenants' ? ' app-tab-active' : ''}`}
          onClick={() => setActiveTab('tenants')}
        >
          {t('admin.tenants')}
        </button>
        <button
          type="button"
          className={`app-tab${activeTab === 'sso' ? ' app-tab-active' : ''}`}
          onClick={() => setActiveTab('sso')}
        >
          {t('admin.sso')}
        </button>
        <button
          type="button"
          className={`app-tab${activeTab === 'llm-providers' ? ' app-tab-active' : ''}`}
          onClick={() => setActiveTab('llm-providers')}
        >
          {t('admin.llmProviders')}
        </button>
        <button
          type="button"
          className={`app-tab${activeTab === 'prompt-templates' ? ' app-tab-active' : ''}`}
          onClick={() => setActiveTab('prompt-templates')}
        >
          {t('admin.promptTemplates')}
        </button>
        <button
          type="button"
          className={`app-tab${activeTab === 'process-params' ? ' app-tab-active' : ''}`}
          onClick={() => setActiveTab('process-params')}
        >
          {t('processParams.title')}
        </button>
      </div>
      <div>
        {activeTab === 'tenants' && <TenantManagement />}
        {activeTab === 'sso' && <SSOConfigPanel />}
        {activeTab === 'llm-providers' && <LLMProviders />}
        {activeTab === 'prompt-templates' && <PromptTemplates />}
        {activeTab === 'process-params' && <ProcessParams />}
      </div>
    </AppPage>
  );
}

export default AdminPage;
