import { useState, useCallback, useEffect, useMemo } from 'react';
import { useTranslation } from 'react-i18next';
import { useSearchParams } from 'react-router-dom';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { apiClient } from '@/lib/api-client';
import { fetchClient, fetchClients, type ClientSummary } from '@/services/clients.api';

// ── Types ───────────────────────────────────────────────────────────────────

interface Connection {
  id: string;
  name: string;
  ordsBaseUrl?: string;
}
interface ApexApp {
  applicationId: number;
  applicationName: string;
  name?: string;
  pagesCount: number | null;
  lastUpdatedOn: string | null;
}
interface ApexPage {
  pageId: number;
  pageName: string;
  pageNumber?: number;
  name?: string;
  title?: string;
  pageMode: string | null;
  pageGroup: string | null;
  lastUpdatedOn: string | null;
}
interface ApexComponent {
  componentId: number;
  componentName: string;
  componentType: string;
  sourceType: string | null;
  regionId?: number;
}

interface RegionWithItems {
  region: ApexComponent;
  items: ApexComponent[];
}

type View = 'apps' | 'pages' | 'components';

// ── Color palette for app badges (APEX style) ──────────────────────────────

const APP_COLORS = [
  '#e74c3c',
  '#e67e22',
  '#f1c40f',
  '#2ecc71',
  '#1abc9c',
  '#3498db',
  '#9b59b6',
  '#e91e63',
  '#00bcd4',
  '#8bc34a',
  '#ff9800',
  '#795548',
  '#607d8b',
  '#673ab7',
  '#009688',
];

function getAppColor(id: number): string {
  return APP_COLORS[id % APP_COLORS.length];
}

function getAppInitials(name: string): string {
  return name
    .split(/\s+/)
    .map((w) => w[0])
    .join('')
    .substring(0, 2)
    .toUpperCase();
}

function normalizeApp(raw: Partial<ApexApp>): ApexApp {
  return {
    applicationId: Number(raw.applicationId ?? 0),
    applicationName: String(raw.applicationName ?? raw.name ?? ''),
    name: raw.name,
    pagesCount: raw.pagesCount ?? null,
    lastUpdatedOn: raw.lastUpdatedOn ?? null,
  };
}

function normalizePage(raw: Partial<ApexPage>): ApexPage {
  return {
    pageId: Number(raw.pageId ?? raw.pageNumber ?? 0),
    pageName: String(raw.pageName ?? raw.name ?? raw.title ?? ''),
    pageNumber: raw.pageNumber,
    name: raw.name,
    title: raw.title,
    pageMode: raw.pageMode ?? null,
    pageGroup: raw.pageGroup ?? null,
    lastUpdatedOn: raw.lastUpdatedOn ?? null,
  };
}

// ── Explorer Page ───────────────────────────────────────────────────────────

