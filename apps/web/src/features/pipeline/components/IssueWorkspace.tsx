import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import {
  fetchIssue,
  fetchApprovals,
  submitApproval,
  fetchReturnHistory,
  transitionIssueWithReason,
  updateIssue,
  fetchIssueActivities,
  ISSUE_STATUSES,
  STATUS_LABELS,
  type IssueStatus,
  type Issue,
  type IssueApproval,
} from '@/services/issues.api';
import { fetchUsersByRole, type UserProfile } from '@/services/users.api';

// ── Constants ──────────────────────────────────────────────────────────────

const STATUS_COLORS: Record<IssueStatus, string> = {
  draft: '#6b7280',
  validation: '#8b5cf6',
  intake: '#3b82f6',
  prd: '#0891b2',
  prd_approval: '#d97706',
  design: '#7c3aed',
  build: '#0f766e',
  test: '#ea580c',
  docs: '#2563eb',
  done: '#16a34a',
};

const STAGE_ICONS: Record<IssueStatus, string> = {
  draft: '1',
  validation: '2',
  intake: '3',
  prd: '4',
  prd_approval: '5',
  design: '6',
  build: '7',
  test: '8',
  docs: '9',
  done: '10',
};

interface Props {
  issueId: string;
  userRole: string;
  userId: string;
  onBack: () => void;
}

// ── Main Component ─────────────────────────────────────────────────────────

