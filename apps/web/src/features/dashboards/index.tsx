import { useState } from 'react';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { OverviewDashboard } from './components/OverviewDashboard';
import { IncidentManager } from './components/IncidentManager';

type Tab = 'overview' | 'incidents';

export function DashboardsPage() {
  const [activeTab, setActiveTab] = useState<Tab>('overview');
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('observability.eyebrow')}
        title={t('observability.title')}
        description={t('observability.description')}
      />
      <div className="app-tabs" role="tablist" aria-label="Dashboard sections">
        <button
          type="button"
          className={`app-tab${activeTab === 'overview' ? ' app-tab-active' : ''}`}
          onClick={() => setActiveTab('overview')}
        >
          Overview
        </button>
        <button
          type="button"
          className={`app-tab${activeTab === 'incidents' ? ' app-tab-active' : ''}`}
          onClick={() => setActiveTab('incidents')}
        >
          Incidents
        </button>
      </div>
      <div>{activeTab === 'overview' ? <OverviewDashboard /> : <IncidentManager />}</div>
    </AppPage>
  );
}

export default DashboardsPage;
