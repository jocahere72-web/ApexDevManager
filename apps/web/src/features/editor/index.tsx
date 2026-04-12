import { useState, useCallback, useEffect } from 'react';
import { apiClient } from '@/lib/api-client';
import MonacoEditorWrapper from './components/MonacoEditorWrapper';

interface ConnectionOption {
  id: string;
  name: string;
  connection_type: string;
}

export default function EditorPage() {
  const [connections, setConnections] = useState<ConnectionOption[]>([]);
  const [selectedConnId, setSelectedConnId] = useState('');
  const [componentType, setComponentType] = useState('plsql_package');
  const [componentId, setComponentId] = useState('');
  const [content, setContent] = useState('');
  const [originalContent, setOriginalContent] = useState('');
  const [isEditing, setIsEditing] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [status, setStatus] = useState<string | null>(null);

  useEffect(() => {
    apiClient.get('/connections').then(res => {
      setConnections(res.data.data || []);
    }).catch(() => {});
  }, []);

  const handleLoad = async () => {
    if (!selectedConnId || !componentId) return;
    setLoading(true);
    setError(null);
    try {
      const res = await apiClient.get(`/editor/source/${selectedConnId}/${componentType}/${componentId}`);
      const src = res.data.data?.source || res.data.data || '';
      setContent(typeof src === 'string' ? src : JSON.stringify(src, null, 2));
      setOriginalContent(typeof src === 'string' ? src : JSON.stringify(src, null, 2));
      setStatus('Source loaded');
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Failed to load source');
    } finally {
      setLoading(false);
    }
  };

  const isDirty = content !== originalContent;

  const sampleCode = `CREATE OR REPLACE PACKAGE BODY my_package AS

  PROCEDURE process_data (
    p_id    IN NUMBER,
    p_name  IN VARCHAR2
  ) IS
    v_count NUMBER := 0;
  BEGIN
    SELECT COUNT(*)
      INTO v_count
      FROM my_table
     WHERE id = p_id;

    IF v_count > 0 THEN
      UPDATE my_table
         SET name = p_name,
             updated_at = SYSDATE
       WHERE id = p_id;

      DBMS_OUTPUT.PUT_LINE('Updated: ' || p_name);
    ELSE
      INSERT INTO my_table (id, name, created_at)
      VALUES (p_id, p_name, SYSDATE);

      DBMS_OUTPUT.PUT_LINE('Inserted: ' || p_name);
    END IF;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
  END process_data;

END my_package;
/`;

  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: 'calc(100vh - 3.5rem)' }}>
      {/* Toolbar */}
      <div style={{
        display: 'flex', alignItems: 'center', gap: '0.5rem', padding: '0.5rem 1rem',
        borderBottom: '1px solid #e5e7eb', backgroundColor: '#f9fafb', flexWrap: 'wrap',
      }}>
        <h2 style={{ fontSize: '1rem', fontWeight: 700, margin: 0, marginRight: '1rem' }}>Code Editor</h2>

        <select
          value={selectedConnId}
          onChange={e => setSelectedConnId(e.target.value)}
          style={{ padding: '0.375rem 0.5rem', borderRadius: '0.375rem', border: '1px solid #d1d5db', fontSize: '0.8rem' }}
        >
          <option value="">Select Connection</option>
          {connections.map(c => (
            <option key={c.id} value={c.id}>{c.name} ({c.connection_type})</option>
          ))}
        </select>

        <select
          value={componentType}
          onChange={e => setComponentType(e.target.value)}
          style={{ padding: '0.375rem 0.5rem', borderRadius: '0.375rem', border: '1px solid #d1d5db', fontSize: '0.8rem' }}
        >
          <option value="plsql_package">Package Body</option>
          <option value="plsql_trigger">Trigger</option>
          <option value="plsql_view">View</option>
          <option value="page_process">Page Process</option>
          <option value="dynamic_action">Dynamic Action</option>
          <option value="computation">Computation</option>
          <option value="validation">Validation</option>
        </select>

        <input
          type="text"
          placeholder="Component name..."
          value={componentId}
          onChange={e => setComponentId(e.target.value)}
          style={{ padding: '0.375rem 0.5rem', borderRadius: '0.375rem', border: '1px solid #d1d5db', fontSize: '0.8rem', width: '12rem' }}
        />

        <button
          onClick={handleLoad}
          disabled={loading || !selectedConnId || !componentId}
          style={{
            padding: '0.375rem 0.75rem', backgroundColor: '#2563eb', color: '#fff',
            border: 'none', borderRadius: '0.375rem', fontSize: '0.8rem', fontWeight: 600,
            cursor: 'pointer', opacity: loading || !selectedConnId || !componentId ? 0.5 : 1,
          }}
        >
          {loading ? 'Loading...' : 'Load'}
        </button>

        <div style={{ flex: 1 }} />

        <span style={{
          padding: '0.25rem 0.5rem', borderRadius: '0.25rem', fontSize: '0.75rem', fontWeight: 600,
          backgroundColor: isEditing ? '#fef3c7' : '#f3f4f6',
          color: isEditing ? '#b45309' : '#6b7280',
        }}>
          {isEditing ? '✏️ Editing' : '👁️ View Only'}
        </span>

        <button
          onClick={() => setIsEditing(!isEditing)}
          style={{
            padding: '0.375rem 0.75rem', backgroundColor: '#374151', color: '#fff',
            border: 'none', borderRadius: '0.375rem', fontSize: '0.8rem', cursor: 'pointer',
          }}
        >
          {isEditing ? 'View Mode' : 'Edit Mode'}
        </button>

        {isDirty && (
          <span style={{ fontSize: '0.75rem', color: '#2563eb', fontWeight: 600 }}>● Modified</span>
        )}
      </div>

      {error && (
        <div style={{ padding: '0.5rem 1rem', backgroundColor: '#fef2f2', color: '#dc2626', fontSize: '0.8rem' }}>
          {error}
        </div>
      )}
      {status && !error && (
        <div style={{ padding: '0.5rem 1rem', backgroundColor: '#f0fdf4', color: '#16a34a', fontSize: '0.8rem' }}>
          {status}
        </div>
      )}

      {/* Monaco Editor */}
      <div style={{ flex: 1, overflow: 'hidden' }}>
        <MonacoEditorWrapper
          value={content || sampleCode}
          onChange={setContent}
          readOnly={!isEditing}
        />
      </div>
    </div>
  );
}
