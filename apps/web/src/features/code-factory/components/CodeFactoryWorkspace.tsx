import { useState, useEffect, useCallback, type CSSProperties } from 'react';
import type {
  FactorySpec,
  FactoryJob,
  FactoryTemplate,
  FactoryComponentType,
  GeneratedOutput,
} from '@apex-dev-manager/shared-types';
import * as factoryApi from '@/services/factory.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  height: '100%',
  overflowY: 'auto',
  display: 'flex',
  gap: '1.5rem',
};

const leftPanel: CSSProperties = {
  width: 400,
  minWidth: 360,
  display: 'flex',
  flexDirection: 'column',
  gap: '1rem',
};

const rightPanel: CSSProperties = {
  flex: 1,
  minWidth: 0,
};

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1rem',
  backgroundColor: '#fff',
};

const inputStyle: CSSProperties = {
  width: '100%',
  padding: '0.5rem 0.75rem',
  fontSize: '0.875rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  marginBottom: '0.5rem',
  boxSizing: 'border-box' as const,
};

const textareaStyle: CSSProperties = {
  ...inputStyle,
  minHeight: 100,
  resize: 'vertical' as const,
  fontFamily: 'inherit',
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

const buttonStyle: CSSProperties = {
  padding: '0.625rem 1.25rem',
  fontSize: '0.875rem',
  fontWeight: 500,
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  backgroundColor: '#2563eb',
  color: '#fff',
  width: '100%',
};

const secondaryButton: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#f3f4f6',
  color: '#374151',
  border: '1px solid #d1d5db',
};

const sectionTitle: CSSProperties = {
  fontSize: '1rem',
  fontWeight: 600,
  color: '#111827',
  marginBottom: '0.75rem',
};

const outputTabStyle: CSSProperties = {
  padding: '0.5rem 0.75rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  border: '1px solid #e5e7eb',
  borderBottom: 'none',
  cursor: 'pointer',
  backgroundColor: '#f9fafb',
  borderRadius: '0.375rem 0.375rem 0 0',
};

const outputTabActive: CSSProperties = {
  ...outputTabStyle,
  backgroundColor: '#fff',
  borderColor: '#d1d5db',
  color: '#2563eb',
};

const codePreStyle: CSSProperties = {
  fontSize: '0.8125rem',
  lineHeight: 1.5,
  padding: '1rem',
  backgroundColor: '#1e293b',
  color: '#e2e8f0',
  borderRadius: '0 0.375rem 0.375rem 0.375rem',
  overflow: 'auto',
  maxHeight: 500,
  whiteSpace: 'pre-wrap' as const,
  fontFamily: 'ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace',
};

const jobCardStyle: CSSProperties = {
  ...cardStyle,
  marginBottom: '0.75rem',
  cursor: 'pointer',
};

const badgeBase: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.5rem',
  borderRadius: '9999px',
  fontSize: '0.6875rem',
  fontWeight: 600,
};