export default function ExplorerPage() {
  const { t } = useTranslation();
  const [searchParams, setSearchParams] = useSearchParams();
  const [connections, setConnections] = useState<Connection[]>([]);
  const [clients, setClients] = useState<ClientSummary[]>([]);
  const [selectedClientId, setSelectedClientId] = useState(searchParams.get('clientId') ?? '');
  const [selectedConnId, setSelectedConnId] = useState('');
  const [autoOpenAppId, setAutoOpenAppId] = useState<number | null>(null);
  const [view, setView] = useState<View>('apps');
  const [apps, setApps] = useState<ApexApp[]>([]);
  const [pages, setPages] = useState<ApexPage[]>([]);
  const [components, setComponents] = useState<ApexComponent[]>([]);
  const [selectedApp, setSelectedApp] = useState<ApexApp | null>(null);
  const [selectedPage, setSelectedPage] = useState<ApexPage | null>(null);
  const [loading, setLoading] = useState(false);
  const [search, setSearch] = useState('');
  const [error, setError] = useState<string | null>(null);

  // Load connections for read-only connection metadata and launch URLs.
  useEffect(() => {
    apiClient
      .get('/connections')
      .then((res) => {
        setConnections(res.data.data || []);
      })
      .catch(() => {});
  }, []);

  // Load clients so Explorer can start from a client workspace (e.g. Chinu)
  useEffect(() => {
    fetchClients({ pageSize: 100, isActive: true })
      .then((result) => setClients(result.data))
      .catch(() => setClients([]));
  }, []);

  const applyClientContext = useCallback((client: ClientSummary | null) => {
    setSelectedApp(null);
    setSelectedPage(null);
    setView('apps');
    setApps([]);
    setPages([]);
    setComponents([]);
    setAutoOpenAppId(null);

    if (!client) {
      setSelectedConnId('');
      setError(null);
      return;
    }

    if (!client.connectionId) {
      setSelectedConnId('');
      setError(`El cliente ${client.name} no tiene una conexión configurada.`);
      return;
    }

    setError(null);
    setSelectedConnId(client.connectionId);
    if (client.appId) setAutoOpenAppId(client.appId);
  }, []);

  // Resolve ?clientId=... into the client's stored connection/app.
  useEffect(() => {
    const clientId = searchParams.get('clientId');
    if (!clientId) return;

    setSelectedClientId(clientId);
    fetchClient(clientId)
      .then((client) => applyClientContext(client))
      .catch((err) => setError(err.response?.data?.error?.message || 'Failed to load client'));
  }, [applyClientContext, searchParams]);

  // Load apps when connection changes
  useEffect(() => {
    if (!selectedConnId) {
      setApps([]);
      setView('apps');
      return;
    }
    setLoading(true);
    setError(null);
    apiClient
      .get(`/explorer/apps/${selectedConnId}`)
      .then((res) => setApps((res.data.data || []).map(normalizeApp)))
      .catch((err) => setError(err.response?.data?.error?.message || 'Failed to load'))
      .finally(() => setLoading(false));
  }, [selectedConnId]);

  // Navigate into an app
  const openApp = useCallback(
    (app: ApexApp) => {
      setSelectedApp(app);
      setSelectedPage(null);
      setView('pages');
      setSearch('');
      setLoading(true);
      apiClient
        .get(`/explorer/pages/${selectedConnId}/${app.applicationId}`)
        .then((res) => setPages((res.data.data || []).map(normalizePage)))
        .catch(() => setPages([]))
        .finally(() => setLoading(false));
    },
    [selectedConnId],
  );

  useEffect(() => {
    if (!autoOpenAppId || apps.length === 0 || view !== 'apps') return;
    const app = apps.find((candidate) => candidate.applicationId === autoOpenAppId);
    if (!app) return;
    setAutoOpenAppId(null);
    openApp(app);
  }, [apps, autoOpenAppId, openApp, view]);

  const handleClientChange = useCallback(
    (clientId: string) => {
      setSelectedClientId(clientId);

      if (!clientId) {
        applyClientContext(null);
        setSearchParams({});
        return;
      }

      setSearchParams({ clientId });
      const client = clients.find((candidate) => candidate.id === clientId);
      if (client) applyClientContext(client);
    },
    [applyClientContext, clients, setSearchParams],
  );

  // Load regions + items for a page and group items under their region
  const loadPageComponents = useCallback(
    (page: ApexPage) => {
      setLoading(true);
      const appId = selectedApp?.applicationId ?? 0;
      const base = `/explorer/components/${selectedConnId}/${page.pageId}?appId=${appId}`;
      Promise.all([
        apiClient
          .get(`${base}&type=regions`)
          .then((r) => r.data.data || [])
          .catch(() => []),
        apiClient
          .get(`${base}&type=items`)
          .then((r) => r.data.data || [])
          .catch(() => []),
      ])
        .then(([regions, items]) => {
          setComponents([...regions, ...items]);
        })
        .finally(() => setLoading(false));
    },
    [selectedConnId, selectedApp],
  );

  // Navigate into a page
  const openPage = useCallback(
    (page: ApexPage) => {
      setSelectedPage(page);
      setView('components');
      setSearch('');
      loadPageComponents(page);
    },
    [loadPageComponents],
  );

  // Group items under their regions
  const groupedRegions = useMemo((): RegionWithItems[] => {
    const regions = components.filter((c) => c.componentType === 'region');
    const items = components.filter((c) => c.componentType === 'item');

    const grouped = regions.map((region) => ({
      region,
      items: items.filter((item) => item.regionId === region.componentId),
    }));

    // Items without a matching region
    const orphanItems = items.filter(
      (item) => !regions.some((r) => r.componentId === item.regionId),
    );
    if (orphanItems.length > 0) {
      grouped.push({
        region: {
          componentId: 0,
          componentName: 'Other Items',
          componentType: 'region',
          sourceType: null,
        },
        items: orphanItems,
      });
    }

    return grouped;
  }, [components]);

  // Go back
  const goBack = useCallback(() => {
    if (view === 'components') {
      setView('pages');
      setSelectedPage(null);
      setSearch('');
    } else if (view === 'pages') {
      setView('apps');
      setSelectedApp(null);
      setSearch('');
    }
  }, [view]);

  // Filter
  const filteredApps = useMemo(
    () => apps.filter((a) => a.applicationName.toLowerCase().includes(search.toLowerCase())),
    [apps, search],
  );
  const filteredPages = useMemo(
    () =>
      pages.filter(
        (p) =>
          p.pageName.toLowerCase().includes(search.toLowerCase()) ||
          String(p.pageId).includes(search),
      ),
    [pages, search],
  );
  const filteredComponents = useMemo(
    () => components.filter((c) => c.componentName.toLowerCase().includes(search.toLowerCase())),
    [components, search],
  );

  // ── Header context ──────────────────────────────────────────────────────

  const selectedClient = clients.find((client) => client.id === selectedClientId);
  const connName =
    selectedClient?.connectionName ?? connections.find((c) => c.id === selectedConnId)?.name ?? '';

  const pageLabel = selectedPage ? `Página ${selectedPage.pageId}` : null;
  const explorerTitle = selectedPage
    ? selectedPage.pageName
    : selectedApp
      ? selectedApp.applicationName
      : selectedClient?.name || 'Explorador APEX';

  return (
    <AppPage>
      <AppPageHeader
        eyebrow={selectedClient?.name ? `Cliente · ${selectedClient.name}` : 'APEX Explorer'}
        title={explorerTitle}
        description={
          <div style={{ display: 'grid', gap: 12, marginTop: 4 }}>
            <div
              className="app-toolbar"
              style={{ gap: 8, color: 'var(--app-muted)', fontSize: '0.8rem' }}
            >
              {connName && <span className="app-status-pill">Conexión {connName}</span>}
              {selectedApp && (
                <span className="app-status-pill">{selectedApp.applicationName}</span>
              )}
              {pageLabel && <span className="app-status-pill">{pageLabel}</span>}
            </div>

            <div className="app-toolbar" style={{ gap: 12 }}>
              <select
                className="app-select"
                value={selectedClientId}
                onChange={(e) => handleClientChange(e.target.value)}
                style={{ maxWidth: 260 }}
              >
                <option value="">Selecciona cliente</option>
                {clients.map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.name}
                  </option>
                ))}
              </select>

              {view !== 'apps' && (
                <button className="app-button" type="button" onClick={goBack}>
                  Volver
                </button>
              )}

              <input
                type="text"
                className="app-input"
                placeholder={t('explorer.search')}
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                style={{ maxWidth: 220 }}
              />
            </div>
          </div>
        }
      />

      {/* Action bar (pages/components view) */}
      {view !== 'apps' && selectedApp && (
        <div
          style={{
            display: 'flex',
            alignItems: 'center',
            gap: 16,
            padding: '16px 20px',
            borderBottom: '1px solid var(--app-border)',
            background: 'var(--app-surface-raised)',
          }}
        >
          {view === 'pages' && (
            <>
              <ActionButton
                icon="▶"
                label="Run Application"
                onClick={() => {
                  const conn = connections.find((c) => c.id === selectedConnId);
                  const base = conn?.ordsBaseUrl;
                  if (base)
                    window.open(
                      `${base.replace(/\/+$/, '')}/f${selectedApp.applicationId}`,
                      '_blank',
                    );
                }}
              />
              <ActionButton icon="🔧" label="Supporting Objects" />
              <ActionButton icon="🧩" label="Shared Components" />
              <ActionButton icon="🛠" label="Utilities" />
            </>
          )}
          {view === 'components' && selectedPage && (
            <>
              <ActionButton
                icon="▶"
                label="Run Page"
                onClick={() => {
                  const conn = connections.find((c) => c.id === selectedConnId);
                  const base = conn?.ordsBaseUrl;
                  if (base)
                    window.open(
                      `${base.replace(/\/+$/, '')}/f${selectedApp.applicationId}/page${selectedPage.pageId}`,
                      '_blank',
                    );
                }}
              />
              <ActionButton
                icon="🔄"
                label="Refresh"
                onClick={() => loadPageComponents(selectedPage)}
              />
            </>
          )}
        </div>
      )}

      {/* Content */}
      <div style={{ padding: 20 }}>
        {error && (
          <div
            style={{
              padding: 12,
              background: '#fff1ef',
              color: 'var(--app-danger)',
              borderRadius: 6,
              marginBottom: 16,
            }}
          >
            {error}
          </div>
        )}
        {loading && <p style={{ color: 'var(--app-muted)' }}>Loading...</p>}

        {/* === APPS GRID === */}
        {view === 'apps' && !loading && (
          <div
            style={{
              display: 'grid',
              gridTemplateColumns: 'repeat(auto-fill, minmax(180px, 1fr))',
              gap: 12,
            }}
          >
            {filteredApps.map((app) => (
              <div
                key={app.applicationId}
                className="app-card app-card-pad"
                onClick={() => openApp(app)}
                style={{
                  cursor: 'pointer',
                  transition: 'border-color 0.15s, transform 0.1s',
                  display: 'flex',
                  flexDirection: 'column',
                  alignItems: 'center',
                  gap: 8,
                  textAlign: 'center',
                  minHeight: 120,
                }}
                onMouseEnter={(e) => {
                  (e.currentTarget as HTMLElement).style.borderColor = 'var(--app-border-strong)';
                  (e.currentTarget as HTMLElement).style.transform = 'translateY(-2px)';
                }}
                onMouseLeave={(e) => {
                  (e.currentTarget as HTMLElement).style.borderColor = 'var(--app-border)';
                  (e.currentTarget as HTMLElement).style.transform = 'none';
                }}
              >
                <div
                  style={{
                    width: 48,
                    height: 48,
                    borderRadius: 8,
                    display: 'grid',
                    placeItems: 'center',
                    background: getAppColor(app.applicationId),
                    color: '#fff',
                    fontWeight: 800,
                    fontSize: '1rem',
                  }}
                >
                  {getAppInitials(app.applicationName)}
                </div>
                <div style={{ fontSize: '0.8rem', fontWeight: 600, lineHeight: 1.3 }}>
                  {app.applicationName}
                </div>
                <div style={{ fontSize: '0.7rem', color: 'var(--app-muted)' }}>
                  {app.applicationId} · {app.pagesCount ?? '?'} {t('explorer.pages')}
                </div>
              </div>
            ))}
            {filteredApps.length === 0 && !loading && selectedConnId && (
              <p style={{ color: 'var(--app-muted)', gridColumn: '1 / -1' }}>
                {t('explorer.noApps')}
              </p>
            )}
          </div>
        )}

        {/* === PAGES GRID === */}
        {view === 'pages' && !loading && (
          <div
            style={{
              display: 'grid',
              gridTemplateColumns: 'repeat(auto-fill, minmax(160px, 1fr))',
              gap: 10,
            }}
          >
            {filteredPages.map((page) => (
              <div
                key={page.pageId}
                className="app-card app-card-pad"
                onClick={() => openPage(page)}
                style={{
                  cursor: 'pointer',
                  transition: 'border-color 0.15s',
                  textAlign: 'center',
                }}
                onMouseEnter={(e) =>
                  ((e.currentTarget as HTMLElement).style.borderColor = 'var(--app-border-strong)')
                }
                onMouseLeave={(e) =>
                  ((e.currentTarget as HTMLElement).style.borderColor = 'var(--app-border)')
                }
              >
                <div
                  style={{
                    width: 40,
                    height: 40,
                    borderRadius: 6,
                    margin: '0 auto 8px',
                    background: 'var(--app-soft)',
                    display: 'grid',
                    placeItems: 'center',
                    color: 'var(--app-accent)',
                    fontSize: '1.1rem',
                  }}
                >
                  📄
                </div>
                <div style={{ fontSize: '0.75rem', fontWeight: 600, lineHeight: 1.3 }}>
                  {page.pageId} - {page.pageName}
                </div>
                {page.pageGroup && (
                  <div style={{ fontSize: '0.65rem', color: 'var(--app-muted)', marginTop: 4 }}>
                    {page.pageGroup}
                  </div>
                )}
              </div>
            ))}
            {filteredPages.length === 0 && !loading && (
              <p style={{ color: 'var(--app-muted)', gridColumn: '1 / -1' }}>
                {t('explorer.noPages')}
              </p>
            )}
          </div>
        )}

        {/* === COMPONENTS TREE (Regions → Items) === */}
        {view === 'components' && !loading && (
          <div style={{ display: 'grid', gap: 8 }}>
            {groupedRegions.length === 0 && (
              <p style={{ color: 'var(--app-muted)' }}>{t('explorer.noComponents')}</p>
            )}
            {groupedRegions.map(({ region, items }) => (
              <div
                key={region.componentId}
                style={{
                  border: '1px solid var(--app-border)',
                  borderRadius: 8,
                  background: 'var(--app-surface)',
                  overflow: 'hidden',
                }}
              >
                {/* Region header */}
                <div
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: 10,
                    padding: '10px 14px',
                    background: 'var(--app-surface-raised)',
                    borderBottom: items.length > 0 ? '1px solid var(--app-border)' : 'none',
                  }}
                >
                  <span
                    style={{
                      width: 32,
                      height: 32,
                      borderRadius: 6,
                      display: 'grid',
                      placeItems: 'center',
                      background: 'var(--app-accent-soft)',
                      color: 'var(--app-accent-strong)',
                      fontSize: '0.9rem',
                      flexShrink: 0,
                    }}
                  >
                    🔲
                  </span>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ fontSize: '0.85rem', fontWeight: 700 }}>
                      {region.componentName}
                    </div>
                    <div style={{ fontSize: '0.7rem', color: 'var(--app-muted)' }}>
                      {region.sourceType || 'Region'} · {items.length} item
                      {items.length !== 1 ? 's' : ''}
                    </div>
                  </div>
                </div>

                {/* Items under this region */}
                {items.length > 0 && (
                  <div>
                    {items.map((item) => (
                      <div
                        key={item.componentId}
                        style={{
                          display: 'flex',
                          alignItems: 'center',
                          gap: 10,
                          padding: '8px 14px 8px 46px',
                          borderBottom: '1px solid var(--app-soft)',
                          fontSize: '0.8rem',
                        }}
                      >
                        <span
                          style={{
                            width: 24,
                            height: 24,
                            borderRadius: 4,
                            display: 'grid',
                            placeItems: 'center',
                            background: 'var(--app-soft)',
                            color: 'var(--app-accent)',
                            fontSize: '0.7rem',
                            flexShrink: 0,
                          }}
                        >
                          🔤
                        </span>
                        <div style={{ flex: 1, minWidth: 0 }}>
                          <span style={{ fontWeight: 600 }}>{item.componentName}</span>
                          <span style={{ color: 'var(--app-muted)', marginLeft: 8 }}>
                            {item.sourceType || ''}
                          </span>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            ))}
          </div>
        )}

        {!selectedConnId && !loading && (
          <div className="app-empty">
            <div>
              <div style={{ fontSize: '3rem', marginBottom: 12 }}>⚡</div>
              <h2 style={{ margin: '0 0 8px', color: 'var(--app-text)', fontWeight: 700 }}>
                {t('explorer.title')}
              </h2>
              <p style={{ fontSize: '0.9rem' }}>
                Selecciona un cliente para cargar las aplicaciones desde su conexión asociada.
              </p>
            </div>
          </div>
        )}
      </div>
    </AppPage>
  );
}

// ── Action Button ───────────────────────────────────────────────────────────

function ActionButton({
  icon,
  label,
  onClick,
}: {
  icon: string;
  label: string;
  onClick?: () => void;
}) {
  return (
    <button
      onClick={onClick}
      style={{
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        gap: 6,
        background: 'none',
        border: 'none',
        color: 'var(--app-accent)',
        cursor: 'pointer',
        fontSize: '0.75rem',
        padding: '8px 16px',
        borderRadius: 6,
        transition: 'background-color 0.15s',
      }}
      onMouseEnter={(e) =>
        ((e.currentTarget as HTMLElement).style.backgroundColor = 'var(--app-border)')
      }
      onMouseLeave={(e) => ((e.currentTarget as HTMLElement).style.backgroundColor = 'transparent')}
    >
      <span
        style={{
          width: 48,
          height: 48,
          borderRadius: 8,
          display: 'grid',
          placeItems: 'center',
          background: 'var(--app-surface)',
          border: '1px solid var(--app-border-strong)',
          fontSize: '1.4rem',
        }}
      >
        {icon}
      </span>
      {label}
    </button>
  );
}
