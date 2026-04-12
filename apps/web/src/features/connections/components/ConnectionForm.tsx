import { useState, type FormEvent, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { useConnection, useCreateConnection, useUpdateConnection, useTestConnection } from '../hooks/useConnections';
import type { ConnectionPayload, Environment } from '@/services/connections.api';

export default function ConnectionForm() {
  const navigate = useNavigate();
  const { t } = useTranslation();
  const { id } = useParams<{ id: string }>();
  const isEdit = !!id;

  const { data: existing, isLoading: loadingExisting } = useConnection(id ?? '', { enabled: isEdit });
  const createMutation = useCreateConnection();
  const updateMutation = useUpdateConnection(id ?? '');
  const testMutation = useTestConnection();

  // ── Form state ──────────────────────────────────────────────────────────
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [environment, setEnvironment] = useState<Environment>('dev');

  // APEX
  const [apexUrl, setApexUrl] = useState('');
  const [apexWorkspace, setApexWorkspace] = useState('');
  const [apexUser, setApexUser] = useState('');
  const [apexPassword, setApexPassword] = useState('');
  const [schemaName, setSchemaName] = useState('');

  // BD Oracle (opcional, para conexión directa)
  const [showDbSection, setShowDbSection] = useState(false);
  const [dbHost, setDbHost] = useState('');
  const [dbPort, setDbPort] = useState('1521');
  const [dbServiceName, setDbServiceName] = useState('');
  const [dbUsername, setDbUsername] = useState('');
  const [dbPassword, setDbPassword] = useState('');

  const [testResult, setTestResult] = useState<{ success: boolean; message: string } | null>(null);
  const [error, setError] = useState<string | null>(null);

  // Populate on edit
  useEffect(() => {
    if (!existing) return;
    setName(existing.name ?? '');
    setDescription(existing.description ?? '');
    setEnvironment(existing.environment ?? 'dev');
    setApexUrl(existing.apexBaseUrl ?? '');
    setApexWorkspace(existing.apexWorkspace ?? existing.workspaceName ?? '');
    setApexUser(existing.ordsUsername ?? '');
    setSchemaName(existing.schemaName ?? '');
    if (existing.ordsBaseUrl) {
      // Derive APEX URL from ORDS URL if not set
      if (!existing.apexBaseUrl) {
        const url = existing.ordsBaseUrl.replace(/\/ords.*$/, '');
        setApexUrl(url);
      }
    }
    if (existing.dbHost) {
      setShowDbSection(true);
      setDbHost(existing.dbHost ?? '');
      setDbPort(String(existing.dbPort ?? 1521));
      setDbServiceName(existing.dbServiceName ?? '');
      setDbUsername(existing.dbUsername ?? '');
    }
  }, [existing]);

  // Derive ORDS URL from APEX URL + schema
  const ordsUrl = apexUrl && schemaName
    ? `${apexUrl.replace(/\/$/, '')}/ords/${schemaName.toLowerCase()}`
    : apexUrl ? `${apexUrl.replace(/\/$/, '')}/ords` : '';

  const buildPayload = (): ConnectionPayload => ({
    name,
    type: 'ords',
    environment,
    username: apexUser,
    password: apexPassword,
    tags: [],
    ordsBaseUrl: ordsUrl,
    ...(description && { description }),
    ...(apexWorkspace && { apexWorkspace, workspaceName: apexWorkspace }),
    ...(schemaName && { schemaName }),
    ...(apexUrl && { apexBaseUrl: apexUrl }),
    ...(apexUser && { ordsUsername: apexUser }),
    ...(dbHost && { host: dbHost }),
    ...(dbPort && { port: parseInt(dbPort, 10) }),
    ...(dbServiceName && { serviceName: dbServiceName }),
    ...(dbUsername && { dbUsername }),
    ...(dbPassword && { dbPassword }),
  } as any);

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    setError(null);
    try {
      if (isEdit) {
        await updateMutation.mutateAsync(buildPayload());
      } else {
        await createMutation.mutateAsync(buildPayload());
      }
      navigate('/connections');
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Error al guardar la conexión');
    }
  };

  const handleTest = async () => {
    if (!id) return;
    setTestResult(null);
    try {
      const result = await testMutation.mutateAsync(id);
      setTestResult(result);
    } catch {
      setTestResult({ success: false, message: 'Prueba fallida' });
    }
  };

  if (isEdit && loadingExisting) {
    return <AppPage><div className="app-alert">{t('common.loading')}</div></AppPage>;
  }

  const sectionStyle = { marginBottom: 20, padding: 20, border: '1px solid var(--app-border)', borderRadius: 'var(--app-radius)', background: 'var(--app-surface)' };
  const sectionTitle = { margin: '0 0 14px', fontSize: '0.95rem', fontWeight: 700 as const, color: 'var(--app-accent-strong)', display: 'flex', alignItems: 'center', gap: 8 };
  const gridStyle = { display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12 };

  return (
    <AppPage>
      <AppPageHeader
        eyebrow="Conexiones"
        title={isEdit ? `Editar: ${name}` : 'Nueva Conexión'}
        description="Configura los datos de acceso a tu instancia Oracle APEX."
      />

      {error && <div className="app-alert app-alert-danger" style={{ marginBottom: 16 }}>{error}</div>}

      <form onSubmit={handleSubmit}>
        {/* ── General ──────────────────────────────────────────────── */}
        <div style={sectionStyle}>
          <h3 style={sectionTitle}>📋 General</h3>
          <div style={gridStyle}>
            <div className="app-field">
              <label className="app-label">Nombre de la conexión *</label>
              <input className="app-input" value={name} onChange={e => setName(e.target.value)} required placeholder="Producción GENESYS" />
            </div>
            <div className="app-field">
              <label className="app-label">Ambiente</label>
              <select className="app-select" value={environment} onChange={e => setEnvironment(e.target.value as Environment)}>
                <option value="dev">Desarrollo</option>
                <option value="test">Pruebas</option>
                <option value="staging">Staging</option>
                <option value="prod">Producción</option>
              </select>
            </div>
          </div>
          <div className="app-field">
            <label className="app-label">Descripción</label>
            <input className="app-input" value={description} onChange={e => setDescription(e.target.value)} placeholder="Instancia de producción del sistema tributario" />
          </div>
        </div>

        {/* ── APEX ─────────────────────────────────────────────────── */}
        <div style={sectionStyle}>
          <h3 style={sectionTitle}>⚡ Oracle APEX</h3>
          <div className="app-field">
            <label className="app-label">URL del servidor APEX *</label>
            <input className="app-input" value={apexUrl} onChange={e => setApexUrl(e.target.value)} required placeholder="http://99.0.5.232:8031" />
            <span style={{ fontSize: '0.75rem', color: 'var(--app-muted)' }}>Solo host y puerto, sin /ords ni /apex</span>
          </div>
          <div style={gridStyle}>
            <div className="app-field">
              <label className="app-label">Workspace *</label>
              <input className="app-input" value={apexWorkspace} onChange={e => setApexWorkspace(e.target.value)} required placeholder="INFORTRIBUTOS" />
            </div>
            <div className="app-field">
              <label className="app-label">Schema Oracle</label>
              <input className="app-input" value={schemaName} onChange={e => setSchemaName(e.target.value)} placeholder="GENESYS" />
              <span style={{ fontSize: '0.75rem', color: 'var(--app-muted)' }}>El schema de la BD asociado al workspace</span>
            </div>
          </div>
          <div style={gridStyle}>
            <div className="app-field">
              <label className="app-label">Usuario APEX *</label>
              <input className="app-input" value={apexUser} onChange={e => setApexUser(e.target.value)} required placeholder="JHERRERA" />
            </div>
            <div className="app-field">
              <label className="app-label">Contraseña APEX *</label>
              <input className="app-input" type="password" value={apexPassword} onChange={e => setApexPassword(e.target.value)} required={!isEdit} placeholder="••••••••" />
            </div>
          </div>

          {/* ORDS URL derivada */}
          {ordsUrl && (
            <div style={{ marginTop: 8, padding: '8px 12px', background: 'var(--app-soft)', borderRadius: 'var(--app-radius-sm)', fontSize: '0.8rem' }}>
              <strong>ORDS URL (generada):</strong> {ordsUrl}
            </div>
          )}
        </div>

        {/* ── BD Oracle (opcional) ──────────────────────────────────── */}
        <div style={sectionStyle}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <h3 style={sectionTitle}>🗄️ Base de Datos Oracle (opcional)</h3>
            <button type="button" className="app-button" style={{ fontSize: '0.8rem' }} onClick={() => setShowDbSection(!showDbSection)}>
              {showDbSection ? '▲ Ocultar' : '▼ Mostrar'}
            </button>
          </div>
          {!showDbSection && (
            <p style={{ fontSize: '0.8rem', color: 'var(--app-muted)', margin: 0 }}>
              Para conexión directa JDBC. No es necesario si solo usas ORDS.
            </p>
          )}
          {showDbSection && (
            <>
              <div style={{ ...gridStyle, gridTemplateColumns: '2fr 1fr 2fr' }}>
                <div className="app-field">
                  <label className="app-label">Host</label>
                  <input className="app-input" value={dbHost} onChange={e => setDbHost(e.target.value)} placeholder="99.0.5.232" />
                </div>
                <div className="app-field">
                  <label className="app-label">Puerto</label>
                  <input className="app-input" type="number" value={dbPort} onChange={e => setDbPort(e.target.value)} placeholder="1521" />
                </div>
                <div className="app-field">
                  <label className="app-label">Service Name</label>
                  <input className="app-input" value={dbServiceName} onChange={e => setDbServiceName(e.target.value)} placeholder="XEPDB1" />
                </div>
              </div>
              <div style={gridStyle}>
                <div className="app-field">
                  <label className="app-label">Usuario BD</label>
                  <input className="app-input" value={dbUsername} onChange={e => setDbUsername(e.target.value)} placeholder="GENESYS" />
                </div>
                <div className="app-field">
                  <label className="app-label">Contraseña BD</label>
                  <input className="app-input" type="password" value={dbPassword} onChange={e => setDbPassword(e.target.value)} placeholder="••••••••" />
                </div>
              </div>
            </>
          )}
        </div>

        {/* ── Actions ──────────────────────────────────────────────── */}
        <div className="app-toolbar" style={{ justifyContent: 'space-between' }}>
          <div className="app-toolbar">
            {isEdit && (
              <button type="button" className="app-button" onClick={handleTest} disabled={testMutation.isPending}>
                {testMutation.isPending ? '⏳ Probando...' : '🔍 Probar Conexión'}
              </button>
            )}
            {testResult && (
              <span style={{ fontSize: '0.85rem', color: testResult.success ? 'var(--app-success)' : 'var(--app-danger)', fontWeight: 600 }}>
                {testResult.success ? '✅ Conexión exitosa' : `❌ ${testResult.message}`}
              </span>
            )}
          </div>
          <div className="app-toolbar">
            <button type="button" className="app-button" onClick={() => navigate('/connections')}>Cancelar</button>
            <button type="submit" className="app-button app-button-primary" disabled={createMutation.isPending || updateMutation.isPending}>
              {(createMutation.isPending || updateMutation.isPending) ? 'Guardando...' : isEdit ? 'Guardar' : 'Crear Conexión'}
            </button>
          </div>
        </div>
      </form>
    </AppPage>
  );
}
