import { useState, useCallback, useEffect, useMemo } from 'react';
import type { TreeNode as TreeNodeData } from '@apex-dev-manager/shared-types';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { apiClient } from '@/lib/api-client';
import { useApplications, usePages, useComponents } from './hooks/useExplorer';
import { ApplicationExplorer } from './components/ApplicationExplorer';
import { ExplorerSearch } from './components/ExplorerSearch';
import { ComponentDetailPanel } from './components/ComponentDetailPanel';
import { TreeNode } from './components/TreeNode';

// ---------------------------------------------------------------------------
// Helper: build tree nodes from applications list
// ---------------------------------------------------------------------------

function appsToTreeNodes(
  apps: Array<{ id: string; name: string; applicationId: number }> | undefined,
): TreeNodeData[] {
  if (!apps) return [];
  return apps.map((app) => ({
    id: app.id,
    parentId: null,
    label: `${app.name} (${app.applicationId})`,
    nodeType: 'application' as const,
    data: app as TreeNodeData['data'],
    children: [],
    isLoading: false,
    isLoaded: false,
    isCached: false,
  }));
}

// ---------------------------------------------------------------------------
// ExplorerPage
// ---------------------------------------------------------------------------

export function ExplorerPage() {
  const [connections, setConnections] = useState<Array<{ id: string; name: string }>>([]);
  const [selectedConnectionId, setSelectedConnectionId] = useState('');
  const [selectedNode, setSelectedNode] = useState<TreeNodeData | null>(null);
  const [treeNodes, setTreeNodes] = useState<TreeNodeData[]>([]);

  // Fetch real connections on mount
  useEffect(() => {
    apiClient
      .get('/connections')
      .then((res) => {
        const items = res.data.data || [];
        setConnections(
          items.map((c: { id: string; name: string }) => ({ id: c.id, name: c.name })),
        );
      })
      .catch(() => {});
  }, []);

  const { data: applications } = useApplications(selectedConnectionId);

  // Rebuild root tree nodes when applications change
  const rootNodes = useMemo(() => appsToTreeNodes(applications), [applications]);

  // Merge server data with local tree state (preserve expanded children)
  const mergedNodes = useMemo(() => {
    if (rootNodes.length === 0) return treeNodes;
    // Keep existing expanded state for nodes we already have
    return rootNodes.map((serverNode) => {
      const existing = treeNodes.find((n) => n.id === serverNode.id);
      return existing ?? serverNode;
    });
  }, [rootNodes, treeNodes]);

  // -----------------------------------------------------------------------
  // Handlers
  // -----------------------------------------------------------------------

  const handleConnectionChange = useCallback((connId: string) => {
    setSelectedConnectionId(connId);
    setSelectedNode(null);
    setTreeNodes([]);
  }, []);

  const handleSelectNode = useCallback((node: TreeNodeData) => {
    setSelectedNode(node);
  }, []);

  const handleExpandNode = useCallback(
    (node: TreeNodeData) => {
      if (node.isLoaded) return;

      // Mark the node as loading
      setTreeNodes((prev) => prev.map((n) => (n.id === node.id ? { ...n, isLoading: true } : n)));

      // Fetch children based on node type
      if (node.nodeType === 'application' && selectedConnectionId) {
        apiClient
          .get(`/explorer/${selectedConnectionId}/applications/${node.id}/pages`)
          .then((res) => {
            const pages = res.data.data || res.data || [];
            const children: TreeNodeData[] = pages.map(
              (p: { id: string; name: string; pageId?: number }) => ({
                id: p.id,
                parentId: node.id,
                label: p.name,
                nodeType: 'page' as const,
                data: p as TreeNodeData['data'],
                children: [],
                isLoading: false,
                isLoaded: false,
                isCached: false,
              }),
            );
            setTreeNodes((prev) =>
              prev.map((n) =>
                n.id === node.id ? { ...n, children, isLoading: false, isLoaded: true } : n,
              ),
            );
          })
          .catch(() => {
            setTreeNodes((prev) =>
              prev.map((n) => (n.id === node.id ? { ...n, isLoading: false } : n)),
            );
          });
      } else if (node.nodeType === 'page' && selectedConnectionId) {
        apiClient
          .get(`/explorer/${selectedConnectionId}/pages/${node.id}/components`)
          .then((res) => {
            const components = res.data.data || res.data || [];
            const children: TreeNodeData[] = components.map(
              (c: { id: string; name: string; componentType?: string }) => ({
                id: c.id,
                parentId: node.id,
                label: c.name,
                nodeType: 'component' as const,
                data: c as TreeNodeData['data'],
                children: [],
                isLoading: false,
                isLoaded: true,
                isCached: false,
              }),
            );
            setTreeNodes((prev) =>
              prev.map((n) =>
                n.id === node.id ? { ...n, children, isLoading: false, isLoaded: true } : n,
              ),
            );
          })
          .catch(() => {
            setTreeNodes((prev) =>
              prev.map((n) => (n.id === node.id ? { ...n, isLoading: false } : n)),
            );
          });
      }
    },
    [selectedConnectionId],
  );

  const handleSearchNavigate = useCallback(
    (nodeId: string) => {
      // Find the node in the current tree (shallow search for now)
      function findNode(nodes: TreeNodeData[]): TreeNodeData | null {
        for (const n of nodes) {
          if (n.id === nodeId) return n;
          const found = findNode(n.children);
          if (found) return found;
        }
        return null;
      }
      const found = findNode(mergedNodes);
      if (found) {
        setSelectedNode(found);
      }
    },
    [mergedNodes],
  );

  const handleOpenInEditor = useCallback((node: TreeNodeData) => {
    // Placeholder – would integrate with the editor feature
    console.info('[Explorer] Open in editor:', node.id, node.label);
  }, []);

  // -----------------------------------------------------------------------
  // Render
  // -----------------------------------------------------------------------

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="APEX Explorer"
        title="Application Explorer"
        description="Browse APEX applications, pages and components from a selected connection."
      />
      <div className="app-workspace">
        {/* Left sidebar: connection selector + search */}
        <div className="app-workspace-sidebar">
          <ApplicationExplorer
            connections={connections}
            selectedConnectionId={selectedConnectionId}
            onConnectionChange={handleConnectionChange}
            selectedNodeId={selectedNode?.id ?? null}
            onSelectNode={handleSelectNode}
            onExpandNode={handleExpandNode}
            treeNodes={mergedNodes}
          />
          {selectedConnectionId && (
            <ExplorerSearch connectionId={selectedConnectionId} onNavigate={handleSearchNavigate} />
          )}
        </div>

        {/* Center: full tree view */}
        <div className="app-workspace-main">
          <div className="explorer-center-header">
            {selectedConnectionId
              ? `Explorer - ${connections.find((c) => c.id === selectedConnectionId)?.name ?? ''}`
              : 'Select a connection to explore'}
          </div>
          <div className="explorer-tree-area" role="tree" aria-label="Component tree">
            {mergedNodes.map((node) => (
              <TreeNode
                key={node.id}
                node={node}
                selectedId={selectedNode?.id ?? null}
                onSelect={handleSelectNode}
                onExpand={handleExpandNode}
              />
            ))}
            {mergedNodes.length === 0 && selectedConnectionId && (
              <p className="explorer-placeholder-text">
                No applications available.
              </p>
            )}
            {!selectedConnectionId && (
              <p className="explorer-placeholder-text">
                Choose a connection from the sidebar to get started.
              </p>
            )}
          </div>
        </div>

        {/* Right panel: component detail */}
        <div className="app-workspace-panel">
          <ComponentDetailPanel selectedNode={selectedNode} onOpenInEditor={handleOpenInEditor} />
        </div>
      </div>
    </AppPage>
  );
}

export default ExplorerPage;
