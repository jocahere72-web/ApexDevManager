import { useState, useEffect, type CSSProperties } from 'react';
import type { SchemaTable, SchemaColumn, DDLScript } from '@apex-dev-manager/shared-types';
import * as schemaApi from '@/services/schema-inspector.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const styles: Record<string, CSSProperties> = {
  container: {
    display: 'grid',
    gridTemplateColumns: '280px 1fr',
    height: 'calc(100vh - 120px)',
    gap: '0',
  },
  sidebar: {
    borderRight: '1px solid #e9ecef',
    backgroundColor: '#f8f9fa',
    overflowY: 'auto' as const,
    padding: '16px 0',
  },
  sidebarHeader: {
    padding: '0 16px 12px',
    fontSize: '12px',
    fontWeight: 600,
    color: '#6c757d',
    textTransform: 'uppercase' as const,
    letterSpacing: '0.5px',
  },
  searchInput: {
    margin: '0 12px 12px',
    padding: '8px 12px',
    borderRadius: '6px',
    border: '1px solid #ddd',
    fontSize: '13px',
    width: 'calc(100% - 24px)',
    boxSizing: 'border-box' as const,
  },
  tableItem: {
    padding: '8px 16px',
    cursor: 'pointer',
    fontSize: '13px',
    display: 'flex',
    alignItems: 'center',
    gap: '8px',
    transition: 'background-color 0.15s',
  },
  tableItemActive: {
    backgroundColor: '#e3f2fd',
    borderLeft: '3px solid #1976d2',
    paddingLeft: '13px',
  },
  tableIcon: {
    fontSize: '11px',
    color: '#6c757d',
    backgroundColor: '#e9ecef',
    padding: '2px 6px',
    borderRadius: '3px',
    fontWeight: 600,
  },
  main: {
    padding: '24px',
    overflowY: 'auto' as const,
  },
  tabBar: {
    display: 'flex',
    borderBottom: '2px solid #e9ecef',
    marginBottom: '16px',
    gap: '0',
  },
  tab: {
    padding: '10px 20px',
    cursor: 'pointer',
    fontSize: '14px',
    fontWeight: 500,
    color: '#6c757d',
    borderBottom: '2px solid transparent',
    marginBottom: '-2px',
    transition: 'all 0.15s',
  },
  tabActive: {
    color: '#1976d2',
    borderBottom: '2px solid #1976d2',
  },
  columnTable: {
    width: '100%',
    borderCollapse: 'collapse' as const,
    fontSize: '13px',
  },
  colTh: {
    textAlign: 'left' as const,
    padding: '10px 12px',
    backgroundColor: '#f8f9fa',
    fontSize: '11px',
    fontWeight: 600,
    color: '#6c757d',
    textTransform: 'uppercase' as const,
    borderBottom: '2px solid #e9ecef',
  },
  colTd: {
    padding: '10px 12px',
    borderBottom: '1px solid #f0f0f0',
  },
  ddlBlock: {
    backgroundColor: '#1e1e1e',
    color: '#d4d4d4',
    padding: '16px',
    borderRadius: '8px',
    fontFamily: 'monospace',
    fontSize: '13px',
    whiteSpace: 'pre-wrap' as const,
    overflowX: 'auto' as const,
    lineHeight: 1.6,
  },
  erdContainer: {
    backgroundColor: '#fff',
    border: '1px solid #e9ecef',
    borderRadius: '8px',
    padding: '16px',
    minHeight: '300px',
    fontFamily: 'monospace',
    fontSize: '13px',
    whiteSpace: 'pre-wrap' as const,
  },
  badge: {
    fontSize: '10px',
    fontWeight: 600,
    padding: '2px 6px',
    borderRadius: '3px',
  },
  connSelect: {
    padding: '8px 12px',
    borderRadius: '6px',
    border: '1px solid #ddd',
    fontSize: '14px',
    marginBottom: '16px',
  },
  snapshotBtn: {
    padding: '6px 12px',
    backgroundColor: '#6c5ce7',
    color: '#fff',
    border: 'none',
    borderRadius: '6px',
    cursor: 'pointer',
    fontSize: '13px',
    marginLeft: '8px',
  },
  erdBtn: {
    padding: '6px 12px',
    backgroundColor: '#00b894',
    color: '#fff',
    border: 'none',
    borderRadius: '6px',
    cursor: 'pointer',
    fontSize: '13px',
    marginLeft: '8px',
  },
  header: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: '16px',
  },
  title: {
    fontSize: '20px',
    fontWeight: 600,
    color: '#1a1a2e',
    margin: 0,
  },
};

