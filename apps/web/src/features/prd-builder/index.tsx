import { useState, useEffect, useRef, useCallback } from 'react';
import { AppPage, AppPageHeader, AppCard, AppEmptyState, AppStatusPill } from '@/components/ui/AppTemplate';
import { apiClient } from '@/lib/api-client';

// ── Types ───────────────────────────────────────────────────────────────────

interface PRDSession {
  id: string; title: string; status: string; currentStage: number;
  validationScore?: number; validationBlockers?: number; validationWarnings?: number;
  createdAt: string; updatedAt: string;
}
interface PRDSource {
  id: string; filename: string; parseStatus: string; chunkCount: number;
}
interface PRDSection {
  id: string; sectionNumber: number; title: string; content: string; isCurrent: boolean;
}

type View = 'list' | 'workspace';

const STAGES = ['Draft', 'Upload', 'Extract', 'Generate', 'Validate', 'Export'];

const STATUS_TONE: Record<string, 'neutral' | 'accent' | 'warning' | 'success' | 'danger'> = {
  draft: 'neutral', ingesting: 'accent', extracting: 'warning',
  generating: 'warning', validating: 'accent', validated: 'success', exported: 'success',
};

// ── PRD Builder Page ────────────────────────────────────────────────────────

export default function PRDBuilderPage() {
  const [view, setView] = useState<View>('list');
  const [sessions, setSessions] = useState<PRDSession[]>([]);
  const [activeSession, setActiveSession] = useState<PRDSession | null>(null);
  const [sources, setSources] = useState<PRDSource[]>([]);
  const [sections, setSections] = useState<PRDSection[]>([]);
  const [extraction, setExtraction] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [actionLoading, setActionLoading] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [showCreate, setShowCreate] = useState(false);
  const [newTitle, setNewTitle] = useState('');
  const [textInput, setTextInput] = useState('');
  const fileRef = useRef<HTMLInputElement>(null);

  // ── Load sessions ───────────────────────────────────────────────────────
  const loadSessions = useCallback(async () => {
    try {
      setLoading(true);
      const res = await apiClient.get('/prd/sessions');
      setSessions(res.data.data || []);
    } catch { setError('Failed to load sessions'); }
    finally { setLoading(false); }
  }, []);

  useEffect(() => { loadSessions(); }, [loadSessions]);

  // ── Load session detail ─────────────────────────────────────────────────
  const loadSessionDetail = useCallback(async (id: string) => {
    try {
      const res = await apiClient.get(`/prd/sessions/${id}`);
      const data = res.data.data || res.data;
      setActiveSession(data);
      setSources(data.sources || []);
      setSections((data.sections || []).filter((s: PRDSection) => s.isCurrent));
      setExtraction(data.extractionData || null);
    } catch { setError('Failed to load session'); }
  }, []);

  const openSession = useCallback((session: PRDSession) => {
    setActiveSession(session);
    setView('workspace');
    setError(null);
    loadSessionDetail(session.id);
  }, [loadSessionDetail]);

  // ── Create session ──────────────────────────────────────────────────────
  const handleCreate = async () => {
    if (!newTitle.trim()) return;
    setActionLoading('create');
    try {
      const res = await apiClient.post('/prd/sessions', { title: newTitle.trim() });
      setNewTitle('');
      setShowCreate(false);
      openSession(res.data.data);
      loadSessions();
    } catch { setError('Failed to create session'); }
    finally { setActionLoading(''); }
  };

  // ── Upload text ─────────────────────────────────────────────────────────
  const handleUploadText = async () => {
    if (!activeSession || !textInput.trim()) return;
    setActionLoading('upload');
    try {
      await apiClient.post(`/prd/sessions/${activeSession.id}/sources`, {
        filename: 'input.txt',
        mimeType: 'text/plain',
        content: textInput.trim(),
      });
      setTextInput('');
      await loadSessionDetail(activeSession.id);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Upload failed');
    } finally { setActionLoading(''); }
  };

  // ── Upload file ─────────────────────────────────────────────────────────
  const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !activeSession) return;
    setActionLoading('upload');
    try {
      const text = await file.text();
      const mimeType = file.type || 'text/plain';
      await apiClient.post(`/prd/sessions/${activeSession.id}/sources`, {
        filename: file.name,
        mimeType,
        content: text,
        fileSize: file.size,
      });
      await loadSessionDetail(activeSession.id);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Upload failed');
    } finally {
      setActionLoading('');
      if (fileRef.current) fileRef.current.value = '';
    }
  };

  // ── Extract ─────────────────────────────────────────────────────────────
  const handleExtract = async () => {
    if (!activeSession) return;
    setActionLoading('extract');
    try {
      const res = await apiClient.post(`/prd/sessions/${activeSession.id}/extract`);
      setExtraction(res.data.data?.extractionData || res.data.data || null);
      await loadSessionDetail(activeSession.id);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Extraction failed');
    } finally { setActionLoading(''); }
  };

  // ── Generate ────────────────────────────────────────────────────────────
  const handleGenerate = async () => {
    if (!activeSession) return;
    setActionLoading('generate');
    try {
      await apiClient.post(`/prd/sessions/${activeSession.id}/generate`, { templateStyle: 'standard' });
      await loadSessionDetail(activeSession.id);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Generation failed');
    } finally { setActionLoading(''); }
  };

  // ── Validate ────────────────────────────────────────────────────────────
  const handleValidate = async () => {
    if (!activeSession) return;
    setActionLoading('validate');
    try {
      await apiClient.post(`/prd/sessions/${activeSession.id}/validate`);
      await loadSessionDetail(activeSession.id);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Validation failed');
    } finally { setActionLoading(''); }
  };

  // ── Export ──────────────────────────────────────────────────────────────
  const handleExport = async (format: string) => {
    if (!activeSession) return;
    setActionLoading('export');
    try {
      const res = await apiClient.post(`/prd/sessions/${activeSession.id}/export`, { format });
      const content = res.data.data?.content || res.data.data || '';
      const blob = new Blob([typeof content === 'string' ? content : JSON.stringify(content, null, 2)], { type: 'text/plain' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `${activeSession.title}.${format === 'json' ? 'json' : 'md'}`;
      a.click();
      URL.revokeObjectURL(url);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Export failed');
    } finally { setActionLoading(''); }
  };

  // ── Render: Session List ──────────────────────────────────────────────

  if (view === 'list') {
    return (
      <AppPage>
        <AppPageHeader eyebrow="Product Requirements" title="PRD Builder"
          description="Create, refine and export Product Requirements Documents."
          actions={<button onClick={() => setShowCreate(true)} className="app-button app-button-primary">+ New PRD</button>}
        />
        {error && <div className="app-alert app-alert-danger" style={{ marginBottom: 12 }}>{error}</div>}
        {loading ? <AppEmptyState>Loading...</AppEmptyState> :
          sessions.length === 0 ? (
            <AppEmptyState><p className="app-card-title">No PRD sessions yet</p><p className="app-card-meta">Create one to get started.</p></AppEmptyState>
          ) : (
            <div className="app-stack">
              {sessions.map(s => (
                <div key={s.id} className="app-list-card" style={{ cursor: 'pointer' }} onClick={() => openSession(s)}>
                  <div>
                    <h3 className="app-card-title">{s.title}</h3>
                    <p className="app-card-meta">Updated {new Date(s.updatedAt).toLocaleDateString()}</p>
                  </div>
                  <AppStatusPill tone={STATUS_TONE[s.status] || 'neutral'}>{s.status}</AppStatusPill>
                </div>
              ))}
            </div>
          )}
        {showCreate && (
          <div className="app-modal-backdrop">
            <div className="app-modal">
              <h3 className="app-card-title" style={{ marginBottom: 12 }}>New PRD Session</h3>
              <input type="text" placeholder="PRD title..." value={newTitle} onChange={e => setNewTitle(e.target.value)} autoFocus className="app-input" style={{ marginBottom: 12 }} />
              <div className="app-toolbar" style={{ justifyContent: 'flex-end' }}>
                <button onClick={() => { setShowCreate(false); setNewTitle(''); }} className="app-button">Cancel</button>
                <button onClick={handleCreate} disabled={!!actionLoading || !newTitle.trim()} className="app-button app-button-primary">{actionLoading === 'create' ? 'Creating...' : 'Create'}</button>
              </div>
            </div>
          </div>
        )}
      </AppPage>
    );
  }

  // ── Render: Workspace ─────────────────────────────────────────────────

  return (
    <AppPage fullWidth>
      {/* Header */}
      <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginBottom: 20 }}>
        <button onClick={() => { setView('list'); setActiveSession(null); }} className="app-button">← Back</button>
        <div style={{ flex: 1 }}>
          <p className="app-eyebrow">PRD Builder</p>
          <h1 className="app-page-title" style={{ fontSize: '1.25rem' }}>{activeSession?.title}</h1>
        </div>
        <AppStatusPill tone={STATUS_TONE[activeSession?.status || ''] || 'neutral'}>{activeSession?.status}</AppStatusPill>
      </div>

      {/* Stage stepper */}
      <div style={{ display: 'flex', gap: 4, marginBottom: 20 }}>
        {STAGES.map((stage, i) => (
          <div key={stage} style={{
            flex: 1, padding: '8px 12px', borderRadius: 'var(--app-radius-sm)',
            background: i < (activeSession?.currentStage ?? 1) ? 'var(--app-accent-soft)' : 'var(--app-soft)',
            color: i < (activeSession?.currentStage ?? 1) ? 'var(--app-accent-strong)' : 'var(--app-muted)',
            textAlign: 'center', fontSize: '0.75rem', fontWeight: 700,
          }}>
            {i + 1}. {stage}
          </div>
        ))}
      </div>

      {error && <div className="app-alert app-alert-danger" style={{ marginBottom: 12 }}>{error}<button onClick={() => setError(null)} style={{ float: 'right', background: 'none', border: 'none', cursor: 'pointer' }}>✕</button></div>}

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 16 }}>
        {/* Left: Sources + Upload */}
        <div>
          <AppCard padded>
            <h3 className="app-card-title" style={{ marginBottom: 12 }}>📄 Sources ({sources.length}/10)</h3>

            {sources.map(s => (
              <div key={s.id} style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', padding: '8px 0', borderBottom: '1px solid var(--app-border)' }}>
                <span style={{ fontSize: '0.85rem', fontWeight: 600 }}>{s.filename}</span>
                <AppStatusPill tone={s.parseStatus === 'parsed' ? 'success' : s.parseStatus === 'error' ? 'danger' : 'neutral'}>{s.parseStatus} ({s.chunkCount} chunks)</AppStatusPill>
              </div>
            ))}

            {sources.length === 0 && <p className="app-card-meta">No sources yet. Upload a file or paste text below.</p>}

            {/* Text input */}
            <div style={{ marginTop: 16 }}>
              <label className="app-label">Paste requirements text</label>
              <textarea className="app-textarea" rows={6} placeholder="Describe the requirements here..." value={textInput} onChange={e => setTextInput(e.target.value)} />
              <button onClick={handleUploadText} disabled={!textInput.trim() || actionLoading === 'upload'} className="app-button app-button-primary" style={{ marginTop: 8 }}>
                {actionLoading === 'upload' ? 'Uploading...' : '📝 Add Text'}
              </button>
            </div>

            {/* File upload */}
            <div style={{ marginTop: 12 }}>
              <input ref={fileRef} type="file" accept=".txt,.md,.pdf,.docx,.doc,.png,.jpg,.jpeg,.webp" onChange={handleFileUpload} style={{ display: 'none' }} />
              <button onClick={() => fileRef.current?.click()} disabled={actionLoading === 'upload'} className="app-button" style={{ width: '100%' }}>
                📁 Upload File (.txt, .md, .pdf, .docx, images)
              </button>
            </div>
          </AppCard>

          {/* Actions */}
          <AppCard padded>
            <h3 className="app-card-title" style={{ marginBottom: 12 }}>⚡ Actions</h3>
            <div className="app-stack">
              <button onClick={handleExtract} disabled={sources.length === 0 || !!actionLoading} className="app-button" style={{ width: '100%' }}>
                {actionLoading === 'extract' ? '⏳ Extracting...' : '🔍 Extract Requirements'}
              </button>
              <button onClick={handleGenerate} disabled={!extraction || !!actionLoading} className="app-button" style={{ width: '100%' }}>
                {actionLoading === 'generate' ? '⏳ Generating...' : '📋 Generate PRD Sections'}
              </button>
              <button onClick={handleValidate} disabled={sections.length === 0 || !!actionLoading} className="app-button" style={{ width: '100%' }}>
                {actionLoading === 'validate' ? '⏳ Validating...' : '✅ Validate PRD'}
              </button>
              <div className="app-toolbar">
                <button onClick={() => handleExport('markdown')} disabled={sections.length === 0 || (activeSession?.validationBlockers ?? 0) > 0 || !!actionLoading} className="app-button app-button-primary" style={{ flex: 1 }}>
                  📥 Export .md
                </button>
                <button onClick={() => handleExport('json')} disabled={sections.length === 0 || !!actionLoading} className="app-button" style={{ flex: 1 }}>
                  📥 Export JSON
                </button>
              </div>
              {(activeSession?.validationBlockers ?? 0) > 0 && (
                <p style={{ color: 'var(--app-danger)', fontSize: '0.8rem' }}>⚠️ {activeSession?.validationBlockers} blocker(s) must be resolved before export.</p>
              )}
            </div>
          </AppCard>

          {/* Validation results */}
          {activeSession?.validationScore != null && (
            <AppCard padded>
              <h3 className="app-card-title" style={{ marginBottom: 8 }}>📊 Validation Score: {activeSession.validationScore}%</h3>
              <div className="app-toolbar">
                <AppStatusPill tone="danger">🔴 {activeSession.validationBlockers ?? 0} blockers</AppStatusPill>
                <AppStatusPill tone="warning">🟡 {activeSession.validationWarnings ?? 0} warnings</AppStatusPill>
              </div>
            </AppCard>
          )}
        </div>

        {/* Right: Extraction + Sections */}
        <div>
          {/* Extraction data */}
          {extraction && (
            <AppCard padded>
              <h3 className="app-card-title" style={{ marginBottom: 12 }}>🔍 Extraction Results</h3>
              {extraction.actors?.length > 0 && <Detail label="Actors" items={extraction.actors.map((a: any) => `${a.name} — ${a.role}`)} />}
              {extraction.flows?.length > 0 && <Detail label="Flows" items={extraction.flows.map((f: any) => f.name)} />}
              {extraction.businessRules?.length > 0 && <Detail label="Business Rules" items={extraction.businessRules.map((r: any) => r.description)} />}
              {extraction.apexPages?.length > 0 && <Detail label="APEX Pages" items={extraction.apexPages.map((p: any) => `${p.name} (${p.type})`)} />}
              {extraction.genesysTables?.length > 0 && <Detail label="GENESYS Tables" items={extraction.genesysTables.map((t: any) => t.name)} />}
              {!extraction.actors && !extraction.flows && (
                <p className="app-card-meta">Extraction data: {JSON.stringify(extraction).substring(0, 200)}...</p>
              )}
            </AppCard>
          )}

          {/* Sections */}
          {sections.length > 0 && (
            <AppCard padded>
              <h3 className="app-card-title" style={{ marginBottom: 12 }}>📑 PRD Sections ({sections.length})</h3>
              <div className="app-stack">
                {sections.sort((a, b) => a.sectionNumber - b.sectionNumber).map(sec => (
                  <details key={sec.id} style={{ border: '1px solid var(--app-border)', borderRadius: 'var(--app-radius-sm)', padding: '10px 14px' }}>
                    <summary style={{ cursor: 'pointer', fontWeight: 700, fontSize: '0.85rem' }}>
                      {sec.sectionNumber}. {sec.title}
                    </summary>
                    <div style={{ marginTop: 10, fontSize: '0.85rem', color: 'var(--app-text)', whiteSpace: 'pre-wrap', lineHeight: 1.6 }}>
                      {sec.content}
                    </div>
                  </details>
                ))}
              </div>
            </AppCard>
          )}

          {!extraction && sections.length === 0 && (
            <AppEmptyState>
              <p className="app-card-title">No content yet</p>
              <p className="app-card-meta">Upload sources, then extract and generate to build the PRD.</p>
            </AppEmptyState>
          )}
        </div>
      </div>
    </AppPage>
  );
}

// ── Helper Components ───────────────────────────────────────────────────────

function Detail({ label, items }: { label: string; items: string[] }) {
  return (
    <div style={{ marginBottom: 12 }}>
      <p style={{ fontWeight: 700, fontSize: '0.8rem', color: 'var(--app-accent-strong)', marginBottom: 4 }}>{label}</p>
      <ul style={{ margin: 0, paddingLeft: 16, fontSize: '0.8rem' }}>
        {items.map((item, i) => <li key={i} style={{ marginBottom: 2 }}>{item}</li>)}
      </ul>
    </div>
  );
}