export default function IssueWorkspace({ issueId, userRole, userId, onBack }: Props) {
  const queryClient = useQueryClient();
  const [returnReason, setReturnReason] = useState('');
  const [showReturnModal, setShowReturnModal] = useState(false);
  const [approvalComment, setApprovalComment] = useState('');

  // Queries
  const issueQuery = useQuery({
    queryKey: ['issue', issueId],
    queryFn: () => fetchIssue(issueId),
  });

  const approvalsQuery = useQuery({
    queryKey: ['issue', issueId, 'approvals', issueQuery.data?.status],
    queryFn: () => fetchApprovals(issueId, issueQuery.data!.status),
    enabled: !!issueQuery.data && issueQuery.data.status === 'prd_approval',
  });

  const returnsQuery = useQuery({
    queryKey: ['issue', issueId, 'returns'],
    queryFn: () => fetchReturnHistory(issueId),
  });

  const activitiesQuery = useQuery({
    queryKey: ['issue', issueId, 'activities'],
    queryFn: () => fetchIssueActivities(issueId),
  });

  // Mutations
  const transitionMutation = useMutation({
    mutationFn: ({ status, reason }: { status: IssueStatus; reason?: string }) =>
      transitionIssueWithReason(issueId, status, reason),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['issue', issueId] });
      queryClient.invalidateQueries({ queryKey: ['issues'] });
      setShowReturnModal(false);
      setReturnReason('');
    },
  });

  const approvalMutation = useMutation({
    mutationFn: ({ decision, comments }: { decision: 'approved' | 'returned'; comments?: string }) =>
      submitApproval(issueId, 'prd_approval', decision, comments),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['issue', issueId] });
      queryClient.invalidateQueries({ queryKey: ['issue', issueId, 'approvals'] });
      setApprovalComment('');
    },
  });

  const issue = issueQuery.data;
  const approvals = approvalsQuery.data ?? [];
  const returns = returnsQuery.data ?? [];
  const activities = activitiesQuery.data ?? [];

  if (issueQuery.isLoading) {
    return (
      <div className="app-page" style={{ display: 'flex', justifyContent: 'center', padding: '3rem' }}>
        <span style={{ color: 'var(--app-text-secondary)' }}>Cargando issue...</span>
      </div>
    );
  }

  if (!issue) {
    return (
      <div className="app-page">
        <button type="button" className="app-button" onClick={onBack}>Volver</button>
        <p style={{ marginTop: '1rem', color: '#dc2626' }}>Issue no encontrado.</p>
      </div>
    );
  }

  const currentStageIndex = ISSUE_STATUSES.indexOf(issue.status);

  return (
    <div className="app-page">
      {/* Header */}
      <div style={{ display: 'flex', alignItems: 'center', gap: '1rem', marginBottom: '1.5rem' }}>
        <button type="button" className="app-button" onClick={onBack}>
          Volver
        </button>
        <div style={{ flex: 1 }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
            <span style={{ fontFamily: 'monospace', fontWeight: 700, fontSize: '0.85rem', color: 'var(--app-text-secondary)' }}>
              {issue.code}
            </span>
            <h1 style={{ fontSize: '1.2rem', fontWeight: 600, margin: 0, color: 'var(--app-text)' }}>
              {issue.title}
            </h1>
          </div>
          <div style={{ display: 'flex', gap: '0.75rem', marginTop: '0.25rem', fontSize: '0.8rem', color: 'var(--app-text-secondary)' }}>
            <span>{issue.clientName}</span>
            {issue.assignedToName && <span>Asignado: {issue.assignedToName}</span>}
            <span>Prioridad: {issue.priority}</span>
          </div>
        </div>
      </div>

      {/* Return banner */}
      {issue.returnedReason && (
        <div className="app-card" style={{
          padding: '0.75rem 1rem',
          marginBottom: '1rem',
          borderLeft: '3px solid #dc2626',
          background: '#fef2f2',
        }}>
          <div style={{ fontSize: '0.85rem', fontWeight: 600, color: '#dc2626', marginBottom: '0.25rem' }}>
            Issue devuelto
          </div>
          <div style={{ fontSize: '0.85rem', color: '#7f1d1d' }}>
            {issue.returnedReason}
          </div>
        </div>
      )}

      {/* Stepper */}
      <div style={{
        display: 'flex',
        alignItems: 'center',
        gap: '0.25rem',
        marginBottom: '1.5rem',
        overflowX: 'auto',
        padding: '0.5rem 0',
      }}>
        {ISSUE_STATUSES.map((status, index) => {
          const isCompleted = index < currentStageIndex;
          const isCurrent = status === issue.status;
          const isFuture = index > currentStageIndex;
          const color = STATUS_COLORS[status];

          return (
            <div key={status} style={{ display: 'flex', alignItems: 'center' }}>
              {/* Step circle */}
              <div style={{
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                minWidth: '70px',
              }}>
                <div style={{
                  width: 32,
                  height: 32,
                  borderRadius: '50%',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  fontSize: '0.75rem',
                  fontWeight: 700,
                  background: isCompleted ? color : isCurrent ? color : 'var(--app-soft)',
                  color: isCompleted || isCurrent ? '#fff' : 'var(--app-text-secondary)',
                  border: isCurrent ? `2px solid ${color}` : '2px solid transparent',
                  boxShadow: isCurrent ? `0 0 0 3px ${color}30` : 'none',
                }}>
                  {isCompleted ? '✓' : STAGE_ICONS[status]}
                </div>
                <span style={{
                  fontSize: '0.65rem',
                  fontWeight: isCurrent ? 700 : 400,
                  color: isCurrent ? color : isFuture ? 'var(--app-text-secondary)' : 'var(--app-text)',
                  marginTop: '0.3rem',
                  textAlign: 'center',
                  whiteSpace: 'nowrap',
                }}>
                  {STATUS_LABELS[status]}
                </span>
              </div>
              {/* Connector line */}
              {index < ISSUE_STATUSES.length - 1 && (
                <div style={{
                  width: '20px',
                  height: '2px',
                  background: index < currentStageIndex ? color : 'var(--app-border)',
                  marginTop: '-1rem',
                }} />
              )}
            </div>
          );
        })}
      </div>

      {/* Main content area */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 300px', gap: '1rem' }}>
        {/* Left: Stage content */}
        <div>
          <StageContent
            issue={issue}
            userRole={userRole}
            userId={userId}
            approvals={approvals}
            approvalComment={approvalComment}
            setApprovalComment={setApprovalComment}
            onTransition={(status, reason) => transitionMutation.mutate({ status, reason })}
            onApprove={(decision, comments) => approvalMutation.mutate({ decision, comments })}
            onShowReturn={() => setShowReturnModal(true)}
            isTransitioning={transitionMutation.isPending}
            isApproving={approvalMutation.isPending}
          />
        </div>

        {/* Right: Sidebar */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
          {/* Issue details */}
          <div className="app-card" style={{ padding: '1rem' }}>
            <h3 style={{ fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.75rem' }}>Detalle</h3>
            <div style={{ display: 'flex', flexDirection: 'column', gap: '0.4rem', fontSize: '0.8rem' }}>
              <div><strong>Cliente:</strong> {issue.clientName} ({issue.clientCode})</div>
              <div><strong>Tipo:</strong> {issue.type}</div>
              <div><strong>Prioridad:</strong> {issue.priority}</div>
              {issue.appName && <div><strong>Aplicación:</strong> {issue.appName}</div>}
              {issue.assignedToName && <div><strong>Asignado:</strong> {issue.assignedToName}</div>}
              {issue.tags.length > 0 && (
                <div><strong>Tags:</strong> {issue.tags.join(', ')}</div>
              )}
              {issue.aiValidationScore != null && (
                <div><strong>Score IA:</strong> {issue.aiValidationScore}/100</div>
              )}
            </div>
          </div>

          {/* Return history */}
          {returns.length > 0 && (
            <div className="app-card" style={{ padding: '1rem' }}>
              <h3 style={{ fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.75rem' }}>
                Historial de devoluciones
              </h3>
              <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
                {returns.slice(0, 5).map((ret) => (
                  <div key={ret.id} style={{ fontSize: '0.75rem', padding: '0.4rem', background: 'var(--app-soft)', borderRadius: '0.25rem' }}>
                    <div style={{ fontWeight: 600 }}>
                      {ret.fromStage} → {ret.toStage}
                    </div>
                    <div style={{ color: 'var(--app-text-secondary)' }}>
                      {ret.returnedByName ?? 'Sistema'} — {new Date(ret.createdAt).toLocaleDateString('es')}
                    </div>
                    <div style={{ marginTop: '0.2rem' }}>{ret.reason}</div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Recent activity */}
          <div className="app-card" style={{ padding: '1rem' }}>
            <h3 style={{ fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.75rem' }}>
              Actividad reciente
            </h3>
            <div style={{ display: 'flex', flexDirection: 'column', gap: '0.4rem' }}>
              {activities.slice(0, 8).map((act) => (
                <div key={act.id} style={{ fontSize: '0.75rem', padding: '0.3rem 0', borderBottom: '1px solid var(--app-border)' }}>
                  <div>{act.description}</div>
                  <div style={{ color: 'var(--app-text-secondary)' }}>
                    {new Date(act.createdAt).toLocaleDateString('es', { day: '2-digit', month: 'short', hour: '2-digit', minute: '2-digit' })}
                  </div>
                </div>
              ))}
              {activities.length === 0 && (
                <div style={{ color: 'var(--app-text-secondary)', fontSize: '0.8rem' }}>Sin actividad.</div>
              )}
            </div>
          </div>
        </div>
      </div>

      {/* Return Modal */}
      {showReturnModal && (
        <div style={{
          position: 'fixed', inset: 0, background: 'rgba(0,0,0,0.5)',
          display: 'flex', alignItems: 'center', justifyContent: 'center', zIndex: 1000,
        }}>
          <div className="app-card" style={{ padding: '1.5rem', maxWidth: '500px', width: '90%' }}>
            <h3 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem' }}>Devolver Issue</h3>
            <p style={{ fontSize: '0.85rem', marginBottom: '0.75rem', color: 'var(--app-text-secondary)' }}>
              Explica el motivo de la devolución para que el responsable pueda corregir.
            </p>
            <textarea
              className="app-textarea"
              rows={4}
              placeholder="Motivo de devolución..."
              value={returnReason}
              onChange={(e) => setReturnReason(e.target.value)}
              style={{ width: '100%', marginBottom: '1rem' }}
            />
            <div style={{ display: 'flex', gap: '0.5rem', justifyContent: 'flex-end' }}>
              <button type="button" className="app-button" onClick={() => { setShowReturnModal(false); setReturnReason(''); }}>
                Cancelar
              </button>
              <button
                type="button"
                className="app-button"
                style={{ background: '#dc2626', color: '#fff', border: 'none' }}
                disabled={!returnReason.trim() || transitionMutation.isPending}
                onClick={() => {
                  const returnTargets: Partial<Record<IssueStatus, IssueStatus>> = {
                    validation: 'draft',
                    intake: 'draft',
                    prd_approval: 'prd',
                    design: 'prd_approval',
                    build: 'design',
                    test: 'build',
                    docs: 'test',
                  };
                  const target = returnTargets[issue.status];
                  if (target) {
                    transitionMutation.mutate({ status: target, reason: returnReason });
                  }
                }}
              >
                {transitionMutation.isPending ? 'Devolviendo...' : 'Devolver'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

// ── Stage Content ──────────────────────────────────────────────────────────

function StageContent({
  issue,
  userRole,
  userId,
  approvals,
  approvalComment,
  setApprovalComment,
  onTransition,
  onApprove,
  onShowReturn,
  isTransitioning,
  isApproving,
}: {
  issue: Issue;
  userRole: string;
  userId: string;
  approvals: IssueApproval[];
  approvalComment: string;
  setApprovalComment: (v: string) => void;
  onTransition: (status: IssueStatus, reason?: string) => void;
  onApprove: (decision: 'approved' | 'returned', comments?: string) => void;
  onShowReturn: () => void;
  isTransitioning: boolean;
  isApproving: boolean;
}) {
  switch (issue.status) {
    case 'draft':
      return <DraftStage issue={issue} userRole={userRole} onTransition={onTransition} isTransitioning={isTransitioning} />;
    case 'validation':
      return <ValidationStage issue={issue} />;
    case 'intake':
      return <IntakeStage issue={issue} userRole={userRole} onTransition={onTransition} onShowReturn={onShowReturn} isTransitioning={isTransitioning} />;
    case 'prd':
      return <PRDStage issue={issue} userRole={userRole} onTransition={onTransition} isTransitioning={isTransitioning} />;
    case 'prd_approval':
      return (
        <PRDApprovalStage
          issue={issue}
          userRole={userRole}
          approvals={approvals}
          approvalComment={approvalComment}
          setApprovalComment={setApprovalComment}
          onApprove={onApprove}
          onTransition={onTransition}
          isApproving={isApproving}
        />
      );
    case 'design':
      return <DesignStage issue={issue} userRole={userRole} onTransition={onTransition} onShowReturn={onShowReturn} isTransitioning={isTransitioning} />;
    case 'build':
      return <BuildStage issue={issue} userRole={userRole} onTransition={onTransition} onShowReturn={onShowReturn} isTransitioning={isTransitioning} />;
    case 'test':
      return <TestStage issue={issue} userRole={userRole} onTransition={onTransition} onShowReturn={onShowReturn} isTransitioning={isTransitioning} />;
    case 'docs':
      return <DocsStage issue={issue} userRole={userRole} onTransition={onTransition} isTransitioning={isTransitioning} />;
    case 'done':
      return <DoneStage issue={issue} />;
    default:
      return <div>Estado desconocido: {issue.status}</div>;
  }
}

// ── Individual Stages ──────────────────────────────────────────────────────

function DraftStage({ issue, userRole, onTransition, isTransitioning }: {
  issue: Issue; userRole: string; onTransition: (s: IssueStatus) => void; isTransitioning: boolean;
}) {
  const canSubmit = userRole === 'ops_lead' || userRole === 'admin';
  return (
    <div className="app-card" style={{ padding: '1.5rem' }}>
      <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem', color: STATUS_COLORS.draft }}>
        Borrador del Requerimiento
      </h2>
      <div style={{ marginBottom: '1rem' }}>
        <div style={{ fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.5rem' }}>Descripción</div>
        <div style={{ fontSize: '0.85rem', lineHeight: 1.6, color: 'var(--app-text)', whiteSpace: 'pre-wrap' }}>
          {issue.description || 'Sin descripción.'}
        </div>
      </div>
      {issue.requirementDocuments && issue.requirementDocuments.length > 0 && (
        <div style={{ marginBottom: '1rem' }}>
          <div style={{ fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.5rem' }}>Documentos adjuntos</div>
          {issue.requirementDocuments.map((doc) => (
            <div key={doc.id} style={{ fontSize: '0.8rem', padding: '0.3rem 0' }}>
              {doc.filename} ({Math.round(doc.fileSize / 1024)} KB)
            </div>
          ))}
        </div>
      )}
      {canSubmit && (
        <div style={{ display: 'flex', gap: '0.5rem', marginTop: '1.5rem' }}>
          <button
            type="button"
            className="app-button app-button-primary"
            disabled={isTransitioning}
            onClick={() => onTransition('validation')}
          >
            {isTransitioning ? 'Enviando...' : 'Enviar a Validación IA'}
          </button>
        </div>
      )}
    </div>
  );
}

function ValidationStage({ issue }: { issue: Issue }) {
  return (
    <div className="app-card" style={{ padding: '1.5rem' }}>
      <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem', color: STATUS_COLORS.validation }}>
        Validación por Agente IA
      </h2>
      {issue.aiValidationScore != null ? (
        <div>
          <div style={{
            display: 'flex', alignItems: 'center', gap: '1rem', marginBottom: '1rem',
            padding: '1rem', background: 'var(--app-soft)', borderRadius: '0.5rem',
          }}>
            <div style={{
              width: 60, height: 60, borderRadius: '50%',
              display: 'flex', alignItems: 'center', justifyContent: 'center',
              fontSize: '1.2rem', fontWeight: 700,
              background: issue.aiValidationScore >= 70 ? '#dcfce7' : '#fef2f2',
              color: issue.aiValidationScore >= 70 ? '#16a34a' : '#dc2626',
            }}>
              {issue.aiValidationScore}
            </div>
            <div>
              <div style={{ fontWeight: 600, fontSize: '0.9rem' }}>
                {issue.aiValidationScore >= 70 ? 'Validación aprobada' : 'Requiere correcciones'}
              </div>
              <div style={{ fontSize: '0.8rem', color: 'var(--app-text-secondary)' }}>
                Score mínimo: 70/100
              </div>
            </div>
          </div>
          {issue.aiValidationNotes && (
            <div style={{ fontSize: '0.85rem', lineHeight: 1.6 }}>
              <div style={{ fontWeight: 600, marginBottom: '0.5rem' }}>Observaciones:</div>
              <pre style={{ whiteSpace: 'pre-wrap', fontFamily: 'inherit' }}>
                {JSON.stringify(issue.aiValidationNotes, null, 2)}
              </pre>
            </div>
          )}
        </div>
      ) : (
        <div style={{ textAlign: 'center', padding: '2rem', color: 'var(--app-text-secondary)' }}>
          <div style={{ fontSize: '2rem', marginBottom: '0.5rem' }}>...</div>
          <div>El agente IA está analizando el requerimiento...</div>
          <div style={{ fontSize: '0.8rem', marginTop: '0.5rem' }}>
            Validando completitud, claridad, criterios de aceptación y viabilidad técnica.
          </div>
        </div>
      )}
    </div>
  );
}

function IntakeStage({ issue, userRole, onTransition, onShowReturn, isTransitioning }: {
  issue: Issue; userRole: string; onTransition: (s: IssueStatus) => void; onShowReturn: () => void; isTransitioning: boolean;
}) {
  const queryClient = useQueryClient();
  const canDecide = userRole === 'tech_lead' || userRole === 'admin';
  const [selectedDev, setSelectedDev] = useState<string>(issue.assignedTo ?? '');

  // Fetch developers for assignment dropdown
  const developersQuery = useQuery({
    queryKey: ['users', 'developer'],
    queryFn: () => fetchUsersByRole('developer'),
    enabled: canDecide,
  });

  const assignMutation = useMutation({
    mutationFn: (devId: string) => updateIssue(issue.id, { assignedTo: devId }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['issue', issue.id] });
    },
  });

  const developers = developersQuery.data ?? [];

  return (
    <div className="app-card" style={{ padding: '1.5rem' }}>
      <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem', color: STATUS_COLORS.intake }}>
        Revisión del Jefe de Desarrollo
      </h2>

      {/* Requirement detail */}
      <div style={{ marginBottom: '1.25rem' }}>
        <div style={{ fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.5rem' }}>Descripción del requerimiento</div>
        <div style={{
          fontSize: '0.85rem', lineHeight: 1.6, whiteSpace: 'pre-wrap',
          padding: '0.75rem', background: 'var(--app-soft)', borderRadius: '0.5rem',
          maxHeight: '300px', overflowY: 'auto',
        }}>
          {issue.description || 'Sin descripción.'}
        </div>
      </div>

      {/* Requirement documents */}
      {issue.requirementDocuments && issue.requirementDocuments.length > 0 && (
        <div style={{ marginBottom: '1.25rem' }}>
          <div style={{ fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.5rem' }}>Documentos adjuntos</div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '0.3rem' }}>
            {issue.requirementDocuments.map((doc) => (
              <div key={doc.id} style={{
                display: 'flex', alignItems: 'center', gap: '0.5rem',
                padding: '0.4rem 0.6rem', background: 'var(--app-soft)', borderRadius: '0.25rem',
                fontSize: '0.8rem',
              }}>
                <span style={{ fontWeight: 500 }}>{doc.filename}</span>
                <span style={{ color: 'var(--app-text-secondary)' }}>({Math.round(doc.fileSize / 1024)} KB)</span>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* AI Validation score */}
      {issue.aiValidationScore != null && (
        <div style={{
          display: 'flex', alignItems: 'center', gap: '0.75rem',
          padding: '0.75rem', background: issue.aiValidationScore >= 70 ? '#dcfce7' : '#fef9c3',
          borderRadius: '0.5rem', marginBottom: '1.25rem',
        }}>
          <div style={{
            width: 40, height: 40, borderRadius: '50%',
            display: 'flex', alignItems: 'center', justifyContent: 'center',
            fontSize: '0.9rem', fontWeight: 700,
            background: issue.aiValidationScore >= 70 ? '#16a34a' : '#ca8a04',
            color: '#fff',
          }}>
            {issue.aiValidationScore}
          </div>
          <div>
            <div style={{ fontSize: '0.85rem', fontWeight: 600 }}>Score de validación IA</div>
            <div style={{ fontSize: '0.75rem', color: 'var(--app-text-secondary)' }}>
              {issue.aiValidationScore >= 70 ? 'Aprobado por el agente IA' : 'Aprobado con advertencias'}
            </div>
          </div>
        </div>
      )}

      {/* Issue meta info */}
      <div style={{
        display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: '0.75rem',
        marginBottom: '1.5rem', fontSize: '0.8rem',
      }}>
        <div style={{ padding: '0.5rem', background: 'var(--app-soft)', borderRadius: '0.25rem' }}>
          <div style={{ fontWeight: 600, marginBottom: '0.2rem' }}>Cliente</div>
          <div>{issue.clientName}</div>
        </div>
        <div style={{ padding: '0.5rem', background: 'var(--app-soft)', borderRadius: '0.25rem' }}>
          <div style={{ fontWeight: 600, marginBottom: '0.2rem' }}>Tipo</div>
          <div>{issue.type}</div>
        </div>
        <div style={{ padding: '0.5rem', background: 'var(--app-soft)', borderRadius: '0.25rem' }}>
          <div style={{ fontWeight: 600, marginBottom: '0.2rem' }}>Prioridad</div>
          <div>{issue.priority}</div>
        </div>
      </div>

      {canDecide && (
        <div style={{ borderTop: '1px solid var(--app-border)', paddingTop: '1.25rem' }}>
          {/* Developer assignment */}
          <div style={{ marginBottom: '1.25rem' }}>
            <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.5rem' }}>
              Asignar desarrollador
            </label>
            <div style={{ display: 'flex', gap: '0.5rem', alignItems: 'center' }}>
              <select
                className="app-select"
                value={selectedDev}
                onChange={(e) => setSelectedDev(e.target.value)}
                style={{ flex: 1, maxWidth: '350px' }}
              >
                <option value="">— Seleccionar desarrollador —</option>
                {developers.map((dev) => (
                  <option key={dev.id} value={dev.id}>
                    {dev.displayName} ({dev.email})
                  </option>
                ))}
              </select>
              <button
                type="button"
                className="app-button"
                disabled={!selectedDev || selectedDev === issue.assignedTo || assignMutation.isPending}
                onClick={() => assignMutation.mutate(selectedDev)}
              >
                {assignMutation.isPending ? 'Asignando...' : 'Asignar'}
              </button>
            </div>
            {issue.assignedTo && issue.assignedToName && (
              <div style={{ fontSize: '0.8rem', color: '#16a34a', marginTop: '0.4rem', fontWeight: 500 }}>
                Asignado actualmente a: {issue.assignedToName}
              </div>
            )}
            {developersQuery.isLoading && (
              <div style={{ fontSize: '0.8rem', color: 'var(--app-text-secondary)', marginTop: '0.3rem' }}>
                Cargando lista de desarrolladores...
              </div>
            )}
          </div>

          {/* Actions */}
          <div style={{ display: 'flex', gap: '0.5rem' }}>
            <button
              type="button"
              className="app-button app-button-primary"
              disabled={!issue.assignedTo || isTransitioning}
              onClick={() => onTransition('prd')}
              title={!issue.assignedTo ? 'Asigna un desarrollador primero' : ''}
            >
              {isTransitioning ? 'Avanzando...' : 'Aceptar y avanzar a PRD'}
            </button>
            <button
              type="button"
              className="app-button"
              style={{ color: '#dc2626', borderColor: '#dc2626' }}
              onClick={onShowReturn}
            >
              Devolver con anotaciones
            </button>
          </div>
          {!issue.assignedTo && (
            <p style={{ fontSize: '0.8rem', color: '#dc2626', marginTop: '0.5rem' }}>
              Debes asignar un desarrollador antes de poder aceptar el requerimiento.
            </p>
          )}
        </div>
      )}

      {!canDecide && (
        <div style={{ padding: '1rem', background: '#fef9c3', borderRadius: '0.5rem', fontSize: '0.85rem' }}>
          Este requerimiento está en espera de revisión por el Jefe de Desarrollo.
          {issue.assignedTo && issue.assignedToName && (
            <div style={{ marginTop: '0.4rem', fontWeight: 500 }}>
              Asignado a: {issue.assignedToName}
            </div>
          )}
        </div>
      )}
    </div>
  );
}

function PRDStage({ issue, userRole, onTransition, isTransitioning }: {
  issue: Issue; userRole: string; onTransition: (s: IssueStatus) => void; isTransitioning: boolean;
}) {
  const canWork = (userRole === 'developer' || userRole === 'admin');
  return (
    <div className="app-card" style={{ padding: '1.5rem' }}>
      <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem', color: STATUS_COLORS.prd }}>
        Generación del PRD
      </h2>
      <div style={{ fontSize: '0.85rem', lineHeight: 1.6, marginBottom: '1rem' }}>
        <p>En esta etapa el desarrollador revisa el requerimiento, adjunta información adicional y genera el PRD.</p>
      </div>

      {issue.prdSessionId ? (
        <div style={{ padding: '1rem', background: 'var(--app-soft)', borderRadius: '0.5rem', marginBottom: '1rem' }}>
          <div style={{ fontSize: '0.85rem', fontWeight: 600, color: 'var(--app-accent)' }}>
            Sesión PRD activa
          </div>
          <div style={{ fontSize: '0.8rem', color: 'var(--app-text-secondary)', marginTop: '0.25rem' }}>
            ID: {issue.prdSessionId}
          </div>
          <button
            type="button"
            className="app-button app-button-primary"
            style={{ marginTop: '0.75rem' }}
            onClick={() => { /* TODO: Navigate to PRD Builder within pipeline context */ }}
          >
            Abrir PRD Builder
          </button>
        </div>
      ) : (
        <div style={{ padding: '1rem', background: 'var(--app-soft)', borderRadius: '0.5rem', marginBottom: '1rem' }}>
          <div style={{ fontSize: '0.85rem', color: 'var(--app-text-secondary)' }}>
            Aún no se ha creado una sesión PRD para este issue.
          </div>
          {canWork && (
            <button
              type="button"
              className="app-button app-button-primary"
              style={{ marginTop: '0.75rem' }}
              onClick={() => { /* TODO: Create PRD session and link to issue */ }}
            >
              Crear sesión PRD
            </button>
          )}
        </div>
      )}

      {canWork && (
        <div style={{ display: 'flex', gap: '0.5rem', marginTop: '1rem' }}>
          <button
            type="button"
            className="app-button app-button-primary"
            disabled={isTransitioning}
            onClick={() => onTransition('prd_approval')}
          >
            {isTransitioning ? 'Enviando...' : 'Enviar PRD a aprobación'}
          </button>
        </div>
      )}
    </div>
  );
}

function PRDApprovalStage({
  issue,
  userRole,
  approvals,
  approvalComment,
  setApprovalComment,
  onApprove,
  onTransition,
  isApproving,
}: {
  issue: Issue;
  userRole: string;
  approvals: IssueApproval[];
  approvalComment: string;
  setApprovalComment: (v: string) => void;
  onApprove: (decision: 'approved' | 'returned', comments?: string) => void;
  onTransition: (s: IssueStatus, reason?: string) => void;
  isApproving: boolean;
}) {
  const canApprove = userRole === 'ops_lead' || userRole === 'tech_lead' || userRole === 'admin';
  const opsApproval = approvals.find((a) => a.approverRole === 'ops_lead');
  const techApproval = approvals.find((a) => a.approverRole === 'tech_lead');
  const allApproved = opsApproval?.decision === 'approved' && techApproval?.decision === 'approved';

  return (
    <div className="app-card" style={{ padding: '1.5rem' }}>
      <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem', color: STATUS_COLORS.prd_approval }}>
        Aprobación del PRD
      </h2>
      <p style={{ fontSize: '0.85rem', marginBottom: '1rem', color: 'var(--app-text-secondary)' }}>
        Se requiere aprobación tanto del Líder Operativo como del Jefe de Desarrollo.
      </p>

      {/* Approval status cards */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem', marginBottom: '1.5rem' }}>
        <ApprovalCard
          title="Líder Operativo"
          approval={opsApproval}
        />
        <ApprovalCard
          title="Jefe de Desarrollo"
          approval={techApproval}
        />
      </div>

      {allApproved && (
        <div style={{
          padding: '1rem', background: '#dcfce7', borderRadius: '0.5rem',
          marginBottom: '1rem', textAlign: 'center',
        }}>
          <div style={{ fontWeight: 600, color: '#16a34a' }}>Ambos aprobadores han aceptado el PRD</div>
          <button
            type="button"
            className="app-button app-button-primary"
            style={{ marginTop: '0.75rem' }}
            onClick={() => onTransition('design')}
          >
            Avanzar a Análisis y Diseño
          </button>
        </div>
      )}

      {canApprove && !allApproved && (
        <div style={{ borderTop: '1px solid var(--app-border)', paddingTop: '1rem' }}>
          <div style={{ fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.5rem' }}>Tu decisión:</div>
          <textarea
            className="app-textarea"
            rows={3}
            placeholder="Comentarios (opcional)..."
            value={approvalComment}
            onChange={(e) => setApprovalComment(e.target.value)}
            style={{ width: '100%', marginBottom: '0.75rem' }}
          />
          <div style={{ display: 'flex', gap: '0.5rem' }}>
            <button
              type="button"
              className="app-button app-button-primary"
              disabled={isApproving}
              onClick={() => onApprove('approved', approvalComment || undefined)}
            >
              {isApproving ? 'Procesando...' : 'Aprobar'}
            </button>
            <button
              type="button"
              className="app-button"
              style={{ color: '#dc2626', borderColor: '#dc2626' }}
              disabled={isApproving || !approvalComment.trim()}
              onClick={() => onApprove('returned', approvalComment)}
              title={!approvalComment.trim() ? 'Escribe un comentario para devolver' : ''}
            >
              Devolver
            </button>
          </div>
        </div>
      )}
    </div>
  );
}

function ApprovalCard({ title, approval }: { title: string; approval?: IssueApproval }) {
  const getColor = () => {
    if (!approval || approval.decision === 'pending') return 'var(--app-text-secondary)';
    return approval.decision === 'approved' ? '#16a34a' : '#dc2626';
  };
  const getIcon = () => {
    if (!approval || approval.decision === 'pending') return '○';
    return approval.decision === 'approved' ? '✓' : '✗';
  };
  const getLabel = () => {
    if (!approval || approval.decision === 'pending') return 'Pendiente';
    return approval.decision === 'approved' ? 'Aprobado' : 'Devuelto';
  };

  return (
    <div style={{
      padding: '0.75rem',
      border: '1px solid var(--app-border)',
      borderRadius: '0.5rem',
      borderLeft: `3px solid ${getColor()}`,
    }}>
      <div style={{ fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.4rem' }}>{title}</div>
      <div style={{ display: 'flex', alignItems: 'center', gap: '0.4rem', color: getColor() }}>
        <span style={{ fontSize: '1.1rem' }}>{getIcon()}</span>
        <span style={{ fontSize: '0.8rem', fontWeight: 600 }}>{getLabel()}</span>
      </div>
      {approval?.approverName && (
        <div style={{ fontSize: '0.75rem', color: 'var(--app-text-secondary)', marginTop: '0.25rem' }}>
          {approval.approverName}
        </div>
      )}
      {approval?.comments && (
        <div style={{ fontSize: '0.8rem', marginTop: '0.4rem', padding: '0.4rem', background: 'var(--app-soft)', borderRadius: '0.25rem' }}>
          {approval.comments}
        </div>
      )}
    </div>
  );
}

function DesignStage({ issue, userRole, onTransition, onShowReturn, isTransitioning }: {
  issue: Issue; userRole: string; onTransition: (s: IssueStatus) => void; onShowReturn: () => void; isTransitioning: boolean;
}) {
  const queryClient = useQueryClient();
  const canWork = userRole === 'developer' || userRole === 'admin';
  const isDBA = userRole === 'dba' || userRole === 'admin';
  const isTechLead = userRole === 'tech_lead' || userRole === 'admin';
  const [approvalComment, setApprovalComment] = useState('');

  // Fetch design approvals
  const approvalsQuery = useQuery({
    queryKey: ['issue', issue.id, 'approvals', 'design'],
    queryFn: () => fetchApprovals(issue.id, 'design'),
  });

  const approvalMutation = useMutation({
    mutationFn: ({ decision, comments }: { decision: 'approved' | 'returned'; comments?: string }) =>
      submitApproval(issue.id, 'design', decision, comments),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['issue', issue.id, 'approvals', 'design'] });
      queryClient.invalidateQueries({ queryKey: ['issue', issue.id] });
      setApprovalComment('');
    },
  });

  const approvals = approvalsQuery.data ?? [];
  const techLeadApproval = approvals.find((a) => a.approverRole === 'tech_lead');
  const dbaApproval = approvals.find((a) => a.approverRole === 'dba');
  const allApproved = techLeadApproval?.decision === 'approved' && dbaApproval?.decision === 'approved';

  return (
    <div className="app-card" style={{ padding: '1.5rem' }}>
      <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem', color: STATUS_COLORS.design }}>
        Análisis de Impacto y Diseño
      </h2>
      <p style={{ fontSize: '0.85rem', lineHeight: 1.6, marginBottom: '1rem' }}>
        Genera una descripción detallada de los cambios necesarios a nivel de APEX y base de datos.
        El sistema cruza el PRD aprobado contra el codebase para identificar impactos.
      </p>

      {/* Design panels */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem', marginBottom: '1.5rem' }}>
        <div style={{ padding: '1rem', background: 'var(--app-soft)', borderRadius: '0.5rem' }}>
          <div style={{ fontWeight: 600, fontSize: '0.85rem', marginBottom: '0.5rem' }}>Diseño APEX</div>
          <div style={{ fontSize: '0.8rem', color: 'var(--app-text-secondary)' }}>
            Páginas, regiones, items, procesos y validaciones que se deben crear o modificar.
          </div>
          {canWork && (
            <button type="button" className="app-button" style={{ marginTop: '0.75rem' }}>
              Generar análisis APEX
            </button>
          )}
        </div>
        <div style={{ padding: '1rem', background: 'var(--app-soft)', borderRadius: '0.5rem' }}>
          <div style={{ fontWeight: 600, fontSize: '0.85rem', marginBottom: '0.5rem' }}>Diseño Base de Datos</div>
          <div style={{ fontSize: '0.8rem', color: 'var(--app-text-secondary)' }}>
            Tablas, columnas, índices, constraints y migraciones necesarias.
          </div>
        </div>
      </div>

      {/* Approval gate: tech_lead + DBA */}
      <div style={{ borderTop: '1px solid var(--app-border)', paddingTop: '1.25rem', marginBottom: '1.25rem' }}>
        <h3 style={{ fontSize: '0.9rem', fontWeight: 600, marginBottom: '0.75rem' }}>
          Aprobaciones requeridas
        </h3>
        <p style={{ fontSize: '0.8rem', color: 'var(--app-text-secondary)', marginBottom: '0.75rem' }}>
          El diseño requiere aprobación del Jefe de Desarrollo (diseño general) y del DBA (cambios de base de datos).
        </p>

        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem', marginBottom: '1rem' }}>
          <ApprovalCard title="Jefe de Desarrollo" approval={techLeadApproval} />
          <ApprovalCard title="DBA" approval={dbaApproval} />
        </div>

        {allApproved && (
          <div style={{
            padding: '1rem', background: '#dcfce7', borderRadius: '0.5rem',
            marginBottom: '1rem', textAlign: 'center',
          }}>
            <div style={{ fontWeight: 600, color: '#16a34a' }}>
              Diseño aprobado por Jefe de Desarrollo y DBA
            </div>
            <button
              type="button"
              className="app-button app-button-primary"
              style={{ marginTop: '0.75rem' }}
              disabled={isTransitioning}
              onClick={() => onTransition('build')}
            >
              {isTransitioning ? 'Avanzando...' : 'Avanzar a Construcción'}
            </button>
          </div>
        )}

        {/* Approval form for tech_lead or dba */}
        {(isTechLead || isDBA) && !allApproved && (
          <div style={{ borderTop: '1px solid var(--app-border)', paddingTop: '1rem' }}>
            <div style={{ fontSize: '0.85rem', fontWeight: 600, marginBottom: '0.5rem' }}>
              Tu decisión ({isDBA && userRole === 'dba' ? 'DBA' : 'Jefe de Desarrollo'}):
            </div>
            <textarea
              className="app-textarea"
              rows={3}
              placeholder="Comentarios (opcional)..."
              value={approvalComment}
              onChange={(e) => setApprovalComment(e.target.value)}
              style={{ width: '100%', marginBottom: '0.75rem' }}
            />
            <div style={{ display: 'flex', gap: '0.5rem' }}>
              <button
                type="button"
                className="app-button app-button-primary"
                disabled={approvalMutation.isPending}
                onClick={() => approvalMutation.mutate({ decision: 'approved', comments: approvalComment || undefined })}
              >
                {approvalMutation.isPending ? 'Procesando...' : 'Aprobar'}
              </button>
              <button
                type="button"
                className="app-button"
                style={{ color: '#dc2626', borderColor: '#dc2626' }}
                disabled={approvalMutation.isPending || !approvalComment.trim()}
                onClick={() => approvalMutation.mutate({ decision: 'returned', comments: approvalComment })}
                title={!approvalComment.trim() ? 'Escribe un comentario para devolver' : ''}
              >
                Devolver
              </button>
            </div>
          </div>
        )}
      </div>

      {/* Developer actions: return only if needed */}
      {canWork && !allApproved && (
        <div style={{ display: 'flex', gap: '0.5rem' }}>
          <button type="button" className="app-button" style={{ color: '#dc2626', borderColor: '#dc2626' }} onClick={onShowReturn}>
            Devolver a aprobación PRD
          </button>
        </div>
      )}
    </div>
  );
}

function BuildStage({ issue, userRole, onTransition, onShowReturn, isTransitioning }: {
  issue: Issue; userRole: string; onTransition: (s: IssueStatus) => void; onShowReturn: () => void; isTransitioning: boolean;
}) {
  const canWork = userRole === 'developer' || userRole === 'admin';

  return (
    <div className="app-card" style={{ padding: '1.5rem' }}>
      <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem', color: STATUS_COLORS.build }}>
        Construcción
      </h2>
      <p style={{ fontSize: '0.85rem', lineHeight: 1.6, marginBottom: '1rem' }}>
        Se generan los cambios necesarios en APEX y base de datos según el diseño aprobado.
        El sistema muestra un log en tiempo real del progreso.
      </p>

      <div style={{ padding: '1rem', background: '#0f172a', borderRadius: '0.5rem', marginBottom: '1.5rem' }}>
        <div style={{ fontFamily: 'monospace', fontSize: '0.8rem', color: '#94a3b8', lineHeight: 1.8 }}>
          <div style={{ color: '#22c55e' }}>$ Esperando generación de artefactos...</div>
          <div style={{ color: '#64748b' }}>Use el botón "Generar cambios" para iniciar la construcción.</div>
        </div>
      </div>

      {canWork && (
        <div style={{ display: 'flex', gap: '0.5rem' }}>
          <button type="button" className="app-button app-button-primary">
            Generar cambios
          </button>
          <button
            type="button"
            className="app-button"
            disabled={isTransitioning}
            onClick={() => onTransition('test')}
          >
            {isTransitioning ? 'Avanzando...' : 'Build completado — avanzar a Pruebas'}
          </button>
          <button type="button" className="app-button" style={{ color: '#dc2626', borderColor: '#dc2626' }} onClick={onShowReturn}>
            Devolver a diseño
          </button>
        </div>
      )}
    </div>
  );
}

function TestStage({ issue, userRole, onTransition, onShowReturn, isTransitioning }: {
  issue: Issue; userRole: string; onTransition: (s: IssueStatus) => void; onShowReturn: () => void; isTransitioning: boolean;
}) {
  const canWork = userRole === 'qa_analyst' || userRole === 'developer' || userRole === 'admin';

  return (
    <div className="app-card" style={{ padding: '1.5rem' }}>
      <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem', color: STATUS_COLORS.test }}>
        Pruebas
      </h2>
      <p style={{ fontSize: '0.85rem', lineHeight: 1.6, marginBottom: '1rem' }}>
        Se programan y ejecutan pruebas automáticas basadas en los criterios de aceptación del PRD.
        Si fallan, el issue puede volver a construcción para correcciones.
      </p>

      <div style={{ padding: '1rem', background: 'var(--app-soft)', borderRadius: '0.5rem', marginBottom: '1.5rem' }}>
        <div style={{ fontSize: '0.85rem', color: 'var(--app-text-secondary)' }}>
          No se han ejecutado pruebas aún para este issue.
        </div>
        {canWork && (
          <button type="button" className="app-button" style={{ marginTop: '0.75rem' }}>
            Generar y ejecutar tests
          </button>
        )}
      </div>

      {canWork && (
        <div style={{ display: 'flex', gap: '0.5rem' }}>
          <button
            type="button"
            className="app-button app-button-primary"
            disabled={isTransitioning}
            onClick={() => onTransition('docs')}
          >
            {isTransitioning ? 'Avanzando...' : 'Tests aprobados — avanzar a Documentación'}
          </button>
          <button type="button" className="app-button" style={{ color: '#dc2626', borderColor: '#dc2626' }} onClick={onShowReturn}>
            Devolver a construcción
          </button>
        </div>
      )}
    </div>
  );
}

function DocsStage({ issue, userRole, onTransition, isTransitioning }: {
  issue: Issue; userRole: string; onTransition: (s: IssueStatus) => void; isTransitioning: boolean;
}) {
  const canWork = userRole === 'developer' || userRole === 'admin';

  return (
    <div className="app-card" style={{ padding: '1.5rem' }}>
      <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem', color: STATUS_COLORS.docs }}>
        Documentación
      </h2>
      <p style={{ fontSize: '0.85rem', lineHeight: 1.6, marginBottom: '1rem' }}>
        Se genera la documentación final: changelog, release notes, guía de rollback y actualización del PRD de referencia.
      </p>

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '0.75rem', marginBottom: '1.5rem' }}>
        {['Changelog', 'Release Notes', 'Guía de Rollback', 'PRD Actualizado'].map((doc) => (
          <div key={doc} style={{ padding: '0.75rem', background: 'var(--app-soft)', borderRadius: '0.5rem' }}>
            <div style={{ fontSize: '0.85rem', fontWeight: 600 }}>{doc}</div>
            <div style={{ fontSize: '0.75rem', color: 'var(--app-text-secondary)', marginTop: '0.25rem' }}>Pendiente de generación</div>
          </div>
        ))}
      </div>

      {canWork && (
        <div style={{ display: 'flex', gap: '0.5rem' }}>
          <button type="button" className="app-button">
            Generar documentación
          </button>
          <button
            type="button"
            className="app-button app-button-primary"
            disabled={isTransitioning}
            onClick={() => onTransition('done')}
          >
            {isTransitioning ? 'Finalizando...' : 'Aprobar y entregar'}
          </button>
        </div>
      )}
    </div>
  );
}

function DoneStage({ issue }: { issue: Issue }) {
  return (
    <div className="app-card" style={{ padding: '1.5rem' }}>
      <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '1rem', color: STATUS_COLORS.done }}>
        Entregado
      </h2>
      <div style={{
        textAlign: 'center', padding: '2rem',
        background: '#dcfce7', borderRadius: '0.5rem',
      }}>
        <div style={{ fontSize: '2rem', marginBottom: '0.5rem' }}>✓</div>
        <div style={{ fontWeight: 600, fontSize: '1.1rem', color: '#16a34a' }}>
          Issue completado
        </div>
        <div style={{ fontSize: '0.85rem', color: '#166534', marginTop: '0.5rem' }}>
          Listo para implementar en producción.
        </div>
      </div>
      <div style={{ marginTop: '1.5rem' }}>
        <div style={{ fontWeight: 600, fontSize: '0.85rem', marginBottom: '0.5rem' }}>Resumen</div>
        <div style={{ fontSize: '0.85rem', color: 'var(--app-text-secondary)' }}>
          <div>Código: {issue.code}</div>
          <div>Cliente: {issue.clientName}</div>
          <div>Creado: {new Date(issue.createdAt).toLocaleDateString('es')}</div>
          <div>Finalizado: {new Date(issue.updatedAt).toLocaleDateString('es')}</div>
        </div>
      </div>
    </div>
  );
}
