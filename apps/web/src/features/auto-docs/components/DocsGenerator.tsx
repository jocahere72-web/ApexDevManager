import { useState, useEffect, type CSSProperties } from 'react';
import type { GeneratedDoc, DocExportFormat, DocGenRequest } from '@apex-dev-manager/shared-types';
import * as docsApi from '@/services/docs.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const styles: Record<string, CSSProperties> = {
  container: {
    display: 'grid',
    gridTemplateColumns: '320px 1fr',
    height: 'calc(100vh - 120px)',
    gap: '0',
  },
  sidebar: {
    borderRight: '1px solid #e9ecef',
    backgroundColor: '#f8f9fa',
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
    marginBottom: '14px',
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
  checkbox: {
    display: 'flex',
    gap: '8px',
    alignItems: 'center',
    fontSize: '14px',
    marginBottom: '8px',
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
  btnSecondary: {
    width: '100%',
    padding: '10px 16px',
    borderRadius: '6px',
    cursor: 'pointer',
    fontSize: '14px',
    fontWeight: 500,
    backgroundColor: '#00b894',
    color: '#fff',
    border: 'none',
    marginBottom: '16px',
  },
  divider: {
    borderTop: '1px solid #e9ecef',
    margin: '16px 0',
  },
  docList: {
    listStyle: 'none',
    padding: 0,
    margin: 0,
  },
  docItem: {
    padding: '10px 12px',
    borderRadius: '6px',
    cursor: 'pointer',
    marginBottom: '4px',
    fontSize: '13px',
    transition: 'background-color 0.15s',
  },
  docItemActive: {
    backgroundColor: '#e3f2fd',
  },
  docItemTitle: {
    fontWeight: 600,
    color: '#333',
  },
  docItemMeta: {
    fontSize: '11px',
    color: '#999',
    marginTop: '2px',
  },
  main: {
    display: 'flex',
    flexDirection: 'column' as const,
    overflow: 'hidden',
  },
  toolbar: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: '12px 20px',
    borderBottom: '1px solid #e9ecef',
    backgroundColor: '#fff',
  },
  toolbarTitle: {
    fontSize: '16px',
    fontWeight: 600,
    color: '#333',
  },
  exportBtns: {
    display: 'flex',
    gap: '8px',
  },
  exportBtn: {
    padding: '6px 12px',
    borderRadius: '6px',
    cursor: 'pointer',
    fontSize: '12px',
    fontWeight: 500,
    backgroundColor: '#fff',
    color: '#333',
    border: '1px solid #ddd',
  },
  preview: {
    flex: 1,
    padding: '24px',
    overflowY: 'auto' as const,
    backgroundColor: '#fff',
  },
  markdownContent: {
    fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif',
    fontSize: '14px',
    lineHeight: 1.7,
    color: '#333',
    whiteSpace: 'pre-wrap' as const,
  },
  empty: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    height: '100%',
    color: '#999',
    fontSize: '14px',
  },
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function DocsGenerator() {
  const [docs, setDocs] = useState<GeneratedDoc[]>([]);
  const [selectedDoc, setSelectedDoc] = useState<GeneratedDoc | null>(null);
  const [loading, setLoading] = useState(false);

  // Form state
  const [connectionId, setConnectionId] = useState('');
  const [objectType, setObjectType] = useState('PACKAGE');
  const [objectName, setObjectName] = useState('');
  const [schema, setSchema] = useState('');
  const [includeExamples, setIncludeExamples] = useState(true);
  const [includeLineComments, setIncludeLineComments] = useState(false);

  useEffect(() => {
    loadDocs();
  }, []);

  async function loadDocs() {
    try {
      const result = await docsApi.listDocs();
      setDocs(result);
    } catch (err) {
      console.error('Failed to load docs:', err);
    }
  }

  async function handleGenerate() {
    if (!connectionId || !objectName || !schema) return;
    setLoading(true);
    try {
      const request: DocGenRequest = {
        connectionId,
        objectType,
        objectName,
        schema,
        includeExamples,
        includeLineComments,
      };
      const doc = await docsApi.generateDocs(request);
      setDocs((prev) => [doc, ...prev]);
      setSelectedDoc(doc);
    } catch (err) {
      console.error('Failed to generate docs:', err);
    } finally {
      setLoading(false);
    }
  }

  async function handleGenerateAPI() {
    if (!connectionId) return;
    setLoading(true);
    try {
      const doc = await docsApi.generateAPIDoc(connectionId);
      setDocs((prev) => [doc, ...prev]);
      setSelectedDoc(doc);
    } catch (err) {
      console.error('Failed to generate API docs:', err);
    } finally {
      setLoading(false);
    }
  }

  async function handleExport(format: DocExportFormat) {
    if (!selectedDoc) return;
    try {
      const result = await docsApi.exportDoc(selectedDoc.id, format);
      const blob = new Blob([result.content], { type: result.mimeType });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      const ext = format === 'html' ? 'html' : format === 'pdf' ? 'pdf' : 'md';
      a.download = `${selectedDoc.objectName}-docs.${ext}`;
      a.click();
      URL.revokeObjectURL(url);
    } catch (err) {
      console.error('Failed to export:', err);
    }
  }

  const formatDate = (iso: string) => {
    try {
      return new Date(iso).toLocaleString();
    } catch {
      return iso;
    }
  };

  return (
    <div style={styles.container}>
      {/* Sidebar */}
      <div style={styles.sidebar}>
        <h2 style={styles.sidebarTitle}>Auto Docs</h2>

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
            <option value="PACKAGE">Package</option>
            <option value="PACKAGE BODY">Package Body</option>
            <option value="TABLE">Table</option>
            <option value="VIEW">View</option>
            <option value="PROCEDURE">Procedure</option>
            <option value="FUNCTION">Function</option>
            <option value="TRIGGER">Trigger</option>
          </select>
        </div>

        <div style={styles.formGroup}>
          <label style={styles.label}>Object Name</label>
          <input
            style={styles.input}
            value={objectName}
            onChange={(e) => setObjectName(e.target.value)}
            placeholder="e.g. MY_PACKAGE"
          />
        </div>

        <div style={styles.formGroup}>
          <label style={styles.label}>Schema</label>
          <input
            style={styles.input}
            value={schema}
            onChange={(e) => setSchema(e.target.value)}
            placeholder="e.g. HR"
          />
        </div>

        <div style={styles.formGroup}>
          <label style={styles.checkbox}>
            <input
              type="checkbox"
              checked={includeExamples}
              onChange={(e) => setIncludeExamples(e.target.checked)}
            />
            Include usage examples
          </label>
          <label style={styles.checkbox}>
            <input
              type="checkbox"
              checked={includeLineComments}
              onChange={(e) => setIncludeLineComments(e.target.checked)}
            />
            Include line comments
          </label>
        </div>

        <button style={styles.btn} onClick={handleGenerate} disabled={loading || !connectionId || !objectName}>
          {loading ? 'Generating...' : 'Generate Documentation'}
        </button>

        <button style={styles.btnSecondary} onClick={handleGenerateAPI} disabled={loading || !connectionId}>
          Generate API Docs
        </button>

        <div style={styles.divider} />

        {/* Generated docs list */}
        <div style={{ fontSize: '12px', fontWeight: 600, color: '#6c757d', marginBottom: '8px', textTransform: 'uppercase' }}>
          Generated Documents ({docs.length})
        </div>
        <ul style={styles.docList}>
          {docs.map((doc) => (
            <li
              key={doc.id}
              style={{
                ...styles.docItem,
                ...(selectedDoc?.id === doc.id ? styles.docItemActive : {}),
              }}
              onClick={() => setSelectedDoc(doc)}
              onMouseEnter={(e) => {
                if (selectedDoc?.id !== doc.id) {
                  (e.currentTarget as HTMLElement).style.backgroundColor = '#e9ecef';
                }
              }}
              onMouseLeave={(e) => {
                if (selectedDoc?.id !== doc.id) {
                  (e.currentTarget as HTMLElement).style.backgroundColor = '';
                }
              }}
            >
              <div style={styles.docItemTitle}>{doc.title}</div>
              <div style={styles.docItemMeta}>{formatDate(doc.createdAt)}</div>
            </li>
          ))}
        </ul>
      </div>

      {/* Main preview */}
      <div style={styles.main}>
        {selectedDoc ? (
          <>
            <div style={styles.toolbar}>
              <span style={styles.toolbarTitle}>{selectedDoc.title}</span>
              <div style={styles.exportBtns}>
                <button style={styles.exportBtn} onClick={() => handleExport('markdown')}>
                  Markdown
                </button>
                <button style={styles.exportBtn} onClick={() => handleExport('html')}>
                  HTML
                </button>
                <button style={styles.exportBtn} onClick={() => handleExport('pdf')}>
                  PDF
                </button>
                <button style={styles.exportBtn} onClick={() => handleExport('confluence')}>
                  Confluence
                </button>
              </div>
            </div>
            <div style={styles.preview}>
              <div style={styles.markdownContent}>{selectedDoc.content}</div>
            </div>
          </>
        ) : (
          <div style={styles.empty}>
            Select a document or generate new documentation to preview it here.
          </div>
        )}
      </div>
    </div>
  );
}
