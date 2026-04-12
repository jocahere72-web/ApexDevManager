import { useState, useEffect, useCallback, type CSSProperties } from 'react';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader, AppCard } from '@/components/ui/AppTemplate';
import { apiClient } from '@/lib/api-client';
import * as dependencyApi from '@/services/dependency.api';
import type { PRDImpactAnalysis, PRDImpactRequest } from '@apex-dev-manager/shared-types';
import type { Issue } from '@/services/issues.api';
import DependencyGraph from './components/DependencyGraph';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const s: Record<string, CSSProperties> = {
  row: { display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginBottom: '16px' },
  fullRow: { marginBottom: '16px' },
  label: {
    display: 'block', fontSize: '12px', fontWeight: 600, color: '#6c757d',
    marginBottom: '6px', textTransform: 'uppercase' as const,
  },
  input: {
    width: '100%', padding: '8px 12px', borderRadius: '6px', border: '1px solid #ddd',
    fontSize: '14px', boxSizing: 'border-box' as const,
  },
  select: {
    width: '100%', padding: '8px 12px', borderRadius: '6px', border: '1px solid #ddd', fontSize: '14px',
  },
  textarea: {
    width: '100%', padding: '8px 12px', borderRadius: '6px', border: '1px solid #ddd',
    fontSize: '14px', minHeight: '80px', boxSizing: 'border-box' as const, resize: 'vertical' as const,
  },
  btn: {
    padding: '10px 20px', border: 'none', borderRadius: '6px', cursor: 'pointer',
    fontSize: '14px', fontWeight: 600, backgroundColor: '#6c5ce7', color: '#fff',
  },
  btnOutline: {
    padding: '10px 20px', borderRadius: '6px', cursor: 'pointer',
    fontSize: '14px', fontWeight: 500, backgroundColor: '#fff', color: '#333',
    border: '1px solid #ddd',
  },
  summaryRow: {
    display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px', alignItems: 'center',
  },
  metricGrid: { display: 'grid', gridTemplateColumns: '1fr 1fr 1fr 1fr', gap: '12px' },
  metricBox: {
    backgroundColor: '#f8f9fa', borderRadius: '8px', padding: '16px', textAlign: 'center' as const,
  },
  metricNum: { fontSize: '24px', fontWeight: 700, color: '#1a1a2e' },
  metricLabel: { fontSize: '11px', color: '#6c757d', marginTop: '4px' },
  sectionTitle: { fontSize: '14px', fontWeight: 600, color: '#333', marginBottom: '8px', marginTop: '16px' },
  greenItem: {
    padding: '8px 12px', backgroundColor: '#e8f5e9', borderRadius: '6px',
    marginBottom: '6px', fontSize: '13px',
  },
  yellowItem: {
    padding: '8px 12px', backgroundColor: '#fff8e1', borderRadius: '6px',
    marginBottom: '6px', fontSize: '13px',
  },
  depTable: {
    width: '100%', borderCollapse: 'collapse' as const, fontSize: '13px',
  },
  th: {
    textAlign: 'left' as const, padding: '8px 12px', borderBottom: '2px solid #e9ecef',
    fontWeight: 600, color: '#6c757d', fontSize: '11px', textTransform: 'uppercase' as const,
  },
  td: { padding: '8px 12px', borderBottom: '1px solid #f0f0f0' },
  checkboxRow: { display: 'flex', flexWrap: 'wrap' as const, gap: '8px' },
  checkboxLabel: { display: 'flex', alignItems: 'center', gap: '4px', fontSize: '13px', cursor: 'pointer' },
  collapsible: { cursor: 'pointer', fontSize: '14px', fontWeight: 600, color: '#6c5ce7', marginTop: '8px' },
};

const riskColors: Record<string, { bg: string; text: string }> = {
  low: { bg: '#e8f5e9', text: '#2e7d32' },
  medium: { bg: '#fff8e1', text: '#f57f17' },
  high: { bg: '#fff3e0', text: '#e65100' },
  critical: { bg: '#fce4ec', text: '#c62828' },
};

