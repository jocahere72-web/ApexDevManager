import { useState, useEffect, useCallback } from 'react';
import { AppPage, AppPageHeader, AppCard, AppEmptyState, AppStatusPill } from '@/components/ui/AppTemplate';
import {
  fetchConfigs,
  createConfig,
  updateConfig,
  deleteConfig,
  setDefaultConfig,
  type PRDConfig,
  type CreateConfigParams,
  type UpdateConfigParams,
} from '@/services/prd-config.api';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface ConfigFormData {
  name: string;
  exampleDocument: string;
  generationPrompt: string;
  extractionPrompt: string;
  validationPrompt: string;
}

const EMPTY_FORM: ConfigFormData = {
  name: '',
  exampleDocument: '',
  generationPrompt: '',
  extractionPrompt: '',
  validationPrompt: '',
};

// ---------------------------------------------------------------------------
// PRDConfig Page
// ---------------------------------------------------------------------------

export default function PRDConfigPage() {
  const [configs, setConfigs] = useState<PRDConfig[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [showModal, setShowModal] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [form, setForm] = useState<ConfigFormData>(EMPTY_FORM);
  const [saving, setSaving] = useState(false);

  // ── Load configs ─────────────────────────────────────────────────────────
  const loadConfigs = useCallback(async () => {
    try {
      setLoading(true);
      const data = await fetchConfigs();
      setConfigs(data);
    } catch {
      setError('Failed to load PRD configs');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    loadConfigs();
  }, [loadConfigs]);

  // ── Open modal for create ──────────────────────────────────────────────
  const handleNewConfig = () => {
    setEditingId(null);
    setForm(EMPTY_FORM);
    setShowModal(true);
    setError(null);
  };

  // ── Open modal for edit ────────────────────────────────────────────────
  const handleEditConfig = (config: PRDConfig) => {
    setEditingId(config.id);
    setForm({
      name: config.name,
      exampleDocument: config.exampleDocument,
      generationPrompt: config.generationPrompt,
      extractionPrompt: config.extractionPrompt ?? '',
      validationPrompt: config.validationPrompt ?? '',
    });
    setShowModal(true);
    setError(null);
  };

  // ── Save (create or update) ────────────────────────────────────────────
  const handleSave = async () => {
    if (!form.name.trim() || !form.exampleDocument.trim() || !form.generationPrompt.trim()) {
      setError('Name, example document, and generation prompt are required.');
      return;
    }

    setSaving(true);
    setError(null);
    try {
      if (editingId) {
        const params: UpdateConfigParams = {
          name: form.name.trim(),
          exampleDocument: form.exampleDocument.trim(),
          generationPrompt: form.generationPrompt.trim(),
          extractionPrompt: form.extractionPrompt.trim() || null,
          validationPrompt: form.validationPrompt.trim() || null,
        };
        await updateConfig(editingId, params);
      } else {
        const params: CreateConfigParams = {
          name: form.name.trim(),
          exampleDocument: form.exampleDocument.trim(),
          generationPrompt: form.generationPrompt.trim(),
          extractionPrompt: form.extractionPrompt.trim() || null,
          validationPrompt: form.validationPrompt.trim() || null,
        };
        await createConfig(params);
      }
      setShowModal(false);
      setForm(EMPTY_FORM);
      setEditingId(null);
      await loadConfigs();
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Failed to save config');
    } finally {
      setSaving(false);
    }
  };

  // ── Delete ─────────────────────────────────────────────────────────────
  const handleDelete = async (id: string) => {
    if (!confirm('Are you sure you want to delete this PRD config?')) return;
    try {
      await deleteConfig(id);
      await loadConfigs();
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Failed to delete config');
    }
  };

  // ── Set default ────────────────────────────────────────────────────────
  const handleSetDefault = async (id: string) => {
    try {
      await setDefaultConfig(id);
      await loadConfigs();
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Failed to set default');
    }
  };

  // ── Render ─────────────────────────────────────────────────────────────
  return (
    <AppPage>
      <AppPageHeader
        eyebrow="PRD Builder"
        title="PRD Configs"
        description="Manage reference documents and AI prompts used for PRD generation. Each config defines an example document and custom prompts."
        actions={
          <button onClick={handleNewConfig} className="app-button app-button-primary">
            + New Config
          </button>
        }
      />

      {error && (
        <div className="app-alert app-alert-danger" style={{ marginBottom: 12 }}>
          {error}
          <button
            onClick={() => setError(null)}
            style={{ float: 'right', background: 'none', border: 'none', cursor: 'pointer' }}
          >
            x
          </button>
        </div>
      )}

      {loading ? (
        <AppEmptyState>Loading...</AppEmptyState>
      ) : configs.length === 0 ? (
        <AppEmptyState>
          <p className="app-card-title">No PRD configs yet</p>
          <p className="app-card-meta">
            Create a config to define reference documents and AI prompts for PRD generation.
          </p>
        </AppEmptyState>
      ) : (
        <div className="app-stack">
          {configs.map((cfg) => (
            <AppCard key={cfg.id} padded>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
                <div style={{ flex: 1 }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 4 }}>
                    <h3 className="app-card-title" style={{ margin: 0 }}>{cfg.name}</h3>
                    {cfg.isDefault && <AppStatusPill tone="accent">Default</AppStatusPill>}
                  </div>
                  <p className="app-card-meta" style={{ marginBottom: 8 }}>
                    Updated {new Date(cfg.updatedAt).toLocaleDateString()} |
                    Example: {cfg.exampleDocument.length.toLocaleString()} chars |
                    Prompt: {cfg.generationPrompt.length.toLocaleString()} chars
                    {cfg.extractionPrompt ? ` | Extraction prompt: ${cfg.extractionPrompt.length.toLocaleString()} chars` : ''}
                    {cfg.validationPrompt ? ` | Validation prompt: ${cfg.validationPrompt.length.toLocaleString()} chars` : ''}
                  </p>
                  <details style={{ fontSize: '0.8rem', color: 'var(--app-muted)' }}>
                    <summary style={{ cursor: 'pointer', fontWeight: 600 }}>Preview example document</summary>
                    <pre style={{ whiteSpace: 'pre-wrap', marginTop: 8, maxHeight: 200, overflow: 'auto', background: 'var(--app-soft)', padding: 8, borderRadius: 'var(--app-radius-sm)' }}>
                      {cfg.exampleDocument.substring(0, 2000)}{cfg.exampleDocument.length > 2000 ? '...' : ''}
                    </pre>
                  </details>
                </div>

                <div className="app-toolbar" style={{ gap: 6, flexShrink: 0, marginLeft: 12 }}>
                  {!cfg.isDefault && (
                    <button
                      onClick={() => handleSetDefault(cfg.id)}
                      className="app-button"
                      style={{ fontSize: '0.8rem' }}
                    >
                      Set Default
                    </button>
                  )}
                  <button
                    onClick={() => handleEditConfig(cfg)}
                    className="app-button"
                    style={{ fontSize: '0.8rem' }}
                  >
                    Edit
                  </button>
                  {!cfg.isDefault && (
                    <button
                      onClick={() => handleDelete(cfg.id)}
                      className="app-button"
                      style={{ fontSize: '0.8rem', color: 'var(--app-danger)' }}
                    >
                      Delete
                    </button>
                  )}
                </div>
              </div>
            </AppCard>
          ))}
        </div>
      )}

      {/* ── Modal ─────────────────────────────────────────────────────────── */}
      {showModal && (
        <div className="app-modal-backdrop">
          <div className="app-modal" style={{ maxWidth: 700, maxHeight: '90vh', overflow: 'auto' }}>
            <h3 className="app-card-title" style={{ marginBottom: 16 }}>
              {editingId ? 'Edit PRD Config' : 'New PRD Config'}
            </h3>

            <div style={{ marginBottom: 12 }}>
              <label className="app-label">Name *</label>
              <input
                type="text"
                className="app-input"
                value={form.name}
                onChange={(e) => setForm({ ...form, name: e.target.value })}
                placeholder="e.g. PRD Estandar APEX"
                autoFocus
              />
            </div>

            <div style={{ marginBottom: 12 }}>
              <label className="app-label">Documento de Ejemplo *</label>
              <p style={{ fontSize: '0.75rem', color: 'var(--app-muted)', marginBottom: 4 }}>
                Un PRD de referencia que la IA usa como modelo de formato al generar las secciones.
              </p>
              <div style={{ display: 'flex', gap: 8, marginBottom: 8 }}>
                <button
                  type="button"
                  className="app-button"
                  style={{ fontSize: '0.8rem' }}
                  onClick={() => {
                    const input = document.createElement('input');
                    input.type = 'file';
                    input.accept = '.md,.txt,.markdown';
                    input.onchange = async (e) => {
                      const file = (e.target as HTMLInputElement).files?.[0];
                      if (!file) return;
                      const text = await file.text();
                      setForm({ ...form, exampleDocument: text });
                    };
                    input.click();
                  }}
                >
                  📁 Cargar archivo .md
                </button>
                {form.exampleDocument && (
                  <span style={{ fontSize: '0.75rem', color: 'var(--app-muted)', alignSelf: 'center' }}>
                    {form.exampleDocument.length.toLocaleString()} caracteres
                  </span>
                )}
              </div>
              <textarea
                className="app-textarea"
                rows={10}
                value={form.exampleDocument}
                onChange={(e) => setForm({ ...form, exampleDocument: e.target.value })}
                placeholder="Pega un documento PRD de ejemplo aquí o carga un archivo .md..."
                style={{ fontFamily: 'monospace', fontSize: '0.8rem' }}
              />
            </div>

            <div style={{ marginBottom: 12 }}>
              <label className="app-label">Generation Prompt *</label>
              <p style={{ fontSize: '0.75rem', color: 'var(--app-muted)', marginBottom: 4 }}>
                System prompt sent to the AI when generating each PRD section.
              </p>
              <textarea
                className="app-textarea"
                rows={6}
                value={form.generationPrompt}
                onChange={(e) => setForm({ ...form, generationPrompt: e.target.value })}
                placeholder="You are a technical writer creating a PRD section..."
                style={{ fontFamily: 'monospace', fontSize: '0.8rem' }}
              />
            </div>

            <div style={{ marginBottom: 12 }}>
              <label className="app-label">Extraction Prompt (optional)</label>
              <p style={{ fontSize: '0.75rem', color: 'var(--app-muted)', marginBottom: 4 }}>
                System prompt for extracting requirements from source documents. If blank, uses the global default.
              </p>
              <textarea
                className="app-textarea"
                rows={4}
                value={form.extractionPrompt}
                onChange={(e) => setForm({ ...form, extractionPrompt: e.target.value })}
                placeholder="Leave blank to use the default extraction prompt..."
                style={{ fontFamily: 'monospace', fontSize: '0.8rem' }}
              />
            </div>

            <div style={{ marginBottom: 16 }}>
              <label className="app-label">Validation Prompt (optional)</label>
              <p style={{ fontSize: '0.75rem', color: 'var(--app-muted)', marginBottom: 4 }}>
                System prompt for AI-based validation. If blank, only deterministic checks run.
              </p>
              <textarea
                className="app-textarea"
                rows={4}
                value={form.validationPrompt}
                onChange={(e) => setForm({ ...form, validationPrompt: e.target.value })}
                placeholder="Leave blank to use deterministic validation only..."
                style={{ fontFamily: 'monospace', fontSize: '0.8rem' }}
              />
            </div>

            {error && (
              <div className="app-alert app-alert-danger" style={{ marginBottom: 12, fontSize: '0.85rem' }}>
                {error}
              </div>
            )}

            <div className="app-toolbar" style={{ justifyContent: 'flex-end' }}>
              <button
                onClick={() => {
                  setShowModal(false);
                  setForm(EMPTY_FORM);
                  setEditingId(null);
                  setError(null);
                }}
                className="app-button"
              >
                Cancel
              </button>
              <button
                onClick={handleSave}
                disabled={saving}
                className="app-button app-button-primary"
              >
                {saving ? 'Saving...' : editingId ? 'Update' : 'Create'}
              </button>
            </div>
          </div>
        </div>
      )}
    </AppPage>
  );
}
