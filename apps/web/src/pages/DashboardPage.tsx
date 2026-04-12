import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
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
  const { t } = useTranslation();
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
        if (issuesData?.data) setRecentIssues(issuesData.data);
      } finally {
        if (!cancelled) setLoading(false);
      }
    }

    load();
    return () => { cancelled = true; };
  }, []);

  const firstName = user?.displayName?.split(' ')[0] ?? 'there';

  const byStatus = stats?.byStatus ?? {};
  const summaryCards = stats
    ? [
        { label: t('dashboard.totalIssues'), value: stats.total ?? 0, tone: 'accent' as const },
        {
          label: t('dashboard.inProgress'),
          value: (byStatus.build ?? 0) + (byStatus.review ?? 0) + (byStatus.test ?? 0),
          tone: 'warning' as const,
        },
        { label: t('dashboard.done'), value: byStatus.done ?? 0, tone: 'success' as const },
      ]
    : null;

  return (
    <AppPage>
      <AppPageHeader
        eyebrow={t('dashboard.eyebrow')}
        title={t('dashboard.greeting', { name: firstName })}
        description={t('dashboard.description')}
        actions={
          <>
            <Link className="app-button app-button-primary" to="/connections">
              {t('dashboard.newConnection')}
            </Link>
            <Link className="app-button" to="/explorer">
              {t('dashboard.openExplorer')}
            </Link>
          </>
        }
      />

      {loading && (
        <div className="app-alert">{t('dashboard.loading')}</div>
      )}

      {summaryCards && (
        <div className="app-grid app-grid-3">
          {summaryCards.map((card) => (
            <div className="app-card app-card-pad" key={card.label}>
              <p className="app-eyebrow">{card.label}</p>
              <p className="app-page-title">{card.value}</p>
              <AppStatusPill tone={card.tone}>
                {card.tone === 'accent' ? t('dashboard.all') : card.tone === 'warning' ? t('dashboard.active') : t('dashboard.completed')}
              </AppStatusPill>
            </div>
          ))}
        </div>
      )}

      {recentIssues.length > 0 && (
        <div className="app-stack app-mt">
          <h2 className="app-card-title">{t('dashboard.recentIssues')}</h2>
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
            <h2 className="app-card-title">{t('dashboard.noIssues')}</h2>
            <p className="app-card-meta">
              {t('dashboard.noIssuesDesc')}
            </p>
          </div>
        </div>
      )}
    </AppPage>
  );
}

export default DashboardPage;
