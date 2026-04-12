import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import {
  AppPage,
  AppPageHeader,
  AppStatusPill,
} from '@/components/ui/AppTemplate';
import {
  fetchIssueStats,
  fetchIssues,
  STATUS_LABELS,
  type IssueStats,
  type IssueSummary,
  type IssueStatus,
} from '@/services/issues.api';
import { useAuth } from '@/hooks/useAuth';

const PRIORITY_TONE: Record<string, 'danger' | 'warning' | 'accent' | 'neutral'> = {
  critical: 'danger',
  high: 'warning',
  medium: 'accent',
  low: 'neutral',
};

const STATUS_TONE: Record<string, 'success' | 'warning' | 'accent' | 'neutral'> = {
  done: 'success',
  deploy: 'warning',
  build: 'accent',
  review: 'accent',
  test: 'warning',
};

function DashboardPage() {
  const { user } = useAuth();
  const [stats, setStats] = useState<IssueStats | null>(null);
  const [recentIssues, setRecentIssues] = useState<IssueSummary[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let cancelled = false;

    async function load() {
      try {
        const [statsData, issuesData] = await Promise.all([
          fetchIssueStats().catch(() => null),
          fetchIssues({ page: 1, pageSize: 8 }).catch(() => null),
        ]);

        if (cancelled) return;

        if (statsData) setStats(statsData);
        if (issuesData) setRecentIssues(issuesData.data);
      } finally {
        if (!cancelled) setLoading(false);
      }
    }

    load();
    return () => { cancelled = true; };
  }, []);

  const firstName = user?.displayName?.split(' ')[0] ?? 'there';

  const summaryCards = stats
    ? [
        { label: 'Total Issues', value: stats.total, tone: 'accent' as const },
        {
          label: 'In Progress',
          value: (stats.byStatus.build ?? 0) + (stats.byStatus.review ?? 0) + (stats.byStatus.test ?? 0),
          tone: 'warning' as const,
        },
        { label: 'Done', value: stats.byStatus.done ?? 0, tone: 'success' as const },
      ]
    : null;

  return (
    <AppPage>
      <AppPageHeader
        eyebrow="Workspace"
        title={`Welcome back, ${firstName}`}
        description="Your delivery overview. Start with a connection, open the Explorer, then move through editor, documentation, tests, and release workflows."
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

      {loading && (
        <div className="app-alert">Loading dashboard data...</div>
      )}

      {summaryCards && (
        <div className="app-grid app-grid-3">
          {summaryCards.map((card) => (
            <div className="app-card app-card-pad" key={card.label}>
              <p className="app-eyebrow">{card.label}</p>
              <p className="app-page-title">{card.value}</p>
              <AppStatusPill tone={card.tone}>
                {card.tone === 'accent' ? 'All' : card.tone === 'warning' ? 'Active' : 'Completed'}
              </AppStatusPill>
            </div>
          ))}
        </div>
      )}

      {recentIssues.length > 0 && (
        <div className="app-stack app-mt">
          <h2 className="app-card-title">Recent Issues</h2>
          <div className="app-stack">
            {recentIssues.map((issue) => (
              <Link
                key={issue.id}
                to={`/issues?id=${issue.id}`}
                className="app-list-card"
              >
                <div>
                  <p className="app-card-title">{issue.code} - {issue.title}</p>
                  <p className="app-card-meta">
                    {issue.clientName}
                    {issue.assignedToName ? ` \u00B7 ${issue.assignedToName}` : ''}
                  </p>
                </div>
                <div className="app-toolbar">
                  <AppStatusPill tone={STATUS_TONE[issue.status] ?? 'neutral'}>
                    {STATUS_LABELS[issue.status as IssueStatus] ?? issue.status}
                  </AppStatusPill>
                  <AppStatusPill tone={PRIORITY_TONE[issue.priority] ?? 'neutral'}>
                    {issue.priority}
                  </AppStatusPill>
                </div>
              </Link>
            ))}
          </div>
        </div>
      )}

      {!loading && recentIssues.length === 0 && (
        <div className="app-empty app-mt">
          <div>
            <h2 className="app-card-title">No issues yet</h2>
            <p className="app-card-meta">
              Create your first issue from the{' '}
              <Link to="/issues" className="app-nav-link-active">Issues</Link>{' '}
              page to get started.
            </p>
          </div>
        </div>
      )}
    </AppPage>
  );
}

export default DashboardPage;
