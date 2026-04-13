import { useState, useEffect, useCallback } from 'react';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import {
  fetchIssues,
  createIssue,
  ISSUE_STATUSES,
  STATUS_LABELS,
  type IssueSummary,
  type IssueStatus,
  type IssuePriority,
  type IssueType,
  type IssueFilters,
  type IssuePayload,
} from '@/services/issues.api';
import { fetchClients, type ClientSummary } from '@/services/clients.api';
import { fetchApplications, fetchPages } from '@/services/explorer.api';
import type { ApexApplication } from '@apex-dev-manager/shared-types';
import IssueCard from './components/IssueCard';
import IssueDetail from './components/IssueDetail';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function debounce<T extends (...args: unknown[]) => void>(fn: T, ms: number) {
  let timer: ReturnType<typeof setTimeout>;
  return (...args: Parameters<T>) => {
    clearTimeout(timer);
    timer = setTimeout(() => fn(...args), ms);
  };
}

const PRIORITY_OPTIONS: IssuePriority[] = ['critical', 'high', 'medium', 'low'];
const TYPE_OPTIONS: IssueType[] = ['feature', 'bug', 'enhancement', 'task'];
const MAX_REQUIREMENT_FILE_BYTES = 5 * 1024 * 1024;
const REQUIREMENT_FILE_ACCEPT =
  '.doc,.docx,.pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/pdf';

interface ExplorerPageOption {
  pageId: number;
  pageName: string;
  title?: string;
}

type IssueApexApplication = ApexApplication & {
  applicationName?: string;
};

function getApplicationName(app: IssueApexApplication | undefined): string {
  return app?.name || app?.applicationName || 'Aplicacion APEX';
}

const PRIORITY_DOT: Record<IssuePriority, string> = {
  critical: 'var(--app-danger)',
  high: 'var(--app-warm)',
  medium: 'var(--app-accent)',
  low: 'var(--app-muted)',
};

