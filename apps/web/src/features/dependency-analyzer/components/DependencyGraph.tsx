import { useState, useEffect, useRef, useCallback, type CSSProperties } from 'react';
import type {
  DependencyGraph as DependencyGraphType,
  DependencyNode,
  ImpactAssessment,
} from '@apex-dev-manager/shared-types';
import * as dependencyApi from '@/services/dependency.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const styles: Record<string, CSSProperties> = {
  container: {
    display: 'grid',
    gridTemplateColumns: '1fr 360px',
    height: 'calc(100vh - 120px)',
    gap: '0',
  },
  graphArea: {
    position: 'relative' as const,
    backgroundColor: '#fafbfc',
    overflow: 'hidden',
    border: '1px solid #e9ecef',
  },
  svg: {
    width: '100%',
    height: '100%',
  },
  sidebar: {
    borderLeft: '1px solid #e9ecef',
    backgroundColor: '#fff',
    overflowY: 'auto' as const,
    padding: '20px',
  },
  sidebarTitle: {
    fontSize: '18px',
    fontWeight: 600,
    color: '#1a1a2e',
    marginBottom: '16px',
  },
  formGroup: {
    marginBottom: '16px',
  },
  label: {
    display: 'block',
    fontSize: '12px',
    fontWeight: 600,
    color: '#6c757d',
    marginBottom: '6px',
    textTransform: 'uppercase' as const,
  },
  input: {
    width: '100%',
    padding: '8px 12px',
    borderRadius: '6px',
    border: '1px solid #ddd',
    fontSize: '14px',
    boxSizing: 'border-box' as const,
  },
  select: {
    width: '100%',
    padding: '8px 12px',
    borderRadius: '6px',
    border: '1px solid #ddd',
    fontSize: '14px',
  },
  btn: {
    width: '100%',
    padding: '10px 16px',
    border: 'none',
    borderRadius: '6px',
    cursor: 'pointer',
    fontSize: '14px',
    fontWeight: 500,
    backgroundColor: '#6c5ce7',
    color: '#fff',
    marginBottom: '8px',
  },
  btnOutline: {
    width: '100%',
    padding: '10px 16px',
    borderRadius: '6px',
    cursor: 'pointer',
    fontSize: '14px',
    fontWeight: 500,
    backgroundColor: '#fff',
    color: '#333',
    border: '1px solid #ddd',
    marginBottom: '8px',
  },
  impactCard: {
    backgroundColor: '#f8f9fa',
    borderRadius: '8px',
    padding: '16px',
    marginTop: '16px',
  },
  impactTitle: {
    fontSize: '14px',
    fontWeight: 600,
    color: '#333',
    marginBottom: '8px',
  },
  impactLevel: {
    display: 'inline-block',
    padding: '3px 10px',
    borderRadius: '10px',
    fontSize: '12px',
    fontWeight: 600,
    marginBottom: '8px',
  },
  depList: {
    listStyle: 'none',
    padding: 0,
    margin: '8px 0 0',
  },
  depItem: {
    padding: '6px 0',
    borderBottom: '1px solid #e9ecef',
    fontSize: '13px',
    display: 'flex',
    gap: '8px',
    alignItems: 'center',
  },
  nodeType: {
    fontSize: '10px',
    fontWeight: 600,
    padding: '2px 6px',
    borderRadius: '3px',
    backgroundColor: '#e9ecef',
    color: '#6c757d',
  },
  stats: {
    display: 'grid',
    gridTemplateColumns: '1fr 1fr',
    gap: '8px',
    marginBottom: '16px',
  },
  statBox: {
    backgroundColor: '#f0f0f0',
    borderRadius: '6px',
    padding: '10px',
    textAlign: 'center' as const,
  },
  statNum: {
    fontSize: '20px',
    fontWeight: 700,
    color: '#1a1a2e',
  },
  statLabel: {
    fontSize: '11px',
    color: '#6c757d',
    marginTop: '2px',
  },
  exportBtns: {
    display: 'flex',
    gap: '8px',
    marginTop: '12px',
  },
};

const impactColors: Record<string, { bg: string; text: string }> = {
  low: { bg: '#e8f5e9', text: '#2e7d32' },
  medium: { bg: '#fff3e0', text: '#e65100' },
  high: { bg: '#fce4ec', text: '#c62828' },
  critical: { bg: '#f3e5f5', text: '#6a1b9a' },
};

const nodeColors: Record<string, string> = {
  TABLE: '#3498db',
  VIEW: '#2ecc71',
  PACKAGE: '#9b59b6',
  'PACKAGE BODY': '#8e44ad',
  PROCEDURE: '#e67e22',
  FUNCTION: '#f39c12',
  TRIGGER: '#e74c3c',
  TYPE: '#1abc9c',
  SEQUENCE: '#95a5a6',
};

// ---------------------------------------------------------------------------
// Simple SVG graph layout
// ---------------------------------------------------------------------------

