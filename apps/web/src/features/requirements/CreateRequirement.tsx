import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';
import {
  createIssue,
  saveIssueValidation,
  transitionIssueWithReason,
  type IssuePayload,
  type IssuePriority,
  type IssueType,
  type Issue,
} from '@/services/issues.api';
import { fetchClients, type ClientSummary } from '@/services/clients.api';
import { fetchApplications, fetchPages } from '@/services/explorer.api';
import { fetchProcessParams } from '@/services/process-params.api';
import type { ApexApplication, ProcessParams, ChecklistItem } from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const MAX_FILE_BYTES = 5 * 1024 * 1024;
const ACCEPTED_EXTENSIONS = /\.(doc|docx|pdf|xlsx|xls|png|jpg|jpeg)$/i;
const ACCEPTED_MIME =
  '.doc,.docx,.pdf,.xlsx,.xls,.png,.jpg,.jpeg,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/pdf,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,image/png,image/jpeg';

const PRIORITY_OPTIONS: { value: IssuePriority; label: string; color: string }[] = [
  { value: 'critical', label: 'Crítica', color: 'var(--app-danger)' },
  { value: 'high', label: 'Alta', color: 'var(--app-warm)' },
  { value: 'medium', label: 'Media', color: 'var(--app-accent)' },
  { value: 'low', label: 'Baja', color: 'var(--app-muted)' },
];

const TYPE_OPTIONS: { value: IssueType; label: string }[] = [
  { value: 'feature', label: 'Nueva funcionalidad' },
  { value: 'bug', label: 'Corrección de error' },
  { value: 'enhancement', label: 'Mejora' },
  { value: 'task', label: 'Tarea' },
];

// ---------------------------------------------------------------------------
// Validation criteria for AI report
// ---------------------------------------------------------------------------

interface ValidationCriterion {
  id: string;
  label: string;
  description: string;
  status: 'pass' | 'fail' | 'warning';
  message: string;
}

interface ValidationReport {
  score: number;
  criteria: ValidationCriterion[];
  summary: string;
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

type IssueApexApplication = ApexApplication & { applicationName?: string };

function getAppName(app: IssueApexApplication | undefined): string {
  return app?.name || app?.applicationName || 'Aplicación APEX';
}

function readFileAsBase64(file: File): Promise<string> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => {
      const v = String(reader.result ?? '');
      resolve(v.includes(',') ? v.split(',')[1] : v);
    };
    reader.onerror = () => reject(reader.error ?? new Error('Error leyendo archivo'));
    reader.readAsDataURL(file);
  });
}

