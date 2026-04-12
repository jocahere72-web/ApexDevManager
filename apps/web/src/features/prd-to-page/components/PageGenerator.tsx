import { useState, useCallback, type CSSProperties } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import type { PageGenerationJob, PageDefinition } from '@apex-dev-manager/shared-types';
import {
  generatePage,
  fetchJobs,
  fetchJob,
  applyPage,
} from '../../../services/prd.api';
import type { GeneratePageParams } from '../../../services/prd.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  display: 'flex',
  height: '100%',
  overflow: 'hidden',
};

const leftPanelStyle: CSSProperties = {
  flex: 1,
  display: 'flex',
  flexDirection: 'column',
  overflow: 'hidden',
  borderRight: '1px solid #e5e7eb',
};

const rightPanelStyle: CSSProperties = {
  flex: 1,
  display: 'flex',
  flexDirection: 'column',
  overflow: 'hidden',
};

const panelHeaderStyle: CSSProperties = {
  padding: '1rem 1.25rem',
  borderBottom: '1px solid #e5e7eb',
  backgroundColor: '#f9fafb',
};

const panelTitleStyle: CSSProperties = {
  fontSize: '0.9375rem',
  fontWeight: 600,
  color: '#111827',
  margin: 0,
};

const panelContentStyle: CSSProperties = {
  flex: 1,
  overflowY: 'auto',
  padding: '1.25rem',
};

const formGroupStyle: CSSProperties = {
  marginBottom: '1rem',
};

const labelStyle: CSSProperties = {
  display: 'block',
  fontSize: '0.8125rem',
  fontWeight: 500,
  color: '#374151',
  marginBottom: '0.375rem',
};

const selectStyle: CSSProperties = {
  width: '100%',
  padding: '0.5rem 0.75rem',
  fontSize: '0.875rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  outline: 'none',
  backgroundColor: '#fff',
  boxSizing: 'border-box',
};

const textareaStyle: CSSProperties = {
  width: '100%',
  minHeight: '12rem',
  padding: '0.75rem',
  fontSize: '0.875rem',
  fontFamily: 'inherit',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  resize: 'vertical',
  outline: 'none',
  boxSizing: 'border-box',
};

const buttonStyle: CSSProperties = {
  display: 'inline-flex',
  alignItems: 'center',
  gap: '0.375rem',
  padding: '0.5rem 1rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  color: '#fff',
  backgroundColor: '#2563eb',
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  transition: 'background-color 0.15s',
};

const buttonSuccessStyle: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#059669',
};

const buttonSecondaryStyle: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#fff',
  color: '#374151',
  border: '1px solid #d1d5db',
};

const cardStyle: CSSProperties = {
  backgroundColor: '#fff',
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1rem',
  marginBottom: '1rem',
};

const badgeStyle: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.5rem',
  fontSize: '0.6875rem',
  fontWeight: 500,
  borderRadius: '9999px',
};

const jobItemStyle: CSSProperties = {
  padding: '0.625rem 0.75rem',
  marginBottom: '0.375rem',
  borderRadius: '0.375rem',
  border: '1px solid #e5e7eb',
  cursor: 'pointer',
  transition: 'all 0.15s',
};

const jobItemSelectedStyle: CSSProperties = {
  ...jobItemStyle,
  borderColor: '#2563eb',
  backgroundColor: '#eff6ff',
};

const previewSectionStyle: CSSProperties = {
  marginBottom: '0.75rem',
};

const previewLabelStyle: CSSProperties = {
  fontSize: '0.75rem',
  fontWeight: 600,
  color: '#6b7280',
  textTransform: 'uppercase',
  letterSpacing: '0.05em',
  marginBottom: '0.25rem',
};

const STATUS_COLORS: Record<string, { bg: string; color: string }> = {
  pending: { bg: '#f3f4f6', color: '#374151' },
  generating: { bg: '#fef3c7', color: '#b45309' },
  preview: { bg: '#dbeafe', color: '#1d4ed8' },
  applying: { bg: '#e0e7ff', color: '#4338ca' },
  applied: { bg: '#d1fae5', color: '#065f46' },
  error: { bg: '#fee2e2', color: '#991b1b' },
};

