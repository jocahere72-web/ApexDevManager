import { useState, useCallback, useEffect, useMemo } from 'react';
import { apiClient } from '@/lib/api-client';

// ── Types ───────────────────────────────────────────────────────────────────

interface Connection { id: string; name: string; }
interface ApexApp {
  applicationId: number;
  applicationName: string;
  pagesCount: number | null;
  lastUpdatedOn: string | null;
}
interface ApexPage {
  pageId: number;
  pageName: string;
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
  '#e74c3c', '#e67e22', '#f1c40f', '#2ecc71', '#1abc9c',
  '#3498db', '#9b59b6', '#e91e63', '#00bcd4', '#8bc34a',
  '#ff9800', '#795548', '#607d8b', '#673ab7', '#009688',
];

function getAppColor(id: number): string {
  return APP_COLORS[id % APP_COLORS.length];
}

function getAppInitials(name: string): string {
  return name.split(/\s+/).map(w => w[0]).join('').substring(0, 2).toUpperCase();
}

// ── Explorer Page ───────────────────────────────────────────────────────────

export default function ExplorerPage() {
  const [connections, setConnections] = useState<Connection[]>([]);
  const [selectedConnId, setSelectedConnId] = useState('');
  const [view, setView] = useState<View>('apps');
  const [apps, setApps] = useState<ApexApp[]>([]);
  const [pages, setPages] = useState<ApexPage[]>([]);
  const [components, setComponents] = useState<ApexComponent[]>([]);
  const [selectedApp, setSelectedApp] = useState<ApexApp | null>(null);
  const [selectedPage, setSelectedPage] = useState<ApexPage | null>(null);
  const [loading, setLoading] = useState(false);
  const [search, setSearch] = useState('');
  const [error, setError] = useState<string | null>(null);

  // Load connections
  useEffect(() => {
    apiClient.get('/connections').then(res => {
      setConnections(res.data.data || []);
    }).catch(() => {});
  }, []);

  // Load apps when connection changes
  useEffect(() => {
    if (!selectedConnId) { setApps([]); setView('apps'); return; }
    setLoading(true);
    setError(null);
    apiClient.get(`/explorer/apps/${selectedConnId}`)
      .then(res => setApps(res.data.data || []))
      .catch(err => setError(err.response?.data?.error?.message || 'Failed to load'))
      .finally(() => setLoading(false));
  }, [selectedConnId]);

  // Navigate into an app
  const openApp = useCallback((app: ApexApp) => {
    setSelectedApp(app);
    setSelectedPage(null);
    setView('pages');
    setSearch('');
    setLoading(true);
    apiClient.get(`/explorer/pages/${selectedConnId}/${app.applicationId}`)
      .then(res => setPages(res.data.data || []))
      .catch(() => setPages([]))
      .finally(() => setLoading(false));
  }, [selectedConnId]);

  // Load regions + items for a page and group items under their region
  const loadPageComponents = useCallback((page: ApexPage) => {
    setLoading(true);
    const appId = selectedApp?.applicationId ?? 0;
    const base = `/explorer/components/${selectedConnId}/${page.pageId}?appId=${appId}`;
    Promise.all([
      apiClient.get(`${base}&type=regions`).then(r => r.data.data || []).catch(() => []),
      apiClient.get(`${base}&type=items`).then(r => r.data.data || []).catch(() => []),
    ]).then(([regions, items]) => {
      setComponents([...regions, ...items]);
    }).finally(() => setLoading(false));
  }, [selectedConnId, selectedApp]);

  // Navigate into a page
  const openPage = useCallback((page: ApexPage) => {
    setSelectedPage(page);
    setView('components');
    setSearch('');
    loadPageComponents(page);
  }, [loadPageComponents]);

  // Group items under their regions
  const groupedRegions = useMemo((): RegionWithItems[] => {
    const regions = components.filter(c => c.componentType === 'region');
    const items = components.filter(c => c.componentType === 'item');

    const grouped = regions.map(region => ({
      region,
      items: items.filter(item => item.regionId === region.componentId),
    }));

    // Items without a matching region
    const orphanItems = items.filter(item => !regions.some(r => r.componentId === item.regionId));
    if (orphanItems.length > 0) {
      grouped.push({
        region: { componentId: 0, componentName: 'Other Items', componentType: 'region', sourceType: null },
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
  const filteredApps = useMemo(() =>
    apps.filter(a => a.applicationName.toLowerCase().includes(search.toLowerCase())),
    [apps, search]);
  const filteredPages = useMemo(() =>
    pages.filter(p => p.pageName.toLowerCase().includes(search.toLowerCase()) || String(p.pageId).includes(search)),
    [pages, search]);
  const filteredComponents = useMemo(() =>
    components.filter(c => c.componentName.toLowerCase().includes(search.toLowerCase())),
    [components, search]);

  // ── Breadcrumb ──────────────────────────────────────────────────────────

  const connName = connections.find(c => c.id === selectedConnId)?.name ?? '';

  return (
    <div style={{ minHeight: 'calc(100vh - var(--app-topbar-height))', background: 'var(--app-bg)', color: 'var(--app-text)' }}>
      {/* Top bar */}
      <div style={{
        display: 'flex', alignItems: 'center', gap: 12, padding: '10px 20px',
        borderBottom: '1px solid var(--app-border)', background: 'var(--app-surface)',
      }}>
        <span style={{ fontWeight: 800, color: 'var(--app-danger)', fontSize: '1.1rem' }}>APEX</span>
        <span style={{ color: 'var(--app-muted)' }}>›</span>

        <select
          value={selectedConnId}
          onChange={e => { setSelectedConnId(e.target.value); setView('apps'); setSelectedApp(null); }}
          style={{
            background: 'var(--app-border)', color: 'var(--app-text)', border: '1px solid var(--app-border-strong)',
            borderRadius: 4, padding: '4px 8px', fontSize: '0.85rem',
          }}
        >
          <option value="">Select Connection</option>
          {connections.map(c => <option key={c.id} value={c.id}>{c.name}</option>)}
        </select>

        {selectedApp && (
          <>
            <span style={{ color: 'var(--app-muted)' }}>›</span>
            <button onClick={goBack} style={{
              background: 'none', border: 'none', color: 'var(--app-accent)', cursor: 'pointer',
              fontSize: '0.85rem', padding: 0,
            }}>
              Applications
            </button>
            <span style={{ color: 'var(--app-muted)' }}>›</span>
            <span style={{ fontWeight: 600, fontSize: '0.85rem' }}>
              {selectedApp.applicationName}
            </span>
          </>
        )}

        {selectedPage && (
          <>
            <span style={{ color: 'var(--app-muted)' }}>›</span>
            <button onClick={() => { setView('pages'); setSelectedPage(null); }} style={{
              background: 'none', border: 'none', color: 'var(--app-accent)', cursor: 'pointer',
              fontSize: '0.85rem', padding: 0,
            }}>
              Pages
            </button>
            <span style={{ color: 'var(--app-muted)' }}>›</span>
            <span style={{ fontWeight: 600, fontSize: '0.85rem' }}>
              Page {selectedPage.pageId} - {selectedPage.pageName}
            </span>
          </>
        )}

        <div style={{ flex: 1 }} />

        <div style={{ position: 'relative' }}>
          <input
            type="text"
            placeholder="Search..."
            value={search}
            onChange={e => setSearch(e.target.value)}
            style={{
              background: 'var(--app-border)', color: 'var(--app-text)', border: '1px solid var(--app-border-strong)',
              borderRadius: 4, padding: '6px 12px 6px 30px', fontSize: '0.85rem', width: 200,
            }}
          />
          <span style={{ position: 'absolute', left: 10, top: '50%', transform: 'translateY(-50%)', color: 'var(--app-muted)', fontSize: '0.8rem' }}>🔍</span>
        </div>
      </div>

      {/* Action bar (pages/components view) */}
      {view !== 'apps' && selectedApp && (
        <div style={{
          display: 'flex', alignItems: 'center', gap: 16, padding: '16px 20px',
          borderBottom: '1px solid var(--app-border)', background: 'var(--app-surface-raised)',
        }}>
          {view === 'pages' && (
            <>
              <ActionButton icon="▶" label="Run Application" onClick={() => window.open(`http://99.0.5.232:8031/ords/r/infortributos/f${selectedApp.applicationId}`, '_blank')} />
              <ActionButton icon="🔧" label="Supporting Objects" />
              <ActionButton icon="🧩" label="Shared Components" />
              <ActionButton icon="🛠" label="Utilities" />
            </>
          )}
          {view === 'components' && selectedPage && (
            <>
              <ActionButton icon="▶" label="Run Page" onClick={() => window.open(`http://99.0.5.232:8031/ords/r/infortributos/f${selectedApp.applicationId}/page${selectedPage.pageId}`, '_blank')} />
              <ActionButton icon="🔄" label="Refresh" onClick={() => loadPageComponents(selectedPage)} />
            </>
          )}
        </div>
      )}

      {/* Content */}
      <div style={{ padding: 20 }}>
        {error && <div style={{ padding: 12, background: '#fff1ef', color: 'var(--app-danger)', borderRadius: 6, marginBottom: 16 }}>{error}</div>}
        {loading && <p style={{ color: 'var(--app-muted)' }}>Loading...</p>}

        {/* === APPS GRID === */}
        {view === 'apps' && !loading && (
          <div style={{
            display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(180px, 1fr))', gap: 12,
          }}>
            {filteredApps.map(app => (
              <div
                key={app.applicationId}
                onClick={() => openApp(app)}
                style={{
                  background: 'var(--app-surface)', borderRadius: 8, padding: 16, cursor: 'pointer',
                  border: '1px solid transparent', transition: 'border-color 0.15s, transform 0.1s',
                  display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8,
                  textAlign: 'center', minHeight: 120,
                }}
                onMouseEnter={e => {
                  (e.currentTarget as HTMLElement).style.borderColor = 'var(--app-border-strong)';
                  (e.currentTarget as HTMLElement).style.transform = 'translateY(-2px)';
                }}
                onMouseLeave={e => {
                  (e.currentTarget as HTMLElement).style.borderColor = 'transparent';
                  (e.currentTarget as HTMLElement).style.transform = 'none';
                }}
              >
                <div style={{
                  width: 48, height: 48, borderRadius: 8, display: 'grid', placeItems: 'center',
                  background: getAppColor(app.applicationId), color: '#fff',
                  fontWeight: 800, fontSize: '1rem',
                }}>
                  {getAppInitials(app.applicationName)}
                </div>
                <div style={{ fontSize: '0.8rem', fontWeight: 600, lineHeight: 1.3 }}>
                  {app.applicationName}
                </div>
                <div style={{ fontSize: '0.7rem', color: 'var(--app-muted)' }}>
                  {app.applicationId} · {app.pagesCount ?? '?'} pages
                </div>
              </div>
            ))}
            {filteredApps.length === 0 && !loading && selectedConnId && (
              <p style={{ color: 'var(--app-muted)', gridColumn: '1 / -1' }}>No applications match your search.</p>
            )}
          </div>
        )}

        {/* === PAGES GRID === */}
        {view === 'pages' && !loading && (
          <div style={{
            display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(160px, 1fr))', gap: 10,
          }}>
            {filteredPages.map(page => (
              <div
                key={page.pageId}
                onClick={() => openPage(page)}
                style={{
                  background: 'var(--app-surface)', borderRadius: 8, padding: 14, cursor: 'pointer',
                  border: '1px solid transparent', transition: 'border-color 0.15s',
                  textAlign: 'center',
                }}
                onMouseEnter={e => (e.currentTarget as HTMLElement).style.borderColor = 'var(--app-border-strong)'}
                onMouseLeave={e => (e.currentTarget as HTMLElement).style.borderColor = 'transparent'}
              >
                <div style={{
                  width: 40, height: 40, borderRadius: 6, margin: '0 auto 8px',
                  background: 'var(--app-soft)', display: 'grid', placeItems: 'center',
                  color: 'var(--app-accent)', fontSize: '1.1rem',
                }}>
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
              <p style={{ color: 'var(--app-muted)', gridColumn: '1 / -1' }}>No pages match your search.</p>
            )}
          </div>
        )}

        {/* === COMPONENTS TREE (Regions → Items) === */}
        {view === 'components' && !loading && (
          <div style={{ display: 'grid', gap: 8 }}>
            {groupedRegions.length === 0 && (
              <p style={{ color: 'var(--app-muted)' }}>No components found for this page.</p>
            )}
            {groupedRegions.map(({ region, items }) => (
              <div key={region.componentId} style={{
                border: '1px solid var(--app-border)', borderRadius: 8,
                background: 'var(--app-surface)', overflow: 'hidden',
              }}>
                {/* Region header */}
                <div style={{
                  display: 'flex', alignItems: 'center', gap: 10, padding: '10px 14px',
                  background: 'var(--app-surface-raised)', borderBottom: items.length > 0 ? '1px solid var(--app-border)' : 'none',
                }}>
                  <span style={{
                    width: 32, height: 32, borderRadius: 6, display: 'grid', placeItems: 'center',
                    background: 'var(--app-accent-soft)', color: 'var(--app-accent-strong)',
                    fontSize: '0.9rem', flexShrink: 0,
                  }}>🔲</span>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ fontSize: '0.85rem', fontWeight: 700 }}>{region.componentName}</div>
                    <div style={{ fontSize: '0.7rem', color: 'var(--app-muted)' }}>
                      {region.sourceType || 'Region'} · {items.length} item{items.length !== 1 ? 's' : ''}
                    </div>
                  </div>
                </div>

                {/* Items under this region */}
                {items.length > 0 && (
                  <div>
                    {items.map(item => (
                      <div key={item.componentId} style={{
                        display: 'flex', alignItems: 'center', gap: 10, padding: '8px 14px 8px 46px',
                        borderBottom: '1px solid var(--app-soft)',
                        fontSize: '0.8rem',
                      }}>
                        <span style={{
                          width: 24, height: 24, borderRadius: 4, display: 'grid', placeItems: 'center',
                          background: 'var(--app-soft)', color: 'var(--app-accent)',
                          fontSize: '0.7rem', flexShrink: 0,
                        }}>🔤</span>
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
          <div style={{
            display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center',
            minHeight: 300, color: 'var(--app-muted)', textAlign: 'center',
          }}>
            <div style={{ fontSize: '3rem', marginBottom: 12 }}>⚡</div>
            <h2 style={{ margin: '0 0 8px', color: 'var(--app-text)', fontWeight: 700 }}>APEX Explorer</h2>
            <p style={{ fontSize: '0.9rem' }}>Select a connection to browse your APEX applications.</p>
          </div>
        )}
      </div>
    </div>
  );
}

// ── Action Button ───────────────────────────────────────────────────────────

function ActionButton({ icon, label, onClick }: { icon: string; label: string; onClick?: () => void }) {
  return (
    <button
      onClick={onClick}
      style={{
        display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 6,
        background: 'none', border: 'none', color: 'var(--app-accent)', cursor: 'pointer',
        fontSize: '0.75rem', padding: '8px 16px', borderRadius: 6,
        transition: 'background-color 0.15s',
      }}
      onMouseEnter={e => (e.currentTarget as HTMLElement).style.backgroundColor = 'var(--app-border)'}
      onMouseLeave={e => (e.currentTarget as HTMLElement).style.backgroundColor = 'transparent'}
    >
      <span style={{
        width: 48, height: 48, borderRadius: 8, display: 'grid', placeItems: 'center',
        background: 'var(--app-surface)', border: '1px solid var(--app-border-strong)', fontSize: '1.4rem',
      }}>
        {icon}
      </span>
      {label}
    </button>
  );
}
