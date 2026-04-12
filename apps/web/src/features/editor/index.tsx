import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader, AppStatusPill } from '@/components/ui/AppTemplate';
import { apiClient } from '@/lib/api-client';
import MonacoEditorWrapper from './components/MonacoEditorWrapper';

interface ConnectionOption {
  id: string;
  name: string;
  connection_type: string;
}

export default function EditorPage() {
  const { t } = useTranslation();
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
    apiClient
      .get('/connections')
      .then((res) => {
        setConnections(res.data.data || []);
      })
      .catch(() => {});
  }, []);

  const handleLoad = async () => {
    if (!selectedConnId || !componentId) return;
    setLoading(true);
    setError(null);
    try {
      const res = await apiClient.get(
        `/editor/source/${selectedConnId}/${componentType}/${componentId}`,
      );
      const src = res.data.data?.source || res.data.data || '';
      setContent(typeof src === 'string' ? src : JSON.stringify(src, null, 2));
      setOriginalContent(typeof src === 'string' ? src : JSON.stringify(src, null, 2));
      setStatus('Source loaded');
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : 'Failed to load source');
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
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('editor.eyebrow')}
        title={t('editor.title')}
        description={t('editor.description')}
      />
      <div className="app-card app-editor-surface">
        <div className="app-toolbar editor-toolbar">
          <select
            value={selectedConnId}
            onChange={(e) => setSelectedConnId(e.target.value)}
            className="app-select editor-select-connection"
          >
            <option value="">{t('editor.selectConnection')}</option>
            {connections.map((c) => (
              <option key={c.id} value={c.id}>
                {c.name} ({c.connection_type})
              </option>
            ))}
          </select>

          <select
            value={componentType}
            onChange={(e) => setComponentType(e.target.value)}
            className="app-select editor-select-type"
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
            onChange={(e) => setComponentId(e.target.value)}
            className="app-input editor-input-component"
          />

          <button
            onClick={handleLoad}
            disabled={loading || !selectedConnId || !componentId}
            className={`app-button app-button-primary${loading || !selectedConnId || !componentId ? ' editor-button-disabled' : ''}`}
          >
            {loading ? t('editor.loading') : t('editor.load')}
          </button>

          <div className="editor-toolbar-spacer" />

          <AppStatusPill tone={isEditing ? 'warning' : 'neutral'}>
            {isEditing ? t('editor.editing') : t('editor.viewOnly')}
          </AppStatusPill>

          <button onClick={() => setIsEditing(!isEditing)} className="app-button">
            {isEditing ? t('editor.viewMode') : t('editor.editMode')}
          </button>

          {isDirty && <AppStatusPill tone="accent">Modified</AppStatusPill>}
        </div>

        {error && (
          <div className="app-alert app-alert-danger editor-alert">
            {error}
          </div>
        )}
        {status && !error && (
          <div className="app-alert editor-alert editor-alert-success">
            {status}
          </div>
        )}

        <div className="editor-monaco-wrapper">
          <MonacoEditorWrapper
            value={content || sampleCode}
            onChange={setContent}
            readOnly={!isEditing}
          />
        </div>
      </div>
    </AppPage>
  );
}
