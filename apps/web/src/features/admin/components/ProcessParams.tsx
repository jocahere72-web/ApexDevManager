import { useState, useEffect, useCallback, type CSSProperties } from 'react';
import { useTranslation } from 'react-i18next';
import type {
  ProcessParams as ProcessParamsType,
  ProcessStage,
  ChecklistItem,
  RequiredField,
  ApprovalRules,
  UpsertProcessParamsRequest,
} from '@apex-dev-manager/shared-types';
const PROCESS_STAGES: ProcessStage[] = ['intake', 'prd', 'design', 'build', 'review', 'test', 'deploy'];

const STAGE_LABELS: Record<ProcessStage, { es: string; en: string }> = {
  intake: { es: 'Recepción', en: 'Intake' },
  prd: { es: 'PRD', en: 'PRD' },
  design: { es: 'Diseño', en: 'Design' },
  build: { es: 'Construcción', en: 'Build' },
  review: { es: 'Revisión', en: 'Review' },
  test: { es: 'Pruebas', en: 'Test' },
  deploy: { es: 'Despliegue', en: 'Deploy' },
};
import * as paramsApi from '@/services/process-params.api';

// ---------------------------------------------------------------------------
// Stage icons (simple text-based)
// ---------------------------------------------------------------------------

const STAGE_ICONS: Record<ProcessStage, string> = {
  intake: '1',
  prd: '2',
  design: '3',
  build: '4',
  review: '5',
  test: '6',
  deploy: '7',
};

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  height: '100%',
  overflowY: 'auto',
};

const pipelineBarStyle: CSSProperties = {
  display: 'flex',
  gap: '0.25rem',
  marginBottom: '2rem',
  alignItems: 'center',
  justifyContent: 'center',
  flexWrap: 'wrap',
};

const pipelineStepStyle = (active: boolean, isExpanded: boolean): CSSProperties => ({
  display: 'flex',
  flexDirection: 'column',
  alignItems: 'center',
  gap: '0.375rem',
  padding: '0.75rem 1rem',
  borderRadius: '0.5rem',
  cursor: 'pointer',
  border: isExpanded ? '2px solid #2563eb' : '1px solid #e5e7eb',
  backgroundColor: isExpanded ? '#eff6ff' : active ? '#f0fdf4' : '#f9fafb',
  minWidth: '90px',
  transition: 'all 0.15s ease',
});

const stepNumberStyle = (isExpanded: boolean): CSSProperties => ({
  width: '28px',
  height: '28px',
  borderRadius: '50%',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  fontSize: '0.75rem',
  fontWeight: 700,
  backgroundColor: isExpanded ? '#2563eb' : '#e5e7eb',
  color: isExpanded ? '#fff' : '#374151',
});

const stepLabelStyle: CSSProperties = {
  fontSize: '0.6875rem',
  fontWeight: 500,
  color: '#374151',
  textAlign: 'center',
};

const arrowStyle: CSSProperties = {
  fontSize: '1rem',
  color: '#9ca3af',
  margin: '0 0.125rem',
};

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  marginBottom: '0.75rem',
  backgroundColor: '#fff',
};

const cardHeaderStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  padding: '1rem 1.25rem',
  cursor: 'pointer',
  userSelect: 'none',
};

const cardTitleStyle: CSSProperties = {
  fontWeight: 600,
  fontSize: '0.9375rem',
  color: '#111827',
};

const cardDescStyle: CSSProperties = {
  fontSize: '0.8125rem',
  color: '#6b7280',
  marginTop: '0.125rem',
};

const checklistPreviewStyle: CSSProperties = {
  display: 'flex',
  gap: '0.375rem',
  flexWrap: 'wrap',
  marginTop: '0.5rem',
};

const checkBadgeStyle = (required: boolean): CSSProperties => ({
  fontSize: '0.6875rem',
  padding: '0.125rem 0.5rem',
  borderRadius: '9999px',
  backgroundColor: required ? '#fef3c7' : '#f3f4f6',
  color: required ? '#92400e' : '#6b7280',
  fontWeight: 500,
});

const expandedStyle: CSSProperties = {
  padding: '0 1.25rem 1.25rem',
  borderTop: '1px solid #f3f4f6',
};