const componentTypes: FactoryComponentType[] = [
  'page',
  'region',
  'process',
  'validation',
  'computation',
  'dynamic-action',
  'rest-api',
  'plsql-package',
  'trigger',
  'view',
  'full-module',
];

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function CodeFactoryWorkspace() {
  const [templates, setTemplates] = useState<FactoryTemplate[]>([]);
  const [jobs, setJobs] = useState<FactoryJob[]>([]);
  const [selectedJob, setSelectedJob] = useState<FactoryJob | null>(null);
  const [selectedOutputIdx, setSelectedOutputIdx] = useState(0);
  const [generating, setGenerating] = useState(false);
  const [batchMode, setBatchMode] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Spec form
  const [specName, setSpecName] = useState('');
  const [specDescription, setSpecDescription] = useState('');
  const [specComponentType, setSpecComponentType] = useState<FactoryComponentType>('plsql-package');
  const [specConnectionId, setSpecConnectionId] = useState('default');
  const [specRequirements, setSpecRequirements] = useState('');
  const [specConstraints, setSpecConstraints] = useState('');
  const [specTemplateId, setSpecTemplateId] = useState('');

  useEffect(() => {
    loadData();
  }, []);

  const loadData = useCallback(async () => {
    try {
      const [t, j] = await Promise.all([factoryApi.getTemplates(), factoryApi.listJobs()]);
      setTemplates(t);
      setJobs(j);
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  const handleGenerate = useCallback(async () => {
    if (!specName || !specRequirements) return;
    setGenerating(true);
    setError(null);
    try {
      const spec: FactorySpec = {
        name: specName,
        description: specDescription,
        componentType: specComponentType,
        connectionId: specConnectionId,
        requirements: specRequirements,
        constraints: specConstraints ? specConstraints.split('\n').filter(Boolean) : undefined,
        templateId: specTemplateId || undefined,
      };

      const job = await factoryApi.generateFromSpec(spec);
      setSelectedJob(job);
      setSelectedOutputIdx(0);
      await loadData();

      // Clear form
      setSpecName('');
      setSpecDescription('');
      setSpecRequirements('');
      setSpecConstraints('');
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setGenerating(false);
    }
  }, [
    specName,
    specDescription,
    specComponentType,
    specConnectionId,
    specRequirements,
    specConstraints,
    specTemplateId,
    loadData,
  ]);

  const handleSelectJob = useCallback(async (job: FactoryJob) => {
    try {
      const fullJob = await factoryApi.getJob(job.id);
      setSelectedJob(fullJob);
      setSelectedOutputIdx(0);
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  const statusBadge = (status: string): CSSProperties => {
    const colors: Record<string, { bg: string; color: string }> = {
      completed: { bg: '#dcfce7', color: '#166534' },
      processing: { bg: '#dbeafe', color: '#1e40af' },
      failed: { bg: '#fef2f2', color: '#991b1b' },
      queued: { bg: '#f3f4f6', color: '#6b7280' },
      cancelled: { bg: '#f3f4f6', color: '#6b7280' },
    };
    const c = colors[status] ?? colors.queued;
    return { ...badgeBase, backgroundColor: c.bg, color: c.color };
  };

  return (
    <div style={containerStyle}>
      {/* Left panel: Spec input form */}
      <div style={leftPanel}>
        <div style={cardStyle}>
          <div
            style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              marginBottom: '0.75rem',
            }}
          >
            <div style={sectionTitle}>Code Factory</div>
            <label
              style={{
                fontSize: '0.75rem',
                display: 'flex',
                alignItems: 'center',
                gap: '0.375rem',
                cursor: 'pointer',
              }}
            >
              <input
                type="checkbox"
                checked={batchMode}
                onChange={(e) => setBatchMode(e.target.checked)}
              />
              Batch Mode
            </label>
          </div>

          <label style={labelStyle}>Component Name *</label>
          <input
            type="text"
            style={inputStyle}
            value={specName}
            onChange={(e) => setSpecName(e.target.value)}
            placeholder="e.g., employee_management"
          />

          <label style={labelStyle}>Description</label>
          <input
            type="text"
            style={inputStyle}
            value={specDescription}
            onChange={(e) => setSpecDescription(e.target.value)}
            placeholder="Brief description"
          />

          <label style={labelStyle}>Component Type</label>
          <select
            style={selectStyle}
            value={specComponentType}
            onChange={(e) => setSpecComponentType(e.target.value as FactoryComponentType)}
          >
            {componentTypes.map((t) => (
              <option key={t} value={t}>
                {t.replace(/-/g, ' ')}
              </option>
            ))}
          </select>

          <label style={labelStyle}>Template (optional)</label>
          <select
            style={selectStyle}
            value={specTemplateId}
            onChange={(e) => setSpecTemplateId(e.target.value)}
          >
            <option value="">No template</option>
            {templates.map((t) => (
              <option key={t.id} value={t.id}>
                {t.name}
              </option>
            ))}
          </select>

          <label style={labelStyle}>Requirements *</label>
          <textarea
            style={textareaStyle}
            value={specRequirements}
            onChange={(e) => setSpecRequirements(e.target.value)}
            placeholder="Describe what this component should do..."
          />

          <label style={labelStyle}>Constraints (one per line)</label>
          <textarea
            style={{ ...textareaStyle, minHeight: 60 }}
            value={specConstraints}
            onChange={(e) => setSpecConstraints(e.target.value)}
            placeholder="Optional constraints..."
          />

          <button
            type="button"
            style={buttonStyle}
            onClick={handleGenerate}
            disabled={generating || !specName || !specRequirements}
          >
            {generating ? 'Generating...' : 'Generate Code'}
          </button>

          {error && (
            <div
              style={{
                padding: '0.5rem',
                backgroundColor: '#fef2f2',
                borderRadius: '0.375rem',
                color: '#991b1b',
                marginTop: '0.5rem',
                fontSize: '0.8125rem',
              }}
            >
              {error}
            </div>
          )}
        </div>

        {/* Recent jobs */}
        <div>
          <div style={sectionTitle}>Recent Jobs</div>
          {jobs.length === 0 ? (
            <div style={{ color: '#9ca3af', fontSize: '0.8125rem' }}>No generation jobs yet.</div>
          ) : (
            jobs.slice(0, 10).map((job) => (
              <div
                key={job.id}
                style={{
                  ...jobCardStyle,
                  borderColor: selectedJob?.id === job.id ? '#2563eb' : '#e5e7eb',
                }}
                onClick={() => handleSelectJob(job)}
              >
                <div
                  style={{
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'flex-start',
                  }}
                >
                  <div>
                    <div style={{ fontWeight: 500, fontSize: '0.875rem' }}>{job.spec.name}</div>
                    <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>
                      {job.spec.componentType}
                    </div>
                  </div>
                  <span style={statusBadge(job.status)}>{job.status}</span>
                </div>
                <div style={{ fontSize: '0.6875rem', color: '#9ca3af', marginTop: '0.25rem' }}>
                  {job.outputs.length} files |{' '}
                  {job.executionTimeMs ? `${job.executionTimeMs}ms` : 'pending'}
                </div>
              </div>
            ))
          )}
        </div>
      </div>

      {/* Right panel: Output preview */}
      <div style={rightPanel}>
        <div style={sectionTitle}>Generated Output</div>
        {selectedJob ? (
          <div>
            {/* Output tabs */}
            {selectedJob.outputs.length > 0 ? (
              <>
                <div style={{ display: 'flex', gap: '2px', flexWrap: 'wrap' }}>
                  {selectedJob.outputs.map((output, idx) => (
                    <button
                      key={output.id}
                      type="button"
                      style={idx === selectedOutputIdx ? outputTabActive : outputTabStyle}
                      onClick={() => setSelectedOutputIdx(idx)}
                    >
                      {output.filename}
                    </button>
                  ))}
                </div>
                <div>
                  <pre style={codePreStyle}>
                    {selectedJob.outputs[selectedOutputIdx]?.content ?? ''}
                  </pre>
                  <div
                    style={{
                      display: 'flex',
                      justifyContent: 'space-between',
                      alignItems: 'center',
                      marginTop: '0.5rem',
                    }}
                  >
                    <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>
                      {selectedJob.outputs[selectedOutputIdx]?.language} |{' '}
                      {selectedJob.outputs[selectedOutputIdx]?.lineCount} lines |{' '}
                      {selectedJob.outputs[selectedOutputIdx]?.description}
                    </div>
                    <button
                      type="button"
                      style={{
                        ...buttonStyle,
                        width: 'auto',
                        padding: '0.375rem 1rem',
                        fontSize: '0.8125rem',
                      }}
                      onClick={() => {
                        navigator.clipboard.writeText(
                          selectedJob.outputs[selectedOutputIdx]?.content ?? '',
                        );
                      }}
                    >
                      Copy to Clipboard
                    </button>
                  </div>
                </div>
              </>
            ) : (
              <div style={{ ...cardStyle, textAlign: 'center', padding: '2rem', color: '#6b7280' }}>
                {selectedJob.status === 'processing'
                  ? 'Generating code...'
                  : 'No outputs generated.'}
              </div>
            )}

            {/* Job metadata */}
            <div style={{ ...cardStyle, marginTop: '1rem' }}>
              <div
                className="app-responsive-two-column"
                style={{
                  fontSize: '0.8125rem',
                  display: 'grid',
                  gridTemplateColumns: '1fr 1fr',
                  gap: '0.5rem',
                }}
              >
                <div>
                  <strong>Status:</strong>{' '}
                  <span style={statusBadge(selectedJob.status)}>{selectedJob.status}</span>
                </div>
                <div>
                  <strong>Files:</strong> {selectedJob.outputs.length}
                </div>
                <div>
                  <strong>Execution:</strong>{' '}
                  {selectedJob.executionTimeMs ? `${selectedJob.executionTimeMs}ms` : '-'}
                </div>
                <div>
                  <strong>Tokens:</strong> {selectedJob.tokensUsed?.toLocaleString() ?? '-'}
                </div>
              </div>
            </div>
          </div>
        ) : (
          <div style={{ ...cardStyle, textAlign: 'center', padding: '3rem', color: '#6b7280' }}>
            Fill in the specification and click "Generate Code" to create APEX components.
          </div>
        )}
      </div>
    </div>
  );
}

export default CodeFactoryWorkspace;
