import { useState, useEffect, useCallback, useRef } from 'react';
import { useTranslation } from 'react-i18next';
import {
  AppPage,
  AppPageHeader,
  AppCard,
  AppEmptyState,
  AppStatusPill,
} from '@/components/ui/AppTemplate';
import { apiClient } from '@/lib/api-client';
import {
  fetchIssues,
  fetchIssue,
  transitionIssue,
  type Issue,
  type IssueSummary,
} from '@/services/issues.api';
import { fetchConfigs, type PRDConfig } from '@/services/prd-config.api';
import PRDConfigPage from './components/PRDConfig';

// ── Types ──────────────────────────────────────────────────────────────────

interface PRDSession {
  id: string;
  title: string;
  status: string;
  currentStage: number;
  validationScore?: number;
  validationBlockers?: number;
  validationWarnings?: number;
  issueId?: string;
  createdAt: string;
  updatedAt: string;
}

interface PRDSection {
  id: string;
  sectionNumber: number;
  title: string;
  content: string;
  isCurrent: boolean;
}

interface PRDSource {
  id: string;
  filename: string;
  parseStatus: string;
  chunkCount: number;
}

interface ValidationCheck {
  key: string;
  label: string;
  type: 'blocker' | 'warning';
  status: 'open' | 'resolved';
  detail?: string;
}

type View = 'list' | 'workspace' | 'configs';
type WorkspaceStep = 'requirement' | 'context' | 'generate' | 'edit' | 'approve';

const STEPS: { key: WorkspaceStep; label: string }[] = [
  { key: 'requirement', label: 'Requerimiento' },
  { key: 'context', label: 'Contexto' },
  { key: 'generate', label: 'Generar PRD' },
  { key: 'edit', label: 'Editar Secciones' },
  { key: 'approve', label: 'Aprobar' },
];

const PRIORITY_TONE: Record<string, 'neutral' | 'accent' | 'warning' | 'success' | 'danger'> = {
  critical: 'danger',
  high: 'warning',
  medium: 'accent',
  low: 'neutral',
};

const STATUS_TONE: Record<string, 'neutral' | 'accent' | 'warning' | 'success' | 'danger'> = {
  draft: 'neutral',
  ingesting: 'accent',
  extracting: 'warning',
  generating: 'warning',
  validating: 'accent',
  validated: 'success',
  approved: 'success',
  exported: 'success',
};

// ── Main Page Component ────────────────────────────────────────────────────

