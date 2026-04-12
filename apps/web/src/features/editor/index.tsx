import { useState, useCallback, useEffect } from 'react';
import { useSearchParams } from 'react-router-dom';
import type { EditorTab, ComponentType, LockStatus } from '@apex-dev-manager/shared-types';
import MonacoEditorWrapper from './components/MonacoEditorWrapper';
import EditorTabs from './components/EditorTabs';
import ChangeLogPanel from './components/ChangeLogPanel';
import DiffViewer from './components/DiffViewer';
import {
  useComponentSource,
  useChangeLog,
  useOpenSession,
  useSaveDraft,
  useApplyCode,
  useFormatCode,
  useReleaseSession,
} from './hooks/useEditor';

// ---------------------------------------------------------------------------
// Editor Page
// ---------------------------------------------------------------------------

export default function EditorPage() {
  const [searchParams] = useSearchParams();

  // URL-driven initial component
  const initialConnectionId = searchParams.get('connectionId') ?? '';
  const initialComponentType = (searchParams.get('componentType') ?? 'package_body') as ComponentType;
  const initialComponentId = searchParams.get('componentId') ?? '';

  // ── Tab state ─────────────────────────────────────────────────────────

  const [tabs, setTabs] = useState<EditorTab[]>([]);
  const [activeTabId, setActiveTabId] = useState<string | null>(null);
  const [showChangeLog, setShowChangeLog] = useState(true);
  const [showDiff, setShowDiff] = useState(false);
  const [changeLogPage, setChangeLogPage] = useState(0);

  const activeTab = tabs.find((t) => t.id === activeTabId) ?? null;

  // ── Queries & mutations ───────────────────────────────────────────────

  const sourceQuery = useComponentSource(
    activeTab?.connectionId ?? initialConnectionId,
    activeTab?.componentType ?? initialComponentType,
    activeTab?.componentId ?? initialComponentId,
  );

  const changeLogQuery = useChangeLog(
    activeTab?.connectionId ?? initialConnectionId,
    activeTab?.componentType ?? initialComponentType,
    activeTab?.componentId ?? initialComponentId,
    20,
    changeLogPage * 20,
  );

  const openSessionMutation = useOpenSession();
  const saveDraftMutation = useSaveDraft();
  const applyCodeMutation = useApplyCode();
  const formatCodeMutation = useFormatCode();
  const releaseSessionMutation = useReleaseSession();

  // ── Lock status derived from session ──────────────────────────────────

  const lockStatus: LockStatus = activeTab?.sessionId
    ? { isLocked: true, lockedBy: null, lockedByName: null, sessionId: activeTab.sessionId, expiresAt: null }
    : { isLocked: false, lockedBy: null, lockedByName: null, sessionId: null, expiresAt: null };

  // ── Open initial tab from URL params ──────────────────────────────────

  useEffect(() => {
    if (initialConnectionId && initialComponentId && tabs.length === 0 && sourceQuery.data) {
      const tab: EditorTab = {
        id: `${initialConnectionId}:${initialComponentType}:${initialComponentId}`,
        sessionId: null,
        connectionId: initialConnectionId,
        componentType: initialComponentType,
        componentId: initialComponentId,
        componentName: sourceQuery.data.componentName,
        mode: 'view',
        content: sourceQuery.data.source,
        originalContent: sourceQuery.data.source,
        isDirty: false,
        cursorLine: 1,
        cursorColumn: 1,
      };

      setTabs([tab]);
      setActiveTabId(tab.id);
    }
  }, [initialConnectionId, initialComponentId, initialComponentType, sourceQuery.data, tabs.length]);

  // ── Tab handlers ──────────────────────────────────────────────────────

  const handleSelectTab = useCallback((tabId: string) => {
    setActiveTabId(tabId);
    setChangeLogPage(0);
  }, []);

  const handleCloseTab = useCallback(
    (tabId: string) => {
      const tab = tabs.find((t) => t.id === tabId);
      if (tab?.sessionId) {
        releaseSessionMutation.mutate(tab.sessionId);
      }

      setTabs((prev) => {
        const filtered = prev.filter((t) => t.id !== tabId);
        if (activeTabId === tabId && filtered.length > 0) {
          setActiveTabId(filtered[filtered.length - 1].id);
        } else if (filtered.length === 0) {
          setActiveTabId(null);
        }
        return filtered;
      });
    },
    [tabs, activeTabId, releaseSessionMutation],
  );

  // ── Editor handlers ───────────────────────────────────────────────────

  const handleContentChange = useCallback(
    (newContent: string) => {
      if (!activeTabId) return;
      setTabs((prev) =>
        prev.map((t) =>
          t.id === activeTabId
            ? { ...t, content: newContent, isDirty: newContent !== t.originalContent }
            : t,
        ),
      );
    },
    [activeTabId],
  );

  const handleSave = useCallback(() => {
    if (!activeTab?.sessionId || !activeTab.isDirty) return;

    saveDraftMutation.mutate({
      sessionId: activeTab.sessionId,
      draftContent: activeTab.content,
      cursorLine: activeTab.cursorLine,
      cursorColumn: activeTab.cursorColumn,
    });
  }, [activeTab, saveDraftMutation]);

  const handleFormat = useCallback(() => {
    if (!activeTab) return;

    formatCodeMutation.mutate(
      { source: activeTab.content, language: 'plsql' },
      {
        onSuccess: (result) => {
          if (result.changed) {
            handleContentChange(result.formatted);
          }
        },
      },
    );
  }, [activeTab, formatCodeMutation, handleContentChange]);

  const handleApply = useCallback(() => {
    if (!activeTab?.sessionId) return;

    applyCodeMutation.mutate({
      sessionId: activeTab.sessionId,
      code: activeTab.content,
      connectionId: activeTab.connectionId,
      componentType: activeTab.componentType,
      componentId: activeTab.componentId,
      componentName: activeTab.componentName,
      source: 'manual',
    }, {
      onSuccess: () => {
        // Mark the tab as clean and update original content
        setTabs((prev) =>
          prev.map((t) =>
            t.id === activeTabId
              ? { ...t, originalContent: t.content, isDirty: false, sessionId: null, mode: 'view' as const }
              : t,
          ),
        );
      },
    });
  }, [activeTab, activeTabId, applyCodeMutation]);

  const handleToggleEdit = useCallback(() => {
    if (!activeTab) return;

    if (activeTab.mode === 'view') {
      // Open edit session
      openSessionMutation.mutate(
        {
          connectionId: activeTab.connectionId,
          componentType: activeTab.componentType,
          componentId: activeTab.componentId,
          mode: 'edit',
        },
        {
          onSuccess: (session) => {
            setTabs((prev) =>
              prev.map((t) =>
                t.id === activeTabId
                  ? { ...t, mode: 'edit' as const, sessionId: session.id }
                  : t,
              ),
            );
          },
        },
      );
    } else {
      // Release lock and go to view
      if (activeTab.sessionId) {
        releaseSessionMutation.mutate(activeTab.sessionId);
      }
      setTabs((prev) =>
        prev.map((t) =>
          t.id === activeTabId
            ? { ...t, mode: 'view' as const, sessionId: null }
            : t,
        ),
      );
    }
  }, [activeTab, activeTabId, openSessionMutation, releaseSessionMutation]);

  // ── Render ────────────────────────────────────────────────────────────

  return (
    <div className="flex h-full flex-col bg-neutral-950 text-white">
      {/* Toolbar */}
      <div className="flex items-center gap-2 border-b border-neutral-700 bg-neutral-900 px-4 py-1.5">
        <h1 className="mr-4 text-sm font-semibold text-neutral-300">Code Editor</h1>

        {/* Lock status indicator */}
        <div className="flex items-center gap-1.5 text-xs">
          {lockStatus.isLocked ? (
            <span className="flex items-center gap-1 rounded bg-amber-700/30 px-2 py-0.5 text-amber-300">
              <svg className="h-3 w-3" viewBox="0 0 16 16" fill="currentColor">
                <path d="M8 1a3 3 0 0 0-3 3v2H4a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1h-1V4a3 3 0 0 0-3-3zm2 5V4a2 2 0 1 0-4 0v2h4z" />
              </svg>
              Editing
            </span>
          ) : (
            <span className="flex items-center gap-1 rounded bg-neutral-700/50 px-2 py-0.5 text-neutral-400">
              <svg className="h-3 w-3" viewBox="0 0 16 16" fill="currentColor">
                <path d="M11 1a2 2 0 0 0-2 2v1H4a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1h-1V3a2 2 0 0 0-2-2z" />
              </svg>
              View Only
            </span>
          )}
        </div>

        <div className="flex-1" />

        {/* Action buttons */}
        <button
          type="button"
          className="rounded bg-neutral-700 px-3 py-1 text-xs font-medium text-neutral-200 transition-colors hover:bg-neutral-600 disabled:opacity-50"
          onClick={handleToggleEdit}
          disabled={!activeTab}
        >
          {activeTab?.mode === 'edit' ? 'Switch to View' : 'Edit'}
        </button>

        <button
          type="button"
          className="rounded bg-neutral-700 px-3 py-1 text-xs font-medium text-neutral-200 transition-colors hover:bg-neutral-600 disabled:opacity-50"
          onClick={handleSave}
          disabled={!activeTab?.isDirty || !activeTab?.sessionId}
        >
          Save Draft
        </button>

        <button
          type="button"
          className="rounded bg-neutral-700 px-3 py-1 text-xs font-medium text-neutral-200 transition-colors hover:bg-neutral-600 disabled:opacity-50"
          onClick={handleFormat}
          disabled={!activeTab}
        >
          Format
        </button>

        <button
          type="button"
          className="rounded bg-blue-600 px-3 py-1 text-xs font-medium text-white transition-colors hover:bg-blue-500 disabled:opacity-50"
          onClick={handleApply}
          disabled={!activeTab?.sessionId || !activeTab?.isDirty}
        >
          Apply
        </button>

        <div className="mx-2 h-5 w-px bg-neutral-700" />

        <button
          type="button"
          className={`rounded px-3 py-1 text-xs font-medium transition-colors ${
            showDiff
              ? 'bg-purple-600/30 text-purple-300'
              : 'bg-neutral-700 text-neutral-200 hover:bg-neutral-600'
          }`}
          onClick={() => setShowDiff(!showDiff)}
          disabled={!activeTab}
        >
          View Diff
        </button>

        <button
          type="button"
          className={`rounded px-3 py-1 text-xs font-medium transition-colors ${
            showChangeLog
              ? 'bg-green-600/30 text-green-300'
              : 'bg-neutral-700 text-neutral-200 hover:bg-neutral-600'
          }`}
          onClick={() => setShowChangeLog(!showChangeLog)}
        >
          History
        </button>
      </div>

      {/* Tabs */}
      <EditorTabs
        tabs={tabs}
        activeTabId={activeTabId}
        onSelectTab={handleSelectTab}
        onCloseTab={handleCloseTab}
      />

      {/* Main content area */}
      <div className="flex flex-1 overflow-hidden">
        {/* Editor / Diff */}
        <div className="flex flex-1 flex-col overflow-hidden">
          {activeTab ? (
            showDiff ? (
              <DiffViewer
                original={activeTab.originalContent}
                modified={activeTab.content}
              />
            ) : (
              <MonacoEditorWrapper
                value={activeTab.content}
                onChange={handleContentChange}
                readOnly={activeTab.mode === 'view'}
                onSave={handleSave}
                onFormat={handleFormat}
              />
            )
          ) : (
            <div className="flex flex-1 items-center justify-center text-neutral-500">
              <div className="text-center">
                <p className="text-lg font-medium">No file open</p>
                <p className="mt-1 text-sm">
                  Open a component from the Explorer to start editing.
                </p>
              </div>
            </div>
          )}
        </div>

        {/* Change log panel */}
        {showChangeLog && activeTab && (
          <div className="w-80 flex-shrink-0 border-l border-neutral-700 bg-neutral-900">
            <ChangeLogPanel
              entries={changeLogQuery.data?.entries ?? []}
              total={changeLogQuery.data?.total ?? 0}
              isLoading={changeLogQuery.isLoading}
              hasMore={
                (changeLogQuery.data?.entries.length ?? 0) <
                (changeLogQuery.data?.total ?? 0)
              }
              onLoadMore={() => setChangeLogPage((p) => p + 1)}
            />
          </div>
        )}
      </div>
    </div>
  );
}
