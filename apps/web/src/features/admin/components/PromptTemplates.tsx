import { useState, useEffect, useCallback, type CSSProperties, type FormEvent } from 'react';
import type {
  PromptTemplate,
  PromptCategory,
  CreatePromptTemplateRequest,
} from '@apex-dev-manager/shared-types';
import * as promptApi from '@/services/prompt-templates.api';
import * as llmApi from '@/services/llm-providers.api';

// ---------------------------------------------------------------------------
// Category labels
// ---------------------------------------------------------------------------

const CATEGORY_LABELS: Record<PromptCategory, string> = {
  prd: 'PRD Builder',
  'page-gen': 'Page Generation',
  code: 'Code Analysis',
  analysis: 'Documentation & Analysis',
  testing: 'Testing',
};

const CATEGORIES: PromptCategory[] = ['prd', 'page-gen', 'code', 'analysis', 'testing'];

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  height: '100%',
  overflowY: 'auto',
};

const headerRowStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  marginBottom: '1.5rem',
};

const filterBarStyle: CSSProperties = {
  display: 'flex',
  gap: '0.5rem',
  flexWrap: 'wrap',
  marginBottom: '1.25rem',
};

const filterBtnStyle = (active: boolean): CSSProperties => ({
  padding: '0.375rem 0.875rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  border: active ? '1px solid #2563eb' : '1px solid #d1d5db',
  borderRadius: '9999px',
  cursor: 'pointer',
  backgroundColor: active ? '#eff6ff' : '#fff',
  color: active ? '#2563eb' : '#374151',
});

const categoryGroupStyle: CSSProperties = {
  marginBottom: '1.5rem',
};

const categoryTitleStyle: CSSProperties = {
  fontSize: '0.875rem',
  fontWeight: 600,
  color: '#6b7280',
  textTransform: 'uppercase' as const,
  letterSpacing: '0.05em',
  marginBottom: '0.75rem',
};

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  marginBottom: '0.5rem',
  backgroundColor: '#fff',
};

const cardHeaderStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  padding: '0.875rem 1.25rem',
  cursor: 'pointer',
};

const cardNameStyle: CSSProperties = {
  fontSize: '0.9375rem',
  fontWeight: 600,
  color: '#111827',
  margin: 0,
};

const cardSlugStyle: CSSProperties = {
  fontSize: '0.75rem',
  color: '#9ca3af',
  fontFamily: 'monospace',
};

const badgeStyle = (active: boolean): CSSProperties => ({
  display: 'inline-flex',
  alignItems: 'center',
  padding: '0.125rem 0.5rem',
  borderRadius: '9999px',
  fontSize: '0.6875rem',
  fontWeight: 600,
  backgroundColor: active ? '#dcfce7' : '#fef2f2',
  color: active ? '#166534' : '#991b1b',
  marginLeft: '0.5rem',
});

const modelBadgeStyle: CSSProperties = {
  display: 'inline-flex',
  alignItems: 'center',
  padding: '0.125rem 0.5rem',
  borderRadius: '9999px',
  fontSize: '0.6875rem',
  fontWeight: 500,
  backgroundColor: '#f0f9ff',
  color: '#0369a1',
  marginLeft: '0.5rem',
};

const expandedStyle: CSSProperties = {
  padding: '0 1.25rem 1.25rem',
  borderTop: '1px solid #f3f4f6',
};