const STATUS_COL_COLORS: Record<IssueStatus, string> = {
  intake: '#6366f1',
  prd: '#8b5cf6',
  design: '#a855f7',
  build: '#3b82f6',
  review: '#f59e0b',
  test: '#14b8a6',
  deploy: '#f97316',
  done: 'var(--app-success)',
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function IssuesPage() {
  const { t } = useTranslation();
  const [issues, setIssues] = useState<IssueSummary[]>([]);
  const [clients, setClients] = useState<ClientSummary[]>([]);
  const [applications, setApplications] = useState<IssueApexApplication[]>([]);
  const [pages, setPages] = useState<ExplorerPageOption[]>([]);
  const [loading, setLoading] = useState(true);

  // Filters
  const [search, setSearch] = useState('');
  const [debouncedSearch, setDebouncedSearch] = useState('');
  const [filterClient, setFilterClient] = useState('');
  const [filterStatus, setFilterStatus] = useState<IssueStatus | ''>('');
  const [filterPriority, setFilterPriority] = useState<IssuePriority | ''>('');

  // View
  const [view, setView] = useState<'kanban' | 'list'>('kanban');
  const [selectedIssueId, setSelectedIssueId] = useState<string | null>(null);

  // New issue modal
  const [modalOpen, setModalOpen] = useState(false);
  const [formTitle, setFormTitle] = useState('');
  const [formDescription, setFormDescription] = useState('');
  const [formClientId, setFormClientId] = useState('');
  const [formAppId, setFormAppId] = useState('');
  const [formPageId, setFormPageId] = useState('');
  const [formPriority, setFormPriority] = useState<IssuePriority>('medium');
  const [formType, setFormType] = useState<IssueType>('task');
  const [formRequirementFile, setFormRequirementFile] = useState<File | null>(null);
  const [formRequirementFileError, setFormRequirementFileError] = useState('');
  const [loadingApplications, setLoadingApplications] = useState(false);
  const [loadingPages, setLoadingPages] = useState(false);
  const [applicationsError, setApplicationsError] = useState('');
  const [pagesError, setPagesError] = useState('');

  const debouncedSetSearch = useCallback(
    debounce((...args: unknown[]) => setDebouncedSearch(args[0] as string), 300),
    [],
  );

  const loadIssues = useCallback(async () => {
    setLoading(true);
    try {
      const filters: IssueFilters = { pageSize: 500 };
      if (debouncedSearch) filters.search = debouncedSearch;
      if (filterClient) filters.clientId = filterClient;
      if (filterStatus) filters.status = filterStatus;
      if (filterPriority) filters.priority = filterPriority;
      const result = await fetchIssues(filters);
      setIssues(result.data);
    } catch (err) {
      console.error('Failed to load issues', err);
    } finally {
      setLoading(false);
    }
  }, [debouncedSearch, filterClient, filterStatus, filterPriority]);

  useEffect(() => {
    loadIssues();
  }, [loadIssues]);

  useEffect(() => {
    fetchClients({ pageSize: 200 })
      .then((r) => setClients(r.data))
      .catch(() => {});
  }, []);

  useEffect(() => {
    if (!modalOpen || !formClientId) {
      setApplications([]);
      setFormAppId('');
      setPages([]);
      setFormPageId('');
      setApplicationsError('');
      return;
    }

    const selectedClient = clients.find((client) => client.id === formClientId);
    if (!selectedClient?.connectionId) {
      setApplications([]);
      setFormAppId('');
      setPages([]);
      setFormPageId('');
      setApplicationsError('Este cliente no tiene una conexion APEX configurada.');
      return;
    }

    let cancelled = false;
    setLoadingApplications(true);
    setApplicationsError('');
    fetchApplications(selectedClient.connectionId)
      .then((apps) => {
        if (cancelled) return;
        setApplications(apps);
        const preferredAppId = selectedClient.appId
          ? String(selectedClient.appId)
          : apps[0]?.applicationId
            ? String(apps[0].applicationId)
            : '';
        setFormAppId(preferredAppId);
        if (apps.length === 0) {
          setApplicationsError('No encontre aplicaciones APEX para la conexion del cliente.');
        }
      })
      .catch((err) => {
        if (cancelled) return;
        console.error('Failed to load client applications', err);
        setApplications([]);
        setFormAppId('');
        setApplicationsError('No pude cargar las aplicaciones de este cliente.');
      })
      .finally(() => {
        if (!cancelled) setLoadingApplications(false);
      });

    return () => {
      cancelled = true;
    };
  }, [clients, formClientId, modalOpen]);

  useEffect(() => {
    if (!modalOpen || !formClientId || !formAppId) {
      setPages([]);
      setFormPageId('');
      setPagesError('');
      return;
    }

    const selectedClient = clients.find((client) => client.id === formClientId);
    if (!selectedClient?.connectionId) {
      setPages([]);
      setFormPageId('');
      setPagesError('');
      return;
    }

    let cancelled = false;
    setLoadingPages(true);
    setPagesError('');
    fetchPages(selectedClient.connectionId, formAppId)
      .then((nextPages) => {
        if (cancelled) return;
        setPages(
          nextPages.map((page) => ({
            pageId: Number((page as unknown as ExplorerPageOption).pageId ?? page.pageNumber),
            pageName: String((page as unknown as ExplorerPageOption).pageName ?? page.name ?? ''),
            title: page.title,
          })),
        );
        setFormPageId('');
      })
      .catch((err) => {
        if (cancelled) return;
        console.error('Failed to load application pages', err);
        setPages([]);
        setFormPageId('');
        setPagesError('No pude cargar las paginas de esta aplicacion.');
      })
      .finally(() => {
        if (!cancelled) setLoadingPages(false);
      });

    return () => {
      cancelled = true;
    };
  }, [clients, formAppId, formClientId, modalOpen]);

  // Group by status for kanban
  const grouped = ISSUE_STATUSES.reduce<Record<IssueStatus, IssueSummary[]>>(
    (acc, status) => {
      acc[status] = [];
      return acc;
    },
    {} as Record<IssueStatus, IssueSummary[]>,
  );
  issues.forEach((issue) => {
    if (grouped[issue.status]) grouped[issue.status].push(issue);
  });

  const openNewIssue = () => {
    setFormTitle('');
    setFormDescription('');
    setFormClientId(clients[0]?.id ?? '');
    setFormAppId('');
    setFormPageId('');
    setApplications([]);
    setPages([]);
    setApplicationsError('');
    setPagesError('');
    setFormPriority('medium');
    setFormType('task');
    setFormRequirementFile(null);
    setFormRequirementFileError('');
    setModalOpen(true);
  };

  const readFileAsBase64 = (file: File) =>
    new Promise<string>((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => {
        const value = String(reader.result ?? '');
        resolve(value.includes(',') ? value.split(',')[1] : value);
      };
      reader.onerror = () => reject(reader.error ?? new Error('Failed to read file'));
      reader.readAsDataURL(file);
    });

  const handleRequirementFileChange = (file: File | null) => {
    setFormRequirementFile(null);
    setFormRequirementFileError('');
    if (!file) return;

    if (!/\.(doc|docx|pdf)$/i.test(file.name)) {
      setFormRequirementFileError('Solo se permiten documentos Word o PDF.');
      return;
    }

    if (file.size > MAX_REQUIREMENT_FILE_BYTES) {
      setFormRequirementFileError('El archivo debe pesar 5 MB o menos.');
      return;
    }

    setFormRequirementFile(file);
  };

  const handleCreateIssue = async () => {
    if (!formTitle.trim() || !formClientId || !formAppId) return;
    const selectedApplication = applications.find((app) => String(app.applicationId) === formAppId);
    const selectedPage = pages.find((page) => String(page.pageId) === formPageId);
    const payload: IssuePayload = {
      clientId: formClientId,
      appId: Number(formAppId),
      appName: getApplicationName(selectedApplication),
      pageId: selectedPage?.pageId ?? null,
      pageName: selectedPage?.pageName || selectedPage?.title || null,
      title: formTitle,
      description: formDescription || undefined,
      priority: formPriority,
      type: formType,
    };
    try {
      if (formRequirementFile) {
        payload.requirementDocument = {
          filename: formRequirementFile.name,
          mimeType: formRequirementFile.type || 'application/octet-stream',
          fileSize: formRequirementFile.size,
          contentBase64: await readFileAsBase64(formRequirementFile),
        };
      }
      await createIssue(payload);
      setModalOpen(false);
      loadIssues();
    } catch (err) {
      console.error('Failed to create issue', err);
    }
  };

  const handleCardClick = (issue: IssueSummary) => {
    setSelectedIssueId(issue.id);
  };

  const selectedFormClient = clients.find((client) => client.id === formClientId);
  const selectedApplication = applications.find((app) => String(app.applicationId) === formAppId);
  const selectedPage = pages.find((page) => String(page.pageId) === formPageId);
  const canCreateIssue = Boolean(
    formTitle.trim() &&
    formClientId &&
    formAppId &&
    !loadingApplications &&
    !formRequirementFileError,
  );

  // ---------------------------------------------------------------------------
  // Render
  // ---------------------------------------------------------------------------

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('issues.eyebrow')}
        title={t('issues.title')}
        description={t('issues.description')}
        actions={
          <>
            <div className="app-tabs" style={{ marginBottom: 0, padding: 3 }}>
              <button
                onClick={() => setView('kanban')}
                className={`app-tab${view === 'kanban' ? ' app-tab-active' : ''}`}
              >
                {t('issues.kanban')}
              </button>
              <button
                onClick={() => setView('list')}
                className={`app-tab${view === 'list' ? ' app-tab-active' : ''}`}
              >
                {t('issues.list')}
              </button>
            </div>
            <button onClick={openNewIssue} className="app-button app-button-primary">
              + {t('issues.newIssue')}
            </button>
          </>
        }
      />
      <div className="app-workspace" style={{ overflow: 'hidden' }}>
        {/* Main panel */}
        <div
          className="app-workspace-main"
          style={{ display: 'flex', flexDirection: 'column', overflow: 'hidden' }}
        >
          {/* Filter bar */}
          <div
            className="app-toolbar"
            style={{
              padding: '12px',
              borderBottom: '1px solid var(--app-border)',
              marginBottom: 0,
            }}
          >
            <input
              placeholder={t('issues.search')}
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                debouncedSetSearch(e.target.value);
              }}
              className="app-input"
              style={{ width: 'min(100%, 260px)' }}
            />
            <select
              value={filterClient}
              onChange={(e) => setFilterClient(e.target.value)}
              className="app-select"
              style={{ width: 'min(100%, 180px)' }}
            >
              <option value="">{t('issues.allClients')}</option>
              {clients.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name}
                </option>
              ))}
            </select>
            <select
              value={filterStatus}
              onChange={(e) => setFilterStatus(e.target.value as IssueStatus | '')}
              className="app-select"
              style={{ width: 'min(100%, 180px)' }}
            >
              <option value="">{t('issues.allStatuses')}</option>
              {ISSUE_STATUSES.map((s) => (
                <option key={s} value={s}>
                  {STATUS_LABELS[s]}
                </option>
              ))}
            </select>
            <select
              value={filterPriority}
              onChange={(e) => setFilterPriority(e.target.value as IssuePriority | '')}
              className="app-select"
              style={{ width: 'min(100%, 180px)' }}
            >
              <option value="">{t('issues.allPriorities')}</option>
              {PRIORITY_OPTIONS.map((p) => (
                <option key={p} value={p}>
                  {p.charAt(0).toUpperCase() + p.slice(1)}
                </option>
              ))}
            </select>
          </div>

          {/* Loading */}
          {loading && (
            <div style={{ padding: '2rem', color: 'var(--app-muted)' }}>Loading issues...</div>
          )}

          {/* Kanban view */}
          {!loading && view === 'kanban' && (
            <div
              style={{
                display: 'flex',
                gap: '12px',
                flex: 1,
                overflowX: 'auto',
                overflowY: 'hidden',
                padding: '12px',
              }}
            >
              {ISSUE_STATUSES.map((status) => {
                const col = grouped[status];
                const colColor = STATUS_COL_COLORS[status];
                return (
                  <div
                    key={status}
                    className="app-card"
                    style={{
                      minWidth: '240px',
                      width: '240px',
                      flexShrink: 0,
                      display: 'flex',
                      flexDirection: 'column',
                      overflow: 'hidden',
                      background: 'var(--app-surface-raised)',
                    }}
                  >
                    {/* Column header */}
                    <div
                      style={{
                        padding: '10px 12px',
                        display: 'flex',
                        justifyContent: 'space-between',
                        alignItems: 'center',
                        borderBottom: `3px solid ${colColor}`,
                      }}
                    >
                      <span
                        style={{
                          fontSize: '0.78rem',
                          fontWeight: 700,
                          color: 'var(--app-text)',
                          textTransform: 'uppercase',
                          letterSpacing: '0.04em',
                        }}
                      >
                        {STATUS_LABELS[status]}
                      </span>
                      <span className="app-status-pill" style={{ padding: '1px 7px' }}>
                        {col.length}
                      </span>
                    </div>

                    {/* Cards */}
                    <div
                      style={{
                        flex: 1,
                        overflowY: 'auto',
                        padding: '8px',
                        display: 'flex',
                        flexDirection: 'column',
                        gap: '8px',
                      }}
                    >
                      {col.length === 0 && (
                        <div
                          style={{
                            fontSize: '0.75rem',
                            color: 'var(--app-muted)',
                            textAlign: 'center',
                            padding: '1.5rem 0',
                          }}
                        >
                          {t('issues.noIssues')}
                        </div>
                      )}
                      {col.map((issue) => (
                        <IssueCard
                          key={issue.id}
                          issue={issue}
                          isSelected={selectedIssueId === issue.id}
                          onClick={handleCardClick}
                        />
                      ))}
                    </div>
                  </div>
                );
              })}
            </div>
          )}

          {/* List view */}
          {!loading && view === 'list' && (
            <div className="app-table-wrap" style={{ flex: 1 }}>
              <table className="app-table">
                <thead>
                  <tr style={{ position: 'sticky', top: 0 }}>
                    {[
                      'Code',
                      'Title',
                      'Client',
                      'Application',
                      'Page',
                      'Status',
                      'Priority',
                      'Type',
                      'Assigned',
                      'Updated',
                    ].map((header) => (
                      <th key={header}>{header}</th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {issues.length === 0 && (
                    <tr>
                      <td
                        colSpan={10}
                        style={{ padding: '2rem', textAlign: 'center', color: 'var(--app-muted)' }}
                      >
                        {t('issues.noIssues')}
                      </td>
                    </tr>
                  )}
                  {issues.map((issue) => (
                    <tr
                      key={issue.id}
                      onClick={() => handleCardClick(issue)}
                      className="app-table-row"
                      style={{
                        backgroundColor:
                          selectedIssueId === issue.id ? 'var(--app-accent-soft)' : 'transparent',
                      }}
                    >
                      <td
                        style={{
                          fontFamily: 'monospace',
                          fontWeight: 700,
                          color: 'var(--app-text)',
                          fontSize: '0.75rem',
                        }}
                      >
                        {issue.code}
                      </td>
                      <td
                        style={{
                          maxWidth: '240px',
                          overflow: 'hidden',
                          textOverflow: 'ellipsis',
                          whiteSpace: 'nowrap',
                        }}
                      >
                        {issue.title}
                      </td>
                      <td style={{ color: 'var(--app-muted)' }}>{issue.clientName}</td>
                      <td style={{ color: 'var(--app-muted)' }}>
                        {issue.appId
                          ? `${issue.appId} - ${issue.appName ?? 'Aplicacion APEX'}`
                          : '--'}
                      </td>
                      <td style={{ color: 'var(--app-muted)' }}>
                        {issue.pageId
                          ? `${issue.pageId} - ${issue.pageName ?? 'Sin nombre'}`
                          : '--'}
                      </td>
                      <td>
                        <span className="app-status-pill app-status-accent">
                          {STATUS_LABELS[issue.status]}
                        </span>
                      </td>
                      <td>
                        <span style={{ display: 'flex', alignItems: 'center', gap: '5px' }}>
                          <span
                            style={{
                              width: '8px',
                              height: '8px',
                              borderRadius: '50%',
                              backgroundColor: PRIORITY_DOT[issue.priority],
                              display: 'inline-block',
                            }}
                          />
                          <span style={{ textTransform: 'capitalize', fontSize: '0.78rem' }}>
                            {issue.priority}
                          </span>
                        </span>
                      </td>
                      <td style={{ textTransform: 'capitalize' }}>{issue.type}</td>
                      <td style={{ color: 'var(--app-muted)' }}>{issue.assignedToName ?? '--'}</td>
                      <td style={{ color: 'var(--app-muted)', fontSize: '0.75rem' }}>--</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        {/* Detail sidebar */}
        {selectedIssueId && (
          <div className="app-workspace-panel" style={{ flex: '0 0 400px', overflowY: 'auto' }}>
            <IssueDetail
              issueId={selectedIssueId}
              onClose={() => setSelectedIssueId(null)}
              onUpdated={loadIssues}
            />
          </div>
        )}

        {/* New issue modal */}
        {modalOpen && (
          <div className="app-modal-backdrop" onClick={() => setModalOpen(false)}>
            <div
              className="app-modal"
              style={{ width: 'min(96vw, 760px)', maxWidth: 760 }}
              onClick={(e) => e.stopPropagation()}
            >
              <div style={{ marginBottom: 18 }}>
                <p className="app-label" style={{ marginBottom: 6 }}>
                  Requerimientos
                </p>
                <h2 className="app-card-title" style={{ marginBottom: 6 }}>
                  Nuevo requerimiento
                </h2>
                <p style={{ color: 'var(--app-muted)', margin: 0, fontSize: '0.86rem' }}>
                  Define el cliente y la aplicacion APEX antes de enviar el trabajo al tablero.
                </p>
              </div>

              <div className="app-responsive-two-column" style={{ display: 'grid', gap: 12 }}>
                <div className="app-field">
                  <label className="app-label">Cliente *</label>
                  <select
                    value={formClientId}
                    onChange={(e) => {
                      setFormClientId(e.target.value);
                      setFormAppId('');
                      setFormPageId('');
                    }}
                    className="app-select"
                  >
                    <option value="">Selecciona un cliente...</option>
                    {clients.map((c) => (
                      <option key={c.id} value={c.id}>
                        {c.name}
                      </option>
                    ))}
                  </select>
                  {selectedFormClient?.connectionName && (
                    <div style={{ color: 'var(--app-muted)', fontSize: '0.78rem', marginTop: 6 }}>
                      Conexion: {selectedFormClient.connectionName}
                    </div>
                  )}
                </div>

                <div className="app-field">
                  <label className="app-label">Aplicacion APEX *</label>
                  <select
                    value={formAppId}
                    onChange={(e) => {
                      setFormAppId(e.target.value);
                      setFormPageId('');
                    }}
                    className="app-select"
                    disabled={!formClientId || loadingApplications || applications.length === 0}
                  >
                    <option value="">
                      {loadingApplications
                        ? 'Cargando aplicaciones...'
                        : 'Selecciona una aplicacion...'}
                    </option>
                    {applications.map((app) => (
                      <option key={app.applicationId} value={String(app.applicationId)}>
                        {app.applicationId} - {getApplicationName(app)}
                      </option>
                    ))}
                  </select>
                  {selectedApplication && (
                    <div style={{ color: 'var(--app-muted)', fontSize: '0.78rem', marginTop: 6 }}>
                      Codigo {selectedApplication.applicationId} -{' '}
                      {getApplicationName(selectedApplication)}
                    </div>
                  )}
                  {applicationsError && (
                    <div style={{ color: 'var(--app-danger)', fontSize: '0.78rem', marginTop: 6 }}>
                      {applicationsError}
                    </div>
                  )}
                </div>
              </div>

              <div className="app-field">
                <label className="app-label">Pagina APEX</label>
                <select
                  value={formPageId}
                  onChange={(e) => setFormPageId(e.target.value)}
                  className="app-select"
                  disabled={!formAppId || loadingPages || pages.length === 0}
                >
                  <option value="">
                    {loadingPages ? 'Cargando paginas...' : 'Sin pagina especifica'}
                  </option>
                  {pages.map((page) => (
                    <option key={page.pageId} value={String(page.pageId)}>
                      {page.pageId} - {page.pageName || page.title || 'Sin nombre'}
                    </option>
                  ))}
                </select>
                {selectedPage && (
                  <div style={{ color: 'var(--app-muted)', fontSize: '0.78rem', marginTop: 6 }}>
                    Pagina {selectedPage.pageId} -{' '}
                    {selectedPage.pageName || selectedPage.title || 'Sin nombre'}
                  </div>
                )}
                {pagesError && (
                  <div style={{ color: 'var(--app-danger)', fontSize: '0.78rem', marginTop: 6 }}>
                    {pagesError}
                  </div>
                )}
              </div>

              <div className="app-field">
                <label className="app-label">Titulo *</label>
                <input
                  value={formTitle}
                  onChange={(e) => setFormTitle(e.target.value)}
                  className="app-input"
                  placeholder="Ej. Ajustar consulta de pagos"
                />
              </div>

              <div className="app-field">
                <label className="app-label">Descripcion</label>
                <textarea
                  value={formDescription}
                  onChange={(e) => setFormDescription(e.target.value)}
                  rows={4}
                  className="app-textarea"
                  placeholder="Describe el alcance, contexto y resultado esperado..."
                />
              </div>

              <div className="app-field">
                <label className="app-label">Documento de requerimientos</label>
                <input
                  type="file"
                  accept={REQUIREMENT_FILE_ACCEPT}
                  onChange={(e) => handleRequirementFileChange(e.target.files?.[0] ?? null)}
                  className="app-input"
                />
                {formRequirementFile && (
                  <div
                    style={{
                      marginTop: 8,
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'space-between',
                      gap: 12,
                      color: 'var(--app-muted)',
                      fontSize: '0.78rem',
                    }}
                  >
                    <span>
                      {formRequirementFile.name} - {(formRequirementFile.size / 1024).toFixed(1)} KB
                    </span>
                    <button
                      type="button"
                      onClick={() => handleRequirementFileChange(null)}
                      className="app-button"
                      style={{ padding: '4px 8px', minHeight: 0 }}
                    >
                      Quitar
                    </button>
                  </div>
                )}
                {formRequirementFileError && (
                  <div style={{ color: 'var(--app-danger)', fontSize: '0.78rem', marginTop: 6 }}>
                    {formRequirementFileError}
                  </div>
                )}
              </div>

              <div style={{ display: 'flex', gap: '12px' }}>
                <div className="app-field" style={{ flex: 1 }}>
                  <label className="app-label">Prioridad</label>
                  <select
                    value={formPriority}
                    onChange={(e) => setFormPriority(e.target.value as IssuePriority)}
                    className="app-select"
                  >
                    {PRIORITY_OPTIONS.map((p) => (
                      <option key={p} value={p}>
                        {p.charAt(0).toUpperCase() + p.slice(1)}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="app-field" style={{ flex: 1 }}>
                  <label className="app-label">Tipo</label>
                  <select
                    value={formType}
                    onChange={(e) => setFormType(e.target.value as IssueType)}
                    className="app-select"
                  >
                    {TYPE_OPTIONS.map((tp) => (
                      <option key={tp} value={tp}>
                        {tp.charAt(0).toUpperCase() + tp.slice(1)}
                      </option>
                    ))}
                  </select>
                </div>
              </div>

              <div className="app-toolbar" style={{ justifyContent: 'flex-end', marginTop: '8px' }}>
                <button onClick={() => setModalOpen(false)} className="app-button">
                  Cancelar
                </button>
                <button
                  onClick={handleCreateIssue}
                  disabled={!canCreateIssue}
                  className="app-button app-button-primary"
                  style={{ opacity: canCreateIssue ? 1 : 0.5 }}
                >
                  Crear requerimiento
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </AppPage>
  );
}
