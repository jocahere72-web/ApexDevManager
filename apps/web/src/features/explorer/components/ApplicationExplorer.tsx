import { useState, useCallback } from 'react';
import type { TreeNode as TreeNodeData, SyncFreshness } from '@apex-dev-manager/shared-types';
import { useApplications, useSyncStatus, useSyncConnection } from '../hooks/useExplorer';
import { useOfflineMode } from '../hooks/useOfflineMode';
import { TreeNode } from './TreeNode';

// ---------------------------------------------------------------------------
// Sync status badge
// ---------------------------------------------------------------------------

const FRESHNESS_TONE: Record<SyncFreshness, 'success' | 'warning' | 'accent' | 'danger'> = {
  fresh: 'success',
  stale: 'warning',
  syncing: 'accent',
  error: 'danger',
};

const FRESHNESS_LABEL: Record<SyncFreshness, string> = {
  fresh: 'Synced',
  stale: 'Stale',
  syncing: 'Syncing...',
  error: 'Sync error',
};

function SyncBadge({ freshness, onSync }: { freshness: SyncFreshness; onSync: () => void }) {
  return (
    <div className="explorer-sync-row">
      <span className={`app-status-pill app-status-${FRESHNESS_TONE[freshness]}`}>
        {FRESHNESS_LABEL[freshness]}
      </span>
      {freshness !== 'syncing' && (
        <button onClick={onSync} className="explorer-sync-button">
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
    <div className="app-alert app-alert-danger explorer-offline-banner">
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
    <div className="explorer-sidebar-panel">
      {/* Offline banner */}
      {isOffline && <OfflineBanner />}

      {/* Header: connection selector + sync status */}
      <div className="explorer-sidebar-header">
        <select
          value={selectedConnectionId}
          onChange={(e) => onConnectionChange(e.target.value)}
          className="app-select"
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
      <div className="explorer-tree-container" role="tree" aria-label="Application explorer">
        {treeNodes.length === 0 && selectedConnectionId && (
          <p className="explorer-placeholder-text">
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