// ---------------------------------------------------------------------------
// Sub-types for dropdowns
// ---------------------------------------------------------------------------
interface SimpleApp { applicationId: number; applicationName: string }
interface SimplePage { pageId: number; pageName: string }

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function DependencyAnalyzerPage() {
  const { t } = useTranslation();

  // Mode: 'form' | 'results' | 'graph'
  const [mode, setMode] = useState<'form' | 'results' | 'graph'>('form');
  const [tab, setTab] = useState<'prd' | 'graph'>('prd');

  // Form state
  const [issues, setIssues] = useState<Issue[]>([]);
  const [selectedIssueId, setSelectedIssueId] = useState('');
  const [connectionId, setConnectionId] = useState('');
  const [connections, setConnections] = useState<Array<{ id: string; name: string }>>([]);
  const [apps, setApps] = useState<SimpleApp[]>([]);
  const [selectedAppId, setSelectedAppId] = useState<number | undefined>();
  const [pages, setPages] = useState<SimplePage[]>([]);
  const [selectedPageIds, setSelectedPageIds] = useState<number[]>([]);
  const [affectedTables, setAffectedTables] = useState('');
  const [affectedObjects, setAffectedObjects] = useState('');
  const [notes, setNotes] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  // Results
  const [analysis, setAnalysis] = useState<PRDImpactAnalysis | null>(null);
  const [contextOpen, setContextOpen] = useState(false);

  // Load issues with PRD
  useEffect(() => {
    apiClient.get('/issues', { params: { pageSize: 500 } })
      .then((res) => {
        const all: Issue[] = res.data.data ?? [];
        setIssues(all.filter((i) => i.prdSessionId));
      })
      .catch(() => {});
  }, []);

  // Load connections
  useEffect(() => {
    apiClient.get('/connections')
      .then((res) => setConnections(res.data.data || []))
      .catch(() => {});
  }, []);

  // Reset dependent fields when issue changes
  useEffect(() => {
    if (!selectedIssueId) return;
    setSelectedAppId(undefined);
    setSelectedPageIds([]);
  }, [selectedIssueId]);

  // Load apps when connection changes
  useEffect(() => {
    if (!connectionId) { setApps([]); return; }
    apiClient.get(`/explorer/apps/${connectionId}`)
      .then((res) => setApps(res.data.data || []))
      .catch(() => setApps([]));
  }, [connectionId]);

  // Load pages when app changes
  useEffect(() => {
    if (!connectionId || !selectedAppId) { setPages([]); return; }
    apiClient.get(`/explorer/pages/${connectionId}/${selectedAppId}`)
      .then((res) => setPages(res.data.data || []))
      .catch(() => setPages([]));
  }, [connectionId, selectedAppId]);

  const togglePage = useCallback((pageId: number) => {
    setSelectedPageIds((prev) =>
      prev.includes(pageId) ? prev.filter((p) => p !== pageId) : [...prev, pageId],
    );
  }, []);

  async function handleAnalyze() {
    if (!selectedIssueId || !connectionId) return;
    setLoading(true);
    setError('');
    try {
      const request: PRDImpactRequest = {
        issueId: selectedIssueId,
        connectionId,
        applicationId: selectedAppId,
        pageIds: selectedPageIds.length > 0 ? selectedPageIds : undefined,
        affectedTables: affectedTables ? affectedTables.split(',').map((t) => t.trim()).filter(Boolean) : undefined,
        affectedObjects: affectedObjects ? affectedObjects.split(',').map((o) => o.trim()).filter(Boolean) : undefined,
        notes: notes || undefined,
      };
      const result = await dependencyApi.analyzePRDImpact(request);
      setAnalysis(result);
      setMode('results');
    } catch (err: any) {
      setError(err?.response?.data?.error?.message || err.message || 'Analysis failed');
    } finally {
      setLoading(false);
    }
  }

  function handleNewAnalysis() {
    setMode('form');
    setAnalysis(null);
    setError('');
  }

  // ---------------------------------------------------------------------------
  // Render: Form mode
  // ---------------------------------------------------------------------------
  function renderForm() {
    return (
      <>
        {/* Tab selector */}
        <div style={{ display: 'flex', gap: '8px', marginBottom: '20px' }}>
          <button
            style={tab === 'prd' ? s.btn : s.btnOutline}
            onClick={() => setTab('prd')}
          >
            {t('dependencies.prdImpact')}
          </button>
          <button
            style={tab === 'graph' ? s.btn : s.btnOutline}
            onClick={() => setTab('graph')}
          >
            {t('dependencies.title')}
          </button>
        </div>

        {tab === 'graph' && <DependencyGraph />}

        {tab === 'prd' && (
          <AppCard>
            <h3 style={{ fontSize: '16px', fontWeight: 600, color: '#1a1a2e', marginBottom: '16px' }}>
              {t('dependencies.analysisContext')}
            </h3>

            {/* Row 1: Issue + Connection */}
            <div style={s.row}>
              <div>
                <label style={s.label}>{t('dependencies.selectIssue')}</label>
                <select
                  style={s.select}
                  value={selectedIssueId}
                  onChange={(e) => setSelectedIssueId(e.target.value)}
                >
                  <option value="">{t('dependencies.noIssueSelected')}</option>
                  {issues.map((issue) => (
                    <option key={issue.id} value={issue.id}>
                      {issue.code}: {issue.title}
                    </option>
                  ))}
                </select>
              </div>
              <div>
                <label style={s.label}>{t('connections.title')}</label>
                <select
                  style={s.select}
                  value={connectionId}
                  onChange={(e) => setConnectionId(e.target.value)}
                >
                  <option value="">—</option>
                  {connections.map((c) => (
                    <option key={c.id} value={c.id}>{c.name}</option>
                  ))}
                </select>
              </div>
            </div>

            {/* Row 2: Application + Pages */}
            <div style={s.row}>
              <div>
                <label style={s.label}>{t('dependencies.selectApp')}</label>
                <select
                  style={s.select}
                  value={selectedAppId ?? ''}
                  onChange={(e) => setSelectedAppId(e.target.value ? Number(e.target.value) : undefined)}
                >
                  <option value="">—</option>
                  {apps.map((a) => (
                    <option key={a.applicationId} value={a.applicationId}>
                      {a.applicationName}
                    </option>
                  ))}
                </select>
              </div>
              <div>
                <label style={s.label}>{t('dependencies.selectPages')}</label>
                <div style={{ ...s.checkboxRow, maxHeight: '120px', overflowY: 'auto', padding: '4px', border: '1px solid #ddd', borderRadius: '6px' }}>
                  {pages.length === 0 && (
                    <span style={{ fontSize: '13px', color: '#999', padding: '4px' }}>—</span>
                  )}
                  {pages.map((pg) => (
                    <label key={pg.pageId} style={s.checkboxLabel}>
                      <input
                        type="checkbox"
                        checked={selectedPageIds.includes(pg.pageId)}
                        onChange={() => togglePage(pg.pageId)}
                      />
                      {pg.pageName}
                    </label>
                  ))}
                </div>
              </div>
            </div>

            {/* Row 3: Tables + Objects */}
            <div style={s.row}>
              <div>
                <label style={s.label}>{t('dependencies.affectedTables')}</label>
                <input
                  style={s.input}
                  value={affectedTables}
                  onChange={(e) => setAffectedTables(e.target.value)}
                  placeholder={t('dependencies.tablesPlaceholder')}
                />
              </div>
              <div>
                <label style={s.label}>{t('dependencies.affectedObjects')}</label>
                <input
                  style={s.input}
                  value={affectedObjects}
                  onChange={(e) => setAffectedObjects(e.target.value)}
                  placeholder={t('dependencies.objectsPlaceholder')}
                />
              </div>
            </div>

            {/* Notes */}
            <div style={s.fullRow}>
              <label style={s.label}>{t('dependencies.notes')}</label>
              <textarea
                style={s.textarea}
                value={notes}
                onChange={(e) => setNotes(e.target.value)}
                placeholder={t('dependencies.notesPlaceholder')}
              />
            </div>

            {/* Error */}
            {error && (
              <div style={{ color: '#c62828', fontSize: '13px', marginBottom: '12px' }}>{error}</div>
            )}

            {/* Analyze button */}
            <button
              style={{ ...s.btn, opacity: (!selectedIssueId || !connectionId || loading) ? 0.5 : 1 }}
              onClick={handleAnalyze}
              disabled={!selectedIssueId || !connectionId || loading}
            >
              {loading ? t('dependencies.analyzing') : t('dependencies.analyze')}
            </button>
          </AppCard>
        )}
      </>
    );
  }

  // ---------------------------------------------------------------------------
  // Render: Results mode
  // ---------------------------------------------------------------------------
  function renderResults() {
    if (!analysis) return null;
    const risk = riskColors[analysis.summary.riskLevel] ?? riskColors.low;

    return (
      <>
        <button style={{ ...s.btnOutline, marginBottom: '20px' }} onClick={handleNewAnalysis}>
          &larr; {t('dependencies.newAnalysis')}
        </button>

        {/* Summary card */}
        <AppCard>
          <h3 style={{ fontSize: '16px', fontWeight: 600, marginBottom: '16px' }}>
            {t('dependencies.summary')} &mdash; {analysis.issueCode}: {analysis.issueTitle}
          </h3>
          <div style={s.summaryRow}>
            <div>
              <span
                style={{
                  display: 'inline-block', padding: '6px 16px', borderRadius: '16px',
                  fontWeight: 700, fontSize: '14px',
                  backgroundColor: risk.bg, color: risk.text,
                }}
              >
                {t('dependencies.riskLevel')}: {t(`dependencies.${analysis.summary.riskLevel}`)}
              </span>
              <div style={{ marginTop: '10px', width: '100%', maxWidth: '300px' }}>
                <div style={{ fontSize: '11px', color: '#6c757d', marginBottom: '4px' }}>
                  {t('dependencies.riskScore')}: {analysis.summary.riskScore}/100
                </div>
                <div style={{ height: '8px', backgroundColor: '#e9ecef', borderRadius: '4px', overflow: 'hidden' }}>
                  <div
                    style={{
                      height: '100%', borderRadius: '4px',
                      width: `${analysis.summary.riskScore}%`,
                      backgroundColor: risk.text,
                      transition: 'width 0.3s',
                    }}
                  />
                </div>
              </div>
            </div>
            <div style={s.metricGrid}>
              <div style={s.metricBox}>
                <div style={s.metricNum}>{analysis.summary.totalNewPages}</div>
                <div style={s.metricLabel}>{t('dependencies.newPages')}</div>
              </div>
              <div style={s.metricBox}>
                <div style={s.metricNum}>{analysis.summary.totalAffectedPages}</div>
                <div style={s.metricLabel}>{t('dependencies.modifiedPages')}</div>
              </div>
              <div style={s.metricBox}>
                <div style={s.metricNum}>{analysis.summary.totalNewTables}</div>
                <div style={s.metricLabel}>{t('dependencies.newTables')}</div>
              </div>
              <div style={s.metricBox}>
                <div style={s.metricNum}>{analysis.summary.totalAffectedTables}</div>
                <div style={s.metricLabel}>{t('dependencies.modifiedTables')}</div>
              </div>
            </div>
          </div>
        </AppCard>

        {/* 2-column grid: Functional + Database */}
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginTop: '16px' }}>
          {/* Functional Impact */}
          <AppCard>
            <h3 style={{ fontSize: '15px', fontWeight: 600, marginBottom: '12px' }}>
              {t('dependencies.functionalImpact')}
            </h3>

            {analysis.functionalImpact.newPages.length > 0 && (
              <>
                <div style={s.sectionTitle}>{t('dependencies.newPages')}</div>
                {analysis.functionalImpact.newPages.map((pg, i) => (
                  <div key={i} style={s.greenItem}>
                    <strong>{pg.name}</strong> ({pg.type})<br />
                    <span style={{ color: '#555' }}>{pg.description}</span>
                  </div>
                ))}
              </>
            )}

            {analysis.functionalImpact.modifiedPages.length > 0 && (
              <>
                <div style={s.sectionTitle}>{t('dependencies.modifiedPages')}</div>
                {analysis.functionalImpact.modifiedPages.map((pg, i) => (
                  <div key={i} style={s.yellowItem}>
                    <strong>{pg.pageName}</strong> (ID: {pg.pageId})<br />
                    <span style={{ color: '#555' }}>{pg.reason}</span>
                    {pg.affectedRegions.length > 0 && (
                      <div style={{ fontSize: '12px', color: '#888', marginTop: '4px' }}>
                        Regions: {pg.affectedRegions.join(', ')}
                      </div>
                    )}
                  </div>
                ))}
              </>
            )}

            {analysis.functionalImpact.affectedFlows.length > 0 && (
              <>
                <div style={s.sectionTitle}>{t('dependencies.affectedFlows')}</div>
                {analysis.functionalImpact.affectedFlows.map((fl, i) => (
                  <div key={i} style={{ ...s.yellowItem, backgroundColor: '#f3e5f5' }}>
                    <strong>{fl.flowName}</strong><br />
                    <span style={{ color: '#555' }}>{fl.impact}</span>
                  </div>
                ))}
              </>
            )}

            {analysis.functionalImpact.newPages.length === 0 &&
             analysis.functionalImpact.modifiedPages.length === 0 &&
             analysis.functionalImpact.affectedFlows.length === 0 && (
              <div style={{ color: '#999', fontSize: '13px' }}>—</div>
            )}
          </AppCard>

          {/* Database Impact */}
          <AppCard>
            <h3 style={{ fontSize: '15px', fontWeight: 600, marginBottom: '12px' }}>
              {t('dependencies.databaseImpact')}
            </h3>

            {analysis.databaseImpact.newTables.length > 0 && (
              <>
                <div style={s.sectionTitle}>{t('dependencies.newTables')}</div>
                {analysis.databaseImpact.newTables.map((tbl, i) => (
                  <div key={i} style={s.greenItem}>
                    <strong>{tbl.name}</strong><br />
                    <span style={{ color: '#555' }}>{tbl.description}</span>
                    <div style={{ fontSize: '12px', color: '#888', marginTop: '4px' }}>
                      Columns: {tbl.columns.join(', ')}
                    </div>
                  </div>
                ))}
              </>
            )}

            {analysis.databaseImpact.modifiedTables.length > 0 && (
              <>
                <div style={s.sectionTitle}>{t('dependencies.modifiedTables')}</div>
                {analysis.databaseImpact.modifiedTables.map((tbl, i) => (
                  <div key={i} style={s.yellowItem}>
                    <strong>{tbl.name}</strong><br />
                    <span style={{ color: '#555' }}>{tbl.reason}</span>
                    <div style={{ fontSize: '12px', color: '#888', marginTop: '4px' }}>
                      {tbl.changes.join(', ')}
                    </div>
                  </div>
                ))}
              </>
            )}

            {(analysis.databaseImpact.affectedIndexes.length > 0 ||
              analysis.databaseImpact.affectedTriggers.length > 0) && (
              <>
                <div style={s.sectionTitle}>Indexes / Triggers</div>
                {analysis.databaseImpact.affectedIndexes.map((idx, i) => (
                  <div key={`idx-${i}`} style={{ fontSize: '13px', padding: '4px 0' }}>IDX: {idx}</div>
                ))}
                {analysis.databaseImpact.affectedTriggers.map((trg, i) => (
                  <div key={`trg-${i}`} style={{ fontSize: '13px', padding: '4px 0' }}>TRG: {trg}</div>
                ))}
              </>
            )}

            {analysis.databaseImpact.newTables.length === 0 &&
             analysis.databaseImpact.modifiedTables.length === 0 &&
             analysis.databaseImpact.affectedIndexes.length === 0 &&
             analysis.databaseImpact.affectedTriggers.length === 0 && (
              <div style={{ color: '#999', fontSize: '13px' }}>—</div>
            )}
          </AppCard>
        </div>

        {/* Dependency chain */}
        {analysis.dependencies.length > 0 && (
          <div style={{ marginTop: '16px' }}>
            <AppCard>
              <h3 style={{ fontSize: '15px', fontWeight: 600, marginBottom: '12px' }}>
                {t('dependencies.dependencyChain')}
              </h3>
              <table style={s.depTable}>
                <thead>
                  <tr>
                    <th style={s.th}>{t('dependencies.source')}</th>
                    <th style={s.th}></th>
                    <th style={s.th}>{t('dependencies.target')}</th>
                    <th style={s.th}>{t('dependencies.impact')}</th>
                  </tr>
                </thead>
                <tbody>
                  {analysis.dependencies.map((dep, i) => (
                    <tr key={i}>
                      <td style={s.td}>
                        <span style={{ fontSize: '10px', fontWeight: 600, color: '#6c757d' }}>{dep.sourceType}</span>
                        <br />{dep.sourceName}
                      </td>
                      <td style={{ ...s.td, color: '#999', textAlign: 'center' }}>&rarr;</td>
                      <td style={s.td}>
                        <span style={{ fontSize: '10px', fontWeight: 600, color: '#6c757d' }}>{dep.targetType}</span>
                        <br />{dep.targetName}
                      </td>
                      <td style={s.td}>{dep.impact}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </AppCard>
          </div>
        )}

        {/* Recommendations */}
        <div style={{ marginTop: '16px' }}>
          <AppCard>
            <h3 style={{ fontSize: '15px', fontWeight: 600, marginBottom: '12px' }}>
              {t('dependencies.recommendations')}
            </h3>
            <ul style={{ margin: 0, paddingLeft: '20px' }}>
              {analysis.recommendations.map((rec, i) => (
                <li key={i} style={{ fontSize: '13px', marginBottom: '6px', color: '#333' }}>{rec}</li>
              ))}
            </ul>
          </AppCard>
        </div>

        {/* User Context (collapsible) */}
        <div style={{ marginTop: '16px' }}>
          <AppCard>
            <div
              style={s.collapsible}
              onClick={() => setContextOpen(!contextOpen)}
            >
              {contextOpen ? '- ' : '+ '}{t('dependencies.userContext')}
            </div>
            {contextOpen && (
              <div style={{ marginTop: '12px', fontSize: '13px', color: '#555' }}>
                {analysis.userContext.applicationName && (
                  <div><strong>{t('dependencies.selectApp')}:</strong> {analysis.userContext.applicationName}</div>
                )}
                {analysis.userContext.pageNames && analysis.userContext.pageNames.length > 0 && (
                  <div><strong>{t('dependencies.selectPages')}:</strong> {analysis.userContext.pageNames.join(', ')}</div>
                )}
                {analysis.userContext.tables && analysis.userContext.tables.length > 0 && (
                  <div><strong>{t('dependencies.affectedTables')}:</strong> {analysis.userContext.tables.join(', ')}</div>
                )}
                {analysis.userContext.objects && analysis.userContext.objects.length > 0 && (
                  <div><strong>{t('dependencies.affectedObjects')}:</strong> {analysis.userContext.objects.join(', ')}</div>
                )}
                {analysis.userContext.notes && (
                  <div><strong>{t('dependencies.notes')}:</strong> {analysis.userContext.notes}</div>
                )}
              </div>
            )}
          </AppCard>
        </div>
      </>
    );
  }

  // ---------------------------------------------------------------------------
  // Main render
  // ---------------------------------------------------------------------------
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('dependencies.eyebrow')}
        title={t('dependencies.title')}
        description={t('dependencies.description')}
      />
      {mode === 'form' && renderForm()}
      {mode === 'results' && renderResults()}
    </AppPage>
  );
}
