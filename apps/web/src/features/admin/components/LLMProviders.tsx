import { useState, useEffect, useCallback, type CSSProperties, type FormEvent } from 'react';
import type {
  LLMProvider,
  LLMProviderName,
  CreateLLMProviderRequest,
  UpdateLLMProviderRequest,
} from '@apex-dev-manager/shared-types';
import * as llmApi from '@/services/llm-providers.api';

const PROVIDER_MODELS: Record<LLMProviderName, string[]> = {
  anthropic: ['claude-sonnet-4-20250514', 'claude-opus-4-20250514', 'claude-haiku-4-20250414'],
  openai: ['gpt-4o', 'gpt-4o-mini', 'o3', 'o3-mini'],
  google: ['gemini-2.5-pro', 'gemini-2.5-flash'],
  mistral: ['mistral-large', 'mistral-medium', 'codestral'],
  local: ['custom'],
};

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  height: '100%',
  overflowY: 'auto',
};

const gridStyle: CSSProperties = {
  display: 'grid',
  gridTemplateColumns: 'repeat(auto-fill, minmax(340px, 1fr))',
  gap: '1rem',
  marginBottom: '1.5rem',
};

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1.25rem',
  backgroundColor: '#fff',
  position: 'relative',
};

const activeCardStyle: CSSProperties = {
  ...cardStyle,
  borderColor: '#22c55e',
  boxShadow: '0 0 0 1px #22c55e',
};

const badgeStyle = (active: boolean): CSSProperties => ({
  display: 'inline-flex',
  alignItems: 'center',
  gap: '0.375rem',
  padding: '0.25rem 0.625rem',
  borderRadius: '9999px',
  fontSize: '0.75rem',
  fontWeight: 600,
  backgroundColor: active ? '#dcfce7' : '#f3f4f6',
  color: active ? '#166534' : '#6b7280',
});

const cardHeaderStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'flex-start',
  marginBottom: '0.75rem',
};

const providerNameStyle: CSSProperties = {
  fontSize: '1rem',
  fontWeight: 600,
  color: '#111827',
  margin: 0,
};

const detailStyle: CSSProperties = {
  fontSize: '0.8125rem',
  color: '#6b7280',
  marginBottom: '0.25rem',
};

const buttonRowStyle: CSSProperties = {
  display: 'flex',
  gap: '0.5rem',
  marginTop: '1rem',
  flexWrap: 'wrap',
};

const buttonStyle: CSSProperties = {
  padding: '0.375rem 0.75rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  backgroundColor: '#2563eb',
  color: '#fff',
};

const secondaryButton: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#f3f4f6',
  color: '#374151',
  border: '1px solid #d1d5db',
};

const dangerButton: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#fef2f2',
  color: '#dc2626',
  border: '1px solid #fecaca',
};

const successButton: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#dcfce7',
  color: '#166534',
  border: '1px solid #bbf7d0',
};

const modalOverlayStyle: CSSProperties = {
  position: 'fixed',
  inset: 0,
  backgroundColor: 'rgba(0,0,0,0.4)',
  display: 'flex',
  justifyContent: 'center',
  alignItems: 'center',
  zIndex: 1000,
};

const modalStyle: CSSProperties = {
  backgroundColor: '#fff',
  borderRadius: '0.75rem',
  padding: '1.5rem',
  width: '100%',
  maxWidth: 520,
  maxHeight: '85vh',
  overflowY: 'auto',
  boxShadow: '0 20px 60px rgba(0,0,0,0.15)',
};

const inputStyle: CSSProperties = {
  width: '100%',
  padding: '0.5rem 0.75rem',
  fontSize: '0.875rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  marginBottom: '0.75rem',
  boxSizing: 'border-box' as const,
};

const selectStyle: CSSProperties = {
  ...inputStyle,
};

const labelStyle: CSSProperties = {
  display: 'block',
  fontSize: '0.8125rem',
  fontWeight: 500,
  color: '#374151',
  marginBottom: '0.25rem',
};

const sectionTitle: CSSProperties = {
  fontSize: '1.125rem',
  fontWeight: 600,
  color: '#111827',
  marginBottom: '1rem',
};

const alertStyle = (type: 'error' | 'success' | 'info'): CSSProperties => ({
  padding: '0.75rem 1rem',
  borderRadius: '0.375rem',
  fontSize: '0.875rem',
  marginBottom: '1rem',
  backgroundColor: type === 'error' ? '#fef2f2' : type === 'success' ? '#f0fdf4' : '#eff6ff',
  color: type === 'error' ? '#991b1b' : type === 'success' ? '#166534' : '#1e40af',
  border: `1px solid ${type === 'error' ? '#fecaca' : type === 'success' ? '#bbf7d0' : '#bfdbfe'}`,
});

