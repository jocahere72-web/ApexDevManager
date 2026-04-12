import { useState } from 'react';
import type { ChangeLogEntry } from '@apex-dev-manager/shared-types';
import DiffViewer from './DiffViewer';

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

export interface ChangeLogPanelProps {
  entries: ChangeLogEntry[];
  total: number;
  isLoading: boolean;
  onLoadMore?: () => void;
  hasMore: boolean;
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function formatTimestamp(iso: string): string {
  const d = new Date(iso);
  return d.toLocaleString(undefined, {
    month: 'short',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });
}

function truncateDiff(diff: string | null, maxLines = 4): string {
  if (!diff) return '(no diff)';
  const lines = diff.split('\n');
  if (lines.length <= maxLines) return diff;
  return lines.slice(0, maxLines).join('\n') + '\n...';
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function ChangeLogPanel({
  entries,
  total,
  isLoading,
  onLoadMore,
  hasMore,
}: ChangeLogPanelProps) {
  const [expandedId, setExpandedId] = useState<string | null>(null);

  if (isLoading && entries.length === 0) {
    return (
      <div className="flex h-full items-center justify-center text-sm text-neutral-500">
        Loading change history...
      </div>
    );
  }

  if (entries.length === 0) {
    return (
      <div className="flex h-full items-center justify-center text-sm text-neutral-500">
        No changes recorded for this component.
      </div>
    );
  }

  return (
    <div className="flex h-full flex-col overflow-hidden">
      {/* Header */}
      <div className="flex items-center justify-between border-b border-neutral-700 px-3 py-1.5">
        <span className="text-xs font-semibold uppercase tracking-wider text-neutral-400">
          Change History
        </span>
        <span className="text-xs text-neutral-500">{total} total</span>
      </div>

      {/* Entries list */}
      <div className="flex-1 overflow-y-auto">
        {entries.map((entry) => {
          const isExpanded = expandedId === entry.id;

          return (
            <div key={entry.id} className="border-b border-neutral-800">
              {/* Entry summary row */}
              <button
                type="button"
                className="flex w-full items-center gap-2 px-3 py-2 text-left text-sm transition-colors hover:bg-neutral-800/50"
                onClick={() => setExpandedId(isExpanded ? null : entry.id)}
              >
                {/* Expand/collapse indicator */}
                <svg
                  className={`h-3 w-3 flex-shrink-0 text-neutral-500 transition-transform ${isExpanded ? 'rotate-90' : ''}`}
                  viewBox="0 0 16 16"
                  fill="currentColor"
                >
                  <path d="M6 4l4 4-4 4V4z" />
                </svg>

                {/* Timestamp */}
                <span className="flex-shrink-0 text-xs text-neutral-400">
                  {formatTimestamp(entry.appliedAt)}
                </span>

                {/* Source badge */}
                <span
                  className={`flex-shrink-0 rounded px-1 text-[10px] font-medium ${
                    entry.source === 'ai'
                      ? 'bg-purple-600/30 text-purple-300'
                      : 'bg-blue-600/30 text-blue-300'
                  }`}
                >
                  {entry.source === 'ai' ? 'AI' : 'Manual'}
                </span>

                {/* Diff preview */}
                <span className="min-w-0 flex-1 truncate font-mono text-xs text-neutral-500">
                  {truncateDiff(entry.diff, 1)}
                </span>
              </button>

              {/* Expanded diff view */}
              {isExpanded && (
                <div className="border-t border-neutral-800">
                  <div style={{ height: 300 }}>
                    <DiffViewer
                      original={entry.codeBefore ?? ''}
                      modified={entry.codeAfter ?? ''}
                    />
                  </div>
                </div>
              )}
            </div>
          );
        })}

        {/* Load more */}
        {hasMore && (
          <div className="flex justify-center py-2">
            <button
              type="button"
              className="rounded px-3 py-1 text-xs text-neutral-400 transition-colors hover:bg-neutral-800 hover:text-white"
              onClick={onLoadMore}
              disabled={isLoading}
            >
              {isLoading ? 'Loading...' : 'Load more'}
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