const fieldGroupStyle: CSSProperties = {
  marginBottom: '1.25rem',
};

const labelStyle: CSSProperties = {
  display: 'block',
  fontSize: '0.8125rem',
  fontWeight: 600,
  color: '#374151',
  marginBottom: '0.375rem',
};

const inputStyle: CSSProperties = {
  width: '100%',
  padding: '0.5rem 0.75rem',
  fontSize: '0.875rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  outline: 'none',
  boxSizing: 'border-box',
};

const textareaStyle: CSSProperties = {
  ...inputStyle,
  minHeight: '80px',
  resize: 'vertical',
};

const selectStyle: CSSProperties = {
  ...inputStyle,
  appearance: 'auto',
};

const sliderContainerStyle: CSSProperties = {
  display: 'flex',
  alignItems: 'center',
  gap: '0.75rem',
};

const sliderStyle: CSSProperties = {
  flex: 1,
  cursor: 'pointer',
};

const sliderValueStyle: CSSProperties = {
  fontSize: '0.875rem',
  fontWeight: 600,
  color: '#2563eb',
  minWidth: '40px',
  textAlign: 'right',
};

const rowStyle: CSSProperties = {
  display: 'grid',
  gridTemplateColumns: '1fr 1fr',
  gap: '1rem',
};

const checklistItemStyle: CSSProperties = {
  display: 'flex',
  alignItems: 'center',
  gap: '0.5rem',
  padding: '0.375rem 0',
  borderBottom: '1px solid #f3f4f6',
};

const checklistInputStyle: CSSProperties = {
  flex: 1,
  padding: '0.375rem 0.5rem',
  fontSize: '0.8125rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.25rem',
  outline: 'none',
};

const smallBtnStyle: CSSProperties = {
  padding: '0.25rem 0.625rem',
  fontSize: '0.75rem',
  fontWeight: 500,
  border: '1px solid #d1d5db',
  borderRadius: '0.25rem',
  cursor: 'pointer',
  backgroundColor: '#fff',
  color: '#374151',
};

const dangerBtnStyle: CSSProperties = {
  ...smallBtnStyle,
  color: '#dc2626',
  borderColor: '#fecaca',
};

const btnRowStyle: CSSProperties = {
  display: 'flex',
  gap: '0.5rem',
  justifyContent: 'flex-end',
  paddingTop: '1rem',
  borderTop: '1px solid #f3f4f6',
};

const primaryBtnStyle: CSSProperties = {
  padding: '0.5rem 1.25rem',
  fontSize: '0.875rem',
  fontWeight: 600,
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  backgroundColor: '#2563eb',
  color: '#fff',
};

const outlineBtnStyle: CSSProperties = {
  padding: '0.5rem 1.25rem',
  fontSize: '0.875rem',
  fontWeight: 600,
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  backgroundColor: '#fff',
  color: '#374151',
};

