import { ISSUE_STATUSES, STATUS_LABELS, type IssueStatus } from '@/services/issues.api';

interface IssuePipelineProps {
  currentStatus: IssueStatus;
}

export default function IssuePipeline({ currentStatus }: IssuePipelineProps) {
  const currentIndex = ISSUE_STATUSES.indexOf(currentStatus);

  return (
    <div style={{ display: 'flex', alignItems: 'center', gap: 0, width: '100%' }}>
      {ISSUE_STATUSES.map((status, index) => {
        const isCompleted = index < currentIndex;
        const isCurrent = index === currentIndex;
        const isFuture = index > currentIndex;

        let dotColor = 'var(--app-border-strong)';
        let lineColor = 'var(--app-border-strong)';
        let labelColor = 'var(--app-muted)';
        if (isCompleted) {
          dotColor = 'var(--app-success)';
          lineColor = 'var(--app-success)';
          labelColor = 'var(--app-success)';
        } else if (isCurrent) {
          dotColor = 'var(--app-accent)';
          labelColor = 'var(--app-accent-strong)';
        }
        void isFuture;

        return (
          <div
            key={status}
            style={{
              display: 'flex',
              alignItems: 'center',
              flex: index < ISSUE_STATUSES.length - 1 ? 1 : 0,
            }}
          >
            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
              <div
                style={{
                  width: isCurrent ? '14px' : '10px',
                  height: isCurrent ? '14px' : '10px',
                  borderRadius: '50%',
                  backgroundColor: dotColor,
                  border: isCurrent ? '2px solid var(--app-accent-soft)' : 'none',
                  flexShrink: 0,
                  transition: 'all 0.2s',
                }}
              />
              <span
                style={{
                  fontSize: '0.55rem',
                  fontWeight: isCurrent ? 700 : 500,
                  color: labelColor,
                  marginTop: '4px',
                  textTransform: 'uppercase',
                  letterSpacing: '0.03em',
                  whiteSpace: 'nowrap',
                }}
              >
                {STATUS_LABELS[status]}
              </span>
            </div>
            {index < ISSUE_STATUSES.length - 1 && (
              <div
                style={{
                  flex: 1,
                  height: '2px',
                  backgroundColor: isCompleted ? lineColor : 'var(--app-border)',
                  marginLeft: '4px',
                  marginRight: '4px',
                  marginBottom: '18px',
                }}
              />
            )}
          </div>
        );
      })}
    </div>
  );
}
