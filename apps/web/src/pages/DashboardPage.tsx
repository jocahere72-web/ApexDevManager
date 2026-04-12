import {
  AppCard,
  AppEmptyState,
  AppPage,
  AppPageHeader,
  AppStatusPill,
  AppToolbar,
} from '@/components/ui/AppTemplate';
import { Link } from 'react-router-dom';

const focusAreas = [
  { label: 'Connect', value: 'APEX workspaces', tone: 'accent' as const },
  { label: 'Inspect', value: 'Schemas and apps', tone: 'success' as const },
  { label: 'Ship', value: 'Changes and releases', tone: 'warning' as const },
];

function DashboardPage() {
  return (
    <AppPage>
      <AppPageHeader
        eyebrow="Workspace"
        title="Build, inspect, and ship APEX work from one clean surface."
        description="Start with a connection, open the Explorer, then move through editor, documentation, tests, and release workflows without losing context."
        actions={
          <>
            <Link className="app-button app-button-primary" to="/connections">
              New connection
            </Link>
            <Link className="app-button" to="/explorer">
              Open Explorer
            </Link>
          </>
        }
      />

      <div className="app-grid app-grid-3">
        {focusAreas.map((area) => (
          <AppCard key={area.label}>
            <AppToolbar>
              <AppStatusPill tone={area.tone}>{area.label}</AppStatusPill>
            </AppToolbar>
            <h2 style={{ margin: '16px 0 6px', fontSize: '1.25rem' }}>{area.value}</h2>
            <p style={{ margin: 0, color: 'var(--app-muted)', lineHeight: 1.55 }}>
              Keep the next action visible, remove visual noise, and preserve room for data-heavy work.
            </p>
          </AppCard>
        ))}
      </div>

      <div style={{ marginTop: 18 }}>
        <AppEmptyState>
          <div>
            <h2 style={{ margin: '0 0 8px', color: 'var(--app-text)' }}>Template ready</h2>
            <p style={{ margin: 0, maxWidth: 620 }}>
              Use `AppPage`, `AppPageHeader`, `AppCard`, `AppToolbar`, and the `.app-*` CSS classes as the base for every module.
            </p>
          </div>
        </AppEmptyState>
      </div>
    </AppPage>
  );
}

export default DashboardPage;
