import { useState, type FormEvent, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { useConnection, useCreateConnection, useUpdateConnection } from '../hooks/useConnections';
import { apiClient } from '@/lib/api-client';
import type { ConnectionPayload, Environment } from '@/services/connections.api';

export default function ConnectionForm() {
  const navigate = useNavigate();
  const { t } = useTranslation();
  const { id } = useParams<{ id: string }>();
  const isEdit = !!id;

  const { data: existing, isLoading: loadingExisting } = useConnection(id ?? '', { enabled: isEdit });
  const createMutation = useCreateConnection();
  const updateMutation = useUpdateConnection(id ?? '');

  // ── Form state ──────────────────────────────────────────────────────────
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [environment, setEnvironment] = useState<Environment>('dev');

  // APEX / ORDS
  const [apexUrl, setApexUrl] = useState('');
  const [apexWorkspace, setApexWorkspace] = useState('');
  const [schemaName, setSchemaName] = useState('');
  const [apexUser, setApexUser] = useState('');
  const [apexPassword, setApexPassword] = useState('');

  // Oracle DB
  const [dbHost, setDbHost] = useState('');
  const [dbPort, setDbPort] = useState('1521');
  const [dbServiceName, setDbServiceName] = useState('');
  const [dbUsername, setDbUsername] = useState('');
  const [dbPassword, setDbPassword] = useState('');

  // Test results
  const [apexTestResult, setApexTestResult] = useState<{ success: boolean; message: string; latency?: number } | null>(null);
  const [dbTestResult, setDbTestResult] = useState<{ success: boolean; message: string; latency?: number } | null>(null);
  const [apexTesting, setApexTesting] = useState(false);
  const [dbTesting, setDbTesting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Populate on edit
  useEffect(() => {
    if (!existing) return;
    setName(existing.name ?? '');
    setDescription(existing.description ?? '');
    setEnvironment(existing.environment ?? 'dev');
    setApexUrl(existing.apexBaseUrl ?? '');
    setApexWorkspace(existing.apexWorkspace ?? existing.workspaceName ?? '');
    setSchemaName(existing.schemaName ?? '');
    setApexUser(existing.ordsUsername ?? '');
    setDbHost(existing.dbHost ?? existing.config?.host ?? '');
    setDbPort(String(existing.dbPort ?? 1521));
    setDbServiceName(existing.dbServiceName ?? existing.config?.serviceName ?? '');
    setDbUsername(existing.dbUsername ?? '');
    if (!existing.apexBaseUrl && existing.ordsBaseUrl) {
      setApexUrl(existing.ordsBaseUrl.replace(/\/ords.*$/, ''));
    }
  }, [existing]);

  // Derive ORDS URL
  const ordsUrl = apexUrl && schemaName
    ? `${apexUrl.replace(/\/$/, '')}/ords/${schemaName.toLowerCase()}`
    : apexUrl ? `${apexUrl.replace(/\/$/, '')}/ords` : '';

  const buildPayload = (): ConnectionPayload => ({
    name, type: 'ords', environment,
    username: apexUser, password: apexPassword || 'unchanged',
    tags: [], ordsBaseUrl: ordsUrl,
    description, apexWorkspace, schemaName,
    workspaceName: apexWorkspace,
    apexBaseUrl: apexUrl, ordsUsername: apexUser,
    host: dbHost || undefined, port: dbPort ? parseInt(dbPort, 10) : undefined,
    serviceName: dbServiceName || undefined,
    dbUsername: dbUsername || undefined, dbPassword: dbPassword || undefined,
  } as any);

  // ── Test APEX/ORDS ──────────────────────────────────────────────────────
  const handleTestApex = async () => {
    if (!ordsUrl) return;
    setApexTesting(true);
    setApexTestResult(null);
    try {
      const start = Date.now();
      const res = await fetch(`${ordsUrl}/_/landing`, { method: 'HEAD', mode: 'no-cors' }).catch(() => null);
      // Since no-cors doesn't give us status, try a direct fetch
      const res2 = await fetch(`${ordsUrl}/apexdev/applications`).catch(() => null);
      const latency = Date.now() - start;
      if (res2 && res2.ok) {
        const data = await res2.json().catch(() => null);
        const appCount = data?.items?.length ?? 0;
        setApexTestResult({ success: true, message: `Conectado · ${appCount} aplicaciones encontradas`, latency });
      } else if (res) {
        setApexTestResult({ success: true, message: 'ORDS responde (verificar módulos REST)', latency });
      } else {
        setApexTestResult({ success: false, message: 'No se pudo conectar al servidor ORDS' });
      }
    } catch {
      setApexTestResult({ success: false, message: 'Error de conexión ORDS' });
    } finally { setApexTesting(false); }
  };

  // ── Test BD ─────────────────────────────────────────────────────────────
  const handleTestDb = async () => {
    if (!dbHost || !dbServiceName || !dbUsername) return;
    setDbTesting(true);
    setDbTestResult(null);
    try {
      // Call backend endpoint to test DB connection
      const res = await apiClient.post('/connections/test-db', {
        host: dbHost, port: parseInt(dbPort, 10),
        serviceName: dbServiceName, username: dbUsername, password: dbPassword,
      });
      const data = res.data.data ?? res.data;
      setDbTestResult({ success: data.success, message: data.message, latency: data.latencyMs });
    } catch (err: any) {
      setDbTestResult({ success: false, message: err.response?.data?.error?.message || 'Error de conexión BD' });
    } finally { setDbTesting(false); }
  };

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    setError(null);
    try {
      if (isEdit) await updateMutation.mutateAsync(buildPayload());
      else await createMutation.mutateAsync(buildPayload());
      navigate('/connections');
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Error al guardar');
    }
  };

  if (isEdit && loadingExisting) {
    return <AppPage><div className="app-alert">{t('common.loading')}</div></AppPage>;
  }

  // ── Styles ──────────────────────────────────────────────────────────────
  const panelStyle = {
    flex: 1, padding: 20, border: '1px solid var(--app-border)',
    borderRadius: 'var(--app-radius)', background: 'var(--app-surface)',
  };
  const headerStyle = {
    margin: '0 0 16px', fontSize: '1rem', fontWeight: 700 as const,
    display: 'flex', alignItems: 'center', gap: 8,
    paddingBottom: 12, borderBottom: '1px solid var(--app-border)',
  };
  const fieldStyle = { marginBottom: 12 };
  const rowStyle = { display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12 };
  const testBoxStyle = (success: boolean | null) => ({
    marginTop: 12, padding: '10px 14px', borderRadius: 'var(--app-radius-sm)',
    border: `1px solid ${success === null ? 'var(--app-border)' : success ? '#22c55e' : '#ef4444'}`,
    background: success === null ? 'var(--app-soft)' : success ? '#f0fdf4' : '#fef2f2',
    fontSize: '0.85rem',
  });

  return (
    <AppPage>
      <AppPageHeader
        eyebrow="Conexiones"
        title={isEdit ? `Editar: ${name}` : 'Nueva Conexión'}
        description="Configura los datos de acceso a Oracle APEX y a la base de datos."
      />

      {error && <div className="app-alert app-alert-danger" style={{ marginBottom: 16 }}>{error}</div>}

      <form onSubmit={handleSubmit}>
        {/* ── General (full width) ─────────────────────────────────── */}
        <div style={{ ...panelStyle, marginBottom: 16 }}>
          <h3 style={headerStyle}>📋 General</h3>
          <div style={rowStyle}>
            <div className="app-field" style={fieldStyle}>
              <label className="app-label">Nombre *</label>
              <input className="app-input" value={name} onChange={e => setName(e.target.value)} required placeholder="GENESYS Producción" />
            </div>
            <div className="app-field" style={fieldStyle}>
              <label className="app-label">Ambiente</label>
              <select className="app-select" value={environment} onChange={e => setEnvironment(e.target.value as Environment)}>
                <option value="dev">Desarrollo</option>
                <option value="test">Pruebas</option>
                <option value="staging">Staging</option>
                <option value="prod">Producción</option>
              </select>
            </div>
          </div>
          <div className="app-field" style={fieldStyle}>
            <label className="app-label">Descripción</label>
            <input className="app-input" value={description} onChange={e => setDescription(e.target.value)} placeholder="Sistema tributario municipal" />
          </div>
        </div>

        {/* ── Two columns: APEX | BD ───────────────────────────────── */}
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 16, marginBottom: 16 }}>

          {/* ── LEFT: APEX / ORDS ─────────────────────────────────── */}
          <div style={panelStyle}>
            <h3 style={{ ...headerStyle, color: 'var(--app-accent-strong)' }}>⚡ Oracle APEX</h3>

            <div className="app-field" style={fieldStyle}>
              <label className="app-label">URL del servidor *</label>
              <input className="app-input" value={apexUrl} onChange={e => setApexUrl(e.target.value)} required placeholder="http://99.0.5.232:8031" />
              <span style={{ fontSize: '0.7rem', color: 'var(--app-muted)' }}>Host y puerto sin /ords</span>
            </div>

            <div className="app-field" style={fieldStyle}>
              <label className="app-label">Workspace *</label>
              <input className="app-input" value={apexWorkspace} onChange={e => setApexWorkspace(e.target.value)} required placeholder="INFORTRIBUTOS" />
            </div>

            <div className="app-field" style={fieldStyle}>
              <label className="app-label">Schema Oracle</label>
              <input className="app-input" value={schemaName} onChange={e => setSchemaName(e.target.value)} placeholder="GENESYS" />
            </div>

            <div style={rowStyle}>
              <div className="app-field" style={fieldStyle}>
                <label className="app-label">Usuario APEX *</label>
                <input className="app-input" value={apexUser} onChange={e => setApexUser(e.target.value)} required placeholder="JHERRERA" />
              </div>
              <div className="app-field" style={fieldStyle}>
                <label className="app-label">Contraseña *</label>
                <input className="app-input" type="password" value={apexPassword} onChange={e => setApexPassword(e.target.value)} required={!isEdit} placeholder="••••••••" />
              </div>
            </div>

            {ordsUrl && (
              <div style={{ padding: '8px 12px', background: 'var(--app-soft)', borderRadius: 'var(--app-radius-sm)', fontSize: '0.75rem', color: 'var(--app-muted)', marginBottom: 12 }}>
                <strong>ORDS:</strong> {ordsUrl}
              </div>
            )}

            {/* Test APEX */}
            <button type="button" className="app-button" style={{ width: '100%' }} onClick={handleTestApex} disabled={apexTesting || !apexUrl}>
              {apexTesting ? '⏳ Probando APEX...' : '🔍 Probar Conexión APEX'}
            </button>
            {apexTestResult && (
              <div style={testBoxStyle(apexTestResult.success)}>
                <strong>{apexTestResult.success ? '✅' : '❌'}</strong>{' '}
                {apexTestResult.message}
                {apexTestResult.latency && <span style={{ float: 'right', color: 'var(--app-muted)' }}>{apexTestResult.latency}ms</span>}
              </div>
            )}
          </div>

          {/* ── RIGHT: Oracle BD ──────────────────────────────────── */}
          <div style={panelStyle}>
            <h3 style={{ ...headerStyle, color: '#b45309' }}>🗄️ Base de Datos Oracle</h3>

            <div className="app-field" style={fieldStyle}>
              <label className="app-label">Host</label>
              <input className="app-input" value={dbHost} onChange={e => setDbHost(e.target.value)} placeholder="99.0.5.232" />
            </div>

            <div style={rowStyle}>
              <div className="app-field" style={fieldStyle}>
                <label className="app-label">Puerto</label>
                <input className="app-input" type="number" value={dbPort} onChange={e => setDbPort(e.target.value)} placeholder="1521" />
              </div>
              <div className="app-field" style={fieldStyle}>
                <label className="app-label">Service Name</label>
                <input className="app-input" value={dbServiceName} onChange={e => setDbServiceName(e.target.value)} placeholder="GENESYS01" />
              </div>
            </div>

            <div style={rowStyle}>
              <div className="app-field" style={fieldStyle}>
                <label className="app-label">Usuario BD</label>
                <input className="app-input" value={dbUsername} onChange={e => setDbUsername(e.target.value)} placeholder="genesys" />
              </div>
              <div className="app-field" style={fieldStyle}>
                <label className="app-label">Contraseña BD</label>
                <input className="app-input" type="password" value={dbPassword} onChange={e => setDbPassword(e.target.value)} placeholder="••••••••" />
              </div>
            </div>

            {/* Test BD */}
            <button type="button" className="app-button" style={{ width: '100%' }} onClick={handleTestDb} disabled={dbTesting || !dbHost || !dbServiceName || !dbUsername}>
              {dbTesting ? '⏳ Probando BD...' : '🔍 Probar Conexión BD'}
            </button>
            {dbTestResult && (
              <div style={testBoxStyle(dbTestResult.success)}>
                <strong>{dbTestResult.success ? '✅' : '❌'}</strong>{' '}
                {dbTestResult.message}
                {dbTestResult.latency && <span style={{ float: 'right', color: 'var(--app-muted)' }}>{dbTestResult.latency}ms</span>}
              </div>
            )}

            {!dbHost && (
              <p style={{ fontSize: '0.75rem', color: 'var(--app-muted)', marginTop: 12, textAlign: 'center' }}>
                Opcional. Para conexión directa JDBC a Oracle.
              </p>
            )}
          </div>
        </div>

        {/* ── Actions ──────────────────────────────────────────────── */}
        <div className="app-toolbar" style={{ justifyContent: 'flex-end' }}>
          <button type="button" className="app-button" onClick={() => navigate('/connections')}>Cancelar</button>
          <button type="submit" className="app-button app-button-primary" disabled={createMutation.isPending || updateMutation.isPending}>
            {(createMutation.isPending || updateMutation.isPending) ? 'Guardando...' : isEdit ? 'Guardar' : 'Crear Conexión'}
          </button>
        </div>
      </form>
    </AppPage>
  );
}