// ---------------------------------------------------------------------------
// Query keys
// ---------------------------------------------------------------------------

const pageGenKeys = {
  all: ['page-gen'] as const,
  jobs: () => [...pageGenKeys.all, 'jobs'] as const,
  job: (id: string) => [...pageGenKeys.all, 'job', id] as const,
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function PageGenerator() {
  const queryClient = useQueryClient();

  const [inputType, setInputType] = useState<'prd_section' | 'freeform' | 'requirements'>('freeform');
  const [inputContent, setInputContent] = useState('');
  const [prdSessionId, setPrdSessionId] = useState('');
  const [connectionId, setConnectionId] = useState('');
  const [selectedJobId, setSelectedJobId] = useState<string | null>(null);

  // Queries
  const { data: jobsData } = useQuery({
    queryKey: pageGenKeys.jobs(),
    queryFn: () => fetchJobs(),
  });

  const { data: selectedJob } = useQuery({
    queryKey: pageGenKeys.job(selectedJobId ?? ''),
    queryFn: () => fetchJob(selectedJobId!),
    enabled: !!selectedJobId,
    refetchInterval: (query) => {
      const job = query.state.data;
      if (job && (job.status === 'generating' || job.status === 'applying')) {
        return 2000;
      }
      return false;
    },
  });

  // Mutations
  const generateMutation = useMutation({
    mutationFn: (params: GeneratePageParams) => generatePage(params),
    onSuccess: (job) => {
      setSelectedJobId(job.id);
      queryClient.invalidateQueries({ queryKey: pageGenKeys.jobs() });
    },
  });

  const applyMutation = useMutation({
    mutationFn: (jobId: string) => applyPage(jobId),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: pageGenKeys.all });
    },
  });

  // Handlers
  const handleGenerate = useCallback(() => {
    if (!inputContent.trim()) return;

    generateMutation.mutate({
      inputType,
      inputContent: inputContent.trim(),
      prdSessionId: prdSessionId || undefined,
      connectionId: connectionId || undefined,
    });
  }, [generateMutation, inputType, inputContent, prdSessionId, connectionId]);

  const handleApply = useCallback(() => {
    if (!selectedJobId) return;
    applyMutation.mutate(selectedJobId);
  }, [applyMutation, selectedJobId]);

  const jobs = jobsData?.jobs ?? [];

  return (
    <div style={containerStyle}>
      {/* Left Panel: Input & Job List */}
      <div style={leftPanelStyle}>
        <div style={panelHeaderStyle}>
          <h3 style={panelTitleStyle}>Page Generator</h3>
        </div>
        <div style={panelContentStyle}>
          {/* Input Form */}
          <div style={cardStyle}>
            <div style={formGroupStyle}>
              <label style={labelStyle} htmlFor="input-type">
                Input Type
              </label>
              <select
                id="input-type"
                style={selectStyle}
                value={inputType}
                onChange={(e) => setInputType(e.target.value as typeof inputType)}
              >
                <option value="freeform">Freeform Description</option>
                <option value="prd_section">PRD Section</option>
                <option value="requirements">Requirements List</option>
              </select>
            </div>

            {inputType === 'prd_section' && (
              <div style={formGroupStyle}>
                <label style={labelStyle} htmlFor="prd-session-id">
                  PRD Session ID (optional)
                </label>
                <input
                  id="prd-session-id"
                  type="text"
                  style={{ ...selectStyle }}
                  value={prdSessionId}
                  onChange={(e) => setPrdSessionId(e.target.value)}
                  placeholder="UUID of PRD session"
                />
              </div>
            )}

            <div style={formGroupStyle}>
              <label style={labelStyle} htmlFor="connection-id">
                Connection ID (optional)
              </label>
              <input
                id="connection-id"
                type="text"
                style={{ ...selectStyle }}
                value={connectionId}
                onChange={(e) => setConnectionId(e.target.value)}
                placeholder="UUID of APEX connection"
              />
            </div>

            <div style={formGroupStyle}>
              <label style={labelStyle} htmlFor="input-content">
                {inputType === 'freeform'
                  ? 'Describe the page you want to create'
                  : inputType === 'prd_section'
                    ? 'Paste the PRD section content'
                    : 'List the requirements'}
              </label>
              <textarea
                id="input-content"
                style={textareaStyle}
                value={inputContent}
                onChange={(e) => setInputContent(e.target.value)}
                placeholder={
                  inputType === 'freeform'
                    ? 'e.g., Create an employee management page with a report showing all employees, an edit form with first name, last name, email, department, and hire date fields...'
                    : inputType === 'prd_section'
                      ? 'Paste the PRD section text here...'
                      : '1. User can view all records\n2. User can create new records\n3. User can edit existing records...'
                }
              />
            </div>

            <button
              type="button"
              style={buttonStyle}
              onClick={handleGenerate}
              disabled={!inputContent.trim() || generateMutation.isPending}
            >
              {generateMutation.isPending ? 'Generating...' : 'Generate Page'}
            </button>
          </div>

          {/* Job History */}
          {jobs.length > 0 && (
            <div>
              <h4
                style={{
                  fontSize: '0.875rem',
                  fontWeight: 600,
                  color: '#111827',
                  marginBottom: '0.5rem',
                }}
              >
                Recent Jobs
              </h4>
              {jobs.map((job) => {
                const colors = STATUS_COLORS[job.status] ?? STATUS_COLORS.pending;
                const isSelected = job.id === selectedJobId;

                return (
                  <div
                    key={job.id}
                    style={isSelected ? jobItemSelectedStyle : jobItemStyle}
                    onClick={() => setSelectedJobId(job.id)}
                    role="button"
                    tabIndex={0}
                    onKeyDown={(e) => {
                      if (e.key === 'Enter' || e.key === ' ') setSelectedJobId(job.id);
                    }}
                  >
                    <div
                      style={{
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'space-between',
                      }}
                    >
                      <span style={{ fontSize: '0.8125rem', color: '#111827', fontWeight: 500 }}>
                        {job.pageDefinition?.pageName ?? `Job ${job.id.substring(0, 8)}`}
                      </span>
                      <span
                        style={{
                          ...badgeStyle,
                          backgroundColor: colors.bg,
                          color: colors.color,
                        }}
                      >
                        {job.status}
                      </span>
                    </div>
                    <div style={{ fontSize: '0.6875rem', color: '#6b7280', marginTop: '0.25rem' }}>
                      {job.inputType} - {new Date(job.createdAt).toLocaleDateString()}
                    </div>
                  </div>
                );
              })}
            </div>
          )}
        </div>
      </div>

      {/* Right Panel: Preview */}
      <div style={rightPanelStyle}>
        <div style={panelHeaderStyle}>
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
            <h3 style={panelTitleStyle}>Page Preview</h3>
            {selectedJob && selectedJob.status === 'preview' && (
              <button
                type="button"
                style={buttonSuccessStyle}
                onClick={handleApply}
                disabled={applyMutation.isPending}
              >
                {applyMutation.isPending ? 'Applying...' : 'Apply to APEX'}
              </button>
            )}
          </div>
        </div>
        <div style={panelContentStyle}>
          {!selectedJob && (
            <div
              style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                height: '100%',
                color: '#6b7280',
                fontSize: '0.8125rem',
                textAlign: 'center',
              }}
            >
              <div>
                <p style={{ marginBottom: '0.5rem' }}>No page selected</p>
                <p>Generate a page or select a job to preview</p>
              </div>
            </div>
          )}

          {selectedJob && selectedJob.status === 'generating' && (
            <div
              style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                height: '100%',
                color: '#b45309',
                fontSize: '0.875rem',
              }}
            >
              Generating page definition...
            </div>
          )}

          {selectedJob && selectedJob.status === 'error' && (
            <div style={cardStyle}>
              <div style={{ color: '#dc2626', fontSize: '0.875rem', fontWeight: 500, marginBottom: '0.5rem' }}>
                Generation Failed
              </div>
              <div style={{ fontSize: '0.8125rem', color: '#6b7280' }}>
                {selectedJob.errorMessage ?? 'An unknown error occurred'}
              </div>
            </div>
          )}

          {selectedJob && selectedJob.status === 'applied' && (
            <div
              style={{
                ...cardStyle,
                backgroundColor: '#f0fdf4',
                borderColor: '#bbf7d0',
              }}
            >
              <div style={{ color: '#059669', fontSize: '0.875rem', fontWeight: 500 }}>
                Page Applied Successfully
              </div>
              {selectedJob.appliedPageId && (
                <div style={{ fontSize: '0.8125rem', color: '#6b7280', marginTop: '0.25rem' }}>
                  APEX Page ID: {selectedJob.appliedPageId}
                </div>
              )}
            </div>
          )}

          {selectedJob?.pageDefinition && (
            <PageDefinitionPreview definition={selectedJob.pageDefinition} />
          )}
        </div>
      </div>
    </div>
  );
}