const labelStyle: CSSProperties = {
  display: 'block',
  fontSize: '0.8125rem',
  fontWeight: 500,
  color: '#374151',
  marginBottom: '0.25rem',
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

const textareaStyle: CSSProperties = {
  ...inputStyle,
  minHeight: '200px',
  fontFamily: 'monospace',
  fontSize: '0.8125rem',
  lineHeight: '1.5',
  resize: 'vertical' as const,
};

const selectStyle: CSSProperties = {
  ...inputStyle,
};

const rowStyle: CSSProperties = {
  display: 'grid',
  gridTemplateColumns: '1fr 1fr 1fr',
  gap: '0.75rem',
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

const buttonRowStyle: CSSProperties = {
  display: 'flex',
  gap: '0.5rem',
  marginTop: '0.75rem',
  flexWrap: 'wrap',
};

const variableTagStyle: CSSProperties = {
  display: 'inline-flex',
  alignItems: 'center',
  padding: '0.125rem 0.5rem',
  borderRadius: '0.25rem',
  fontSize: '0.75rem',
  fontFamily: 'monospace',
  backgroundColor: '#fef3c7',
  color: '#92400e',
  marginRight: '0.375rem',
  marginBottom: '0.25rem',
};

const sliderContainerStyle: CSSProperties = {
  display: 'flex',
  alignItems: 'center',
  gap: '0.75rem',
  marginBottom: '0.75rem',
};

const sliderStyle: CSSProperties = {
  flex: 1,
  accentColor: '#2563eb',
};

const errorStyle: CSSProperties = {
  padding: '0.75rem',
  backgroundColor: '#fef2f2',
  color: '#dc2626',
  borderRadius: '0.375rem',
  marginBottom: '1rem',
  fontSize: '0.875rem',
};

const successStyle: CSSProperties = {
  padding: '0.75rem',
  backgroundColor: '#dcfce7',
  color: '#166534',
  borderRadius: '0.375rem',
  marginBottom: '1rem',
  fontSize: '0.875rem',
};

// ---------------------------------------------------------------------------
// Variable extraction helper
// ---------------------------------------------------------------------------

function extractVarsFromText(text: string): string[] {
  const matches = text.match(/\{\{(\w+)\}\}/g);
  if (!matches) return [];
  const unique = new Set(matches.map((m) => m.replace(/\{\{|\}\}/g, '')));
  return Array.from(unique);
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function PromptTemplates() {
  const [templates, setTemplates] = useState<PromptTemplate[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  const [expandedId, setExpandedId] = useState<string | null>(null);
  const [categoryFilter, setCategoryFilter] = useState<PromptCategory | 'all'>('all');
  const [savingId, setSavingId] = useState<string | null>(null);
  const [availableModels, setAvailableModels] = useState<string[]>([]);

  // Editing state per template
  const [editState, setEditState] = useState<
    Record<string, {
      promptText: string;
      name: string;
      modelOverride: string;
      temperature: number;
      maxTokens: number;
    }>
  >({});

  const loadTemplates = useCallback(async () => {
    try {
      setLoading(true);
      setError(null);
      const data = await promptApi.fetchPromptTemplates(
        categoryFilter === 'all' ? undefined : categoryFilter,
      );
      setTemplates(data);

      // Initialize edit state for all templates
      const newEditState: typeof editState = {};
      for (const t of data) {
        newEditState[t.id] = {
          promptText: t.promptText,
          name: t.name,
          modelOverride: t.modelOverride ?? '',
          temperature: t.temperature,
          maxTokens: t.maxTokens,
        };
      }
      setEditState(newEditState);
    } catch (err) {
      setError((err as Error).message ?? 'Failed to load templates');
    } finally {
      setLoading(false);
    }
  }, [categoryFilter]);

  const loadModels = useCallback(async () => {
    try {
      const provider = await llmApi.fetchActiveProvider();
      if (provider) {
        setAvailableModels(provider.availableModels ?? []);
      }
    } catch {
      // Ignore — models dropdown will be empty
    }
  }, []);

  useEffect(() => {
    loadTemplates();
    loadModels();
  }, [loadTemplates, loadModels]);

  const handleToggle = (id: string) => {
    setExpandedId(expandedId === id ? null : id);
    setSuccess(null);
  };

  const handleEditChange = (id: string, field: string, value: string | number) => {
    setEditState((prev) => ({
      ...prev,
      [id]: { ...prev[id], [field]: value },
    }));
  };

  const handleSave = async (template: PromptTemplate) => {
    const edit = editState[template.id];
    if (!edit) return;

    try {
      setSavingId(template.id);
      setError(null);
      setSuccess(null);

      await promptApi.updatePromptTemplate(template.id, {
        name: edit.name !== template.name ? edit.name : undefined,
        promptText: edit.promptText !== template.promptText ? edit.promptText : undefined,
        modelOverride: edit.modelOverride !== (template.modelOverride ?? '')
          ? (edit.modelOverride || null)
          : undefined,
        temperature: edit.temperature !== template.temperature ? edit.temperature : undefined,
        maxTokens: edit.maxTokens !== template.maxTokens ? edit.maxTokens : undefined,
      });

      setSuccess(`Template "${template.name}" saved successfully.`);
      await loadTemplates();
    } catch (err) {
      setError((err as Error).message ?? 'Failed to save template');
    } finally {
      setSavingId(null);
    }
  };

  const handleReset = async (slug: string) => {
    if (!confirm('Reset this template to the system default? Your customizations will be lost.')) {
      return;
    }

    try {
      setError(null);
      setSuccess(null);
      await promptApi.resetPromptTemplate(slug);
      setSuccess(`Template "${slug}" reset to system default.`);
      await loadTemplates();
    } catch (err) {
      setError((err as Error).message ?? 'Failed to reset template');
    }
  };

  const handleDelete = async (id: string, name: string) => {
    if (!confirm(`Delete template "${name}"? This cannot be undone.`)) {
      return;
    }

    try {
      setError(null);
      setSuccess(null);
      await promptApi.deletePromptTemplate(id);
      setSuccess(`Template "${name}" deleted.`);
      setExpandedId(null);
      await loadTemplates();
    } catch (err) {
      setError((err as Error).message ?? 'Failed to delete template');
    }
  };

  // Group templates by category
  const grouped = templates.reduce<Record<string, PromptTemplate[]>>((acc, t) => {
    const cat = t.category;
    if (!acc[cat]) acc[cat] = [];
    acc[cat].push(t);
    return acc;
  }, {});

  return (
    <div style={containerStyle}>
      <div style={headerRowStyle}>
        <div>
          <h2 style={{ margin: 0, fontSize: '1.125rem', fontWeight: 600, color: '#111827' }}>
            Prompt Templates
          </h2>
          <p style={{ margin: '0.25rem 0 0', fontSize: '0.8125rem', color: '#6b7280' }}>
            Configure AI prompts used by each module. Override models and parameters per template.
          </p>
        </div>
      </div>

      {/* Category filter bar */}
      <div style={filterBarStyle}>
        <button
          type="button"
          style={filterBtnStyle(categoryFilter === 'all')}
          onClick={() => setCategoryFilter('all')}
        >
          All
        </button>
        {CATEGORIES.map((cat) => (
          <button
            key={cat}
            type="button"
            style={filterBtnStyle(categoryFilter === cat)}
            onClick={() => setCategoryFilter(cat)}
          >
            {CATEGORY_LABELS[cat]}
          </button>
        ))}
      </div>

      {error && <div style={errorStyle}>{error}</div>}
      {success && <div style={successStyle}>{success}</div>}

      {loading ? (
        <p style={{ color: '#6b7280', fontSize: '0.875rem' }}>Loading templates...</p>
      ) : templates.length === 0 ? (
        <p style={{ color: '#6b7280', fontSize: '0.875rem' }}>
          No prompt templates found. Templates will be auto-created when first needed.
        </p>
      ) : (
        Object.entries(grouped).map(([category, catTemplates]) => (
          <div key={category} style={categoryGroupStyle}>
            <div style={categoryTitleStyle}>
              {CATEGORY_LABELS[category as PromptCategory] ?? category}
            </div>
            {catTemplates.map((template) => {
              const isExpanded = expandedId === template.id;
              const edit = editState[template.id];
              const detectedVars = edit ? extractVarsFromText(edit.promptText) : template.variables;

              return (
                <div key={template.id} style={cardStyle}>
                  {/* Card header — click to expand */}
                  <div style={cardHeaderStyle} onClick={() => handleToggle(template.id)}>
                    <div>
                      <span style={cardNameStyle}>{template.name}</span>
                      <span style={cardSlugStyle}> ({template.slug})</span>
                      <span style={badgeStyle(template.isActive)}>
                        {template.isActive ? 'Active' : 'Inactive'}
                      </span>
                      {template.modelOverride && (
                        <span style={modelBadgeStyle}>{template.modelOverride}</span>
                      )}
                    </div>
                    <span style={{ fontSize: '0.75rem', color: '#9ca3af' }}>
                      v{template.version} {isExpanded ? '\u25B2' : '\u25BC'}
                    </span>
                  </div>

                  {/* Expanded editor */}
                  {isExpanded && edit && (
                    <div style={expandedStyle}>
                      {template.description && (
                        <p style={{ fontSize: '0.8125rem', color: '#6b7280', margin: '0.75rem 0' }}>
                          {template.description}
                        </p>
                      )}

                      {/* Name */}
                      <label style={labelStyle}>Name</label>
                      <input
                        type="text"
                        style={inputStyle}
                        value={edit.name}
                        onChange={(e) => handleEditChange(template.id, 'name', e.target.value)}
                      />

                      {/* Prompt text */}
                      <label style={labelStyle}>Prompt Text</label>
                      <textarea
                        style={textareaStyle}
                        value={edit.promptText}
                        onChange={(e) => handleEditChange(template.id, 'promptText', e.target.value)}
                      />

                      {/* Variables detected */}
                      {detectedVars.length > 0 && (
                        <div style={{ marginBottom: '0.75rem' }}>
                          <label style={labelStyle}>Variables Detected</label>
                          <div>
                            {detectedVars.map((v) => (
                              <span key={v} style={variableTagStyle}>
                                {'{{' + v + '}}'}
                              </span>
                            ))}
                          </div>
                        </div>
                      )}

                      {/* Model override + Temperature + Max tokens */}
                      <div style={rowStyle}>
                        <div>
                          <label style={labelStyle}>Model Override</label>
                          <select
                            style={selectStyle}
                            value={edit.modelOverride}
                            onChange={(e) => handleEditChange(template.id, 'modelOverride', e.target.value)}
                          >
                            <option value="">Use provider default</option>
                            {availableModels.map((m) => (
                              <option key={m} value={m}>{m}</option>
                            ))}
                          </select>
                        </div>
                        <div>
                          <label style={labelStyle}>
                            Temperature: {edit.temperature.toFixed(2)}
                          </label>
                          <div style={sliderContainerStyle}>
                            <span style={{ fontSize: '0.75rem', color: '#9ca3af' }}>0</span>
                            <input
                              type="range"
                              min="0"
                              max="1"
                              step="0.05"
                              style={sliderStyle}
                              value={edit.temperature}
                              onChange={(e) =>
                                handleEditChange(template.id, 'temperature', parseFloat(e.target.value))
                              }
                            />
                            <span style={{ fontSize: '0.75rem', color: '#9ca3af' }}>1</span>
                          </div>
                        </div>
                        <div>
                          <label style={labelStyle}>Max Tokens</label>
                          <input
                            type="number"
                            style={inputStyle}
                            min={1}
                            max={200000}
                            value={edit.maxTokens}
                            onChange={(e) =>
                              handleEditChange(template.id, 'maxTokens', parseInt(e.target.value, 10) || 4096)
                            }
                          />
                        </div>
                      </div>

                      {/* Action buttons */}
                      <div style={buttonRowStyle}>
                        <button
                          type="button"
                          style={buttonStyle}
                          disabled={savingId === template.id}
                          onClick={() => handleSave(template)}
                        >
                          {savingId === template.id ? 'Saving...' : 'Save Changes'}
                        </button>
                        {template.isSystemDefault && (
                          <button
                            type="button"
                            style={secondaryButton}
                            onClick={() => handleReset(template.slug)}
                          >
                            Reset to Default
                          </button>
                        )}
                        {!template.isSystemDefault && (
                          <button
                            type="button"
                            style={dangerButton}
                            onClick={() => handleDelete(template.id, template.name)}
                          >
                            Delete
                          </button>
                        )}
                      </div>
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        ))
      )}
    </div>
  );
}