const PROVIDER_LABELS: Record<LLMProviderName, string> = {
  anthropic: 'Anthropic (Claude)',
  openai: 'OpenAI (GPT)',
  google: 'Google (Gemini)',
  mistral: 'Mistral AI',
  local: 'Local / Custom',
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function LLMProviders() {
  const [providers, setProviders] = useState<LLMProvider[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [successMsg, setSuccessMsg] = useState<string | null>(null);

  // Modal state
  const [showModal, setShowModal] = useState(false);
  const [editingProvider, setEditingProvider] = useState<LLMProvider | null>(null);

  // Form state
  const [formProviderName, setFormProviderName] = useState<LLMProviderName>('anthropic');
  const [formDisplayName, setFormDisplayName] = useState('');
  const [formApiKey, setFormApiKey] = useState('');
  const [formBaseUrl, setFormBaseUrl] = useState('');
  const [formDefaultModel, setFormDefaultModel] = useState('');
  const [formMaxTokens, setFormMaxTokens] = useState('4096');
  const [formRateLimit, setFormRateLimit] = useState('60');
  const [formBudget, setFormBudget] = useState('');
  const [formSaving, setFormSaving] = useState(false);

  // Test state
  const [testingId, setTestingId] = useState<string | null>(null);
  const [testResult, setTestResult] = useState<{ id: string; success: boolean; message: string; latencyMs: number } | null>(null);

  const flash = useCallback((msg: string) => {
    setSuccessMsg(msg);
    setTimeout(() => setSuccessMsg(null), 4000);
  }, []);

  // ── Load providers ───────────────────────────────────────────────────────
  const loadProviders = useCallback(async () => {
    try {
      setLoading(true);
      const data = await llmApi.fetchLLMProviders();
      setProviders(data);
      setError(null);
    } catch (err) {
      setError((err as Error).message ?? 'Failed to load providers');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    loadProviders();
  }, [loadProviders]);

  // ── Open modal ───────────────────────────────────────────────────────────
  const openCreateModal = useCallback(() => {
    setEditingProvider(null);
    setFormProviderName('anthropic');
    setFormDisplayName('');
    setFormApiKey('');
    setFormBaseUrl('');
    setFormDefaultModel(PROVIDER_MODELS.anthropic[0]);
    setFormMaxTokens('4096');
    setFormRateLimit('60');
    setFormBudget('');
    setShowModal(true);
  }, []);

  const openEditModal = useCallback((provider: LLMProvider) => {
    setEditingProvider(provider);
    setFormProviderName(provider.providerName);
    setFormDisplayName(provider.displayName);
    setFormApiKey('');
    setFormBaseUrl(provider.baseUrl ?? '');
    setFormDefaultModel(provider.defaultModel);
    setFormMaxTokens(String(provider.maxTokensPerRequest));
    setFormRateLimit(String(provider.rateLimitRpm));
    setFormBudget(provider.monthlyBudgetUsd != null ? String(provider.monthlyBudgetUsd) : '');
    setShowModal(true);
  }, []);

  const closeModal = useCallback(() => {
    setShowModal(false);
    setEditingProvider(null);
  }, []);

  // ── Handle provider name change ──────────────────────────────────────────
  const handleProviderChange = useCallback((name: LLMProviderName) => {
    setFormProviderName(name);
    setFormDisplayName(PROVIDER_LABELS[name]);
    const models = PROVIDER_MODELS[name];
    setFormDefaultModel(models[0] ?? '');
  }, []);

  // ── Save (create / update) ──────────────────────────────────────────────
  const handleSave = useCallback(async (e: FormEvent) => {
    e.preventDefault();
    setFormSaving(true);
    setError(null);

    try {
      if (editingProvider) {
        const payload: UpdateLLMProviderRequest = {
          displayName: formDisplayName,
          defaultModel: formDefaultModel,
          maxTokensPerRequest: Number(formMaxTokens),
          rateLimitRpm: Number(formRateLimit),
          baseUrl: formBaseUrl || undefined,
          monthlyBudgetUsd: formBudget ? Number(formBudget) : undefined,
        };
        if (formApiKey) {
          payload.apiKey = formApiKey;
        }
        await llmApi.updateLLMProvider(editingProvider.id, payload);
        flash('Provider updated successfully');
      } else {
        const payload: CreateLLMProviderRequest = {
          providerName: formProviderName,
          displayName: formDisplayName,
          apiKey: formApiKey,
          defaultModel: formDefaultModel,
          baseUrl: formBaseUrl || undefined,
          maxTokensPerRequest: Number(formMaxTokens),
          rateLimitRpm: Number(formRateLimit),
          monthlyBudgetUsd: formBudget ? Number(formBudget) : undefined,
          availableModels: PROVIDER_MODELS[formProviderName],
        };
        await llmApi.createLLMProvider(payload);
        flash('Provider created successfully');
      }

      closeModal();
      await loadProviders();
    } catch (err: unknown) {
      const msg = (err as { response?: { data?: { error?: string } } })?.response?.data?.error
        ?? (err as Error).message
        ?? 'Save failed';
      setError(msg);
    } finally {
      setFormSaving(false);
    }
  }, [editingProvider, formProviderName, formDisplayName, formApiKey, formBaseUrl, formDefaultModel, formMaxTokens, formRateLimit, formBudget, closeModal, loadProviders, flash]);

  // ── Activate ────────────────────────────────────────────────────────────
  const handleActivate = useCallback(async (id: string) => {
    try {
      await llmApi.activateLLMProvider(id);
      flash('Provider activated');
      await loadProviders();
    } catch (err) {
      setError((err as Error).message ?? 'Activation failed');
    }
  }, [loadProviders, flash]);

  // ── Test ─────────────────────────────────────────────────────────────────
  const handleTest = useCallback(async (id: string) => {
    setTestingId(id);
    setTestResult(null);
    try {
      const result = await llmApi.testLLMProvider(id);
      setTestResult({ id, ...result });
    } catch (err) {
      setTestResult({ id, success: false, message: (err as Error).message ?? 'Test failed', latencyMs: 0 });
    } finally {
      setTestingId(null);
    }
  }, []);

  // ── Delete ──────────────────────────────────────────────────────────────
  const handleDelete = useCallback(async (id: string, name: string) => {
    if (!window.confirm(`Delete provider "${name}"? This cannot be undone.`)) return;
    try {
      await llmApi.deleteLLMProvider(id);
      flash('Provider deleted');
      await loadProviders();
    } catch (err) {
      setError((err as Error).message ?? 'Delete failed');
    }
  }, [loadProviders, flash]);

  // ── Render ──────────────────────────────────────────────────────────────

  if (loading && providers.length === 0) {
    return <div style={containerStyle}>Loading LLM providers...</div>;
  }

  return (
    <div style={containerStyle}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1.25rem' }}>
        <h2 style={sectionTitle}>LLM Providers</h2>
        <button type="button" style={buttonStyle} onClick={openCreateModal}>
          + Add Provider
        </button>
      </div>

      {error && <div style={alertStyle('error')}>{error}</div>}
      {successMsg && <div style={alertStyle('success')}>{successMsg}</div>}

      {providers.length === 0 && !loading && (
        <div style={alertStyle('info')}>
          No LLM providers configured. Add one to enable AI features.
        </div>
      )}

      <div style={gridStyle}>
        {providers.map((p) => (
          <div key={p.id} style={p.isActive ? activeCardStyle : cardStyle}>
            <div style={cardHeaderStyle}>
              <div>
                <h3 style={providerNameStyle}>{p.displayName}</h3>
                <p style={{ ...detailStyle, marginTop: '0.25rem', textTransform: 'capitalize' }}>
                  {p.providerName}
                </p>
              </div>
              <span style={badgeStyle(p.isActive)}>
                {p.isActive ? 'Active' : 'Inactive'}
              </span>
            </div>

            <p style={detailStyle}>Model: <strong>{p.defaultModel}</strong></p>
            <p style={detailStyle}>Max tokens: {p.maxTokensPerRequest.toLocaleString()}</p>
            <p style={detailStyle}>Rate limit: {p.rateLimitRpm} rpm</p>
            {p.monthlyBudgetUsd != null && (
              <p style={detailStyle}>
                Budget: ${p.currentMonthCostUsd.toFixed(2)} / ${p.monthlyBudgetUsd.toFixed(2)} USD
              </p>
            )}
            {p.baseUrl && <p style={detailStyle}>URL: {p.baseUrl}</p>}

            {testResult && testResult.id === p.id && (
              <div style={{ ...alertStyle(testResult.success ? 'success' : 'error'), marginTop: '0.5rem', marginBottom: 0 }}>
                {testResult.message} ({testResult.latencyMs}ms)
              </div>
            )}

            <div style={buttonRowStyle}>
              {!p.isActive && (
                <button type="button" style={successButton} onClick={() => handleActivate(p.id)}>
                  Activate
                </button>
              )}
              <button
                type="button"
                style={secondaryButton}
                onClick={() => handleTest(p.id)}
                disabled={testingId === p.id}
              >
                {testingId === p.id ? 'Testing...' : 'Test'}
              </button>
              <button type="button" style={secondaryButton} onClick={() => openEditModal(p)}>
                Edit
              </button>
              <button type="button" style={dangerButton} onClick={() => handleDelete(p.id, p.displayName)}>
                Delete
              </button>
            </div>
          </div>
        ))}
      </div>

      {/* ── Modal ──────────────────────────────────────────────────────────── */}
      {showModal && (
        <div style={modalOverlayStyle} onClick={closeModal}>
          <div style={modalStyle} onClick={(e) => e.stopPropagation()}>
            <h3 style={sectionTitle}>
              {editingProvider ? 'Edit Provider' : 'Add LLM Provider'}
            </h3>

            <form onSubmit={handleSave}>
              {!editingProvider && (
                <>
                  <label style={labelStyle}>Provider</label>
                  <select
                    style={selectStyle}
                    value={formProviderName}
                    onChange={(e) => handleProviderChange(e.target.value as LLMProviderName)}
                  >
                    {(Object.keys(PROVIDER_LABELS) as LLMProviderName[]).map((key) => (
                      <option key={key} value={key}>{PROVIDER_LABELS[key]}</option>
                    ))}
                  </select>
                </>
              )}

              <label style={labelStyle}>Display Name</label>
              <input
                style={inputStyle}
                value={formDisplayName}
                onChange={(e) => setFormDisplayName(e.target.value)}
                required
                placeholder="e.g., Anthropic Production"
              />

              <label style={labelStyle}>
                API Key {editingProvider && <span style={{ fontWeight: 400, color: '#9ca3af' }}>(leave blank to keep current)</span>}
              </label>
              <input
                style={inputStyle}
                type="password"
                value={formApiKey}
                onChange={(e) => setFormApiKey(e.target.value)}
                required={!editingProvider}
                placeholder="sk-..."
                autoComplete="off"
              />

              <label style={labelStyle}>Default Model</label>
              <select
                style={selectStyle}
                value={formDefaultModel}
                onChange={(e) => setFormDefaultModel(e.target.value)}
              >
                {PROVIDER_MODELS[formProviderName].map((m) => (
                  <option key={m} value={m}>{m}</option>
                ))}
              </select>

              <label style={labelStyle}>Base URL <span style={{ fontWeight: 400, color: '#9ca3af' }}>(optional, for custom endpoints)</span></label>
              <input
                style={inputStyle}
                value={formBaseUrl}
                onChange={(e) => setFormBaseUrl(e.target.value)}
                placeholder="https://api.example.com/v1"
              />

              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '0.75rem' }}>
                <div>
                  <label style={labelStyle}>Max Tokens</label>
                  <input
                    style={inputStyle}
                    type="number"
                    value={formMaxTokens}
                    onChange={(e) => setFormMaxTokens(e.target.value)}
                    min={1}
                    max={200000}
                  />
                </div>
                <div>
                  <label style={labelStyle}>Rate Limit (RPM)</label>
                  <input
                    style={inputStyle}
                    type="number"
                    value={formRateLimit}
                    onChange={(e) => setFormRateLimit(e.target.value)}
                    min={1}
                    max={10000}
                  />
                </div>
              </div>

              <label style={labelStyle}>Monthly Budget (USD) <span style={{ fontWeight: 400, color: '#9ca3af' }}>(optional)</span></label>
              <input
                style={inputStyle}
                type="number"
                step="0.01"
                value={formBudget}
                onChange={(e) => setFormBudget(e.target.value)}
                placeholder="100.00"
              />

              {error && <div style={alertStyle('error')}>{error}</div>}

              <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '0.5rem', marginTop: '1rem' }}>
                <button type="button" style={secondaryButton} onClick={closeModal} disabled={formSaving}>
                  Cancel
                </button>
                <button type="submit" style={buttonStyle} disabled={formSaving}>
                  {formSaving ? 'Saving...' : editingProvider ? 'Update' : 'Create'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}

export default LLMProviders;