// ---------------------------------------------------------------------------
// Page Definition Preview Subcomponent
// ---------------------------------------------------------------------------

interface PageDefinitionPreviewProps {
  definition: PageDefinition;
}

function PageDefinitionPreview({ definition }: PageDefinitionPreviewProps) {
  const [viewMode, setViewMode] = useState<'visual' | 'json'>('visual');

  return (
    <div>
      {/* View toggle */}
      <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '1rem' }}>
        <button
          type="button"
          style={viewMode === 'visual' ? buttonStyle : buttonSecondaryStyle}
          onClick={() => setViewMode('visual')}
        >
          Visual
        </button>
        <button
          type="button"
          style={viewMode === 'json' ? buttonStyle : buttonSecondaryStyle}
          onClick={() => setViewMode('json')}
        >
          JSON
        </button>
      </div>

      {viewMode === 'json' ? (
        <pre
          style={{
            backgroundColor: '#f9fafb',
            padding: '1rem',
            borderRadius: '0.375rem',
            fontSize: '0.75rem',
            lineHeight: 1.5,
            overflowX: 'auto',
            border: '1px solid #e5e7eb',
            whiteSpace: 'pre-wrap',
            wordBreak: 'break-word',
          }}
        >
          {JSON.stringify(definition, null, 2)}
        </pre>
      ) : (
        <div>
          {/* Page Info */}
          <div style={cardStyle}>
            <div style={previewSectionStyle}>
              <div style={previewLabelStyle}>Page Name</div>
              <div style={{ fontSize: '1rem', fontWeight: 600, color: '#111827' }}>
                {definition.pageName}
              </div>
            </div>
            <div style={{ display: 'flex', gap: '1.5rem' }}>
              <div style={previewSectionStyle}>
                <div style={previewLabelStyle}>Alias</div>
                <div style={{ fontSize: '0.8125rem', color: '#4b5563' }}>
                  {definition.pageAlias}
                </div>
              </div>
              <div style={previewSectionStyle}>
                <div style={previewLabelStyle}>Mode</div>
                <div style={{ fontSize: '0.8125rem', color: '#4b5563' }}>
                  {definition.pageMode}
                </div>
              </div>
              {definition.pageTemplate && (
                <div style={previewSectionStyle}>
                  <div style={previewLabelStyle}>Template</div>
                  <div style={{ fontSize: '0.8125rem', color: '#4b5563' }}>
                    {definition.pageTemplate}
                  </div>
                </div>
              )}
            </div>
          </div>

          {/* Regions */}
          {definition.regions.length > 0 && (
            <div style={cardStyle}>
              <div style={{ ...previewLabelStyle, marginBottom: '0.5rem' }}>
                Regions ({definition.regions.length})
              </div>
              {definition.regions.map((region, i) => (
                <div
                  key={i}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '0.5rem',
                    padding: '0.375rem 0',
                    borderBottom: i < definition.regions.length - 1 ? '1px solid #f3f4f6' : 'none',
                    fontSize: '0.8125rem',
                  }}
                >
                  <span style={{ fontWeight: 500, color: '#111827' }}>{region.name}</span>
                  <span
                    style={{
                      ...badgeStyle,
                      backgroundColor: '#eff6ff',
                      color: '#2563eb',
                    }}
                  >
                    {region.type}
                  </span>
                  <span style={{ color: '#9ca3af', marginLeft: 'auto' }}>
                    #{region.displaySequence}
                  </span>
                </div>
              ))}
            </div>
          )}

          {/* Items */}
          {definition.items.length > 0 && (
            <div style={cardStyle}>
              <div style={{ ...previewLabelStyle, marginBottom: '0.5rem' }}>
                Items ({definition.items.length})
              </div>
              {definition.items.map((item, i) => (
                <div
                  key={i}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '0.5rem',
                    padding: '0.375rem 0',
                    borderBottom: i < definition.items.length - 1 ? '1px solid #f3f4f6' : 'none',
                    fontSize: '0.8125rem',
                  }}
                >
                  <span style={{ fontWeight: 500, color: '#111827', fontFamily: 'monospace' }}>
                    {item.name}
                  </span>
                  <span
                    style={{
                      ...badgeStyle,
                      backgroundColor: '#f0fdf4',
                      color: '#059669',
                    }}
                  >
                    {item.itemType}
                  </span>
                  {item.isRequired && (
                    <span style={{ color: '#dc2626', fontSize: '0.6875rem' }}>required</span>
                  )}
                  <span style={{ color: '#9ca3af', marginLeft: 'auto', fontSize: '0.75rem' }}>
                    {item.regionName}
                  </span>
                </div>
              ))}
            </div>
          )}

          {/* Processes */}
          {definition.processes.length > 0 && (
            <div style={cardStyle}>
              <div style={{ ...previewLabelStyle, marginBottom: '0.5rem' }}>
                Processes ({definition.processes.length})
              </div>
              {definition.processes.map((proc, i) => (
                <div
                  key={i}
                  style={{
                    padding: '0.5rem 0',
                    borderBottom: i < definition.processes.length - 1 ? '1px solid #f3f4f6' : 'none',
                    fontSize: '0.8125rem',
                  }}
                >
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                    <span style={{ fontWeight: 500, color: '#111827' }}>{proc.name}</span>
                    <span
                      style={{ ...badgeStyle, backgroundColor: '#fef3c7', color: '#b45309' }}
                    >
                      {proc.type}
                    </span>
                    <span style={{ fontSize: '0.6875rem', color: '#9ca3af' }}>{proc.point}</span>
                  </div>
                </div>
              ))}
            </div>
          )}

          {/* Validations */}
          {definition.validations.length > 0 && (
            <div style={cardStyle}>
              <div style={{ ...previewLabelStyle, marginBottom: '0.5rem' }}>
                Validations ({definition.validations.length})
              </div>
              {definition.validations.map((val, i) => (
                <div
                  key={i}
                  style={{
                    padding: '0.5rem 0',
                    borderBottom:
                      i < definition.validations.length - 1 ? '1px solid #f3f4f6' : 'none',
                    fontSize: '0.8125rem',
                  }}
                >
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                    <span style={{ fontWeight: 500, color: '#111827' }}>{val.name}</span>
                    <span
                      style={{ ...badgeStyle, backgroundColor: '#fee2e2', color: '#991b1b' }}
                    >
                      {val.validationType}
                    </span>
                    {val.itemName && (
                      <span style={{ fontFamily: 'monospace', fontSize: '0.75rem', color: '#6b7280' }}>
                        {val.itemName}
                      </span>
                    )}
                  </div>
                  <div style={{ fontSize: '0.75rem', color: '#6b7280', marginTop: '0.125rem' }}>
                    {val.errorMessage}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  );
}

export default PageGenerator;
