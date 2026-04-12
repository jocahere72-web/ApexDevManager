import { AppStatusPill } from '@/components/ui/AppTemplate';
import type { IssueSummary } from '@/services/issues.api';

interface IssueCardProps {
  issue: IssueSummary;
  isSelected?: boolean;
  onClick: (issue: IssueSummary) => void;
}

const TYPE_ICONS: Record<string, string> = {
  feature: '\u2B50',
  bug: '\uD83D\uDC1B',
  enhancement: '\u2728',
  task: '\uD83D\uDCCB',
};

export default function IssueCard({ issue, isSelected, onClick }: IssueCardProps) {
  const typeIcon = TYPE_ICONS[issue.type] ?? '\uD83D\uDCCB';

  const initials = issue.assignedToName
    ? issue.assignedToName
        .split(' ')
        .map((w) => w[0])
        .join('')
        .toUpperCase()
        .slice(0, 2)
    : null;

  return (
    <div
      onClick={() => onClick(issue)}
      className="app-card app-card-pad"
      style={{
        borderColor: isSelected ? 'var(--app-accent)' : 'var(--app-border)',
        cursor: 'pointer',
        boxShadow: isSelected ? '0 0 0 2px var(--app-accent-soft)' : undefined,
      }}
    >
      <div
        style={{
          fontSize: '0.7rem',
          fontWeight: 700,
          color: 'var(--app-muted)',
          fontFamily: 'monospace',
          marginBottom: '4px',
        }}
      >
        {issue.code}
      </div>

      <div
        style={{
          fontSize: '0.82rem',
          color: 'var(--app-text)',
          marginBottom: '8px',
          lineHeight: 1.35,
          overflow: 'hidden',
          textOverflow: 'ellipsis',
          display: '-webkit-box',
          WebkitLineClamp: 2,
          WebkitBoxOrient: 'vertical',
        }}
      >
        {issue.title}
      </div>

      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          gap: '6px',
        }}
      >
        <div style={{ display: 'flex', gap: '4px', flexWrap: 'wrap' }}>
          <AppStatusPill
            tone={issue.priority === 'critical' || issue.priority === 'high' ? 'danger' : 'accent'}
          >
            {issue.priority}
          </AppStatusPill>

          <AppStatusPill>
            {typeIcon} {issue.type}
          </AppStatusPill>
        </div>

        {initials ? (
          <div
            title={issue.assignedToName ?? ''}
            style={{
              width: '22px',
              height: '22px',
              borderRadius: 'var(--app-radius-sm)',
              backgroundColor: 'var(--app-accent)',
              color: '#ffffff',
              fontSize: '0.55rem',
              fontWeight: 700,
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              flexShrink: 0,
            }}
          >
            {initials}
          </div>
        ) : (
          <div
            title="Unassigned"
            style={{
              width: '22px',
              height: '22px',
              borderRadius: 'var(--app-radius-sm)',
              backgroundColor: 'var(--app-soft)',
              color: 'var(--app-muted)',
              fontSize: '0.55rem',
              fontWeight: 600,
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              flexShrink: 0,
            }}
          >
            --
          </div>
        )}
      </div>
    </div>
  );
}