function layoutNodes(
  nodes: DependencyNode[],
  width: number,
  height: number,
): Map<string, { x: number; y: number }> {
  const positions = new Map<string, { x: number; y: number }>();
  const count = nodes.length;
  if (count === 0) return positions;

  // Circular layout
  const cx = width / 2;
  const cy = height / 2;
  const radius = Math.min(width, height) * 0.35;

  nodes.forEach((node, i) => {
    const angle = (2 * Math.PI * i) / count - Math.PI / 2;
    positions.set(node.id, {
      x: cx + radius * Math.cos(angle),
      y: cy + radius * Math.sin(angle),
    });
  });

  return positions;
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

interface Props {
  connectionId?: string;
}

export default function DependencyGraph({ connectionId: propConnectionId }: Props) {
  const [connectionId, setConnectionId] = useState(propConnectionId ?? '');
  const [objectType, setObjectType] = useState('TABLE');
  const [objectId, setObjectId] = useState('');
  const [graph, setGraph] = useState<DependencyGraphType | null>(null);
  const [impact, setImpact] = useState<ImpactAssessment | null>(null);
  const [selectedNode, setSelectedNode] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const svgRef = useRef<SVGSVGElement>(null);

  const graphWidth = 700;
  const graphHeight = 500;

  async function handleAnalyze() {
    if (!connectionId) return;
    setLoading(true);
    setImpact(null);
    try {
      if (objectId) {
        const g = await dependencyApi.getDependencyGraph(connectionId, objectType, objectId);
        setGraph(g);
      } else {
        const g = await dependencyApi.analyzeDependencies(connectionId);
        setGraph(g);
      }
    } catch (err) {
      console.error('Failed to analyze dependencies:', err);
    } finally {
      setLoading(false);
    }
  }

  async function handleImpactAssessment() {
    if (!connectionId || !objectId) return;
    setLoading(true);
    try {
      const assessment = await dependencyApi.getImpactAssessment(connectionId, objectType, objectId);
      setImpact(assessment);
    } catch (err) {
      console.error('Failed to assess impact:', err);
    } finally {
      setLoading(false);
    }
  }

  async function handleExport(format: 'dot' | 'mermaid') {
    if (!graph) return;
    try {
      const content = await dependencyApi.exportGraph(graph, format);
      const blob = new Blob([content], { type: 'text/plain' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `dependency-graph.${format === 'dot' ? 'dot' : 'md'}`;
      a.click();
      URL.revokeObjectURL(url);
    } catch (err) {
      console.error('Failed to export:', err);
    }
  }

  const positions = graph ? layoutNodes(graph.nodes, graphWidth, graphHeight) : new Map();

  return (
    <div style={styles.container}>
      {/* Graph visualization */}
      <div style={styles.graphArea}>
        {loading && (
          <div style={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', color: '#999' }}>
            Analyzing dependencies...
          </div>
        )}
        {!loading && !graph && (
          <div style={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', color: '#999', textAlign: 'center' }}>
            Enter connection details and click Analyze<br />to view the dependency graph.
          </div>
        )}
        {graph && (
          <svg ref={svgRef} style={styles.svg} viewBox={`0 0 ${graphWidth} ${graphHeight}`}>
            {/* Edges */}
            {graph.edges.map((edge, i) => {
              const from = positions.get(edge.sourceId);
              const to = positions.get(edge.targetId);
              if (!from || !to) return null;
              return (
                <line
                  key={i}
                  x1={from.x}
                  y1={from.y}
                  x2={to.x}
                  y2={to.y}
                  stroke="#ccc"
                  strokeWidth="1.5"
                  markerEnd="url(#arrowhead)"
                />
              );
            })}

            {/* Arrow marker */}
            <defs>
              <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
                <polygon points="0 0, 10 3.5, 0 7" fill="#ccc" />
              </marker>
            </defs>

            {/* Nodes */}
            {graph.nodes.map((node) => {
              const pos = positions.get(node.id);
              if (!pos) return null;
              const color = nodeColors[node.objectType] ?? '#95a5a6';
              const isSelected = selectedNode === node.id;

              return (
                <g
                  key={node.id}
                  style={{ cursor: 'pointer' }}
                  onClick={() => setSelectedNode(node.id)}
                >
                  <circle
                    cx={pos.x}
                    cy={pos.y}
                    r={isSelected ? 28 : 22}
                    fill={color}
                    stroke={isSelected ? '#1a1a2e' : '#fff'}
                    strokeWidth={isSelected ? 3 : 2}
                    opacity={0.9}
                  />
                  <text
                    x={pos.x}
                    y={pos.y + 36}
                    textAnchor="middle"
                    fontSize="10"
                    fill="#333"
                    fontWeight="600"
                  >
                    {node.name.length > 15 ? node.name.substring(0, 15) + '...' : node.name}
                  </text>
                  <text
                    x={pos.x}
                    y={pos.y + 4}
                    textAnchor="middle"
                    fontSize="8"
                    fill="#fff"
                    fontWeight="700"
                  >
                    {node.objectType.substring(0, 3)}
                  </text>
                </g>
              );
            })}
          </svg>
        )}
      </div>

      {/* Sidebar */}
      <div style={styles.sidebar}>
        <h2 style={styles.sidebarTitle}>Dependency Analyzer</h2>

        <div style={styles.formGroup}>
          <label style={styles.label}>Connection ID</label>
          <input
            style={styles.input}
            value={connectionId}
            onChange={(e) => setConnectionId(e.target.value)}
            placeholder="Enter connection ID"
          />
        </div>

        <div style={styles.formGroup}>
          <label style={styles.label}>Object Type</label>
          <select style={styles.select} value={objectType} onChange={(e) => setObjectType(e.target.value)}>
            <option value="TABLE">Table</option>
            <option value="VIEW">View</option>
            <option value="PACKAGE">Package</option>
            <option value="PACKAGE BODY">Package Body</option>
            <option value="PROCEDURE">Procedure</option>
            <option value="FUNCTION">Function</option>
            <option value="TRIGGER">Trigger</option>
          </select>
        </div>

        <div style={styles.formGroup}>
          <label style={styles.label}>Object Name (optional)</label>
          <input
            style={styles.input}
            value={objectId}
            onChange={(e) => setObjectId(e.target.value)}
            placeholder="Leave empty for full analysis"
          />
        </div>

        <button style={styles.btn} onClick={handleAnalyze} disabled={loading || !connectionId}>
          {loading ? 'Analyzing...' : 'Analyze'}
        </button>

        {objectId && (
          <button style={styles.btnOutline} onClick={handleImpactAssessment} disabled={loading || !connectionId}>
            Impact Assessment
          </button>
        )}

        {/* Stats */}
        {graph?.metadata && (
          <div style={styles.stats}>
            <div style={styles.statBox}>
              <div style={styles.statNum}>{graph.metadata.totalNodes}</div>
              <div style={styles.statLabel}>Nodes</div>
            </div>
            <div style={styles.statBox}>
              <div style={styles.statNum}>{graph.metadata.totalEdges}</div>
              <div style={styles.statLabel}>Edges</div>
            </div>
          </div>
        )}

        {/* Export */}
        {graph && (
          <div style={styles.exportBtns}>
            <button
              style={{ ...styles.btnOutline, flex: 1 }}
              onClick={() => handleExport('mermaid')}
            >
              Export Mermaid
            </button>
            <button
              style={{ ...styles.btnOutline, flex: 1 }}
              onClick={() => handleExport('dot')}
            >
              Export DOT
            </button>
          </div>
        )}

        {/* Impact Assessment */}
        {impact && (
          <div style={styles.impactCard}>
            <div style={styles.impactTitle}>Impact Assessment</div>
            <span
              style={{
                ...styles.impactLevel,
                backgroundColor: (impactColors[impact.impactLevel] ?? impactColors.low).bg,
                color: (impactColors[impact.impactLevel] ?? impactColors.low).text,
              }}
            >
              {impact.impactLevel.toUpperCase()}
            </span>
            <p style={{ fontSize: '13px', color: '#666', margin: '8px 0' }}>{impact.summary}</p>

            {impact.directDependents.length > 0 && (
              <>
                <div style={{ fontSize: '12px', fontWeight: 600, color: '#333', marginTop: '12px' }}>
                  Direct Dependents ({impact.directDependents.length})
                </div>
                <ul style={styles.depList}>
                  {impact.directDependents.map((dep) => (
                    <li key={dep.id} style={styles.depItem}>
                      <span style={styles.nodeType}>{dep.objectType}</span>
                      <span>{dep.name}</span>
                    </li>
                  ))}
                </ul>
              </>
            )}

            {impact.transitiveDependents.length > 0 && (
              <>
                <div style={{ fontSize: '12px', fontWeight: 600, color: '#333', marginTop: '12px' }}>
                  Transitive ({impact.transitiveDependents.length})
                </div>
                <ul style={styles.depList}>
                  {impact.transitiveDependents.map((dep) => (
                    <li key={dep.id} style={styles.depItem}>
                      <span style={styles.nodeType}>{dep.objectType}</span>
                      <span>{dep.name}</span>
                    </li>
                  ))}
                </ul>
              </>
            )}

            {impact.breakingChanges.length > 0 && (
              <>
                <div style={{ fontSize: '12px', fontWeight: 600, color: '#c62828', marginTop: '12px' }}>
                  Breaking Changes ({impact.breakingChanges.length})
                </div>
                <ul style={styles.depList}>
                  {impact.breakingChanges.map((bc, i) => (
                    <li key={i} style={{ ...styles.depItem, color: '#c62828' }}>
                      <span style={styles.nodeType}>{bc.dependent.objectType}</span>
                      <span>{bc.reason}</span>
                    </li>
                  ))}
                </ul>
              </>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
