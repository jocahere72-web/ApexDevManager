import type { IssueSummary } from '@/services/issues.api';

interface IssueCardProps {
  issue: IssueSummary;
  isSelected?: boolean;
  onClick: (issue: IssueSummary) => void;
}

const PRIORITY_COLORS: Record<string, { bg: string; text: string }> = {
  critical: { bg: '#fef2f2', text: '#dc2626' },
  high: { bg: '#fff7ed', text: '#ea580c' },
  medium: { bg: '#eff6ff', text: '#2563eb' },
  low: { bg: '#f3f4f6', text: '#6b7280' },
};

const TYPE_ICONS: Record<string, string> = {
  feature: '\u2B50',
  bug: '\uD83D\uDC1B',
  enhancement: '\u2728',
  task: '\uD83D\uDCCB',
};

export default function IssueCard({ issue, isSelected, onClick }: IssueCardProps) {
  const priority = PRIORITY_COLORS[issue.priority] ?? PRIORITY_COLORS.medium;
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
      style={{
        backgroundColor: isSelected ? '#eff6ff' : '#ffffff',
        border: isSelected ? '1px solid #3b82f6' : '1px solid #e5e7eb',
        borderRadius: '8px',
        padding: '12px',
        cursor: 'pointer',
        transition: 'border-color 0.15s, box-shadow 0.15s',
        boxShadow: isSelected
          ? '0 0 0 2px rgba(59,130,246,0.15)'
          : '0 1px 2px rgba(0,0,0,0.04)',
      }}
      onMouseEnter={(e) => {
        if (!isSelected) {
          (e.currentTarget as HTMLDivElement).style.borderColor = '#93c5fd';
        }
      }}
      onMouseLeave={(e) => {
        if (!isSelected) {
          (e.currentTarget as HTMLDivElement).style.borderColor = '#e5e7eb';
        }
      }}
    >
      {/* Code */}
      <div
        style={{
          fontSize: '0.7rem',
          fontWeight: 700,
          color: '#374151',
          fontFamily: 'monospace',
          marginBottom: '4px',
        }}
      >
        {issue.code}
      </div>

      {/* Title */}
      <div
        style={{
          fontSize: '0.82rem',
          color: '#111827',
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

      {/* Bottom row: badges + avatar */}
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          gap: '6px',
        }}
      >
        <div style={{ display: 'flex', gap: '4px', flexWrap: 'wrap' }}>
          {/* Priority badge */}
          <span
            style={{
              fontSize: '0.6rem',
              fontWeight: 600,
              padding: '1px 6px',
              borderRadius: '9999px',
              backgroundColor: priority.bg,
              color: priority.text,
              textTransform: 'uppercase',
              letterSpacing: '0.03em',
            }}
          >
            {issue.priority}
          </span>

          {/* Type badge */}
          <span
            style={{
              fontSize: '0.65rem',
              padding: '1px 5px',
              borderRadius: '9999px',
              backgroundColor: '#f3f4f6',
              color: '#4b5563',
            }}
          >
            {typeIcon} {issue.type}
          </span>
        </div>

        {/* Assignee avatar */}
        {initials ? (
          <div
            title={issue.assignedToName ?? ''}
            style={{
              width: '22px',
              height: '22px',
              borderRadius: '50%',
              backgroundColor: '#6366f1',
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
              borderRadius: '50%',
              backgroundColor: '#e5e7eb',
              color: '#9ca3af',
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