const toastStyle = (type: 'success' | 'error'): CSSProperties => ({
  position: 'fixed',
  bottom: '1.5rem',
  right: '1.5rem',
  padding: '0.75rem 1.25rem',
  borderRadius: '0.5rem',
  fontSize: '0.875rem',
  fontWeight: 500,
  color: '#fff',
  backgroundColor: type === 'success' ? '#16a34a' : '#dc2626',
  boxShadow: '0 4px 12px rgba(0,0,0,0.15)',
  zIndex: 9999,
});

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function ProcessParams() {
  const { t, i18n } = useTranslation();
  const lang = i18n.language === 'en' ? 'en' : 'es';

  const [allParams, setAllParams] = useState<ProcessParamsType[]>([]);
  const [expandedStage, setExpandedStage] = useState<ProcessStage | null>(null);
  const [editState, setEditState] = useState<Record<string, UpsertProcessParamsRequest>>({});
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [toast, setToast] = useState<{ msg: string; type: 'success' | 'error' } | null>(null);

  // ── Load ────────────────────────────────────────────────────────────────
  const load = useCallback(async () => {
    setLoading(true);
    try {
      const data = await paramsApi.fetchAllProcessParams();
      setAllParams(data);
    } catch {
      showToast('Error loading params', 'error');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => { load(); }, [load]);

  // ── Toast helper ────────────────────────────────────────────────────────
  function showToast(msg: string, type: 'success' | 'error') {
    setToast({ msg, type });
    setTimeout(() => setToast(null), 3000);
  }

  // ── Get edit state for a stage ──────────────────────────────────────────
  function getEdit(stage: ProcessStage): UpsertProcessParamsRequest {
    if (editState[stage]) return editState[stage];
    const p = allParams.find((pp) => pp.stage === stage);
    if (!p) return {};
    return {
      name: p.name,
      description: p.description ?? '',
      promptTemplate: p.promptTemplate ?? '',
      modelOverride: p.modelOverride ?? '',
      temperature: p.temperature,
      maxTokens: p.maxTokens,
      referenceDocument: p.referenceDocument ?? '',
      checklist: [...(p.checklist ?? [])],
      requiredFields: [...(p.requiredFields ?? [])],
      approvalRules: p.approvalRules ? { ...p.approvalRules } : { requireApproval: false, minApprovers: 0, approverRoles: [] },
      config: p.config ? { ...p.config } : {},
    };
  }

  function updateEdit(stage: ProcessStage, patch: Partial<UpsertProcessParamsRequest>) {
    setEditState((prev) => ({
      ...prev,
      [stage]: { ...getEdit(stage), ...patch },
    }));
  }

  // ── Expand/collapse ─────────────────────────────────────────────────────
  function toggleStage(stage: ProcessStage) {
    if (expandedStage === stage) {
      setExpandedStage(null);
    } else {
      setExpandedStage(stage);
      // Initialize edit state from current params
      if (!editState[stage]) {
        const p = allParams.find((pp) => pp.stage === stage);
        if (p) {
          setEditState((prev) => ({
            ...prev,
            [stage]: {
              name: p.name,
              description: p.description ?? '',
              promptTemplate: p.promptTemplate ?? '',
              modelOverride: p.modelOverride ?? '',
              temperature: p.temperature,
              maxTokens: p.maxTokens,
              referenceDocument: p.referenceDocument ?? '',
              checklist: [...(p.checklist ?? [])],
              requiredFields: [...(p.requiredFields ?? [])],
              approvalRules: p.approvalRules ? { ...p.approvalRules } : { requireApproval: false, minApprovers: 0, approverRoles: [] },
              config: {},
            },
          }));
        }
      }
    }
  }

  // ── Save ────────────────────────────────────────────────────────────────
  async function handleSave(stage: ProcessStage) {
    setSaving(true);
    try {
      const data = getEdit(stage);
      await paramsApi.upsertProcessParams(stage, data);
      showToast(t('processParams.saved'), 'success');
      // Clear edit state and reload
      setEditState((prev) => {
        const next = { ...prev };
        delete next[stage];
        return next;
      });
      await load();
    } catch {
      showToast('Error saving', 'error');
    } finally {
      setSaving(false);
    }
  }

  // ── Reset ───────────────────────────────────────────────────────────────
  async function handleReset(stage: ProcessStage) {
    setSaving(true);
    try {
      await paramsApi.resetProcessParams(stage);
      showToast(t('processParams.saved'), 'success');
      setEditState((prev) => {
        const next = { ...prev };
        delete next[stage];
        return next;
      });
      await load();
    } catch {
      showToast('Error resetting', 'error');
    } finally {
      setSaving(false);
    }
  }

  // ── Checklist helpers ───────────────────────────────────────────────────
  function addChecklistItem(stage: ProcessStage) {
    const edit = getEdit(stage);
    const items = [...(edit.checklist ?? [])];
    items.push({ id: `item-${Date.now()}`, label: '', required: false });
    updateEdit(stage, { checklist: items });
  }

  function updateChecklistItem(stage: ProcessStage, idx: number, patch: Partial<ChecklistItem>) {
    const edit = getEdit(stage);
    const items = [...(edit.checklist ?? [])];
    items[idx] = { ...items[idx], ...patch };
    updateEdit(stage, { checklist: items });
  }

  function removeChecklistItem(stage: ProcessStage, idx: number) {
    const edit = getEdit(stage);
    const items = [...(edit.checklist ?? [])];
    items.splice(idx, 1);
    updateEdit(stage, { checklist: items });
  }

  // ── Required Fields helpers ─────────────────────────────────────────────
  function addRequiredField(stage: ProcessStage) {
    const edit = getEdit(stage);
    const fields = [...(edit.requiredFields ?? [])];
    fields.push({ field: '', label: '', type: 'text' });
    updateEdit(stage, { requiredFields: fields });
  }

  function updateRequiredField(stage: ProcessStage, idx: number, patch: Partial<RequiredField>) {
    const edit = getEdit(stage);
    const fields = [...(edit.requiredFields ?? [])];
    fields[idx] = { ...fields[idx], ...patch };
    updateEdit(stage, { requiredFields: fields });
  }

  function removeRequiredField(stage: ProcessStage, idx: number) {
    const edit = getEdit(stage);
    const fields = [...(edit.requiredFields ?? [])];
    fields.splice(idx, 1);
    updateEdit(stage, { requiredFields: fields });
  }

  // ── Render ──────────────────────────────────────────────────────────────

  if (loading) {
    return <div style={containerStyle}><p>{t('common.loading')}</p></div>;
  }

  return (
    <div style={containerStyle}>
      {/* Pipeline visualization */}
      <div style={pipelineBarStyle}>
        {PROCESS_STAGES.map((stage, idx) => {
          const hasConfig = allParams.find((p) => p.stage === stage && p.id !== '');
          return (
            <div key={stage} style={{ display: 'flex', alignItems: 'center' }}>
              <div
                style={pipelineStepStyle(!!hasConfig, expandedStage === stage)}
                onClick={() => toggleStage(stage)}
              >
                <div style={stepNumberStyle(expandedStage === stage)}>
                  {STAGE_ICONS[stage]}
                </div>
                <span style={stepLabelStyle}>{STAGE_LABELS[stage][lang]}</span>
              </div>
              {idx < PROCESS_STAGES.length - 1 && <span style={arrowStyle}>&rarr;</span>}
            </div>
          );
        })}
      </div>

      {/* Stage cards */}
      {PROCESS_STAGES.map((stage) => {
        const p = allParams.find((pp) => pp.stage === stage);
        const isExpanded = expandedStage === stage;
        const edit = getEdit(stage);

        return (
          <div key={stage} style={cardStyle}>
            {/* Card header */}
            <div style={cardHeaderStyle} onClick={() => toggleStage(stage)}>
              <div>
                <div style={cardTitleStyle}>
                  {STAGE_LABELS[stage][lang]} — {p?.name ?? stage}
                </div>
                <div style={cardDescStyle}>{p?.description ?? ''}</div>
                {/* Checklist preview */}
                {!isExpanded && p?.checklist && p.checklist.length > 0 && (
                  <div style={checklistPreviewStyle}>
                    {p.checklist.map((item) => (
                      <span key={item.id} style={checkBadgeStyle(item.required)}>
                        {item.label}
                      </span>
                    ))}
                  </div>
                )}
              </div>
              <span style={{ fontSize: '1.25rem', color: '#9ca3af' }}>
                {isExpanded ? '\u25B2' : '\u25BC'}
              </span>
            </div>

            {/* Expanded edit form */}
            {isExpanded && (
              <div style={expandedStyle}>
                {/* Name */}
                <div style={fieldGroupStyle}>
                  <label style={labelStyle}>{t('common.name')}</label>
                  <input
                    type="text"
                    style={inputStyle}
                    value={edit.name ?? ''}
                    onChange={(e) => updateEdit(stage, { name: e.target.value })}
                  />
                </div>

                {/* Description */}
                <div style={fieldGroupStyle}>
                  <label style={labelStyle}>{t('common.description')}</label>
                  <textarea
                    style={textareaStyle}
                    value={edit.description ?? ''}
                    onChange={(e) => updateEdit(stage, { description: e.target.value })}
                  />
                </div>

                {/* Prompt Template */}
                <div style={fieldGroupStyle}>
                  <label style={labelStyle}>{t('processParams.prompt')}</label>
                  <textarea
                    style={{ ...textareaStyle, minHeight: '120px', fontFamily: 'monospace', fontSize: '0.8125rem' }}
                    value={edit.promptTemplate ?? ''}
                    onChange={(e) => updateEdit(stage, { promptTemplate: e.target.value })}
                  />
                </div>

                {/* Model & Temperature row */}
                <div style={rowStyle}>
                  <div style={fieldGroupStyle}>
                    <label style={labelStyle}>{t('processParams.model')}</label>
                    <select
                      style={selectStyle}
                      value={edit.modelOverride ?? ''}
                      onChange={(e) => updateEdit(stage, { modelOverride: e.target.value || undefined })}
                    >
                      <option value="">Default</option>
                      <option value="claude-sonnet-4-20250514">Claude Sonnet 4</option>
                      <option value="claude-opus-4-20250514">Claude Opus 4</option>
                      <option value="gpt-4o">GPT-4o</option>
                      <option value="gpt-4o-mini">GPT-4o Mini</option>
                      <option value="gemini-2.5-pro">Gemini 2.5 Pro</option>
                    </select>
                  </div>
                  <div style={fieldGroupStyle}>
                    <label style={labelStyle}>{t('processParams.temperature')}</label>
                    <div style={sliderContainerStyle}>
                      <input
                        type="range"
                        min="0"
                        max="1"
                        step="0.05"
                        style={sliderStyle}
                        value={edit.temperature ?? 0.7}
                        onChange={(e) => updateEdit(stage, { temperature: parseFloat(e.target.value) })}
                      />
                      <span style={sliderValueStyle}>{(edit.temperature ?? 0.7).toFixed(2)}</span>
                    </div>
                  </div>
                </div>

                {/* Max Tokens */}
                <div style={rowStyle}>
                  <div style={fieldGroupStyle}>
                    <label style={labelStyle}>Max Tokens</label>
                    <input
                      type="number"
                      style={inputStyle}
                      value={edit.maxTokens ?? 4096}
                      onChange={(e) => updateEdit(stage, { maxTokens: parseInt(e.target.value, 10) || 4096 })}
                    />
                  </div>
                  <div />
                </div>

                {/* Reference Document */}
                <div style={fieldGroupStyle}>
                  <label style={labelStyle}>{t('processParams.referenceDoc')}</label>
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
                          updateEdit(stage, { referenceDocument: text });
                        };
                        input.click();
                      }}
                    >
                      📁 {t('processParams.uploadMd')}
                    </button>
                    {edit.referenceDocument && (
                      <button
                        type="button"
                        className="app-button"
                        style={{ fontSize: '0.8rem' }}
                        onClick={() => updateEdit(stage, { referenceDocument: '' })}
                      >
                        ✕ {t('common.delete')}
                      </button>
                    )}
                  </div>
                  <textarea
                    style={textareaStyle}
                    value={edit.referenceDocument ?? ''}
                    onChange={(e) => updateEdit(stage, { referenceDocument: e.target.value })}
                    placeholder={t('processParams.referenceDocPlaceholder')}
                  />
                </div>

                {/* Checklist */}
                <div style={fieldGroupStyle}>
                  <label style={labelStyle}>{t('processParams.checklist')}</label>
                  {(edit.checklist ?? []).map((item, idx) => (
                    <div key={item.id || idx} style={checklistItemStyle}>
                      <input
                        type="text"
                        style={checklistInputStyle}
                        placeholder="Label"
                        value={item.label}
                        onChange={(e) => updateChecklistItem(stage, idx, { label: e.target.value })}
                      />
                      <label style={{ fontSize: '0.75rem', display: 'flex', alignItems: 'center', gap: '0.25rem', whiteSpace: 'nowrap' }}>
                        <input
                          type="checkbox"
                          checked={item.required}
                          onChange={(e) => updateChecklistItem(stage, idx, { required: e.target.checked })}
                        />
                        {t('processParams.required')}
                      </label>
                      <button type="button" style={dangerBtnStyle} onClick={() => removeChecklistItem(stage, idx)}>
                        &times;
                      </button>
                    </div>
                  ))}
                  <button type="button" style={{ ...smallBtnStyle, marginTop: '0.5rem' }} onClick={() => addChecklistItem(stage)}>
                    + {t('processParams.addItem')}
                  </button>
                </div>

                {/* Required Fields */}
                <div style={fieldGroupStyle}>
                  <label style={labelStyle}>{t('processParams.requiredFields')}</label>
                  {(edit.requiredFields ?? []).map((field, idx) => (
                    <div key={idx} style={{ ...checklistItemStyle, gap: '0.375rem' }}>
                      <input
                        type="text"
                        style={{ ...checklistInputStyle, flex: '0 0 30%' }}
                        placeholder="Field"
                        value={field.field}
                        onChange={(e) => updateRequiredField(stage, idx, { field: e.target.value })}
                      />
                      <input
                        type="text"
                        style={checklistInputStyle}
                        placeholder="Label"
                        value={field.label}
                        onChange={(e) => updateRequiredField(stage, idx, { label: e.target.value })}
                      />
                      <select
                        style={{ ...selectStyle, flex: '0 0 100px' }}
                        value={field.type}
                        onChange={(e) => updateRequiredField(stage, idx, { type: e.target.value as RequiredField['type'] })}
                      >
                        <option value="text">Text</option>
                        <option value="select">Select</option>
                        <option value="number">Number</option>
                        <option value="date">Date</option>
                      </select>
                      <button type="button" style={dangerBtnStyle} onClick={() => removeRequiredField(stage, idx)}>
                        &times;
                      </button>
                    </div>
                  ))}
                  <button type="button" style={{ ...smallBtnStyle, marginTop: '0.5rem' }} onClick={() => addRequiredField(stage)}>
                    + {t('processParams.addItem')}
                  </button>
                </div>

                {/* Approval Rules */}
                <div style={fieldGroupStyle}>
                  <label style={labelStyle}>{t('processParams.approvalRules')}</label>
                  <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem', paddingLeft: '0.25rem' }}>
                    <label style={{ fontSize: '0.8125rem', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                      <input
                        type="checkbox"
                        checked={edit.approvalRules?.requireApproval ?? false}
                        onChange={(e) =>
                          updateEdit(stage, {
                            approvalRules: { ...(edit.approvalRules as ApprovalRules), requireApproval: e.target.checked },
                          })
                        }
                      />
                      {t('processParams.requireApproval')}
                    </label>
                    <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'center' }}>
                      <label style={{ fontSize: '0.8125rem', whiteSpace: 'nowrap' }}>{t('processParams.minApprovers')}</label>
                      <input
                        type="number"
                        min="0"
                        max="10"
                        style={{ ...inputStyle, width: '80px' }}
                        value={edit.approvalRules?.minApprovers ?? 0}
                        onChange={(e) =>
                          updateEdit(stage, {
                            approvalRules: { ...(edit.approvalRules as ApprovalRules), minApprovers: parseInt(e.target.value, 10) || 0 },
                          })
                        }
                      />
                    </div>
                    <div>
                      <label style={{ fontSize: '0.8125rem' }}>{t('processParams.approverRoles')}</label>
                      <input
                        type="text"
                        style={{ ...inputStyle, marginTop: '0.25rem' }}
                        placeholder="admin, tech_lead, release_manager"
                        value={(edit.approvalRules?.approverRoles ?? []).join(', ')}
                        onChange={(e) =>
                          updateEdit(stage, {
                            approvalRules: {
                              ...(edit.approvalRules as ApprovalRules),
                              approverRoles: e.target.value
                                .split(',')
                                .map((s) => s.trim())
                                .filter(Boolean),
                            },
                          })
                        }
                      />
                    </div>
                  </div>
                </div>

                {/* Action buttons */}
                <div style={btnRowStyle}>
                  <button
                    type="button"
                    style={outlineBtnStyle}
                    disabled={saving}
                    onClick={() => handleReset(stage)}
                  >
                    {t('processParams.reset')}
                  </button>
                  <button
                    type="button"
                    style={primaryBtnStyle}
                    disabled={saving}
                    onClick={() => handleSave(stage)}
                  >
                    {saving ? '...' : t('processParams.save')}
                  </button>
                </div>
              </div>
            )}
          </div>
        );
      })}

      {/* Toast */}
      {toast && <div style={toastStyle(toast.type)}>{toast.msg}</div>}
    </div>
  );
}

export default ProcessParams;
