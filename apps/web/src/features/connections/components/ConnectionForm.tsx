import { useState, type CSSProperties, type FormEvent, type ChangeEvent, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import {
  useConnection,
  useCreateConnection,
  useUpdateConnection,
  useTestConnection,
} from '../hooks/useConnections';
import type {
  ConnectionPayload,
  ConnectionType,
  Environment,
} from '@/services/connections.api';

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

  const [type, setType] = useState<ConnectionType>('ORDS');
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
    if (existing.type === 'ORDS') {
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

    if (type === 'ORDS') {
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
    testMutation.mutate(buildPayload());
  };

  // -- Loading state ---------------------------------------------------------

  if (isEdit && loadingExisting) {
    return <p style={{ color: '#6b7280' }}>Loading connection...</p>;
  }

  // -- Styles ----------------------------------------------------------------

  const formStyle: CSSProperties = {
    display: 'flex',
    flexDirection: 'column',
    gap: '1.25rem',
    maxWidth: '36rem',
  };

  const fieldsetStyle: CSSProperties = {
    border: '1px solid #e5e7eb',
    borderRadius: '0.5rem',
    padding: '1.25rem',
    margin: 0,
  };

  const legendStyle: CSSProperties = {
    fontSize: '0.875rem',
    fontWeight: 600,
    color: '#374151',
    padding: '0 0.375rem',
  };

  const labelStyle: CSSProperties = {
    display: 'flex',
    flexDirection: 'column',
    gap: '0.25rem',
    fontSize: '0.875rem',
    fontWeight: 500,
    color: '#374151',
  };

  const inputStyle: CSSProperties = {
    padding: '0.5rem 0.75rem',
    border: '1px solid #d1d5db',
    borderRadius: '0.375rem',
    fontSize: '0.875rem',
  };

  const selectStyle: CSSProperties = { ...inputStyle, cursor: 'pointer' };

  const toggleContainerStyle: CSSProperties = {
    display: 'flex',
    gap: '0',
    borderRadius: '0.375rem',
    overflow: 'hidden',
    border: '1px solid #d1d5db',
    width: 'fit-content',
  };

  const toggleBtnStyle = (active: boolean): CSSProperties => ({
    padding: '0.5rem 1.25rem',
    fontSize: '0.875rem',
    fontWeight: 600,
    border: 'none',
    cursor: 'pointer',
    backgroundColor: active ? '#2563eb' : '#ffffff',
    color: active ? '#ffffff' : '#374151',
    transition: 'all 0.15s',
  });

  const btnPrimary: CSSProperties = {
    padding: '0.5rem 1.25rem',
    backgroundColor: '#2563eb',
    color: '#ffffff',
    fontWeight: 600,
    fontSize: '0.875rem',
    border: 'none',
    borderRadius: '0.375rem',
    cursor: 'pointer',
  };

  const btnSecondary: CSSProperties = {
    padding: '0.5rem 1.25rem',
    backgroundColor: '#ffffff',
    color: '#374151',
    fontWeight: 500,
    fontSize: '0.875rem',
    border: '1px solid #d1d5db',
    borderRadius: '0.375rem',
    cursor: 'pointer',
  };

  const isSubmitting = createMutation.isPending || updateMutation.isPending;
  const submitError = createMutation.error || updateMutation.error;

  return (
    <div>
      <h2 style={{ fontSize: '1.25rem', fontWeight: 700, marginBottom: '1.25rem' }}>
        {isEdit ? 'Edit Connection' : 'New Connection'}
      </h2>

      <form onSubmit={handleSubmit} style={formStyle}>
        {/* Connection Type Toggle */}
        <label style={labelStyle}>
          Connection Type
          <div style={toggleContainerStyle}>
            <button
              type="button"
              style={toggleBtnStyle(type === 'ORDS')}
              onClick={() => setType('ORDS')}
            >
              ORDS
            </button>
            <button
              type="button"
              style={toggleBtnStyle(type === 'JDBC')}
              onClick={() => setType('JDBC')}
            >
              JDBC
            </button>
          </div>
        </label>

        {/* Common Fields */}
        <label style={labelStyle}>
          Name
          <input
            style={inputStyle}
            value={name}
            onChange={(e: ChangeEvent<HTMLInputElement>) => setName(e.target.value)}
            placeholder="My Database Connection"
            required
          />
        </label>

        <label style={labelStyle}>
          Environment
          <select
            style={selectStyle}
            value={environment}
            onChange={(e: ChangeEvent<HTMLSelectElement>) =>
              setEnvironment(e.target.value as Environment)
            }
          >
            <option value="development">Development</option>
            <option value="staging">Staging</option>
            <option value="production">Production</option>
          </select>
        </label>

        {/* Type-specific fields */}
        {type === 'ORDS' ? (
          <fieldset style={fieldsetStyle}>
            <legend style={legendStyle}>ORDS Settings</legend>
            <label style={labelStyle}>
              ORDS Base URL
              <input
                style={inputStyle}
                value={ordsBaseUrl}
                onChange={(e: ChangeEvent<HTMLInputElement>) => setOrdsBaseUrl(e.target.value)}
                placeholder="https://example.com/ords"
                required
              />
            </label>
          </fieldset>
        ) : (
          <fieldset style={fieldsetStyle}>
            <legend style={legendStyle}>JDBC Settings</legend>
            <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
              <label style={labelStyle}>
                Host
                <input
                  style={inputStyle}
                  value={host}
                  onChange={(e: ChangeEvent<HTMLInputElement>) => setHost(e.target.value)}
                  placeholder="db.example.com"
                  required
                />
              </label>
              <div style={{ display: 'flex', gap: '0.75rem' }}>
                <label style={{ ...labelStyle, flex: 1 }}>
                  Port
                  <input
                    style={inputStyle}
                    type="number"
                    value={port}
                    onChange={(e: ChangeEvent<HTMLInputElement>) => setPort(e.target.value)}
                    required
                  />
                </label>
                <label style={{ ...labelStyle, flex: 2 }}>
                  Service Name
                  <input
                    style={inputStyle}
                    value={serviceName}
                    onChange={(e: ChangeEvent<HTMLInputElement>) =>
                      setServiceName(e.target.value)
                    }
                    placeholder="XEPDB1"
                    required
                  />
                </label>
              </div>
            </div>
          </fieldset>
        )}

        {/* Credentials */}
        <fieldset style={fieldsetStyle}>
          <legend style={legendStyle}>Credentials</legend>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
            <label style={labelStyle}>
              Username
              <input
                style={inputStyle}
                value={username}
                onChange={(e: ChangeEvent<HTMLInputElement>) => setUsername(e.target.value)}
                autoComplete="off"
                required
              />
            </label>
            <label style={labelStyle}>
              Password
              <input
                style={inputStyle}
                type="password"
                value={password}
                onChange={(e: ChangeEvent<HTMLInputElement>) => setPassword(e.target.value)}
                autoComplete="new-password"
                placeholder={isEdit ? '(unchanged if empty)' : ''}
                required={!isEdit}
              />
            </label>
          </div>
        </fieldset>

        {/* Tags */}
        <label style={labelStyle}>
          Tags
          <input
            style={inputStyle}
            value={tagsInput}
            onChange={(e: ChangeEvent<HTMLInputElement>) => setTagsInput(e.target.value)}
            placeholder="tag1, tag2, tag3"
          />
          <span style={{ fontSize: '0.75rem', color: '#9ca3af' }}>
            Comma-separated list of tags
          </span>
        </label>

        {/* Test Connection */}
        <div>
          <button type="button" style={btnSecondary} onClick={handleTest} disabled={testMutation.isPending}>
            {testMutation.isPending ? 'Testing...' : 'Test Connection'}
          </button>
          {testMutation.isSuccess && (
            <span
              style={{
                marginLeft: '0.75rem',
                fontSize: '0.875rem',
                color: testMutation.data.success ? '#15803d' : '#dc2626',
              }}
            >
              {testMutation.data.success
                ? `Connected (${testMutation.data.latencyMs}ms)`
                : testMutation.data.message}
            </span>
          )}
          {testMutation.isError && (
            <span style={{ marginLeft: '0.75rem', fontSize: '0.875rem', color: '#dc2626' }}>
              Test failed: {testMutation.error.message}
            </span>
          )}
        </div>

        {/* Submit error */}
        {submitError && (
          <p style={{ color: '#dc2626', fontSize: '0.875rem', margin: 0 }}>
            {submitError.message}
          </p>
        )}

        {/* Actions */}
        <div style={{ display: 'flex', gap: '0.75rem' }}>
          <button type="submit" style={btnPrimary} disabled={isSubmitting}>
            {isSubmitting ? 'Saving...' : isEdit ? 'Update Connection' : 'Create Connection'}
          </button>
          <button
            type="button"
            style={btnSecondary}
            onClick={() => navigate('/connections')}
          >
            Cancel
          </button>
        </div>
      </form>
    </div>
  );
}