function formatBytes(bytes: number): string {
  if (bytes < 1024) return `${bytes} B`;
  if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`;
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
}

// ---------------------------------------------------------------------------
// Prompt template interpolation
// ---------------------------------------------------------------------------

function interpolatePrompt(
  template: string,
  vars: Record<string, string | number>,
): string {
  return template.replace(/\{\{(\w+)\}\}/g, (_, key) => String(vars[key] ?? ''));
}

// ---------------------------------------------------------------------------
// Local AI validation (runs client-side as placeholder until backend exists)
// Uses the checklist configured in process-params (stage: intake)
// ---------------------------------------------------------------------------

interface LocalValidationInput {
  title: string;
  description: string;
  clientId: string;
  appId: string;
  type: IssueType;
  files: File[];
  processChecklist?: ChecklistItem[];
}

function runLocalValidation(data: LocalValidationInput): ValidationReport {
  const criteria: ValidationCriterion[] = [];

  // 1. Title quality
  const titleWords = data.title.trim().split(/\s+/).length;
  criteria.push({
    id: 'title',
    label: 'Título descriptivo',
    description: 'El título debe describir claramente qué se necesita (mínimo 5 palabras)',
    status: titleWords >= 5 ? 'pass' : titleWords >= 3 ? 'warning' : 'fail',
    message:
      titleWords >= 5
        ? 'El título es descriptivo y claro.'
        : titleWords >= 3
          ? 'El título podría ser más descriptivo. Intenta incluir qué, dónde y para qué.'
          : 'El título es muy corto. Describe qué necesitas, en qué módulo y cuál es el objetivo.',
  });

  // 2. Description completeness
  const descLen = data.description.trim().length;
  const hasContext = /contexto|situaci[oó]n|actualmente|hoy|problema/i.test(data.description);
  const hasExpected = /espera|resultado|deber[ií]a|quiero|necesito|objetivo/i.test(data.description);
  const hasSteps =
    /paso|step|1\.|2\.|primero|luego|después|entonces/i.test(data.description) ||
    data.description.includes('\n');

  let descStatus: 'pass' | 'fail' | 'warning' = 'fail';
  let descMessage = '';
  if (descLen >= 100 && hasContext && hasExpected) {
    descStatus = 'pass';
    descMessage = 'La descripción incluye contexto y resultado esperado.';
  } else if (descLen >= 50) {
    descStatus = 'warning';
    const missing: string[] = [];
    if (!hasContext) missing.push('contexto actual');
    if (!hasExpected) missing.push('resultado esperado');
    descMessage = `Buena descripción, pero podrías agregar: ${missing.join(', ')}.`;
  } else {
    descMessage =
      'La descripción es insuficiente. Incluye: contexto actual, qué necesitas y el resultado esperado.';
  }
  criteria.push({
    id: 'description',
    label: 'Descripción completa',
    description: 'Debe incluir contexto, necesidad y resultado esperado (mínimo 100 caracteres)',
    status: descStatus,
    message: descMessage,
  });

  // 3. Client & App selected
  criteria.push({
    id: 'client_app',
    label: 'Cliente y aplicación',
    description: 'Debe estar asociado a un cliente y aplicación APEX',
    status: data.clientId && data.appId ? 'pass' : 'fail',
    message:
      data.clientId && data.appId
        ? 'Cliente y aplicación correctamente seleccionados.'
        : 'Debes seleccionar un cliente y una aplicación APEX.',
  });

  // 4. Type selected properly
  criteria.push({
    id: 'type',
    label: 'Tipo de requerimiento',
    description: 'Se debe clasificar el tipo de trabajo',
    status: 'pass',
    message: `Clasificado como: ${TYPE_OPTIONS.find((t) => t.value === data.type)?.label ?? data.type}`,
  });

  // 5. Supporting documents
  criteria.push({
    id: 'documents',
    label: 'Documentación de soporte',
    description: 'Se recomienda adjuntar documentos, capturas o archivos de referencia',
    status: data.files.length > 0 ? 'pass' : 'warning',
    message:
      data.files.length > 0
        ? `${data.files.length} archivo(s) adjuntado(s).`
        : 'No se adjuntaron documentos. Se recomienda agregar evidencias o especificaciones.',
  });

  // 6. Steps / acceptance criteria
  criteria.push({
    id: 'acceptance',
    label: 'Criterios de aceptación',
    description: 'Se deben describir pasos o criterios para validar el resultado',
    status: hasSteps ? 'pass' : descLen > 150 ? 'warning' : 'fail',
    message: hasSteps
      ? 'Se detectaron pasos o criterios de aceptación.'
      : 'No se detectaron criterios de aceptación. Agrega pasos numerados o condiciones de éxito.',
  });

  // 7. Business impact
  const hasImpact = /impacto|afecta|usuarios|clientes|negocio|urgente|cr[ií]tico|producción/i.test(
    data.description,
  );
  criteria.push({
    id: 'impact',
    label: 'Impacto del negocio',
    description: 'Describir a quiénes afecta y el impacto en el negocio',
    status: hasImpact ? 'pass' : 'warning',
    message: hasImpact
      ? 'Se menciona el impacto en el negocio.'
      : 'Considera describir a quiénes afecta este cambio y cuál es el impacto si no se implementa.',
  });

  // Compute score
  const weights: Record<string, number> = {
    title: 10,
    description: 25,
    client_app: 15,
    type: 5,
    documents: 15,
    acceptance: 20,
    impact: 10,
  };
  let earned = 0;
  let total = 0;
  for (const c of criteria) {
    const w = weights[c.id] ?? 10;
    total += w;
    if (c.status === 'pass') earned += w;
    else if (c.status === 'warning') earned += w * 0.5;
  }
  const score = Math.round((earned / total) * 100);

  const passCount = criteria.filter((c) => c.status === 'pass').length;
  const failCount = criteria.filter((c) => c.status === 'fail').length;

  let summary: string;
  if (score >= 80) {
    summary =
      'El requerimiento cumple con la mayoría de los criterios. Puedes enviarlo para revisión.';
  } else if (score >= 50) {
    summary = `El requerimiento necesita mejoras en ${failCount} criterio(s). Corrige los puntos marcados en rojo antes de enviar.`;
  } else {
    summary = `El requerimiento tiene ${failCount} criterio(s) que no cumplen. Revisa cada punto y agrega la información faltante.`;
  }

  return { score, criteria, summary };
}

// ---------------------------------------------------------------------------
// Attached file item
// ---------------------------------------------------------------------------

interface AttachedFileProps {
  file: File;
  onRemove: () => void;
}

function AttachedFile({ file, onRemove }: AttachedFileProps) {
  const ext = file.name.split('.').pop()?.toLowerCase() ?? '';
  const iconMap: Record<string, string> = {
    pdf: '📄',
    doc: '📝',
    docx: '📝',
    xlsx: '📊',
    xls: '📊',
    png: '🖼️',
    jpg: '🖼️',
    jpeg: '🖼️',
  };
  return (
    <div style={styles.fileItem}>
      <span style={{ fontSize: '1.4rem' }}>{iconMap[ext] ?? '📎'}</span>
      <div style={{ flex: 1, minWidth: 0 }}>
        <div style={styles.fileName}>{file.name}</div>
        <div style={styles.fileMeta}>{formatBytes(file.size)}</div>
      </div>
      <button type="button" onClick={onRemove} style={styles.fileRemove} title="Quitar archivo">
        ✕
      </button>
    </div>
  );
}

// ---------------------------------------------------------------------------
// Validation Report Panel
// ---------------------------------------------------------------------------

interface ValidationPanelProps {
  report: ValidationReport;
  onClose: () => void;
}

function ValidationPanel({ report, onClose }: ValidationPanelProps) {
  const scoreColor =
    report.score >= 80
      ? 'var(--app-success)'
      : report.score >= 50
        ? 'var(--app-warm)'
        : 'var(--app-danger)';

  return (
    <div style={styles.validationPanel}>
      {/* Header */}
      <div style={styles.validationHeader}>
        <div>
          <div style={{ fontSize: '0.75rem', color: 'var(--app-muted)', marginBottom: 4 }}>
            VALIDACIÓN IA
          </div>
          <div style={{ fontSize: '1.1rem', fontWeight: 600 }}>Reporte de calidad</div>
        </div>
        <div style={{ ...styles.scoreCircle, borderColor: scoreColor, color: scoreColor }}>
          {report.score}
        </div>
      </div>

      {/* Summary */}
      <div
        style={{
          padding: '12px 16px',
          background:
            report.score >= 80
              ? 'rgba(21,128,61,0.06)'
              : report.score >= 50
                ? 'rgba(180,83,9,0.06)'
                : 'rgba(180,35,24,0.06)',
          borderRadius: 'var(--app-radius-sm)',
          fontSize: '0.85rem',
          lineHeight: 1.5,
          color: 'var(--app-text)',
          marginBottom: 16,
        }}
      >
        {report.summary}
      </div>

      {/* Criteria list */}
      <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
        {report.criteria.map((c) => (
          <div key={c.id} style={styles.criterionRow}>
            <div style={styles.criterionIcon}>
              {c.status === 'pass' ? '✅' : c.status === 'warning' ? '⚠️' : '❌'}
            </div>
            <div style={{ flex: 1 }}>
              <div style={{ fontWeight: 600, fontSize: '0.85rem', marginBottom: 2 }}>
                {c.label}
              </div>
              <div style={{ fontSize: '0.8rem', color: 'var(--app-muted)', lineHeight: 1.4 }}>
                {c.message}
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Actions */}
      <div style={{ marginTop: 20, display: 'flex', gap: 10, justifyContent: 'flex-end' }}>
        <button className="app-button" onClick={onClose}>
          Corregir requerimiento
        </button>
        {report.score >= 50 && (
          <button
            className="app-button app-button-primary"
            onClick={() => {
              /* will be wired to submit */
            }}
            style={{ opacity: report.score >= 70 ? 1 : 0.7 }}
          >
            {report.score >= 70 ? 'Enviar a revisión' : 'Enviar de todas formas'}
          </button>
        )}
      </div>
    </div>
  );
}

// ---------------------------------------------------------------------------
// Main Component
// ---------------------------------------------------------------------------

export default function CreateRequirement() {
  const navigate = useNavigate();
  const { user } = useAuth();

  // Clients & apps & pages
  const [clients, setClients] = useState<ClientSummary[]>([]);
  const [applications, setApplications] = useState<IssueApexApplication[]>([]);
  const [pages, setPages] = useState<{ pageId: number; pageName: string; title?: string }[]>([]);
  const [loadingApps, setLoadingApps] = useState(false);
  const [loadingPages, setLoadingPages] = useState(false);
  const [appsError, setAppsError] = useState('');
  const [pagesError, setPagesError] = useState('');

  // Form state
  const [clientId, setClientId] = useState('');
  const [appId, setAppId] = useState('');
  const [pageId, setPageId] = useState('');
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [priority, setPriority] = useState<IssuePriority>('medium');
  const [type, setType] = useState<IssueType>('feature');
  const [files, setFiles] = useState<File[]>([]);
  const [fileError, setFileError] = useState('');

  // Submission
  const [saving, setSaving] = useState(false);
  const [validating, setValidating] = useState(false);
  const [validationReport, setValidationReport] = useState<ValidationReport | null>(null);
  const [createdIssue, setCreatedIssue] = useState<Issue | null>(null);

  // Process parameters for "intake" stage (Creación de Requerimiento)
  // Contains the editable AI validation prompt, checklist, min score, etc.
  const [processParams, setProcessParams] = useState<ProcessParams | null>(null);
  const [showPromptPreview, setShowPromptPreview] = useState(false);

  // Min score required to advance (configurable)
  const minScoreToAdvance =
    (processParams?.config?.minScoreToAdvance as number | undefined) ?? 70;

  // Load clients + process params on mount
  useEffect(() => {
    fetchClients({ pageSize: 200 })
      .then((r) => setClients(r.data))
      .catch(() => {});
    fetchProcessParams('intake')
      .then((p) => setProcessParams(p))
      .catch((err) => {
        console.warn('No se pudieron cargar los parametros del proceso:', err);
      });
  }, []);

  // Load applications when client changes
  useEffect(() => {
    if (!clientId) {
      setApplications([]);
      setAppId('');
      setAppsError('');
      return;
    }
    const client = clients.find((c) => c.id === clientId);
    if (!client?.connectionId) {
      setApplications([]);
      setAppId('');
      setAppsError('Este cliente no tiene una conexión APEX configurada.');
      return;
    }
    let cancelled = false;
    setLoadingApps(true);
    setAppsError('');
    fetchApplications(client.connectionId)
      .then((apps) => {
        if (cancelled) return;
        setApplications(apps);
        const preferred = client.appId ? String(client.appId) : apps[0]?.applicationId ? String(apps[0].applicationId) : '';
        setAppId(preferred);
        if (apps.length === 0) setAppsError('No se encontraron aplicaciones APEX para este cliente.');
      })
      .catch(() => {
        if (cancelled) return;
        setAppsError('No se pudieron cargar las aplicaciones.');
      })
      .finally(() => {
        if (!cancelled) setLoadingApps(false);
      });
    return () => { cancelled = true; };
  }, [clientId, clients]);

  // Load pages when app changes
  useEffect(() => {
    if (!clientId || !appId) {
      setPages([]);
      setPageId('');
      setPagesError('');
      return;
    }
    const client = clients.find((c) => c.id === clientId);
    if (!client?.connectionId) {
      setPages([]);
      setPageId('');
      return;
    }
    let cancelled = false;
    setLoadingPages(true);
    setPagesError('');
    fetchPages(client.connectionId, appId)
      .then((nextPages) => {
        if (cancelled) return;
        setPages(
          nextPages.map((page) => ({
            pageId: Number(
              (page as unknown as { pageId?: number; pageNumber?: number }).pageId ??
                (page as unknown as { pageNumber?: number }).pageNumber ??
                0,
            ),
            pageName: String(
              (page as unknown as { pageName?: string; name?: string }).pageName ??
                (page as unknown as { name?: string }).name ??
                '',
            ),
            title: page.title,
          })),
        );
        setPageId('');
      })
      .catch(() => {
        if (cancelled) return;
        setPages([]);
        setPageId('');
        setPagesError('No se pudieron cargar las paginas de la aplicacion.');
      })
      .finally(() => {
        if (!cancelled) setLoadingPages(false);
      });
    return () => { cancelled = true; };
  }, [appId, clientId, clients]);

  // File handling
  const handleAddFiles = useCallback(
    (incoming: FileList | null) => {
      if (!incoming) return;
      setFileError('');
      const newFiles: File[] = [];
      for (let i = 0; i < incoming.length; i++) {
        const f = incoming[i];
        if (!ACCEPTED_EXTENSIONS.test(f.name)) {
          setFileError(`"${f.name}" no es un tipo de archivo permitido.`);
          continue;
        }
        if (f.size > MAX_FILE_BYTES) {
          setFileError(`"${f.name}" supera el límite de 5 MB.`);
          continue;
        }
        if (files.some((existing) => existing.name === f.name && existing.size === f.size)) continue;
        newFiles.push(f);
      }
      if (newFiles.length) setFiles((prev) => [...prev, ...newFiles]);
    },
    [files],
  );

  const handleRemoveFile = (index: number) => {
    setFiles((prev) => prev.filter((_, i) => i !== index));
  };

  // Drag-and-drop
  const [dragOver, setDragOver] = useState(false);
  const handleDrop = useCallback(
    (e: React.DragEvent) => {
      e.preventDefault();
      setDragOver(false);
      handleAddFiles(e.dataTransfer.files);
    },
    [handleAddFiles],
  );

  // Action feedback
  const [actionError, setActionError] = useState('');
  const [approving, setApproving] = useState(false);

  // ──────────────────────────────────────────────────────────────
  // GUARDAR — creates the issue in state `draft` (Pendiente)
  // ──────────────────────────────────────────────────────────────
  const handleSave = async () => {
    if (!title.trim() || !clientId || !appId) return;
    setActionError('');
    setSaving(true);
    try {
      const selectedApp = applications.find((a) => String(a.applicationId) === appId);
      const selectedPage = pages.find((p) => String(p.pageId) === pageId);
      const payload: IssuePayload = {
        clientId,
        appId: Number(appId),
        appName: getAppName(selectedApp),
        pageId: selectedPage?.pageId ?? null,
        pageName: selectedPage?.pageName || selectedPage?.title || null,
        title: title.trim(),
        description: description.trim() || undefined,
        priority,
        type,
      };
      if (files.length > 0) {
        const f = files[0];
        payload.requirementDocument = {
          filename: f.name,
          mimeType: f.type || 'application/octet-stream',
          fileSize: f.size,
          contentBase64: await readFileAsBase64(f),
        };
      }
      const created = await createIssue(payload);
      setCreatedIssue(created);
    } catch (err) {
      console.error('Error guardando requerimiento:', err);
      setActionError('No se pudo guardar el requerimiento. Verifica los datos e intenta de nuevo.');
    } finally {
      setSaving(false);
    }
  };

  // ──────────────────────────────────────────────────────────────
  // VALIDAR — runs AI validation and persists the result
  // Requires the requirement to be saved first.
  // ──────────────────────────────────────────────────────────────
  const handleValidate = async () => {
    if (!createdIssue) {
      setActionError('Debes guardar el requerimiento antes de validarlo.');
      return;
    }
    setActionError('');
    setValidating(true);
    try {
      // Local (client-side placeholder) — to be replaced by real backend call
      // that runs the configured prompt against an LLM.
      const report = runLocalValidation({
        title,
        description,
        clientId,
        appId,
        type,
        files,
        processChecklist: processParams?.checklist,
      });

      // Persist the result into the issue so it survives reloads
      await saveIssueValidation(createdIssue.id, {
        score: report.score,
        notes: {
          summary: report.summary,
          criteria: report.criteria,
          promptModel: processParams?.modelOverride ?? null,
          minScoreToAdvance,
          validatedAt: new Date().toISOString(),
        },
      });

      setValidationReport(report);
    } catch (err) {
      console.error('Error validando requerimiento:', err);
      setActionError('No se pudo guardar el resultado de la validación.');
    } finally {
      setValidating(false);
    }
  };

  // ──────────────────────────────────────────────────────────────
  // APROBAR — transitions to "Radicado" (intake) and persists
  // the validation result. Requires saved + validated.
  // ──────────────────────────────────────────────────────────────
  const handleApprove = async () => {
    if (!createdIssue) {
      setActionError('No se puede aprobar un requerimiento que no está guardado.');
      return;
    }
    if (!validationReport) {
      setActionError('Debes ejecutar la validación antes de aprobar.');
      return;
    }
    if (validationReport.score < minScoreToAdvance) {
      setActionError(
        `El puntaje de validación (${validationReport.score}) es menor al mínimo requerido (${minScoreToAdvance}).`,
      );
      return;
    }
    setActionError('');
    setApproving(true);
    try {
      // draft → validation → intake (Radicado/Aprobado)
      if (createdIssue.status === 'draft') {
        await transitionIssueWithReason(createdIssue.id, 'validation');
      }
      await transitionIssueWithReason(createdIssue.id, 'intake');
      navigate('/pipeline');
    } catch (err) {
      console.error('Error aprobando requerimiento:', err);
      setActionError('No se pudo aprobar el requerimiento.');
    } finally {
      setApproving(false);
    }
  };

  const canSave = Boolean(title.trim() && clientId && appId && !saving && !createdIssue);
  const canValidate = Boolean(createdIssue && !validating);
  const canApprove = Boolean(
    createdIssue &&
      validationReport &&
      validationReport.score >= minScoreToAdvance &&
      !approving,
  );
  const selectedClient = clients.find((c) => c.id === clientId);

  // ---------------------------------------------------------------------------
  // Render
  // ---------------------------------------------------------------------------

  return (
    <div style={styles.page}>
      {/* Top bar */}
      <div style={styles.topBar}>
        <button className="app-button" onClick={() => navigate(-1)} style={{ gap: 6 }}>
          ← Volver
        </button>
        <div style={{ flex: 1 }} />
        {processParams?.promptTemplate && (
          <button
            className="app-button"
            onClick={() => setShowPromptPreview(true)}
            title="Ver el prompt configurado para la validación IA"
          >
            ⚙️ Prompt IA
          </button>
        )}
        {/* Status pill */}
        {createdIssue && (
          <span
            style={{
              fontSize: '0.72rem',
              padding: '4px 10px',
              borderRadius: 999,
              background: createdIssue.status === 'intake'
                ? 'rgba(34,197,94,0.12)'
                : validationReport
                ? 'rgba(59,130,246,0.12)'
                : 'rgba(234,179,8,0.12)',
              color: createdIssue.status === 'intake'
                ? '#166534'
                : validationReport
                ? '#1e40af'
                : '#854d0e',
              fontWeight: 600,
            }}
          >
            {createdIssue.status === 'intake'
              ? '✓ Radicado'
              : validationReport
              ? '✓ Validado'
              : '● Pendiente'}
          </span>
        )}
        {/* 1. Guardar */}
        <button
          className="app-button"
          onClick={handleSave}
          disabled={!canSave}
          title={createdIssue ? 'El requerimiento ya fue guardado' : 'Crear el requerimiento en estado Pendiente'}
          style={{ opacity: canSave ? 1 : 0.5 }}
        >
          {saving ? 'Guardando...' : createdIssue ? '✓ Guardado' : '💾 Guardar'}
        </button>
        {/* 2. Validar */}
        <button
          className="app-button"
          onClick={handleValidate}
          disabled={!canValidate}
          title={!createdIssue ? 'Primero guarda el requerimiento' : 'Ejecutar la validación IA configurada'}
          style={{ opacity: canValidate ? 1 : 0.5 }}
        >
          {validating ? 'Validando...' : '🔍 Validar'}
        </button>
        {/* 3. Aprobar */}
        <button
          className="app-button app-button-primary"
          onClick={handleApprove}
          disabled={!canApprove}
          title={
            !createdIssue
              ? 'No se puede aprobar un requerimiento que no está guardado'
              : !validationReport
              ? 'Debes ejecutar la validación antes de aprobar'
              : validationReport.score < minScoreToAdvance
              ? `El puntaje (${validationReport.score}) es menor al mínimo (${minScoreToAdvance})`
              : 'Aprobar y radicar el requerimiento'
          }
          style={{ opacity: canApprove ? 1 : 0.5 }}
        >
          {approving ? 'Aprobando...' : '✓ Aprobar'}
        </button>
      </div>
      {actionError && (
        <div
          style={{
            margin: '8px 0',
            padding: '10px 14px',
            borderRadius: 8,
            background: 'rgba(239,68,68,0.08)',
            color: 'var(--app-danger)',
            fontSize: '0.85rem',
          }}
        >
          {actionError}
        </div>
      )}

      {/* Prompt preview modal */}
      {showPromptPreview && processParams && (
        <div className="app-modal-backdrop" onClick={() => setShowPromptPreview(false)}>
          <div
            className="app-modal"
            style={{ width: 'min(96vw, 780px)', maxWidth: 780 }}
            onClick={(e) => e.stopPropagation()}
          >
            <div style={{ marginBottom: 12 }}>
              <p className="app-label" style={{ marginBottom: 4 }}>Parámetros del Proceso → Creación de Requerimiento</p>
              <h2 className="app-card-title" style={{ margin: 0 }}>Prompt configurado para validación IA</h2>
              <p style={{ color: 'var(--app-muted)', fontSize: '0.82rem', marginTop: 6 }}>
                Este prompt se puede editar en Administración → Process Params → Creación de Requerimiento.
                Variables disponibles: <code>{'{{title}}'}</code>, <code>{'{{description}}'}</code>, <code>{'{{clientName}}'}</code>, <code>{'{{appName}}'}</code>, <code>{'{{priority}}'}</code>, <code>{'{{type}}'}</code>, <code>{'{{attachmentCount}}'}</code>
              </p>
            </div>

            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12, marginBottom: 12 }}>
              <div>
                <div style={{ fontSize: '0.72rem', color: 'var(--app-muted)', fontWeight: 600, marginBottom: 2 }}>MODELO</div>
                <div style={{ fontSize: '0.85rem' }}>{processParams.modelOverride || '— por defecto —'}</div>
              </div>
              <div>
                <div style={{ fontSize: '0.72rem', color: 'var(--app-muted)', fontWeight: 600, marginBottom: 2 }}>TEMPERATURE / MAX TOKENS</div>
                <div style={{ fontSize: '0.85rem' }}>{processParams.temperature} / {processParams.maxTokens}</div>
              </div>
              <div>
                <div style={{ fontSize: '0.72rem', color: 'var(--app-muted)', fontWeight: 600, marginBottom: 2 }}>SCORE MÍNIMO</div>
                <div style={{ fontSize: '0.85rem' }}>{minScoreToAdvance}</div>
              </div>
              <div>
                <div style={{ fontSize: '0.72rem', color: 'var(--app-muted)', fontWeight: 600, marginBottom: 2 }}>CRITERIOS</div>
                <div style={{ fontSize: '0.85rem' }}>{processParams.checklist.length} configurados</div>
              </div>
            </div>

            <div>
              <div style={{ fontSize: '0.72rem', color: 'var(--app-muted)', fontWeight: 600, marginBottom: 6 }}>PROMPT TEMPLATE</div>
              <pre style={{
                background: 'var(--app-surface-raised)',
                border: '1px solid var(--app-border)',
                borderRadius: 'var(--app-radius-sm)',
                padding: 12,
                fontSize: '0.8rem',
                lineHeight: 1.5,
                whiteSpace: 'pre-wrap',
                maxHeight: 320,
                overflowY: 'auto',
                fontFamily: 'ui-monospace, SFMono-Regular, Menlo, monospace',
              }}>
                {processParams.promptTemplate || '(sin prompt configurado)'}
              </pre>
            </div>

            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: 8, marginTop: 12 }}>
              <button className="app-button" onClick={() => setShowPromptPreview(false)}>Cerrar</button>
              <button
                className="app-button app-button-primary"
                onClick={() => navigate('/admin#process-params')}
              >
                Editar en Administración
              </button>
            </div>
          </div>
        </div>
      )}

      <div style={styles.content}>
        {/* Left: Form */}
        <div style={styles.formColumn}>
          {/* Title area */}
          <div style={styles.eyebrow}>NUEVO REQUERIMIENTO</div>
          <input
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            placeholder="Título del requerimiento..."
            style={styles.titleInput}
            autoFocus
          />

          {/* Meta row 1: Cliente + Aplicación + Página */}
          <div style={styles.metaRow}>
            {/* Client */}
            <div style={styles.metaField}>
              <label style={styles.metaLabel}>Cliente</label>
              <select
                value={clientId}
                onChange={(e) => {
                  setClientId(e.target.value);
                  setAppId('');
                  setPageId('');
                }}
                className="app-select"
              >
                <option value="">Seleccionar...</option>
                {clients.map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.name}
                  </option>
                ))}
              </select>
              {selectedClient?.connectionName && (
                <div style={styles.metaHint}>Conexión: {selectedClient.connectionName}</div>
              )}
            </div>

            {/* Application */}
            <div style={styles.metaField}>
              <label style={styles.metaLabel}>Aplicación APEX</label>
              <select
                value={appId}
                onChange={(e) => {
                  setAppId(e.target.value);
                  setPageId('');
                }}
                className="app-select"
                disabled={!clientId || loadingApps || applications.length === 0}
              >
                <option value="">
                  {loadingApps ? 'Cargando...' : 'Seleccionar...'}
                </option>
                {applications.map((app) => (
                  <option key={app.applicationId} value={String(app.applicationId)}>
                    {app.applicationId} — {getAppName(app)}
                  </option>
                ))}
              </select>
              {appsError && <div style={styles.metaError}>{appsError}</div>}
            </div>

            {/* Page (optional) */}
            <div style={styles.metaField}>
              <label style={styles.metaLabel}>
                Página <span style={{ fontWeight: 400, textTransform: 'none', color: 'var(--app-muted)' }}>(opcional)</span>
              </label>
              <select
                value={pageId}
                onChange={(e) => setPageId(e.target.value)}
                className="app-select"
                disabled={!appId || loadingPages || pages.length === 0}
              >
                <option value="">
                  {loadingPages
                    ? 'Cargando páginas...'
                    : !appId
                      ? 'Selecciona una app primero'
                      : pages.length === 0
                        ? 'Sin páginas disponibles'
                        : 'Sin página específica'}
                </option>
                {pages.map((p) => (
                  <option key={p.pageId} value={String(p.pageId)}>
                    {p.pageId} — {p.pageName || p.title || 'Sin nombre'}
                  </option>
                ))}
              </select>
              {pagesError && <div style={styles.metaError}>{pagesError}</div>}
              {!pagesError && pages.length > 0 && (
                <div style={styles.metaHint}>Agrega la página para mayor precisión</div>
              )}
            </div>
          </div>

          {/* Meta row 2: Prioridad + Tipo */}
          <div style={{ ...styles.metaRow, gridTemplateColumns: '160px 200px', marginTop: 14 }}>
            {/* Priority */}
            <div style={styles.metaField}>
              <label style={styles.metaLabel}>Prioridad</label>
              <select
                value={priority}
                onChange={(e) => setPriority(e.target.value as IssuePriority)}
                className="app-select"
              >
                {PRIORITY_OPTIONS.map((p) => (
                  <option key={p.value} value={p.value}>
                    {p.label}
                  </option>
                ))}
              </select>
            </div>

            {/* Type */}
            <div style={styles.metaField}>
              <label style={styles.metaLabel}>Tipo</label>
              <select
                value={type}
                onChange={(e) => setType(e.target.value as IssueType)}
                className="app-select"
              >
                {TYPE_OPTIONS.map((t) => (
                  <option key={t.value} value={t.value}>
                    {t.label}
                  </option>
                ))}
              </select>
            </div>
          </div>

          {/* Divider */}
          <div style={styles.divider} />

          {/* Description */}
          <div style={{ marginBottom: 24 }}>
            <label style={styles.sectionLabel}>Descripción del requerimiento</label>
            <textarea
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              placeholder={`Describe detalladamente:\n\n• Contexto actual (¿cuál es la situación hoy?)\n• ¿Qué necesitas que se haga?\n• Resultado esperado\n• Criterios de aceptación (1. ... 2. ... 3. ...)\n• Impacto si no se implementa`}
              style={styles.descriptionInput}
              rows={12}
            />
            <div style={styles.charCount}>
              {description.length} caracteres
              {description.length < 100 && (
                <span style={{ color: 'var(--app-danger)' }}> — mínimo recomendado: 100</span>
              )}
            </div>
          </div>

          {/* Attachments */}
          <div>
            <label style={styles.sectionLabel}>
              Documentos adjuntos
              <span style={{ fontWeight: 400, color: 'var(--app-muted)', marginLeft: 8 }}>
                (PDF, Word, Excel, Imágenes — máx. 5 MB c/u)
              </span>
            </label>

            {/* Drop zone */}
            <div
              style={{
                ...styles.dropZone,
                borderColor: dragOver ? 'var(--app-accent)' : 'var(--app-border)',
                background: dragOver ? 'var(--app-accent-soft)' : 'var(--app-surface-raised)',
              }}
              onDragOver={(e) => {
                e.preventDefault();
                setDragOver(true);
              }}
              onDragLeave={() => setDragOver(false)}
              onDrop={handleDrop}
            >
              <div style={{ fontSize: '1.8rem', marginBottom: 8 }}>📎</div>
              <div style={{ fontSize: '0.85rem', color: 'var(--app-text)', marginBottom: 4 }}>
                Arrastra archivos aquí o{' '}
                <label
                  style={{
                    color: 'var(--app-accent)',
                    cursor: 'pointer',
                    textDecoration: 'underline',
                  }}
                >
                  selecciona del computador
                  <input
                    type="file"
                    multiple
                    accept={ACCEPTED_MIME}
                    onChange={(e) => {
                      handleAddFiles(e.target.files);
                      e.target.value = '';
                    }}
                    style={{ display: 'none' }}
                  />
                </label>
              </div>
              <div style={{ fontSize: '0.75rem', color: 'var(--app-muted)' }}>
                PDF, Word, Excel, PNG, JPG — máximo 5 MB por archivo
              </div>
            </div>

            {fileError && (
              <div style={{ color: 'var(--app-danger)', fontSize: '0.8rem', marginTop: 8 }}>
                {fileError}
              </div>
            )}

            {/* File list */}
            {files.length > 0 && (
              <div style={{ display: 'flex', flexDirection: 'column', gap: 6, marginTop: 12 }}>
                {files.map((f, i) => (
                  <AttachedFile key={`${f.name}-${i}`} file={f} onRemove={() => handleRemoveFile(i)} />
                ))}
              </div>
            )}
          </div>
        </div>

        {/* Right: Validation report (appears after validation) */}
        {validationReport && (
          <div style={styles.reportColumn}>
            <ValidationPanel
              report={validationReport}
              onClose={() => {
                setValidationReport(null);
              }}
            />
            {createdIssue && validationReport.score >= minScoreToAdvance && createdIssue.status !== 'intake' && (
              <div
                style={{
                  marginTop: 12,
                  padding: 12,
                  borderRadius: 8,
                  background: 'rgba(34,197,94,0.08)',
                  color: '#166534',
                  fontSize: '0.85rem',
                  textAlign: 'center',
                }}
              >
                Validación aprobada. Usa el botón <strong>✓ Aprobar</strong> en la barra superior para radicar.
              </div>
            )}
          </div>
        )}

        {/* Right: Tips (before validation) */}
        {!validationReport && (
          <div style={styles.tipsColumn}>
            <div style={styles.tipsCard}>
              <div style={{ fontSize: '0.75rem', color: 'var(--app-muted)', marginBottom: 8, letterSpacing: '0.05em' }}>
                GUÍA PARA UN BUEN REQUERIMIENTO
              </div>
              <div style={styles.tipItem}>
                <span style={styles.tipIcon}>📌</span>
                <div>
                  <strong>Título claro</strong>
                  <div style={styles.tipText}>
                    Describe el qué y el dónde en pocas palabras
                  </div>
                </div>
              </div>
              <div style={styles.tipItem}>
                <span style={styles.tipIcon}>📝</span>
                <div>
                  <strong>Contexto completo</strong>
                  <div style={styles.tipText}>
                    Explica la situación actual y por qué se necesita el cambio
                  </div>
                </div>
              </div>
              <div style={styles.tipItem}>
                <span style={styles.tipIcon}>✅</span>
                <div>
                  <strong>Criterios de aceptación</strong>
                  <div style={styles.tipText}>
                    Lista numerada de condiciones que se deben cumplir
                  </div>
                </div>
              </div>
              <div style={styles.tipItem}>
                <span style={styles.tipIcon}>📎</span>
                <div>
                  <strong>Evidencia</strong>
                  <div style={styles.tipText}>
                    Adjunta capturas, documentos o archivos de referencia
                  </div>
                </div>
              </div>
              <div style={styles.tipItem}>
                <span style={styles.tipIcon}>💡</span>
                <div>
                  <strong>Impacto</strong>
                  <div style={styles.tipText}>
                    Describe a quiénes afecta y qué pasa si no se hace
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

// ---------------------------------------------------------------------------
// Styles (inline, clean, spacious)
// ---------------------------------------------------------------------------

const styles: Record<string, React.CSSProperties> = {
  page: {
    display: 'flex',
    flexDirection: 'column',
    height: '100%',
    background: 'var(--app-bg)',
  },
  topBar: {
    display: 'flex',
    alignItems: 'center',
    gap: 10,
    padding: '12px 24px',
    borderBottom: '1px solid var(--app-border)',
    background: 'var(--app-surface)',
  },
  content: {
    display: 'flex',
    flex: 1,
    overflow: 'hidden',
  },
  formColumn: {
    flex: 1,
    padding: '32px 40px',
    overflowY: 'auto',
    maxWidth: 800,
  },
  reportColumn: {
    width: 380,
    flexShrink: 0,
    padding: '24px',
    overflowY: 'auto',
    borderLeft: '1px solid var(--app-border)',
    background: 'var(--app-surface)',
  },
  tipsColumn: {
    width: 320,
    flexShrink: 0,
    padding: '32px 24px',
    overflowY: 'auto',
    borderLeft: '1px solid var(--app-border)',
    background: 'var(--app-surface-raised)',
  },
  eyebrow: {
    fontSize: '0.7rem',
    fontWeight: 700,
    letterSpacing: '0.08em',
    color: 'var(--app-muted)',
    marginBottom: 8,
  },
  titleInput: {
    width: '100%',
    border: 'none',
    outline: 'none',
    fontSize: '1.6rem',
    fontWeight: 700,
    color: 'var(--app-text)',
    background: 'transparent',
    padding: '0',
    marginBottom: 20,
    fontFamily: 'inherit',
    lineHeight: 1.3,
  },
  metaRow: {
    display: 'grid',
    gridTemplateColumns: '1fr 1fr 1fr',
    gap: 16,
    marginBottom: 4,
  },
  metaField: {
    display: 'flex',
    flexDirection: 'column' as const,
    gap: 4,
  },
  metaLabel: {
    fontSize: '0.72rem',
    fontWeight: 600,
    color: 'var(--app-muted)',
    letterSpacing: '0.03em',
    textTransform: 'uppercase' as const,
  },
  metaHint: {
    fontSize: '0.72rem',
    color: 'var(--app-muted)',
    marginTop: 2,
  },
  metaError: {
    fontSize: '0.72rem',
    color: 'var(--app-danger)',
    marginTop: 2,
  },
  divider: {
    height: 1,
    background: 'var(--app-border)',
    margin: '20px 0 24px',
  },
  sectionLabel: {
    display: 'block',
    fontSize: '0.82rem',
    fontWeight: 600,
    color: 'var(--app-text)',
    marginBottom: 10,
  },
  descriptionInput: {
    width: '100%',
    border: '1px solid var(--app-border)',
    borderRadius: 'var(--app-radius)',
    padding: '14px 16px',
    fontSize: '0.88rem',
    lineHeight: 1.6,
    color: 'var(--app-text)',
    background: 'var(--app-surface)',
    resize: 'vertical' as const,
    fontFamily: 'inherit',
    outline: 'none',
    minHeight: 200,
  },
  charCount: {
    fontSize: '0.72rem',
    color: 'var(--app-muted)',
    textAlign: 'right' as const,
    marginTop: 6,
  },
  dropZone: {
    border: '2px dashed var(--app-border)',
    borderRadius: 'var(--app-radius)',
    padding: '28px 20px',
    textAlign: 'center' as const,
    transition: 'all 0.15s ease',
    cursor: 'pointer',
  },
  fileItem: {
    display: 'flex',
    alignItems: 'center',
    gap: 10,
    padding: '8px 12px',
    borderRadius: 'var(--app-radius-sm)',
    background: 'var(--app-surface)',
    border: '1px solid var(--app-border)',
  },
  fileName: {
    fontSize: '0.82rem',
    fontWeight: 500,
    color: 'var(--app-text)',
    overflow: 'hidden',
    textOverflow: 'ellipsis',
    whiteSpace: 'nowrap' as const,
  },
  fileMeta: {
    fontSize: '0.72rem',
    color: 'var(--app-muted)',
  },
  fileRemove: {
    border: 'none',
    background: 'none',
    color: 'var(--app-muted)',
    cursor: 'pointer',
    fontSize: '0.85rem',
    padding: '4px',
    borderRadius: 4,
  },
  // Validation panel
  validationPanel: {
    borderRadius: 'var(--app-radius)',
    border: '1px solid var(--app-border)',
    padding: '20px',
    background: 'var(--app-surface)',
  },
  validationHeader: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 16,
  },
  scoreCircle: {
    width: 52,
    height: 52,
    borderRadius: '50%',
    border: '3px solid',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    fontWeight: 800,
    fontSize: '1.1rem',
  },
  criterionRow: {
    display: 'flex',
    gap: 10,
    alignItems: 'flex-start',
  },
  criterionIcon: {
    fontSize: '1rem',
    marginTop: 1,
    flexShrink: 0,
  },
  // Tips card
  tipsCard: {
    padding: 20,
    borderRadius: 'var(--app-radius)',
    border: '1px solid var(--app-border)',
    background: 'var(--app-surface)',
  },
  tipItem: {
    display: 'flex',
    gap: 10,
    marginBottom: 14,
    fontSize: '0.82rem',
    lineHeight: 1.4,
  },
  tipIcon: {
    fontSize: '1rem',
    flexShrink: 0,
    marginTop: 1,
  },
  tipText: {
    color: 'var(--app-muted)',
    fontSize: '0.78rem',
    marginTop: 2,
  },
};
