import { useState, type FormEvent, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { useConnection, useCreateConnection, useUpdateConnection, useTestConnection } from '../hooks/useConnections';
import type { ConnectionPayload, ConnectionType, Environment } from '@/services/connections.api';

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
  const [type, setType] = useState<ConnectionType>('ords');
  const [environment, setEnvironment] = useState<Environment>('dev');
  const [tagsInput, setTagsInput] = useState('');

  // APEX
  const [apexWorkspace, setApexWorkspace] = useState('');
  const [apexAppId, setApexAppId] = useState('');
  const [apexBaseUrl, setApexBaseUrl] = useState('');
  const [apexVersion, setApexVersion] = useState('');

  // ORDS
  const [ordsBaseUrl, setOrdsBaseUrl] = useState('');
  const [ordsUsername, setOrdsUsername] = useState('');
  const [ordsPassword, setOrdsPassword] = useState('');

  // BD Oracle
  const [dbHost, setDbHost] = useState('');
  const [dbPort, setDbPort] = useState('1521');
  const [dbServiceName, setDbServiceName] = useState('');
  const [dbSid, setDbSid] = useState('');
  const [dbUsername, setDbUsername] = useState('');
  const [dbPassword, setDbPassword] = useState('');
  const [schemaName, setSchemaName] = useState('');

  // Pool
  const [poolMin, setPoolMin] = useState('2');
  const [poolMax, setPoolMax] = useState('10');

  const [testResult, setTestResult] = useState<{ success: boolean; message: string } | null>(null);
  const [error, setError] = useState<string | null>(null);

  // Populate on edit
  useEffect(() => {
    if (!existing) return;
    setName(existing.name ?? '');
    setDescription(existing.description ?? '');
    setType(existing.type ?? 'ords');
    setEnvironment(existing.environment ?? 'dev');
    setTagsInput((existing.tags ?? []).join(', '));
    setOrdsBaseUrl(existing.ordsBaseUrl ?? existing.config?.ordsBaseUrl ?? '');
    setDbHost(existing.host ?? existing.config?.host ?? '');
    setDbPort(String(existing.port ?? existing.config?.port ?? 1521));
    setDbServiceName(existing.serviceName ?? existing.config?.serviceName ?? '');
    setApexWorkspace(existing.apexWorkspace ?? existing.workspaceName ?? '');
    setSchemaName(existing.schemaName ?? '');
    setOrdsUsername(existing.ordsUsername ?? existing.username ?? '');
    setDbUsername(existing.dbUsername ?? '');
    setApexAppId(existing.apexAppId ? String(existing.apexAppId) : '');
    setApexBaseUrl(existing.apexBaseUrl ?? '');
    setApexVersion(existing.apexVersion ?? '');
    setDbSid(existing.dbSid ?? '');
    setPoolMin(String(existing.poolMin ?? 2));
    setPoolMax(String(existing.poolMax ?? 10));
  }, [existing]);

  const buildPayload = (): ConnectionPayload => ({
    name, type, environment,
    username: ordsUsername || dbUsername,
    password: ordsPassword || dbPassword,
    tags: tagsInput.split(',').map(s => s.trim()).filter(Boolean),
    ordsBaseUrl: ordsBaseUrl || undefined,
    host: dbHost || undefined,
    port: dbPort ? parseInt(dbPort, 10) : undefined,
    serviceName: dbServiceName || undefined,
    // Extended fields sent as extra data
    ...(description && { description }),
    ...(apexWorkspace && { apexWorkspace }),
    ...(apexAppId && { apexAppId: parseInt(apexAppId, 10) }),
    ...(apexBaseUrl && { apexBaseUrl }),
    ...(apexVersion && { apexVersion }),
    ...(ordsUsername && { ordsUsername }),
    ...(dbUsername && { dbUsername }),
    ...(dbSid && { dbSid }),
    ...(schemaName && { schemaName }),
    ...(schemaName && { workspaceName: apexWorkspace }),
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
      setError(err.response?.data?.error?.message || 'Error saving connection');
    }
  };

  const handleTest = async () => {
    if (!id) return;
    setTestResult(null);
    try {
      const result = await testMutation.mutateAsync(id);
      setTestResult(result);
    } catch {
      setTestResult({ success: false, message: 'Test failed' });
    }
  };

  if (isEdit && loadingExisting) {
    return <AppPage><div className="app-alert">Loading...</div></AppPage>;
  }

  const sectionStyle = { marginBottom: 24, padding: 20, border: '1px solid var(--app-border)', borderRadius: 'var(--app-radius)', background: 'var(--app-surface)' };
  const sectionTitle = { margin: '0 0 16px', fontSize: '0.95rem', fontWeight: 700 as const, color: 'var(--app-accent-strong)' };
  const gridStyle = { display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12 };
  const grid3Style = { display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 12 };

  return (
    <AppPage>
      <AppPageHeader
        eyebrow={t('connections.eyebrow')}
        title={isEdit ? `Editar: ${name}` : 'Nueva Conexión'}
        description="Configura los datos de conexión a APEX y a la base de datos Oracle."
      />

      {error && <div className="app-alert app-alert-danger" style={{ marginBottom: 16 }}>{error}</div>}

      <form onSubmit={handleSubmit}>
        {/* ── General ─────────────────────────────────────────────────── */}
        <div style={sectionStyle}>
          <h3 style={sectionTitle}>📋 Información General</h3>
          <div style={gridStyle}>
            <div className="app-field">
              <label className="app-label">Nombre *</label>
              <input className="app-input" value={name} onChange={e => setName(e.target.value)} required placeholder="Mi conexión APEX" />
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
            <textarea className="app-textarea" value={description} onChange={e => setDescription(e.target.value)} rows={2} placeholder="Descripción de esta conexión..." />
          </div>
          <div className="app-field">
            <label className="app-label">Tags (separados por coma)</label>
            <input className="app-input" value={tagsInput} onChange={e => setTagsInput(e.target.value)} placeholder="produccion, genesys, tributario" />
          </div>
        </div>

        {/* ── APEX ────────────────────────────────────────────────────── */}
        <div style={sectionStyle}>
          <h3 style={sectionTitle}>⚡ Conexión APEX</h3>
          <div style={gridStyle}>
            <div className="app-field">
              <label className="app-label">Workspace APEX *</label>
              <input className="app-input" value={apexWorkspace} onChange={e => setApexWorkspace(e.target.value)} placeholder="INFORTRIBUTOS" />
            </div>
            <div className="app-field">
              <label className="app-label">Schema Oracle</label>
              <input className="app-input" value={schemaName} onChange={e => setSchemaName(e.target.value)} placeholder="GENESYS" />
            </div>
          </div>
          <div style={gridStyle}>
            <div className="app-field">
              <label className="app-label">App ID (principal)</label>
              <input className="app-input" type="number" value={apexAppId} onChange={e => setApexAppId(e.target.value)} placeholder="50000" />
            </div>
            <div className="app-field">
              <label className="app-label">Versión APEX</label>
              <input className="app-input" value={apexVersion} onChange={e => setApexVersion(e.target.value)} placeholder="23.2" />
            </div>
          </div>
          <div className="app-field">
            <label className="app-label">URL Base APEX (para abrir la app en el navegador)</label>
            <input className="app-input" value={apexBaseUrl} onChange={e => setApexBaseUrl(e.target.value)} placeholder="http://99.0.5.232:8031/ords/r/infortributos" />
          </div>
        </div>

        {/* ── ORDS ────────────────────────────────────────────────────── */}
        <div style={sectionStyle}>
          <h3 style={sectionTitle}>🔌 Conexión ORDS (REST API)</h3>
          <div className="app-field">
            <label className="app-label">URL Base ORDS *</label>
            <input className="app-input" value={ordsBaseUrl} onChange={e => setOrdsBaseUrl(e.target.value)} required placeholder="http://99.0.5.232:8031/ords/genesys" />
          </div>
          <div style={gridStyle}>
            <div className="app-field">
              <label className="app-label">Usuario ORDS</label>
              <input className="app-input" value={ordsUsername} onChange={e => setOrdsUsername(e.target.value)} placeholder="ADMIN" />
            </div>
            <div className="app-field">
              <label className="app-label">Contraseña ORDS</label>
              <input className="app-input" type="password" value={ordsPassword} onChange={e => setOrdsPassword(e.target.value)} placeholder="••••••••" />
            </div>
          </div>
        </div>

        {/* ── Base de Datos Oracle ─────────────────────────────────────── */}
        <div style={sectionStyle}>
          <h3 style={sectionTitle}>🗄️ Base de Datos Oracle</h3>
          <div style={grid3Style}>
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
          <div style={grid3Style}>
            <div className="app-field">
              <label className="app-label">SID (alternativo)</label>
              <input className="app-input" value={dbSid} onChange={e => setDbSid(e.target.value)} placeholder="XE" />
            </div>
            <div className="app-field">
              <label className="app-label">Usuario BD</label>
              <input className="app-input" value={dbUsername} onChange={e => setDbUsername(e.target.value)} placeholder="GENESYS" />
            </div>
            <div className="app-field">
              <label className="app-label">Contraseña BD</label>
              <input className="app-input" type="password" value={dbPassword} onChange={e => setDbPassword(e.target.value)} placeholder="••••••••" />
            </div>
          </div>
          <div style={gridStyle}>
            <div className="app-field">
              <label className="app-label">Pool Mínimo</label>
              <input className="app-input" type="number" value={poolMin} onChange={e => setPoolMin(e.target.value)} />
            </div>
            <div className="app-field">
              <label className="app-label">Pool Máximo</label>
              <input className="app-input" type="number" value={poolMax} onChange={e => setPoolMax(e.target.value)} />
            </div>
          </div>
        </div>

        {/* ── Actions ──────────────────────────────────────────────────── */}
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
            <button type="button" className="app-button" onClick={() => navigate('/connections')}>
              Cancelar
            </button>
            <button type="submit" className="app-button app-button-primary" disabled={createMutation.isPending || updateMutation.isPending}>
              {(createMutation.isPending || updateMutation.isPending) ? 'Guardando...' : isEdit ? 'Guardar Cambios' : 'Crear Conexión'}
            </button>
          </div>
        </div>
      </form>
    </AppPage>
  );
}
