import { useState, type FormEvent, type ChangeEvent, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import {
  useConnection,
  useCreateConnection,
  useUpdateConnection,
  useTestConnection,
} from '../hooks/useConnections';
import type { ConnectionPayload, ConnectionType, Environment } from '@/services/connections.api';

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function ConnectionForm() {
  const navigate = useNavigate();
  const { id } = useParams<{ id: string }>();
  const isEdit = !!id;

  // Load existing data if editing
  const { data: existing, isLoading: loadingExisting } = useConnection(id ?? '', {
    enabled: isEdit,
  });

  // Mutations
  const createMutation = useCreateConnection();
  const updateMutation = useUpdateConnection(id ?? '');
  const testMutation = useTestConnection();

  // -- Form state -----------------------------------------------------------

  const [type, setType] = useState<ConnectionType>('ords');
  const [name, setName] = useState('');
  const [environment, setEnvironment] = useState<Environment>('development');
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [tagsInput, setTagsInput] = useState('');
  // ORDS
  const [ordsBaseUrl, setOrdsBaseUrl] = useState('');
  // JDBC
  const [host, setHost] = useState('');
  const [port, setPort] = useState('1521');
  const [serviceName, setServiceName] = useState('');

  // Populate fields when editing
  useEffect(() => {
    if (!existing) return;
    setType(existing.type);
    setName(existing.name);
    setEnvironment(existing.environment);
    setUsername(existing.username);
    setTagsInput(existing.tags.join(', '));
    if (existing.type === 'ords') {
      setOrdsBaseUrl(existing.ordsBaseUrl ?? '');
    } else {
      setHost(existing.host ?? '');
      setPort(String(existing.port ?? 1521));
      setServiceName(existing.serviceName ?? '');
    }
  }, [existing]);

  // -- Helpers ---------------------------------------------------------------

  const buildPayload = (): ConnectionPayload => {
    const tags = tagsInput
      .split(',')
      .map((t) => t.trim())
      .filter(Boolean);

    const base: ConnectionPayload = {
      name,
      type,
      environment,
      username,
      password,
      tags,
    };

    if (type === 'ords') {
      base.ordsBaseUrl = ordsBaseUrl;
    } else {
      base.host = host;
      base.port = parseInt(port, 10);
      base.serviceName = serviceName;
    }

    return base;
  };

  // -- Handlers --------------------------------------------------------------

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    const payload = buildPayload();

    try {
      if (isEdit) {
        await updateMutation.mutateAsync(payload);
      } else {
        await createMutation.mutateAsync(payload);
      }
      navigate('/connections');
    } catch {
      // Error handled by mutation state
    }
  };

  const handleTest = () => {
    if (!id) return;
    testMutation.mutate(id);
  };

  // -- Loading state ---------------------------------------------------------

  if (isEdit && loadingExisting) {
    return <p className="conn-muted-text">Loading connection...</p>;
  }

  const isSubmitting = createMutation.isPending || updateMutation.isPending;
  const submitError = createMutation.error || updateMutation.error;

  return (
    <AppPage>
      <AppPageHeader
        eyebrow="Connections"
        title={isEdit ? 'Edit Connection' : 'New Connection'}
        description="Configure ORDS or JDBC access for APEX metadata and automation workflows."
      />

      <form onSubmit={handleSubmit} className="conn-form">
        {/* Connection Type Toggle */}
        <div className="app-field">
          <span className="app-label">Connection Type</span>
          <div className="conn-type-toggle">
            <button
              type="button"
              className={`conn-type-toggle-btn${type === 'ords' ? ' conn-type-toggle-btn-active' : ''}`}
              onClick={() => setType('ords')}
            >
              ORDS
            </button>
            <button
              type="button"
              className={`conn-type-toggle-btn${type === 'jdbc' ? ' conn-type-toggle-btn-active' : ''}`}
              onClick={() => setType('jdbc')}
            >
              JDBC
            </button>
          </div>
        </div>

        {/* Common Fields */}
        <div className="app-field">
          <label className="app-label" htmlFor="conn-name">Name</label>
          <input
            id="conn-name"
            className="app-input"
            value={name}
            onChange={(e: ChangeEvent<HTMLInputElement>) => setName(e.target.value)}
            placeholder="My Database Connection"
            required
          />
        </div>

        <div className="app-field">
          <label className="app-label" htmlFor="conn-env">Environment</label>
          <select
            id="conn-env"
            className="app-select"
            value={environment}
            onChange={(e: ChangeEvent<HTMLSelectElement>) =>
              setEnvironment(e.target.value as Environment)
            }
          >
            <option value="development">Development</option>
            <option value="staging">Staging</option>
            <option value="production">Production</option>
          </select>
        </div>

        {/* Type-specific fields */}
        {type === 'ords' ? (
          <fieldset className="conn-fieldset">
            <legend className="conn-legend">ORDS Settings</legend>
            <div className="app-field">
              <label className="app-label" htmlFor="conn-ords-url">ORDS Base URL</label>
              <input
                id="conn-ords-url"
                className="app-input"
                value={ordsBaseUrl}
                onChange={(e: ChangeEvent<HTMLInputElement>) => setOrdsBaseUrl(e.target.value)}
                placeholder="https://example.com/ords"
                required
              />
            </div>
          </fieldset>
        ) : (
          <fieldset className="conn-fieldset">
            <legend className="conn-legend">JDBC Settings</legend>
            <div className="app-stack">
              <div className="app-field">
                <label className="app-label" htmlFor="conn-host">Host</label>
                <input
                  id="conn-host"
                  className="app-input"
                  value={host}
                  onChange={(e: ChangeEvent<HTMLInputElement>) => setHost(e.target.value)}
                  placeholder="db.example.com"
                  required
                />
              </div>
              <div className="conn-jdbc-row">
                <div className="app-field conn-jdbc-port">
                  <label className="app-label" htmlFor="conn-port">Port</label>
                  <input
                    id="conn-port"
                    className="app-input"
                    type="number"
                    value={port}
                    onChange={(e: ChangeEvent<HTMLInputElement>) => setPort(e.target.value)}
                    required
                  />
                </div>
                <div className="app-field conn-jdbc-service">
                  <label className="app-label" htmlFor="conn-service">Service Name</label>
                  <input
                    id="conn-service"
                    className="app-input"
                    value={serviceName}
                    onChange={(e: ChangeEvent<HTMLInputElement>) => setServiceName(e.target.value)}
                    placeholder="XEPDB1"
                    required
                  />
                </div>
              </div>
            </div>
          </fieldset>
        )}

        {/* Credentials */}
        <fieldset className="conn-fieldset">
          <legend className="conn-legend">Credentials</legend>
          <div className="app-stack">
            <div className="app-field">
              <label className="app-label" htmlFor="conn-user">Username</label>
              <input
                id="conn-user"
                className="app-input"
                value={username}
                onChange={(e: ChangeEvent<HTMLInputElement>) => setUsername(e.target.value)}
                autoComplete="off"
                required
              />
            </div>
            <div className="app-field">
              <label className="app-label" htmlFor="conn-pass">Password</label>
              <input
                id="conn-pass"
                className="app-input"
                type="password"
                value={password}
                onChange={(e: ChangeEvent<HTMLInputElement>) => setPassword(e.target.value)}
                autoComplete="new-password"
                placeholder={isEdit ? '(unchanged if empty)' : ''}
                required={!isEdit}
              />
            </div>
          </div>
        </fieldset>

        {/* Tags */}
        <div className="app-field">
          <label className="app-label" htmlFor="conn-tags">Tags</label>
          <input
            id="conn-tags"
            className="app-input"
            value={tagsInput}
            onChange={(e: ChangeEvent<HTMLInputElement>) => setTagsInput(e.target.value)}
            placeholder="tag1, tag2, tag3"
          />
          <span className="conn-hint">Comma-separated list of tags</span>
        </div>

        {/* Test Connection */}
        <div className="app-toolbar">
          <button
            type="button"
            className="app-button"
            onClick={handleTest}
            disabled={testMutation.isPending || !id}
          >
            {testMutation.isPending ? 'Testing...' : 'Test Connection'}
          </button>
          {testMutation.isSuccess && (
            <span className={testMutation.data.success ? 'conn-test-success' : 'conn-test-fail'}>
              {testMutation.data.success
                ? `Connected (${testMutation.data.latencyMs}ms)`
                : testMutation.data.message}
            </span>
          )}
          {testMutation.isError && (
            <span className="conn-test-fail">
              Test failed: {testMutation.error.message}
            </span>
          )}
        </div>

        {/* Submit error */}
        {submitError && (
          <p className="conn-submit-error">{submitError.message}</p>
        )}

        {/* Actions */}
        <div className="app-toolbar">
          <button type="submit" className="app-button app-button-primary" disabled={isSubmitting}>
            {isSubmitting ? 'Saving...' : isEdit ? 'Update Connection' : 'Create Connection'}
          </button>
          <button type="button" className="app-button" onClick={() => navigate('/connections')}>
            Cancel
          </button>
        </div>
      </form>
    </AppPage>
  );
}