type TabView = 'columns' | 'indexes' | 'ddl' | 'erd';

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

interface Props {
  connectionId?: string;
}

export default function SchemaExplorer({ connectionId: propConnectionId }: Props) {
  const [connectionId, setConnectionId] = useState(propConnectionId ?? '');
  const [tables, setTables] = useState<SchemaTable[]>([]);
  const [views, setViews] = useState<SchemaTable[]>([]);
  const [selectedTable, setSelectedTable] = useState<SchemaTable | null>(null);
  const [activeTab, setActiveTab] = useState<TabView>('columns');
  const [ddl, setDdl] = useState<DDLScript | null>(null);
  const [erd, setErd] = useState<string>('');
  const [search, setSearch] = useState('');
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (connectionId) loadSchema();
  }, [connectionId]);

  async function loadSchema() {
    setLoading(true);
    try {
      const schema = await schemaApi.getSchema(connectionId);
      setTables(schema.tables);
      setViews(schema.views);
      if (schema.tables.length > 0) {
        setSelectedTable(schema.tables[0]);
      }
    } catch (err) {
      console.error('Failed to load schema:', err);
    } finally {
      setLoading(false);
    }
  }

  async function loadDDL(tableName: string) {
    try {
      const result = await schemaApi.getTableDDL(connectionId, tableName);
      setDdl(result);
    } catch (err) {
      console.error('Failed to load DDL:', err);
    }
  }

  async function loadERD() {
    try {
      const result = await schemaApi.generateERD(connectionId);
      setErd(result);
    } catch (err) {
      console.error('Failed to generate ERD:', err);
    }
  }

  async function handleSnapshot() {
    try {
      await schemaApi.createSnapshot(connectionId);
      alert('Schema snapshot created successfully.');
    } catch (err) {
      console.error('Failed to create snapshot:', err);
    }
  }

  function handleSelectTable(table: SchemaTable) {
    setSelectedTable(table);
    setActiveTab('columns');
    setDdl(null);
  }

  function handleTabChange(tab: TabView) {
    setActiveTab(tab);
    if (tab === 'ddl' && selectedTable && !ddl) {
      loadDDL(selectedTable.name);
    }
    if (tab === 'erd' && !erd) {
      loadERD();
    }
  }

  const allObjects = [
    ...tables.map((t) => ({ ...t, kind: 'TABLE' })),
    ...views.map((v) => ({ ...v, kind: 'VIEW' })),
  ];

  const filtered = allObjects.filter((obj) =>
    obj.name.toLowerCase().includes(search.toLowerCase()),
  );

  return (
    <div className="app-responsive-two-column" style={styles.container}>
      {/* Sidebar */}
      <div style={styles.sidebar}>
        <div style={styles.sidebarHeader}>Schema Objects</div>
        <input
          style={styles.searchInput}
          type="text"
          placeholder="Search tables..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />
        {loading ? (
          <div style={{ padding: '16px', color: '#999', textAlign: 'center' }}>Loading...</div>
        ) : (
          filtered.map((obj) => (
            <div
              key={`${obj.kind}:${obj.name}`}
              style={{
                ...styles.tableItem,
                ...(selectedTable?.name === obj.name ? styles.tableItemActive : {}),
              }}
              onClick={() => handleSelectTable(obj)}
              onMouseEnter={(e) => {
                if (selectedTable?.name !== obj.name) {
                  (e.currentTarget as HTMLElement).style.backgroundColor = '#e9ecef';
                }
              }}
              onMouseLeave={(e) => {
                if (selectedTable?.name !== obj.name) {
                  (e.currentTarget as HTMLElement).style.backgroundColor = '';
                }
              }}
            >
              <span style={styles.tableIcon}>{obj.kind === 'TABLE' ? 'T' : 'V'}</span>
              <span>{obj.name}</span>
            </div>
          ))
        )}
      </div>

      {/* Main content */}
      <div style={styles.main}>
        <div style={styles.header}>
          <h2 style={styles.title}>{selectedTable ? selectedTable.name : 'Schema Explorer'}</h2>
          <div>
            <button style={styles.snapshotBtn} onClick={handleSnapshot}>
              Take Snapshot
            </button>
            <button style={styles.erdBtn} onClick={() => handleTabChange('erd')}>
              View ERD
            </button>
          </div>
        </div>

        {selectedTable && (
          <>
            <div style={styles.tabBar}>
              {(['columns', 'indexes', 'ddl', 'erd'] as TabView[]).map((tab) => (
                <div
                  key={tab}
                  style={{
                    ...styles.tab,
                    ...(activeTab === tab ? styles.tabActive : {}),
                  }}
                  onClick={() => handleTabChange(tab)}
                >
                  {tab.charAt(0).toUpperCase() + tab.slice(1)}
                </div>
              ))}
            </div>

            {/* Columns tab */}
            {activeTab === 'columns' && (
              <table style={styles.columnTable}>
                <thead>
                  <tr>
                    <th style={styles.colTh}>Column</th>
                    <th style={styles.colTh}>Type</th>
                    <th style={styles.colTh}>Nullable</th>
                    <th style={styles.colTh}>Default</th>
                    <th style={styles.colTh}>Keys</th>
                  </tr>
                </thead>
                <tbody>
                  {selectedTable.columns.map((col: SchemaColumn) => (
                    <tr key={col.name}>
                      <td style={styles.colTd}>
                        <strong>{col.name}</strong>
                      </td>
                      <td style={styles.colTd}>
                        <code style={{ fontSize: '12px', color: '#6c5ce7' }}>{col.dataType}</code>
                      </td>
                      <td style={styles.colTd}>
                        {col.nullable ? (
                          <span style={{ color: '#999' }}>Yes</span>
                        ) : (
                          <span
                            style={{
                              ...styles.badge,
                              backgroundColor: '#fce4ec',
                              color: '#c62828',
                            }}
                          >
                            NOT NULL
                          </span>
                        )}
                      </td>
                      <td style={styles.colTd}>
                        {col.defaultValue ? (
                          <code style={{ fontSize: '12px' }}>{col.defaultValue}</code>
                        ) : (
                          <span style={{ color: '#ccc' }}>--</span>
                        )}
                      </td>
                      <td style={styles.colTd}>
                        {col.isPrimaryKey && (
                          <span
                            style={{
                              ...styles.badge,
                              backgroundColor: '#fff3e0',
                              color: '#e65100',
                              marginRight: '4px',
                            }}
                          >
                            PK
                          </span>
                        )}
                        {col.isForeignKey && (
                          <span
                            style={{
                              ...styles.badge,
                              backgroundColor: '#e3f2fd',
                              color: '#1565c0',
                            }}
                          >
                            FK
                          </span>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}

            {/* Indexes tab */}
            {activeTab === 'indexes' && (
              <table style={styles.columnTable}>
                <thead>
                  <tr>
                    <th style={styles.colTh}>Index Name</th>
                    <th style={styles.colTh}>Columns</th>
                    <th style={styles.colTh}>Type</th>
                    <th style={styles.colTh}>Unique</th>
                  </tr>
                </thead>
                <tbody>
                  {selectedTable.indexes.map((idx) => (
                    <tr key={idx.name}>
                      <td style={styles.colTd}>
                        <strong>{idx.name}</strong>
                      </td>
                      <td style={styles.colTd}>
                        <code style={{ fontSize: '12px' }}>{idx.columns.join(', ')}</code>
                      </td>
                      <td style={styles.colTd}>{idx.indexType}</td>
                      <td style={styles.colTd}>
                        {idx.isUnique ? (
                          <span
                            style={{
                              ...styles.badge,
                              backgroundColor: '#e8f5e9',
                              color: '#2e7d32',
                            }}
                          >
                            UNIQUE
                          </span>
                        ) : (
                          'No'
                        )}
                      </td>
                    </tr>
                  ))}
                  {selectedTable.indexes.length === 0 && (
                    <tr>
                      <td
                        colSpan={4}
                        style={{ ...styles.colTd, textAlign: 'center', color: '#999' }}
                      >
                        No indexes found
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            )}

            {/* DDL tab */}
            {activeTab === 'ddl' && (
              <div style={styles.ddlBlock}>{ddl ? ddl.ddl : 'Loading DDL...'}</div>
            )}

            {/* ERD tab */}
            {activeTab === 'erd' && (
              <div style={styles.erdContainer}>{erd || 'Loading ERD...'}</div>
            )}
          </>
        )}
      </div>
    </div>
  );
}
