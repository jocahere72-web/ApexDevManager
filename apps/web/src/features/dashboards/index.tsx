import { useState } from 'react';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { OverviewDashboard } from './components/OverviewDashboard';
import { IncidentManager } from './components/IncidentManager';

type Tab = 'overview' | 'incidents';

export function DashboardsPage() {
  const [activeTab, setActiveTab] = useState<Tab>('overview');

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Operations"
        title="Dashboards"
        description="Monitor system health, activity, and incident response signals."
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
