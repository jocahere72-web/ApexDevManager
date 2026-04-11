import { useState, useCallback, type CSSProperties, type ReactNode } from 'react';
import type { TreeNode as TreeNodeData, TreeNodeType } from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Icons per node type (lightweight inline SVG strings)
// ---------------------------------------------------------------------------

const ICONS: Record<TreeNodeType, ReactNode> = {
  workspace: /* folder-root */ (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#6366f1" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M4 20h16a2 2 0 002-2V8a2 2 0 00-2-2h-7.93a2 2 0 01-1.66-.9l-.82-1.2A2 2 0 007.93 3H4a2 2 0 00-2 2v13a2 2 0 002 2z" />
    </svg>
  ),
  application: /* folder */ (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#f59e0b" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M4 20h16a2 2 0 002-2V8a2 2 0 00-2-2h-7.93a2 2 0 01-1.66-.9l-.82-1.2A2 2 0 007.93 3H4a2 2 0 00-2 2v13a2 2 0 002 2z" />
    </svg>
  ),
  page: /* file */ (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#3b82f6" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z" />
      <polyline points="14 2 14 8 20 8" />
    </svg>
  ),
  region: /* grid */ (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#10b981" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <rect x="3" y="3" width="7" height="7" />
      <rect x="14" y="3" width="7" height="7" />
      <rect x="14" y="14" width="7" height="7" />
      <rect x="3" y="14" width="7" height="7" />
    </svg>
  ),
  item: /* input (text-cursor) */ (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#8b5cf6" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <rect x="3" y="3" width="18" height="18" rx="2" />
      <path d="M9 3v18" />
    </svg>
  ),
  process: /* zap */ (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#ef4444" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2" />
    </svg>
  ),
  dynamic_action: /* bolt */ (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#f97316" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z" />
    </svg>
  ),
};

// ---------------------------------------------------------------------------
// Loading skeleton
// ---------------------------------------------------------------------------

function LoadingSkeleton() {
  return (
    <div style={{ paddingLeft: 24 }}>
      {[1, 2, 3].map((i) => (
        <div
          key={i}
          style={{
            height: 20,
            marginBottom: 6,
            borderRadius: 4,
            background: 'linear-gradient(90deg, #e5e7eb 25%, #f3f4f6 50%, #e5e7eb 75%)',
            backgroundSize: '200% 100%',
            animation: 'shimmer 1.5s infinite',
          }}
        />
      ))}
      <style>{`@keyframes shimmer { 0% { background-position: 200% 0; } 100% { background-position: -200% 0; } }`}</style>
    </div>
  );
}

// ---------------------------------------------------------------------------
// TreeNode component
// ---------------------------------------------------------------------------

export interface TreeNodeProps {
  node: TreeNodeData;
  depth?: number;
  selectedId: string | null;
  onSelect: (node: TreeNodeData) => void;
  onExpand: (node: TreeNodeData) => void;
}

export function TreeNode({ node, depth = 0, selectedId, onSelect, onExpand }: TreeNodeProps) {
  const [expanded, setExpanded] = useState(false);
  const hasChildren = node.children.length > 0 || !node.isLoaded;
  const isSelected = node.id === selectedId;

  const handleClick = useCallback(() => {
    onSelect(node);
  }, [node, onSelect]);

  const handleDoubleClick = useCallback(() => {
    if (hasChildren) {
      setExpanded((prev) => !prev);
      if (!node.isLoaded) {
        onExpand(node);
      }
    }
  }, [hasChildren, node, onExpand]);

  const handleArrowClick = useCallback(
    (e: React.MouseEvent) => {
      e.stopPropagation();
      setExpanded((prev) => !prev);
      if (!node.isLoaded) {
        onExpand(node);
      }
    },
    [node, onExpand],
  );

  const rowStyle: CSSProperties = {
    display: 'flex',
    alignItems: 'center',
    gap: 6,
    paddingLeft: depth * 20,
    paddingTop: 4,
    paddingBottom: 4,
    paddingRight: 8,
    cursor: 'pointer',
    borderRadius: 4,
    backgroundColor: isSelected ? '#eff6ff' : 'transparent',
    opacity: node.isCached ? 0.55 : 1,
    userSelect: 'none',
    fontSize: '0.8125rem',
    lineHeight: '1.25rem',
  };

  const arrowStyle: CSSProperties = {
    width: 16,
    height: 16,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    flexShrink: 0,
    transition: 'transform 0.15s ease',
    transform: expanded ? 'rotate(90deg)' : 'rotate(0deg)',
  };

  return (
    <div>
      <div
        style={rowStyle}
        onClick={handleClick}
        onDoubleClick={handleDoubleClick}
        role="treeitem"
        aria-expanded={hasChildren ? expanded : undefined}
        aria-selected={isSelected}
        tabIndex={0}
      >
        {/* Expand / collapse arrow */}
        <span style={arrowStyle} onClick={hasChildren ? handleArrowClick : undefined}>
          {hasChildren ? (
            <svg width="10" height="10" viewBox="0 0 10 10" fill="#6b7280">
              <polygon points="2,1 8,5 2,9" />
            </svg>
          ) : (
            <span style={{ width: 10 }} />
          )}
        </span>

        {/* Type icon */}
        <span style={{ flexShrink: 0, display: 'flex', alignItems: 'center' }}>
          {ICONS[node.nodeType] ?? ICONS.page}
        </span>

        {/* Label */}
        <span
          style={{
            overflow: 'hidden',
            textOverflow: 'ellipsis',
            whiteSpace: 'nowrap',
            color: isSelected ? '#1d4ed8' : '#111827',
            fontWeight: isSelected ? 600 : 400,
          }}
        >
          {node.label}
        </span>

        {/* Cached badge */}
        {node.isCached && (
          <span
            style={{
              fontSize: '0.625rem',
              color: '#9ca3af',
              marginLeft: 'auto',
              flexShrink: 0,
            }}
          >
            cached
          </span>
        )}
      </div>

      {/* Children */}
      {expanded && hasChildren && (
        <div role="group">
          {node.isLoading && <LoadingSkeleton />}
          {node.children.map((child) => (
            <TreeNode
              key={child.id}
              node={child}
              depth={depth + 1}
              selectedId={selectedId}
              onSelect={onSelect}
              onExpand={onExpand}
            />
          ))}
        </div>
      )}
    </div>
  );
}

export default TreeNode;
