import { useState, type CSSProperties } from 'react';
import { OverviewDashboard } from './components/OverviewDashboard';
import { IncidentManager } from './components/IncidentManager';

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

type Tab = 'overview' | 'incidents';

export function DashboardsPage() {
  const [activeTab, setActiveTab] = useState<Tab>('overview');

  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column' }}>
      <div style={tabBarStyle}>
        <button type="button" style={activeTab === 'overview' ? tabActive : tabBase} onClick={() => setActiveTab('overview')}>
          Overview
        </button>
        <button type="button" style={activeTab === 'incidents' ? tabActive : tabBase} onClick={() => setActiveTab('incidents')}>
          Incidents
        </button>
      </div>
      <div style={{ flex: 1, overflow: 'hidden' }}>
        {activeTab === 'overview' ? <OverviewDashboard /> : <IncidentManager />}
      </div>
    </div>
  );
}

export default DashboardsPage;
