import { useState, useCallback, type CSSProperties } from 'react';
import type { TreeNode as TreeNodeData, SyncFreshness } from '@apex-dev-manager/shared-types';
import { useApplications, useSyncStatus, useSyncConnection } from '../hooks/useExplorer';
import { useOfflineMode } from '../hooks/useOfflineMode';
import { TreeNode } from './TreeNode';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const panelStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  height: '100%',
  backgroundColor: '#f9fafb',
  borderRight: '1px solid #e5e7eb',
  overflow: 'hidden',
};

const headerStyle: CSSProperties = {
  padding: '0.75rem 1rem',
  borderBottom: '1px solid #e5e7eb',
  display: 'flex',
  flexDirection: 'column',
  gap: 8,
};

const selectStyle: CSSProperties = {
  width: '100%',
  padding: '0.375rem 0.5rem',
  fontSize: '0.8125rem',
  border: '1px solid #d1d5db',
  borderRadius: 6,
  backgroundColor: '#ffffff',
  outline: 'none',
};

const treeContainerStyle: CSSProperties = {
  flex: 1,
  overflowY: 'auto',
  padding: '0.5rem 0.25rem',
};

// ---------------------------------------------------------------------------
// Sync status badge
// ---------------------------------------------------------------------------

const FRESHNESS_COLORS: Record<SyncFreshness, { bg: string; fg: string; label: string }> = {
  fresh: { bg: '#d1fae5', fg: '#065f46', label: 'Synced' },
  stale: { bg: '#fef3c7', fg: '#92400e', label: 'Stale' },
  syncing: { bg: '#dbeafe', fg: '#1e40af', label: 'Syncing...' },
  error: { bg: '#fee2e2', fg: '#991b1b', label: 'Sync error' },
};

function SyncBadge({ freshness, onSync }: { freshness: SyncFreshness; onSync: () => void }) {
  const { bg, fg, label } = FRESHNESS_COLORS[freshness];
  return (
    <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
      <span
        style={{
          fontSize: '0.6875rem',
          padding: '2px 8px',
          borderRadius: 9999,
          backgroundColor: bg,
          color: fg,
          fontWeight: 500,
        }}
      >
        {label}
      </span>
      {freshness !== 'syncing' && (
        <button
          onClick={onSync}
          style={{
            fontSize: '0.6875rem',
            color: '#6b7280',
            background: 'none',
            border: 'none',
            cursor: 'pointer',
            textDecoration: 'underline',
            padding: 0,
          }}
        >
          Sync now
        </button>
      )}
    </div>
  );
}

// ---------------------------------------------------------------------------
// Offline banner
// ---------------------------------------------------------------------------

function OfflineBanner() {
  return (
    <div
      style={{
        backgroundColor: '#fef3c7',
        color: '#92400e',
        fontSize: '0.75rem',
        padding: '6px 12px',
        textAlign: 'center',
        fontWeight: 500,
      }}
    >
      You are offline. Showing cached data.
    </div>
  );
}

// ---------------------------------------------------------------------------
// ApplicationExplorer
// ---------------------------------------------------------------------------

export interface ApplicationExplorerProps {
  /** Available connection IDs to choose from */
  connections: Array<{ id: string; name: string }>;
  selectedConnectionId: string;
  onConnectionChange: (connectionId: string) => void;
  /** Currently selected node id in the tree */
  selectedNodeId: string | null;
  onSelectNode: (node: TreeNodeData) => void;
  onExpandNode: (node: TreeNodeData) => void;
  /** Root-level tree nodes (applications) */
  treeNodes: TreeNodeData[];
}

export function ApplicationExplorer({
  connections,
  selectedConnectionId,
  onConnectionChange,
  selectedNodeId,
  onSelectNode,
  onExpandNode,
  treeNodes,
}: ApplicationExplorerProps) {
  const { data: syncStatus } = useSyncStatus(selectedConnectionId);
  const { mutate: triggerSync } = useSyncConnection();
  const { isOffline } = useOfflineMode(selectedConnectionId);

  const handleSync = useCallback(() => {
    if (selectedConnectionId) {
      triggerSync(selectedConnectionId);
    }
  }, [selectedConnectionId, triggerSync]);

  const freshness: SyncFreshness = syncStatus?.freshness ?? 'stale';

  return (
    <div style={panelStyle}>
      {/* Offline banner */}
      {isOffline && <OfflineBanner />}

      {/* Header: connection selector + sync status */}
      <div style={headerStyle}>
        <select
          value={selectedConnectionId}
          onChange={(e) => onConnectionChange(e.target.value)}
          style={selectStyle}
          aria-label="Select connection"
        >
          <option value="" disabled>
            Select a connection...
          </option>
          {connections.map((c) => (
            <option key={c.id} value={c.id}>
              {c.name}
            </option>
          ))}
        </select>

        {selectedConnectionId && <SyncBadge freshness={freshness} onSync={handleSync} />}
      </div>

      {/* Tree */}
      <div style={treeContainerStyle} role="tree" aria-label="Application explorer">
        {treeNodes.length === 0 && selectedConnectionId && (
          <p style={{ color: '#9ca3af', fontSize: '0.8125rem', textAlign: 'center', marginTop: 24 }}>
            No applications found.
          </p>
        )}
        {treeNodes.map((node) => (
          <TreeNode
            key={node.id}
            node={node}
            selectedId={selectedNodeId}
            onSelect={onSelectNode}
            onExpand={onExpandNode}
          />
        ))}
      </div>
    </div>
  );
}

export default ApplicationExplorer;