export default function PRDBuilderPage() {
  const { t } = useTranslation();
  const [view, setView] = useState<View>('list');

  // Session list state
  const [sessions, setSessions] = useState<PRDSession[]>([]);
  const [loading, setLoading] = useState(true);

  // Workspace state
  const [activeSession, setActiveSession] = useState<PRDSession | null>(null);
  const [step, setStep] = useState<WorkspaceStep>('requirement');
  const [sections, setSections] = useState<PRDSection[]>([]);
  const [sources, setSources] = useState<PRDSource[]>([]);
  const [extraction, setExtraction] = useState<any>(null);
  const [validationChecks, setValidationChecks] = useState<ValidationCheck[]>([]);

  // Requirement selection state
  const [issueOptions, setIssueOptions] = useState<IssueSummary[]>([]);
  const [selectedIssue, setSelectedIssue] = useState<Issue | null>(null);
  const [issueSearch, setIssueSearch] = useState('');

  // Context additions
  const [additionalContext, setAdditionalContext] = useState('');
  const fileRef = useRef<HTMLInputElement>(null);

  // Config
  const [configOptions, setConfigOptions] = useState<PRDConfig[]>([]);
  const [selectedConfigId, setSelectedConfigId] = useState('');

  // UI state
  const [actionLoading, setActionLoading] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [editingSection, setEditingSection] = useState<string | null>(null);
  const [editContent, setEditContent] = useState('');
  const [expandedSections, setExpandedSections] = useState<Set<string>>(new Set());

  // ── Load sessions ───────────────────────────────────────────────────────
  const loadSessions = useCallback(async () => {
    try {
      setLoading(true);
      const res = await apiClient.get('/prd/sessions');
      setSessions(res.data.data || []);
    } catch {
      setError('Error al cargar sesiones');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    loadSessions();
  }, [loadSessions]);

  // ── Load session detail ─────────────────────────────────────────────────
  const loadSessionDetail = useCallback(async (id: string) => {
    try {
      const res = await apiClient.get(`/prd/sessions/${id}`);
      const data = res.data.data || res.data;
      setActiveSession(data);
      setSources(data.sources || []);
      setSections(
        (data.sections || []).filter((s: PRDSection) => s.isCurrent),
      );
      setExtraction(data.extractionData || null);
      setValidationChecks(data.validationChecks || []);

      // Determine the correct step based on session state
      if (data.status === 'approved' || data.status === 'exported') {
        setStep('approve');
      } else if ((data.sections || []).length > 0) {
        setStep('edit');
      } else if (data.extractionData) {
        setStep('generate');
      } else if ((data.sources || []).length > 0) {
        setStep('context');
      } else {
        setStep('requirement');
      }
    } catch {
      setError('Error al cargar sesión');
    }
  }, []);

  // ── Load issues for selector ────────────────────────────────────────────
  const loadIssuesForSelector = useCallback(async () => {
    try {
      const result = await fetchIssues({ status: 'intake', pageSize: 100 });
      setIssueOptions(result.data);
    } catch {
      /* ignore */
    }
  }, []);

  // ── Load configs ────────────────────────────────────────────────────────
  const loadConfigsForSelector = useCallback(async () => {
    try {
      const data = await fetchConfigs();
      setConfigOptions(data);
      const defaultCfg = data.find((c) => c.isDefault);
      if (defaultCfg) setSelectedConfigId(defaultCfg.id);
    } catch {
      /* ignore */
    }
  }, []);

  // ── Select issue & create session ───────────────────────────────────────
  const handleSelectIssue = async (issueId: string) => {
    setActionLoading('select');
    setError(null);
    try {
      const issue = await fetchIssue(issueId);
      setSelectedIssue(issue);

      // If issue already has a PRD session, open it
      if (issue.prdSessionId) {
        await loadSessionDetail(issue.prdSessionId);
        setView('workspace');
        setActionLoading('');
        return;
      }

      // Create session linked to this issue
      const body: Record<string, unknown> = {
        title: `PRD — ${issue.code}: ${issue.title}`,
        issueId: issue.id,
      };
      if (selectedConfigId) body.configId = selectedConfigId;

      const res = await apiClient.post('/prd/sessions', body);
      const session = res.data.data;
      setActiveSession(session);
      setSources([]);
      setSections([]);
      setExtraction(null);

      // Auto-upload issue description as first source
      if (issue.description) {
        await apiClient.post(`/prd/sessions/${session.id}/sources`, {
          filename: `${issue.code}-description.txt`,
          mimeType: 'text/plain',
          content: issue.description,
        });
      }

      // Upload requirement documents if any
      if (issue.requirementDocuments?.length) {
        for (const doc of issue.requirementDocuments) {
          try {
            const docRes = await apiClient.get(
              `/issues/${issue.id}/documents/${doc.id}`,
              { responseType: 'arraybuffer' },
            );
            const base64 = btoa(
              String.fromCharCode(...new Uint8Array(docRes.data)),
            );
            await apiClient.post(`/prd/sessions/${session.id}/sources`, {
              filename: doc.filename,
              mimeType: doc.mimeType,
              content: base64,
              encoding: 'base64',
              fileSize: doc.fileSize,
            });
          } catch {
            /* continue with other docs */
          }
        }
      }

      // Transition issue to 'prd' status
      await transitionIssue(issue.id, 'prd');

      await loadSessionDetail(session.id);
      setStep('context');
      setView('workspace');
      loadSessions();
    } catch (err: any) {
      setError(
        err.response?.data?.error?.message || 'Error al seleccionar issue',
      );
    } finally {
      setActionLoading('');
    }
  };

  // ── Open existing session ───────────────────────────────────────────────
  const openSession = useCallback(
    async (session: PRDSession) => {
      setError(null);
      setView('workspace');

      // Load the linked issue if available
      if (session.issueId) {
        try {
          const issue = await fetchIssue(session.issueId);
          setSelectedIssue(issue);
        } catch {
          /* issue may have been deleted */
        }
      }

      await loadSessionDetail(session.id);
    },
    [loadSessionDetail],
  );

  // ── Upload additional text ──────────────────────────────────────────────
  const handleUploadText = async () => {
    if (!activeSession || !additionalContext.trim()) return;
    setActionLoading('upload');
    try {
      await apiClient.post(`/prd/sessions/${activeSession.id}/sources`, {
        filename: 'contexto-adicional.txt',
        mimeType: 'text/plain',
        content: additionalContext.trim(),
      });
      setAdditionalContext('');
      await loadSessionDetail(activeSession.id);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Error al subir texto');
    } finally {
      setActionLoading('');
    }
  };

  // ── Upload file ─────────────────────────────────────────────────────────
  const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !activeSession) return;
    setActionLoading('upload');
    try {
      const mimeType = file.type || 'text/plain';
      const isText =
        mimeType.startsWith('text/') ||
        file.name.endsWith('.md') ||
        file.name.endsWith('.txt');

      let content: string;
      let encoding: string | undefined;

      if (isText) {
        content = await file.text();
      } else {
        const buffer = await file.arrayBuffer();
        content = btoa(String.fromCharCode(...new Uint8Array(buffer)));
        encoding = 'base64';
      }

      await apiClient.post(`/prd/sessions/${activeSession.id}/sources`, {
        filename: file.name,
        mimeType,
        content,
        encoding,
        fileSize: file.size,
      });
      await loadSessionDetail(activeSession.id);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Error al subir archivo');
    } finally {
      setActionLoading('');
      if (fileRef.current) fileRef.current.value = '';
    }
  };

  // ── Generate PRD ────────────────────────────────────────────────────────
  const handleGenerate = async () => {
    if (!activeSession) return;
    setActionLoading('generate');
    setError(null);
    try {
      // Extract first if not done
      if (!extraction) {
        await apiClient.post(`/prd/sessions/${activeSession.id}/extract`);
      }
      // Generate
      await apiClient.post(`/prd/sessions/${activeSession.id}/generate`, {
        templateStyle: 'standard',
      });
      await loadSessionDetail(activeSession.id);
      setStep('edit');
      // Expand all sections
      const res = await apiClient.get(`/prd/sessions/${activeSession.id}`);
      const allSections = (res.data.data?.sections || []).filter(
        (s: PRDSection) => s.isCurrent,
      );
      setExpandedSections(new Set(allSections.map((s: PRDSection) => s.id)));
    } catch (err: any) {
      setError(
        err.response?.data?.error?.message || 'Error al generar PRD',
      );
    } finally {
      setActionLoading('');
    }
  };

  // ── Save section edit ───────────────────────────────────────────────────
  const handleSaveSection = async (sectionId: string) => {
    if (!activeSession) return;
    setActionLoading('save');
    try {
      await apiClient.put(`/prd/sections/${sectionId}`, {
        content: editContent,
        generatedBy: 'hybrid',
      });
      setEditingSection(null);
      setEditContent('');
      await loadSessionDetail(activeSession.id);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Error al guardar');
    } finally {
      setActionLoading('');
    }
  };

  // ── Regenerate single section ───────────────────────────────────────────
  const handleRegenerateSection = async (sectionId: string) => {
    if (!activeSession) return;
    setActionLoading(`regen-${sectionId}`);
    try {
      await apiClient.post(
        `/prd/sessions/${activeSession.id}/sections/${sectionId}/regenerate`,
      );
      await loadSessionDetail(activeSession.id);
    } catch (err: any) {
      // Fallback: if endpoint doesn't exist, regenerate all (temporary)
      try {
        await apiClient.post(`/prd/sessions/${activeSession.id}/generate`, {
          templateStyle: 'standard',
        });
        await loadSessionDetail(activeSession.id);
      } catch {
        setError('Error al regenerar sección');
      }
    } finally {
      setActionLoading('');
    }
  };

  // ── Validate ────────────────────────────────────────────────────────────
  const handleValidate = async () => {
    if (!activeSession) return;
    setActionLoading('validate');
    try {
      await apiClient.post(`/prd/sessions/${activeSession.id}/validate`);
      await loadSessionDetail(activeSession.id);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Error al validar');
    } finally {
      setActionLoading('');
    }
  };

  // ── Approve PRD ─────────────────────────────────────────────────────────
  const handleApprove = async () => {
    if (!activeSession) return;
    setActionLoading('approve');
    try {
      // 1. Validate first
      await apiClient.post(`/prd/sessions/${activeSession.id}/validate`);
      const sessionRes = await apiClient.get(
        `/prd/sessions/${activeSession.id}`,
      );
      const session = sessionRes.data.data;

      if ((session.validationBlockers ?? 0) > 0) {
        setError(
          `No se puede aprobar: ${session.validationBlockers} blocker(s) sin resolver`,
        );
        await loadSessionDetail(activeSession.id);
        setActionLoading('');
        return;
      }

      // 2. Export to .md
      await apiClient.post(`/prd/sessions/${activeSession.id}/export`, {
        format: 'markdown',
        includeMeta: true,
      });

      // 3. Mark session as approved
      await apiClient.patch(`/prd/sessions/${activeSession.id}`, {
        status: 'approved',
      });

      // 4. Transition linked issue to 'design' (ready for analysis)
      if (selectedIssue) {
        await transitionIssue(selectedIssue.id, 'design');
      }

      await loadSessionDetail(activeSession.id);
      setStep('approve');
      loadSessions();
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Error al aprobar PRD');
    } finally {
      setActionLoading('');
    }
  };

  // ── Toggle accordion ────────────────────────────────────────────────────
  const toggleSection = (sectionId: string) => {
    setExpandedSections((prev) => {
      const next = new Set(prev);
      if (next.has(sectionId)) next.delete(sectionId);
      else next.add(sectionId);
      return next;
    });
  };

  const expandAll = () =>
    setExpandedSections(new Set(sections.map((s) => s.id)));
  const collapseAll = () => setExpandedSections(new Set());

  // ── Filtered issues ─────────────────────────────────────────────────────
  const filteredIssues = issueOptions.filter(
    (issue) =>
      !issueSearch ||
      issue.title.toLowerCase().includes(issueSearch.toLowerCase()) ||
      issue.code.toLowerCase().includes(issueSearch.toLowerCase()),
  );

  // ══════════════════════════════════════════════════════════════════════════
  //  RENDER: SESSION LIST
  // ══════════════════════════════════════════════════════════════════════════

  if (view === 'list') {
    return (
      <AppPage>
        <AppPageHeader
          eyebrow="M8"
          title="PRD Builder"
          description="Genera PRDs estructurados desde requerimientos existentes"
          actions={
            <div className="app-toolbar" style={{ gap: 8 }}>
              <button
                onClick={() => setView('configs')}
                className="app-button"
              >
                Configuraciones
              </button>
              <button
                onClick={() => {
                  loadIssuesForSelector();
                  loadConfigsForSelector();
                  setView('workspace');
                  setActiveSession(null);
                  setSelectedIssue(null);
                  setStep('requirement');
                  setSections([]);
                  setExtraction(null);
                  setSources([]);
                  setError(null);
                }}
                className="app-button app-button-primary"
              >
                + Nuevo PRD
              </button>
            </div>
          }
        />

        {error && (
          <div className="app-alert app-alert-danger" style={{ marginBottom: 12 }}>
            {error}
            <button
              onClick={() => setError(null)}
              style={{ float: 'right', background: 'none', border: 'none', cursor: 'pointer' }}
            >
              &times;
            </button>
          </div>
        )}

        {loading ? (
          <AppEmptyState>Cargando...</AppEmptyState>
        ) : sessions.length === 0 ? (
          <AppEmptyState>
            <p className="app-card-title">No hay sesiones de PRD</p>
            <p className="app-card-meta">
              Selecciona un requerimiento para generar tu primer PRD
            </p>
          </AppEmptyState>
        ) : (
          <div className="app-stack">
            {sessions.map((s) => (
              <div
                key={s.id}
                className="app-list-card"
                style={{ cursor: 'pointer' }}
                onClick={() => openSession(s)}
              >
                <div style={{ flex: 1, minWidth: 0 }}>
                  <h3 className="app-card-title">{s.title}</h3>
                  <p className="app-card-meta">
                    Actualizado{' '}
                    {new Date(s.updatedAt).toLocaleDateString('es-CO')}
                    {s.validationScore != null &&
                      ` · Score: ${s.validationScore}%`}
                  </p>
                </div>
                <AppStatusPill
                  tone={STATUS_TONE[s.status] || 'neutral'}
                >
                  {s.status}
                </AppStatusPill>
              </div>
            ))}
          </div>
        )}
      </AppPage>
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  //  RENDER: CONFIGS
  // ══════════════════════════════════════════════════════════════════════════

  if (view === 'configs') {
    return (
      <div>
        <div style={{ marginBottom: 12 }}>
          <button onClick={() => setView('list')} className="app-button">
            &larr; Volver a Sesiones
          </button>
        </div>
        <PRDConfigPage />
      </div>
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  //  RENDER: WORKSPACE
  // ══════════════════════════════════════════════════════════════════════════

  const isApproved =
    activeSession?.status === 'approved' ||
    activeSession?.status === 'exported';
  const currentStepIndex = STEPS.findIndex((s) => s.key === step);

  return (
    <AppPage fullWidth>
      {/* ── Header ─────────────────────────────────────────────────────── */}
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          gap: 12,
          marginBottom: 20,
        }}
      >
        <button
          onClick={() => {
            setView('list');
            setActiveSession(null);
            setSelectedIssue(null);
          }}
          className="app-button"
        >
          &larr; Volver
        </button>
        <div style={{ flex: 1 }}>
          <p className="app-eyebrow">PRD Builder</p>
          <h1 className="app-page-title" style={{ fontSize: '1.25rem' }}>
            {activeSession?.title || 'Nuevo PRD'}
          </h1>
        </div>
        {activeSession && (
          <AppStatusPill
            tone={STATUS_TONE[activeSession.status] || 'neutral'}
          >
            {activeSession.status}
          </AppStatusPill>
        )}
      </div>

      {/* ── Step indicator ─────────────────────────────────────────────── */}
      <div style={{ display: 'flex', gap: 4, marginBottom: 20 }}>
        {STEPS.map((s, i) => {
          const isActive = s.key === step;
          const isDone = i < currentStepIndex;
          const isClickable = isDone || (i === currentStepIndex + 1 && !isApproved);

          return (
            <div
              key={s.key}
              onClick={() => {
                if (isDone) setStep(s.key);
              }}
              style={{
                flex: 1,
                padding: '10px 12px',
                borderRadius: 'var(--app-radius-sm)',
                background: isActive
                  ? 'var(--app-accent)'
                  : isDone
                    ? 'var(--app-accent-soft)'
                    : 'var(--app-soft)',
                color: isActive
                  ? '#fff'
                  : isDone
                    ? 'var(--app-accent-strong)'
                    : 'var(--app-muted)',
                textAlign: 'center',
                fontSize: '0.78rem',
                fontWeight: 700,
                cursor: isDone ? 'pointer' : 'default',
                transition: 'all 0.2s',
              }}
            >
              {i + 1}. {s.label}
            </div>
          );
        })}
      </div>

      {/* ── Error bar ──────────────────────────────────────────────────── */}
      {error && (
        <div
          className="app-alert app-alert-danger"
          style={{ marginBottom: 12 }}
        >
          {error}
          <button
            onClick={() => setError(null)}
            style={{
              float: 'right',
              background: 'none',
              border: 'none',
              cursor: 'pointer',
            }}
          >
            &times;
          </button>
        </div>
      )}

      {/* ── STEP 1: Seleccionar Requerimiento ──────────────────────────── */}
      {step === 'requirement' && (
        <div style={{ maxWidth: 720 }}>
          <AppCard padded>
            <h3 className="app-card-title" style={{ marginBottom: 4 }}>
              Seleccionar Requerimiento
            </h3>
            <p className="app-card-meta" style={{ marginBottom: 16 }}>
              Elige un requerimiento en estado Intake para generar su PRD
            </p>

            {/* Config selector */}
            {configOptions.length > 0 && (
              <div style={{ marginBottom: 16 }}>
                <label className="app-label">Configuración de PRD</label>
                <select
                  value={selectedConfigId}
                  onChange={(e) => setSelectedConfigId(e.target.value)}
                  className="app-select"
                  style={{ width: '100%' }}
                >
                  <option value="">Usar configuración por defecto</option>
                  {configOptions.map((cfg) => (
                    <option key={cfg.id} value={cfg.id}>
                      {cfg.name}
                      {cfg.isDefault ? ' (default)' : ''}
                    </option>
                  ))}
                </select>
              </div>
            )}

            {/* Search */}
            <input
              type="text"
              placeholder="Buscar por código o título..."
              value={issueSearch}
              onChange={(e) => setIssueSearch(e.target.value)}
              className="app-input"
              style={{ marginBottom: 12, width: '100%' }}
            />

            {/* Issue list */}
            {issueOptions.length === 0 && (
              <AppEmptyState>
                <p className="app-card-meta">
                  No hay requerimientos en estado Intake.
                </p>
              </AppEmptyState>
            )}

            <div
              className="app-stack"
              style={{ maxHeight: 420, overflowY: 'auto' }}
            >
              {filteredIssues.map((issue) => (
                <div
                  key={issue.id}
                  className="app-list-card"
                  style={{
                    cursor:
                      actionLoading === 'select' ? 'wait' : 'pointer',
                    opacity: actionLoading === 'select' ? 0.6 : 1,
                  }}
                  onClick={() => {
                    if (actionLoading) return;
                    handleSelectIssue(issue.id);
                  }}
                >
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div
                      style={{
                        display: 'flex',
                        alignItems: 'center',
                        gap: 8,
                        marginBottom: 2,
                      }}
                    >
                      <span
                        style={{
                          fontWeight: 700,
                          fontSize: '0.8rem',
                          color: 'var(--app-accent-strong)',
                        }}
                      >
                        {issue.code}
                      </span>
                      <AppStatusPill
                        tone={PRIORITY_TONE[issue.priority] || 'neutral'}
                      >
                        {issue.priority}
                      </AppStatusPill>
                      <span
                        style={{
                          fontSize: '0.75rem',
                          color: 'var(--app-muted)',
                          textTransform: 'uppercase',
                        }}
                      >
                        {issue.type}
                      </span>
                    </div>
                    <h4
                      style={{
                        margin: 0,
                        fontSize: '0.9rem',
                        fontWeight: 600,
                      }}
                    >
                      {issue.title}
                    </h4>
                    <p
                      className="app-card-meta"
                      style={{ marginTop: 2 }}
                    >
                      {issue.clientName}
                      {issue.appName ? ` · ${issue.appName}` : ''}
                      {issue.assignedToName
                        ? ` · ${issue.assignedToName}`
                        : ''}
                    </p>
                  </div>
                  <span style={{ color: 'var(--app-muted)', fontSize: '1.2rem' }}>
                    &rarr;
                  </span>
                </div>
              ))}
            </div>
          </AppCard>
        </div>
      )}

      {/* ── STEP 2: Agregar Contexto ───────────────────────────────────── */}
      {step === 'context' && selectedIssue && (
        <div
          style={{
            display: 'grid',
            gridTemplateColumns: '1fr 1fr',
            gap: 16,
          }}
        >
          {/* Left: Requirement detail */}
          <div>
            <AppCard padded>
              <div
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: 8,
                  marginBottom: 12,
                }}
              >
                <span
                  style={{
                    fontWeight: 700,
                    color: 'var(--app-accent-strong)',
                  }}
                >
                  {selectedIssue.code}
                </span>
                <AppStatusPill
                  tone={PRIORITY_TONE[selectedIssue.priority] || 'neutral'}
                >
                  {selectedIssue.priority}
                </AppStatusPill>
                <span
                  style={{
                    fontSize: '0.75rem',
                    color: 'var(--app-muted)',
                    textTransform: 'uppercase',
                  }}
                >
                  {selectedIssue.type}
                </span>
              </div>
              <h3
                className="app-card-title"
                style={{ marginBottom: 8 }}
              >
                {selectedIssue.title}
              </h3>
              <div
                style={{
                  fontSize: '0.85rem',
                  lineHeight: 1.6,
                  whiteSpace: 'pre-wrap',
                  color: 'var(--app-text)',
                  maxHeight: 300,
                  overflowY: 'auto',
                  padding: '12px',
                  background: 'var(--app-soft)',
                  borderRadius: 'var(--app-radius-sm)',
                }}
              >
                {selectedIssue.description || 'Sin descripción'}
              </div>

              {/* Metadata */}
              <div
                style={{
                  marginTop: 12,
                  display: 'grid',
                  gridTemplateColumns: '1fr 1fr',
                  gap: 8,
                  fontSize: '0.8rem',
                }}
              >
                <div>
                  <span className="app-label">Cliente</span>
                  <p style={{ margin: 0 }}>{selectedIssue.clientName}</p>
                </div>
                <div>
                  <span className="app-label">Aplicación</span>
                  <p style={{ margin: 0 }}>
                    {selectedIssue.appName || '—'}
                  </p>
                </div>
                <div>
                  <span className="app-label">Asignado a</span>
                  <p style={{ margin: 0 }}>
                    {selectedIssue.assignedToName || '—'}
                  </p>
                </div>
                <div>
                  <span className="app-label">Tags</span>
                  <p style={{ margin: 0 }}>
                    {selectedIssue.tags?.join(', ') || '—'}
                  </p>
                </div>
              </div>

              {/* Requirement documents */}
              {selectedIssue.requirementDocuments &&
                selectedIssue.requirementDocuments.length > 0 && (
                  <div style={{ marginTop: 12 }}>
                    <span className="app-label">
                      Documentos adjuntos
                    </span>
                    {selectedIssue.requirementDocuments.map((doc) => (
                      <div
                        key={doc.id}
                        style={{
                          display: 'flex',
                          justifyContent: 'space-between',
                          padding: '6px 0',
                          fontSize: '0.8rem',
                          borderBottom:
                            '1px solid var(--app-border)',
                        }}
                      >
                        <span>{doc.filename}</span>
                        <span className="app-card-meta">
                          {(doc.fileSize / 1024).toFixed(0)} KB
                        </span>
                      </div>
                    ))}
                  </div>
                )}
            </AppCard>

            {/* Sources loaded */}
            {sources.length > 0 && (
              <AppCard padded>
                <h3
                  className="app-card-title"
                  style={{ marginBottom: 8 }}
                >
                  Fuentes cargadas ({sources.length})
                </h3>
                {sources.map((s) => (
                  <div
                    key={s.id}
                    style={{
                      display: 'flex',
                      justifyContent: 'space-between',
                      alignItems: 'center',
                      padding: '6px 0',
                      borderBottom: '1px solid var(--app-border)',
                      fontSize: '0.85rem',
                    }}
                  >
                    <span style={{ fontWeight: 600 }}>
                      {s.filename}
                    </span>
                    <AppStatusPill
                      tone={
                        s.parseStatus === 'parsed'
                          ? 'success'
                          : s.parseStatus === 'error'
                            ? 'danger'
                            : 'neutral'
                      }
                    >
                      {s.parseStatus}
                    </AppStatusPill>
                  </div>
                ))}
              </AppCard>
            )}
          </div>

          {/* Right: Add more context */}
          <div>
            <AppCard padded>
              <h3
                className="app-card-title"
                style={{ marginBottom: 4 }}
              >
                Agregar Contexto Adicional
              </h3>
              <p className="app-card-meta" style={{ marginBottom: 12 }}>
                Puedes agregar notas, aclaraciones o subir documentos
                complementarios antes de generar el PRD
              </p>

              <label className="app-label">Notas adicionales</label>
              <textarea
                className="app-textarea"
                rows={8}
                placeholder="Agrega contexto que no esté en el requerimiento: decisiones técnicas, restricciones, prioridades..."
                value={additionalContext}
                onChange={(e) => setAdditionalContext(e.target.value)}
              />
              <button
                onClick={handleUploadText}
                disabled={
                  !additionalContext.trim() || actionLoading === 'upload'
                }
                className="app-button"
                style={{ marginTop: 8 }}
              >
                {actionLoading === 'upload'
                  ? 'Guardando...'
                  : 'Agregar notas'}
              </button>

              <div
                style={{
                  marginTop: 16,
                  borderTop: '1px solid var(--app-border)',
                  paddingTop: 16,
                }}
              >
                <label className="app-label">
                  Subir documento adicional
                </label>
                <input
                  ref={fileRef}
                  type="file"
                  accept=".txt,.md,.pdf,.docx,.doc,.png,.jpg,.jpeg,.webp"
                  onChange={handleFileUpload}
                  style={{ display: 'none' }}
                />
                <button
                  onClick={() => fileRef.current?.click()}
                  disabled={actionLoading === 'upload'}
                  className="app-button"
                  style={{ width: '100%' }}
                >
                  Subir archivo (.pdf, .docx, imagen)
                </button>
              </div>
            </AppCard>

            {/* Generate button */}
            <div style={{ marginTop: 16, textAlign: 'right' }}>
              <button
                onClick={handleGenerate}
                disabled={
                  sources.length === 0 || actionLoading === 'generate'
                }
                className="app-button app-button-primary"
                style={{
                  padding: '12px 32px',
                  fontSize: '0.95rem',
                }}
              >
                {actionLoading === 'generate'
                  ? 'Generando PRD...'
                  : 'Generar PRD'}
              </button>
              {sources.length === 0 && (
                <p
                  className="app-card-meta"
                  style={{ marginTop: 4 }}
                >
                  Se necesita al menos una fuente para generar
                </p>
              )}
            </div>
          </div>
        </div>
      )}

      {/* ── STEP 3: Generating (intermediate) ──────────────────────────── */}
      {step === 'generate' && (
        <div style={{ maxWidth: 600, margin: '0 auto', textAlign: 'center' }}>
          <AppCard padded>
            <h3 className="app-card-title" style={{ marginBottom: 12 }}>
              Generando PRD
            </h3>
            <p className="app-card-meta">
              El AI está analizando las fuentes y generando el PRD
              estructurado...
            </p>
            <div
              style={{
                marginTop: 20,
                height: 4,
                background: 'var(--app-soft)',
                borderRadius: 4,
                overflow: 'hidden',
              }}
            >
              <div
                style={{
                  height: '100%',
                  width: actionLoading === 'generate' ? '60%' : '100%',
                  background: 'var(--app-accent)',
                  transition: 'width 2s ease',
                }}
              />
            </div>
            <button
              onClick={handleGenerate}
              disabled={actionLoading === 'generate'}
              className="app-button app-button-primary"
              style={{ marginTop: 16 }}
            >
              {actionLoading === 'generate'
                ? 'Generando...'
                : 'Reintentar generación'}
            </button>
          </AppCard>
        </div>
      )}

      {/* ── STEP 4: Edit Sections (Accordion) ──────────────────────────── */}
      {step === 'edit' && sections.length > 0 && (
        <div>
          {/* Toolbar */}
          <div
            className="app-toolbar"
            style={{
              justifyContent: 'space-between',
              marginBottom: 12,
            }}
          >
            <div className="app-toolbar" style={{ gap: 8 }}>
              <button onClick={expandAll} className="app-button">
                Expandir todo
              </button>
              <button onClick={collapseAll} className="app-button">
                Colapsar todo
              </button>
              <button
                onClick={handleValidate}
                disabled={!!actionLoading}
                className="app-button"
              >
                {actionLoading === 'validate'
                  ? 'Validando...'
                  : 'Validar PRD'}
              </button>
            </div>
            <div className="app-toolbar" style={{ gap: 8 }}>
              {activeSession?.validationScore != null && (
                <AppStatusPill
                  tone={
                    (activeSession.validationBlockers ?? 0) > 0
                      ? 'danger'
                      : 'success'
                  }
                >
                  Score: {activeSession.validationScore}%
                  {(activeSession.validationBlockers ?? 0) > 0 &&
                    ` · ${activeSession.validationBlockers} blockers`}
                </AppStatusPill>
              )}
              <button
                onClick={() => setStep('approve')}
                disabled={
                  (activeSession?.validationBlockers ?? 0) > 0 ||
                  !!actionLoading
                }
                className="app-button app-button-primary"
              >
                Ir a Aprobación
              </button>
            </div>
          </div>

          {/* Validation warnings */}
          {(activeSession?.validationBlockers ?? 0) > 0 && (
            <div
              className="app-alert app-alert-danger"
              style={{ marginBottom: 12, fontSize: '0.85rem' }}
            >
              Hay {activeSession?.validationBlockers} blocker(s) que
              deben resolverse antes de aprobar. Revisa las secciones
              marcadas.
            </div>
          )}

          {/* Sections accordion */}
          <div className="app-stack">
            {sections
              .sort((a, b) => a.sectionNumber - b.sectionNumber)
              .map((sec) => {
                const isExpanded = expandedSections.has(sec.id);
                const isEditing = editingSection === sec.id;

                return (
                  <div
                    key={sec.id}
                    style={{
                      border: '1px solid var(--app-border)',
                      borderRadius: 'var(--app-radius)',
                      overflow: 'hidden',
                    }}
                  >
                    {/* Accordion header */}
                    <div
                      onClick={() => {
                        if (!isEditing) toggleSection(sec.id);
                      }}
                      style={{
                        display: 'flex',
                        alignItems: 'center',
                        gap: 10,
                        padding: '12px 16px',
                        background: isExpanded
                          ? 'var(--app-surface-raised)'
                          : 'var(--app-surface)',
                        cursor: isEditing ? 'default' : 'pointer',
                        userSelect: 'none',
                      }}
                    >
                      <span
                        style={{
                          fontSize: '0.75rem',
                          transition: 'transform 0.2s',
                          transform: isExpanded
                            ? 'rotate(90deg)'
                            : 'rotate(0deg)',
                        }}
                      >
                        &#9654;
                      </span>
                      <span
                        style={{
                          fontWeight: 700,
                          fontSize: '0.85rem',
                          flex: 1,
                        }}
                      >
                        {sec.sectionNumber}. {sec.title}
                      </span>
                      {isExpanded && !isEditing && !isApproved && (
                        <div
                          className="app-toolbar"
                          style={{ gap: 4 }}
                          onClick={(e) => e.stopPropagation()}
                        >
                          <button
                            onClick={() => {
                              setEditingSection(sec.id);
                              setEditContent(sec.content);
                            }}
                            className="app-button"
                            style={{
                              fontSize: '0.75rem',
                              padding: '4px 10px',
                            }}
                          >
                            Editar
                          </button>
                          <button
                            onClick={() =>
                              handleRegenerateSection(sec.id)
                            }
                            disabled={
                              actionLoading === `regen-${sec.id}`
                            }
                            className="app-button"
                            style={{
                              fontSize: '0.75rem',
                              padding: '4px 10px',
                            }}
                          >
                            {actionLoading === `regen-${sec.id}`
                              ? 'Regenerando...'
                              : 'Regenerar'}
                          </button>
                        </div>
                      )}
                    </div>

                    {/* Accordion body */}
                    {isExpanded && (
                      <div
                        style={{
                          padding: '16px',
                          borderTop:
                            '1px solid var(--app-border)',
                        }}
                      >
                        {isEditing ? (
                          <div>
                            <textarea
                              className="app-textarea"
                              rows={14}
                              value={editContent}
                              onChange={(e) =>
                                setEditContent(e.target.value)
                              }
                              style={{
                                fontFamily: 'monospace',
                                fontSize: '0.85rem',
                              }}
                            />
                            <div
                              className="app-toolbar"
                              style={{
                                justifyContent: 'flex-end',
                                marginTop: 8,
                                gap: 8,
                              }}
                            >
                              <button
                                onClick={() => {
                                  setEditingSection(null);
                                  setEditContent('');
                                }}
                                className="app-button"
                              >
                                Cancelar
                              </button>
                              <button
                                onClick={() =>
                                  handleSaveSection(sec.id)
                                }
                                disabled={
                                  actionLoading === 'save'
                                }
                                className="app-button app-button-primary"
                              >
                                {actionLoading === 'save'
                                  ? 'Guardando...'
                                  : 'Guardar'}
                              </button>
                            </div>
                          </div>
                        ) : (
                          <div
                            style={{
                              fontSize: '0.85rem',
                              lineHeight: 1.7,
                              whiteSpace: 'pre-wrap',
                              color: 'var(--app-text)',
                            }}
                          >
                            {sec.content}
                          </div>
                        )}
                      </div>
                    )}
                  </div>
                );
              })}
          </div>
        </div>
      )}

      {/* ── STEP 5: Approve ────────────────────────────────────────────── */}
      {step === 'approve' && (
        <div style={{ maxWidth: 720 }}>
          {/* Summary */}
          <AppCard padded>
            <h3 className="app-card-title" style={{ marginBottom: 12 }}>
              Resumen del PRD
            </h3>

            <div
              style={{
                display: 'grid',
                gridTemplateColumns: '1fr 1fr 1fr',
                gap: 16,
                marginBottom: 16,
              }}
            >
              <div
                style={{
                  textAlign: 'center',
                  padding: 16,
                  background: 'var(--app-soft)',
                  borderRadius: 'var(--app-radius-sm)',
                }}
              >
                <p
                  style={{
                    fontSize: '2rem',
                    fontWeight: 700,
                    color: 'var(--app-accent-strong)',
                    margin: 0,
                  }}
                >
                  {sections.length}
                </p>
                <p className="app-card-meta">Secciones</p>
              </div>
              <div
                style={{
                  textAlign: 'center',
                  padding: 16,
                  background:
                    (activeSession?.validationBlockers ?? 0) > 0
                      ? '#fef2f2'
                      : 'var(--app-accent-soft)',
                  borderRadius: 'var(--app-radius-sm)',
                }}
              >
                <p
                  style={{
                    fontSize: '2rem',
                    fontWeight: 700,
                    color:
                      (activeSession?.validationBlockers ?? 0) > 0
                        ? 'var(--app-danger)'
                        : 'var(--app-accent-strong)',
                    margin: 0,
                  }}
                >
                  {activeSession?.validationScore ?? '—'}%
                </p>
                <p className="app-card-meta">
                  Score de validación
                </p>
              </div>
              <div
                style={{
                  textAlign: 'center',
                  padding: 16,
                  background: 'var(--app-soft)',
                  borderRadius: 'var(--app-radius-sm)',
                }}
              >
                <p
                  style={{
                    fontSize: '2rem',
                    fontWeight: 700,
                    margin: 0,
                  }}
                >
                  {sources.length}
                </p>
                <p className="app-card-meta">Fuentes</p>
              </div>
            </div>

            {/* Linked issue info */}
            {selectedIssue && (
              <div
                style={{
                  padding: 12,
                  background: 'var(--app-soft)',
                  borderRadius: 'var(--app-radius-sm)',
                  marginBottom: 16,
                  fontSize: '0.85rem',
                }}
              >
                <p style={{ margin: 0, fontWeight: 600 }}>
                  Requerimiento vinculado: {selectedIssue.code} —{' '}
                  {selectedIssue.title}
                </p>
                <p className="app-card-meta" style={{ margin: 0 }}>
                  Al aprobar, el requerimiento avanzará a estado
                  &quot;Design&quot; (listo para análisis)
                </p>
              </div>
            )}

            {/* Validation issues */}
            {(activeSession?.validationBlockers ?? 0) > 0 && (
              <div
                className="app-alert app-alert-danger"
                style={{ marginBottom: 16, fontSize: '0.85rem' }}
              >
                No se puede aprobar: hay{' '}
                {activeSession?.validationBlockers} blocker(s) sin
                resolver.
                <button
                  onClick={() => setStep('edit')}
                  className="app-button"
                  style={{
                    marginLeft: 12,
                    fontSize: '0.8rem',
                    padding: '4px 12px',
                  }}
                >
                  Volver a editar
                </button>
              </div>
            )}

            {/* Actions */}
            {!isApproved ? (
              <div
                className="app-toolbar"
                style={{
                  justifyContent: 'flex-end',
                  gap: 8,
                }}
              >
                <button
                  onClick={() => setStep('edit')}
                  className="app-button"
                >
                  Volver a editar
                </button>
                <button
                  onClick={handleValidate}
                  disabled={!!actionLoading}
                  className="app-button"
                >
                  {actionLoading === 'validate'
                    ? 'Validando...'
                    : 'Re-validar'}
                </button>
                <button
                  onClick={handleApprove}
                  disabled={
                    (activeSession?.validationBlockers ?? 0) > 0 ||
                    !!actionLoading
                  }
                  className="app-button app-button-primary"
                  style={{ padding: '10px 24px' }}
                >
                  {actionLoading === 'approve'
                    ? 'Aprobando...'
                    : 'Aprobar PRD'}
                </button>
              </div>
            ) : (
              <div
                style={{
                  padding: 16,
                  background: '#f0fdf4',
                  borderRadius: 'var(--app-radius-sm)',
                  textAlign: 'center',
                }}
              >
                <p
                  style={{
                    fontWeight: 700,
                    color: 'var(--app-success)',
                    fontSize: '1.1rem',
                    margin: 0,
                  }}
                >
                  PRD Aprobado
                </p>
                <p className="app-card-meta" style={{ marginTop: 4 }}>
                  El PRD fue guardado en la base de datos, exportado
                  como .md y el requerimiento está listo para la fase
                  de análisis.
                </p>
              </div>
            )}
          </AppCard>

          {/* Section preview (collapsed, read-only) */}
          {sections.length > 0 && (
            <AppCard padded>
              <h3
                className="app-card-title"
                style={{ marginBottom: 12 }}
              >
                Secciones del PRD ({sections.length})
              </h3>
              {sections
                .sort((a, b) => a.sectionNumber - b.sectionNumber)
                .map((sec) => (
                  <details
                    key={sec.id}
                    style={{
                      border: '1px solid var(--app-border)',
                      borderRadius: 'var(--app-radius-sm)',
                      padding: '10px 14px',
                      marginBottom: 4,
                    }}
                  >
                    <summary
                      style={{
                        cursor: 'pointer',
                        fontWeight: 700,
                        fontSize: '0.85rem',
                      }}
                    >
                      {sec.sectionNumber}. {sec.title}
                    </summary>
                    <div
                      style={{
                        marginTop: 10,
                        fontSize: '0.85rem',
                        whiteSpace: 'pre-wrap',
                        lineHeight: 1.6,
                      }}
                    >
                      {sec.content}
                    </div>
                  </details>
                ))}
            </AppCard>
          )}
        </div>
      )}
    </AppPage>
  );
}
