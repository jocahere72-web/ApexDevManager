import { useCallback } from 'react';
import type { EditorTab } from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

export interface EditorTabsProps {
  tabs: EditorTab[];
  activeTabId: string | null;
  onSelectTab: (tabId: string) => void;
  onCloseTab: (tabId: string) => void;
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function EditorTabs({
  tabs,
  activeTabId,
  onSelectTab,
  onCloseTab,
}: EditorTabsProps) {
  // ── Middle-click to close ─────────────────────────────────────────────

  const handleMouseDown = useCallback(
    (e: React.MouseEvent, tabId: string) => {
      // Middle mouse button
      if (e.button === 1) {
        e.preventDefault();
        onCloseTab(tabId);
      }
    },
    [onCloseTab],
  );

  if (tabs.length === 0) {
    return (
      <div className="flex h-9 items-center border-b border-neutral-700 bg-neutral-900 px-4 text-sm text-neutral-500">
        No files open
      </div>
    );
  }

  return (
    <div className="flex h-9 items-center gap-0 overflow-x-auto border-b border-neutral-700 bg-neutral-900">
      {tabs.map((tab) => {
        const isActive = tab.id === activeTabId;

        return (
          <div
            key={tab.id}
            role="tab"
            aria-selected={isActive}
            className={`
              group flex h-full min-w-0 max-w-[200px] cursor-pointer items-center gap-1.5
              border-r border-neutral-700 px-3 text-sm transition-colors
              ${isActive
                ? 'bg-neutral-800 text-white'
                : 'bg-neutral-900 text-neutral-400 hover:bg-neutral-850 hover:text-neutral-200'
              }
            `}
            onClick={() => onSelectTab(tab.id)}
            onMouseDown={(e) => handleMouseDown(e, tab.id)}
          >
            {/* Dirty indicator */}
            {tab.isDirty && (
              <span className="h-2 w-2 flex-shrink-0 rounded-full bg-blue-400" title="Unsaved changes" />
            )}

            {/* Tab label */}
            <span className="truncate">
              {tab.componentName}
            </span>

            {/* Mode badge */}
            {tab.mode === 'edit' && (
              <span className="ml-1 flex-shrink-0 rounded bg-amber-600/30 px-1 text-[10px] font-medium text-amber-300">
                EDIT
              </span>
            )}

            {/* Close button */}
            <button
              type="button"
              className="ml-1 flex-shrink-0 rounded p-0.5 text-neutral-500 opacity-0 transition-opacity hover:bg-neutral-700 hover:text-white group-hover:opacity-100"
              onClick={(e) => {
                e.stopPropagation();
                onCloseTab(tab.id);
              }}
              aria-label={`Close ${tab.componentName}`}
            >
              <svg className="h-3.5 w-3.5" viewBox="0 0 16 16" fill="currentColor">
                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
              </svg>
            </button>
          </div>
        );
      })}
    </div>
  );
}
