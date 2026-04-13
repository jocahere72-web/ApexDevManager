import { useState, useCallback, type CSSProperties } from 'react';
import type {
  PRDSession,
  PRDSection,
  PRDStage,
  ExtractionData,
  ValidationResult,
} from '@apex-dev-manager/shared-types';
const PRD_STAGE_LABELS: Record<number, string> = {
  1: 'Upload Sources',
  2: 'Extract Requirements',
  3: 'Generate Sections',
  4: 'Validate',
  5: 'Export',
};
import {
  usePRDSession,
  useUploadSource,
  useExtractRequirements,
  useGenerateSections,
  useValidatePRD,
  useExportPRD,
  useUpdateSection,
} from '../hooks/usePRD';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  height: '100%',
  overflow: 'hidden',
};

const stepperStyle: CSSProperties = {
  display: 'flex',
  alignItems: 'center',
  padding: '1rem 1.5rem',
  borderBottom: '1px solid #e5e7eb',
  backgroundColor: '#f9fafb',
  gap: '0.25rem',
  overflowX: 'auto',
};

const stepStyle: CSSProperties = {
  display: 'flex',
  alignItems: 'center',
  gap: '0.5rem',
  padding: '0.375rem 0.75rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  borderRadius: '0.375rem',
  color: '#6b7280',
  backgroundColor: 'transparent',
  border: 'none',
  cursor: 'pointer',
  whiteSpace: 'nowrap',
  transition: 'all 0.15s',
};

const stepActiveStyle: CSSProperties = {
  ...stepStyle,
  color: '#2563eb',
  backgroundColor: '#eff6ff',
};

const stepCompletedStyle: CSSProperties = {
  ...stepStyle,
  color: '#059669',
};

const stepNumberStyle: CSSProperties = {
  display: 'inline-flex',
  alignItems: 'center',
  justifyContent: 'center',
  width: '1.5rem',
  height: '1.5rem',
  borderRadius: '50%',
  fontSize: '0.75rem',
  fontWeight: 600,
  backgroundColor: '#e5e7eb',
  color: '#374151',
};

const stepNumberActiveStyle: CSSProperties = {
  ...stepNumberStyle,
  backgroundColor: '#2563eb',
  color: '#fff',
};

const stepNumberCompletedStyle: CSSProperties = {
  ...stepNumberStyle,
  backgroundColor: '#059669',
  color: '#fff',
};

const stepConnectorStyle: CSSProperties = {
  width: '1.5rem',
  height: '1px',
  backgroundColor: '#d1d5db',
};

const contentStyle: CSSProperties = {
  flex: 1,
  overflowY: 'auto',
  padding: '1.5rem',
};

const sectionCardStyle: CSSProperties = {
  backgroundColor: '#fff',
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1.25rem',
  marginBottom: '1rem',
};

const sectionTitleStyle: CSSProperties = {
  fontSize: '0.9375rem',
  fontWeight: 600,
  color: '#111827',
  marginBottom: '0.5rem',
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

const buttonSecondaryStyle: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#fff',
  color: '#374151',
  border: '1px solid #d1d5db',
};

const buttonSuccessStyle: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#059669',
};

const textareaStyle: CSSProperties = {
  width: '100%',
  minHeight: '8rem',
  padding: '0.75rem',
  fontSize: '0.875rem',
  fontFamily: 'inherit',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  resize: 'vertical',
  outline: 'none',
  boxSizing: 'border-box',
};

const badgeStyle: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.5rem',
  fontSize: '0.6875rem',
  fontWeight: 500,
  borderRadius: '9999px',
};

const emptyStateStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  alignItems: 'center',
  justifyContent: 'center',
  padding: '3rem 1rem',
  textAlign: 'center',
  color: '#6b7280',
};

const selectStyle: CSSProperties = {
  padding: '0.5rem 0.75rem',
  fontSize: '0.8125rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  outline: 'none',
  backgroundColor: '#fff',
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

interface PRDWorkspaceProps {
  sessionId: string;
}

export function PRDWorkspace({ sessionId }: PRDWorkspaceProps) {
  const { data: session, isLoading, error } = usePRDSession(sessionId);
  const uploadSource = useUploadSource(sessionId);
  const extractRequirements = useExtractRequirements(sessionId);
  const generateSections = useGenerateSections(sessionId);
  const validatePRD = useValidatePRD(sessionId);
  const exportPRD = useExportPRD(sessionId);
  const updateSection = useUpdateSection(sessionId);

  const [activeStage, setActiveStage] = useState<PRDStage>(1);
  const [editingSectionId, setEditingSectionId] = useState<string | null>(null);
  const [editContent, setEditContent] = useState('');
  const [templateStyle, setTemplateStyle] = useState<'standard' | 'lean' | 'detailed'>('standard');
  const [exportFormat, setExportFormat] = useState<'markdown' | 'yaml' | 'json'>('markdown');
  const [validationResult, setValidationResult] = useState<ValidationResult | null>(null);
  const [exportResult, setExportResult] = useState<{ content: string; filename: string } | null>(null);

  // -----------------------------------------------------------------------
  // Handlers
  // -----------------------------------------------------------------------

  const handleUpload = useCallback(() => {
    // In production, this would open a file picker and upload to object storage.
    // For now, simulate with a mock source.
    uploadSource.mutate({
      filename: 'requirements.pdf',
      mimeType: 'application/pdf',
      fileSize: 1024 * 512,
      storageKey: `uploads/${sessionId}/${Date.now()}/requirements.pdf`,
    });
  }, [uploadSource, sessionId]);

  const handleExtract = useCallback(() => {
    extractRequirements.mutate({});
  }, [extractRequirements]);

  const handleGenerate = useCallback(() => {
    generateSections.mutate({ templateStyle });
  }, [generateSections, templateStyle]);

  const handleValidate = useCallback(async () => {
    const result = await validatePRD.mutateAsync({});
    setValidationResult(result);
  }, [validatePRD]);

  const handleExport = useCallback(async () => {
    const result = await exportPRD.mutateAsync({ format: exportFormat, includeMeta: true });
    setExportResult(result);
  }, [exportPRD, exportFormat]);

  const handleStartEdit = useCallback((section: PRDSection) => {
    setEditingSectionId(section.id);
    setEditContent(section.content);
  }, []);

  const handleSaveEdit = useCallback(
    (sectionId: string) => {
      updateSection.mutate(
        { sectionId, params: { content: editContent, generatedBy: 'user' } },
        {
          onSuccess: () => {
            setEditingSectionId(null);
            setEditContent('');
          },
        },
      );
    },
    [updateSection, editContent],
  );

  const handleRegenerateSection = useCallback(
    (_section: PRDSection) => {
      // No per-section regeneration endpoint exists yet — this regenerates ALL sections.
      const confirmed = window.confirm(
        'This will regenerate ALL sections, not just this one. Any manual edits to other sections will be overwritten. Continue?',
      );
      if (!confirmed) return;
      generateSections.mutate({ templateStyle });
    },
    [generateSections, templateStyle],
  );

  const handleDownload = useCallback(() => {
    if (!exportResult) return;
    const blob = new Blob([exportResult.content], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = exportResult.filename;
    a.click();
    URL.revokeObjectURL(url);
  }, [exportResult]);

  // -----------------------------------------------------------------------
  // Loading / Error states
  // -----------------------------------------------------------------------

  if (isLoading) {
    return (
      <div style={emptyStateStyle}>
        <p>Loading session...</p>
      </div>
    );
  }

  if (error || !session) {
    return (
      <div style={{ ...emptyStateStyle, color: '#dc2626' }}>
        <p>Failed to load session</p>
      </div>
    );
  }

  const currentStage = session.currentStage ?? 1;
  const stages: PRDStage[] = [1, 2, 3, 4, 5];

  // -----------------------------------------------------------------------
  // Render
  // -----------------------------------------------------------------------

  return (
    <div style={containerStyle}>
      {/* Progress Stepper */}
      <div style={stepperStyle}>
        {stages.map((stage, idx) => {
          const isActive = activeStage === stage;
          const isCompleted = currentStage > stage;

          return (
            <div key={stage} style={{ display: 'flex', alignItems: 'center', gap: '0.25rem' }}>
              {idx > 0 && <div style={stepConnectorStyle} />}
              <button
                type="button"
                style={isActive ? stepActiveStyle : isCompleted ? stepCompletedStyle : stepStyle}
                onClick={() => setActiveStage(stage)}
              >
                <span
                  style={
                    isActive
                      ? stepNumberActiveStyle
                      : isCompleted
                        ? stepNumberCompletedStyle
                        : stepNumberStyle
                  }
                >
                  {isCompleted ? '\u2713' : stage}
                </span>
                {PRD_STAGE_LABELS[stage]}
              </button>
            </div>
          );
        })}
      </div>

      {/* Content Area */}
      <div style={contentStyle}>
        {/* Stage 1: Upload Sources */}
        {activeStage === 1 && (
          <div>
            <div style={sectionCardStyle}>
              <h3 style={sectionTitleStyle}>Upload Source Documents</h3>
              <p style={{ fontSize: '0.8125rem', color: '#6b7280', marginBottom: '1rem' }}>
                Upload PDF, DOCX, TXT, or Markdown files containing requirements, specifications,
                or notes to extract into a structured PRD.
              </p>
              <button
                type="button"
                style={buttonStyle}
                onClick={handleUpload}
                disabled={uploadSource.isPending}
              >
                {uploadSource.isPending ? 'Uploading...' : 'Upload Document'}
              </button>
            </div>

            {/* Source list */}
            {session.sources && session.sources.length > 0 && (
              <div style={sectionCardStyle}>
                <h4 style={{ ...sectionTitleStyle, fontSize: '0.875rem' }}>Uploaded Sources</h4>
                {session.sources.map((source) => (
                  <div
                    key={source.id}
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'space-between',
                      padding: '0.5rem 0',
                      borderBottom: '1px solid #f3f4f6',
                    }}
                  >
                    <div>
                      <div style={{ fontSize: '0.8125rem', fontWeight: 500, color: '#111827' }}>
                        {source.filename}
                      </div>
                      <div style={{ fontSize: '0.6875rem', color: '#6b7280' }}>
                        {(source.fileSize / 1024).toFixed(1)} KB
                      </div>
                    </div>
                    <span
                      style={{
                        ...badgeStyle,
                        backgroundColor:
                          source.parseStatus === 'parsed'
                            ? '#d1fae5'
                            : source.parseStatus === 'error'
                              ? '#fee2e2'
                              : '#fef3c7',
                        color:
                          source.parseStatus === 'parsed'
                            ? '#065f46'
                            : source.parseStatus === 'error'
                              ? '#991b1b'
                              : '#b45309',
                      }}
                    >
                      {source.parseStatus}
                    </span>
                  </div>
                ))}
              </div>
            )}

            <div style={{ marginTop: '1rem' }}>
              <button
                type="button"
                style={buttonStyle}
                onClick={() => setActiveStage(2)}
                disabled={!session.sources || session.sources.length === 0}
              >
                Continue to Extract
              </button>
            </div>
          </div>
        )}

        {/* Stage 2: Extract Requirements */}
        {activeStage === 2 && (
          <div>
            <div style={sectionCardStyle}>
              <h3 style={sectionTitleStyle}>Extract Requirements</h3>
              <p style={{ fontSize: '0.8125rem', color: '#6b7280', marginBottom: '1rem' }}>
                AI will analyze your uploaded documents and extract structured requirements
                including goals, features, personas, constraints, and assumptions.
              </p>
              <button
                type="button"
                style={buttonStyle}
                onClick={handleExtract}
                disabled={extractRequirements.isPending}
              >
                {extractRequirements.isPending ? 'Extracting...' : 'Extract Requirements'}
              </button>
            </div>

            {/* Extraction results */}
            {session.extractionData && (
              <div style={sectionCardStyle}>
                <h4 style={{ ...sectionTitleStyle, fontSize: '0.875rem' }}>Extraction Results</h4>

                {(session.extractionData?.goals?.length ?? 0) > 0 && (
                  <div style={{ marginBottom: '1rem' }}>
                    <h5 style={{ fontSize: '0.8125rem', fontWeight: 600, color: '#374151', marginBottom: '0.375rem' }}>
                      Goals
                    </h5>
                    <ul style={{ margin: 0, paddingLeft: '1.25rem', fontSize: '0.8125rem', color: '#4b5563' }}>
                      {session.extractionData?.goals?.map((goal, i) => (
                        <li key={i} style={{ marginBottom: '0.25rem' }}>{goal}</li>
                      ))}
                    </ul>
                  </div>
                )}

                {(session.extractionData?.features?.length ?? 0) > 0 && (
                  <div style={{ marginBottom: '1rem' }}>
                    <h5 style={{ fontSize: '0.8125rem', fontWeight: 600, color: '#374151', marginBottom: '0.375rem' }}>
                      Features ({session.extractionData?.features?.length ?? 0})
                    </h5>
                    {session.extractionData?.features?.map((feature, i) => (
                      <div
                        key={i}
                        style={{
                          padding: '0.5rem 0.75rem',
                          marginBottom: '0.375rem',
                          backgroundColor: '#f9fafb',
                          borderRadius: '0.375rem',
                          fontSize: '0.8125rem',
                        }}
                      >
                        <div style={{ fontWeight: 500, color: '#111827' }}>
                          {feature.name}
                          <span
                            style={{
                              ...badgeStyle,
                              marginLeft: '0.5rem',
                              backgroundColor:
                                feature.priority === 'must' ? '#fee2e2' : feature.priority === 'should' ? '#fef3c7' : '#d1fae5',
                              color:
                                feature.priority === 'must' ? '#991b1b' : feature.priority === 'should' ? '#b45309' : '#065f46',
                            }}
                          >
                            {feature.priority}
                          </span>
                        </div>
                        <div style={{ color: '#6b7280', marginTop: '0.25rem' }}>
                          {feature.description}
                        </div>
                      </div>
                    ))}
                  </div>
                )}

                {(session.extractionData?.userPersonas?.length ?? 0) > 0 && (
                  <div style={{ marginBottom: '1rem' }}>
                    <h5 style={{ fontSize: '0.8125rem', fontWeight: 600, color: '#374151', marginBottom: '0.375rem' }}>
                      User Personas
                    </h5>
                    <ul style={{ margin: 0, paddingLeft: '1.25rem', fontSize: '0.8125rem', color: '#4b5563' }}>
                      {session.extractionData?.userPersonas?.map((persona, i) => (
                        <li key={i} style={{ marginBottom: '0.25rem' }}>{persona}</li>
                      ))}
                    </ul>
                  </div>
                )}
              </div>
            )}

            <div style={{ marginTop: '1rem' }}>
              <button
                type="button"
                style={buttonStyle}
                onClick={() => setActiveStage(3)}
                disabled={!session.extractionData}
              >
                Continue to Generate
              </button>
            </div>
          </div>
        )}

        {/* Stage 3: Generate Sections */}
        {activeStage === 3 && (
          <div>
            <div style={sectionCardStyle}>
              <h3 style={sectionTitleStyle}>Generate PRD Sections</h3>
              <p style={{ fontSize: '0.8125rem', color: '#6b7280', marginBottom: '1rem' }}>
                AI will generate comprehensive PRD sections based on the extracted requirements.
                Choose a template style below.
              </p>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem', marginBottom: '1rem' }}>
                <label style={{ fontSize: '0.8125rem', fontWeight: 500, color: '#374151' }}>
                  Template:
                </label>
                <select
                  style={selectStyle}
                  value={templateStyle}
                  onChange={(e) => setTemplateStyle(e.target.value as typeof templateStyle)}
                >
                  <option value="standard">Standard (12 sections)</option>
                  <option value="lean">Lean (6 sections)</option>
                  <option value="detailed">Detailed (18 sections)</option>
                </select>
              </div>
              <button
                type="button"
                style={buttonStyle}
                onClick={handleGenerate}
                disabled={generateSections.isPending}
              >
                {generateSections.isPending ? 'Generating...' : 'Generate Sections'}
              </button>
            </div>

            {/* Section editor */}
            {session.sections && session.sections.length > 0 && (
              <div>
                <h4
                  style={{
                    fontSize: '0.9375rem',
                    fontWeight: 600,
                    color: '#111827',
                    marginBottom: '0.75rem',
                  }}
                >
                  PRD Sections ({session.sections.length})
                </h4>
                {session.sections.map((section) => (
                  <div key={section.id} style={sectionCardStyle}>
                    <div
                      style={{
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'space-between',
                        marginBottom: '0.75rem',
                      }}
                    >
                      <h5 style={{ margin: 0, fontSize: '0.875rem', fontWeight: 600, color: '#111827' }}>
                        {section.sectionNumber}. {section.title}
                      </h5>
                      <div style={{ display: 'flex', gap: '0.5rem' }}>
                        <span
                          style={{
                            ...badgeStyle,
                            backgroundColor: '#f3f4f6',
                            color: '#6b7280',
                          }}
                        >
                          v{section.version} - {section.generatedBy}
                        </span>
                        <button
                          type="button"
                          style={{ ...buttonSecondaryStyle, padding: '0.25rem 0.625rem', fontSize: '0.75rem' }}
                          onClick={() => handleRegenerateSection(section)}
                          disabled={generateSections.isPending}
                        >
                          Regenerate All Sections
                        </button>
                        <button
                          type="button"
                          style={{ ...buttonSecondaryStyle, padding: '0.25rem 0.625rem', fontSize: '0.75rem' }}
                          onClick={() => handleStartEdit(section)}
                        >
                          Edit
                        </button>
                      </div>
                    </div>

                    {editingSectionId === section.id ? (
                      <div>
                        <textarea
                          style={textareaStyle}
                          value={editContent}
                          onChange={(e) => setEditContent(e.target.value)}
                        />
                        <div style={{ display: 'flex', gap: '0.5rem', marginTop: '0.5rem' }}>
                          <button
                            type="button"
                            style={{ ...buttonStyle, padding: '0.375rem 0.75rem', fontSize: '0.75rem' }}
                            onClick={() => handleSaveEdit(section.id)}
                            disabled={updateSection.isPending}
                          >
                            {updateSection.isPending ? 'Saving...' : 'Save'}
                          </button>
                          <button
                            type="button"
                            style={{ ...buttonSecondaryStyle, padding: '0.375rem 0.75rem', fontSize: '0.75rem' }}
                            onClick={() => {
                              setEditingSectionId(null);
                              setEditContent('');
                            }}
                          >
                            Cancel
                          </button>
                        </div>
                      </div>
                    ) : (
                      <div
                        style={{
                          fontSize: '0.8125rem',
                          color: '#4b5563',
                          lineHeight: 1.6,
                          whiteSpace: 'pre-wrap',
                        }}
                      >
                        {section.content.length > 500
                          ? section.content.substring(0, 500) + '...'
                          : section.content}
                      </div>
                    )}
                  </div>
                ))}
              </div>
            )}

            <div style={{ marginTop: '1rem' }}>
              <button
                type="button"
                style={buttonStyle}
                onClick={() => setActiveStage(4)}
                disabled={!session.sections || session.sections.length === 0}
              >
                Continue to Validate
              </button>
            </div>
          </div>
        )}

        {/* Stage 4: Validate */}
        {activeStage === 4 && (
          <div>
            <div style={sectionCardStyle}>
              <h3 style={sectionTitleStyle}>Validate PRD</h3>
              <p style={{ fontSize: '0.8125rem', color: '#6b7280', marginBottom: '1rem' }}>
                AI will review your PRD for completeness, consistency, clarity, feasibility, and
                testability, providing a quality score and actionable feedback.
              </p>
              <button
                type="button"
                style={buttonStyle}
                onClick={handleValidate}
                disabled={validatePRD.isPending}
              >
                {validatePRD.isPending ? 'Validating...' : 'Run Validation'}
              </button>
            </div>

            {/* Validation results */}
            {(validationResult || session.validationScore != null) && (
              <div style={sectionCardStyle}>
                <h4 style={{ ...sectionTitleStyle, fontSize: '0.875rem' }}>Validation Results</h4>

                <div style={{ display: 'flex', gap: '1.5rem', marginBottom: '1rem' }}>
                  <div style={{ textAlign: 'center' }}>
                    <div
                      style={{
                        fontSize: '2rem',
                        fontWeight: 700,
                        color:
                          (validationResult?.score ?? session.validationScore ?? 0) >= 80
                            ? '#059669'
                            : (validationResult?.score ?? session.validationScore ?? 0) >= 50
                              ? '#d97706'
                              : '#dc2626',
                      }}
                    >
                      {validationResult?.score ?? session.validationScore ?? 0}
                    </div>
                    <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>Score / 100</div>
                  </div>
                  <div style={{ textAlign: 'center' }}>
                    <div style={{ fontSize: '2rem', fontWeight: 700, color: '#dc2626' }}>
                      {validationResult?.blockers ?? session.validationBlockers}
                    </div>
                    <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>Blockers</div>
                  </div>
                  <div style={{ textAlign: 'center' }}>
                    <div style={{ fontSize: '2rem', fontWeight: 700, color: '#d97706' }}>
                      {validationResult?.warnings ?? session.validationWarnings}
                    </div>
                    <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>Warnings</div>
                  </div>
                </div>

                {validationResult?.summary && (
                  <p style={{ fontSize: '0.8125rem', color: '#4b5563', marginBottom: '1rem' }}>
                    {validationResult.summary}
                  </p>
                )}

                {validationResult?.checks && validationResult.checks.length > 0 && (
                  <div>
                    {validationResult.checks.map((check, i) => (
                      <div
                        key={check.id || i}
                        style={{
                          padding: '0.625rem 0.75rem',
                          marginBottom: '0.375rem',
                          backgroundColor:
                            check.severity === 'blocker'
                              ? '#fef2f2'
                              : check.severity === 'warning'
                                ? '#fffbeb'
                                : '#f0fdf4',
                          borderRadius: '0.375rem',
                          borderLeft: `3px solid ${
                            check.severity === 'blocker'
                              ? '#dc2626'
                              : check.severity === 'warning'
                                ? '#d97706'
                                : '#059669'
                          }`,
                        }}
                      >
                        <div
                          style={{
                            display: 'flex',
                            alignItems: 'center',
                            gap: '0.5rem',
                            marginBottom: '0.25rem',
                          }}
                        >
                          <span
                            style={{
                              ...badgeStyle,
                              backgroundColor:
                                check.severity === 'blocker' ? '#fee2e2' : check.severity === 'warning' ? '#fef3c7' : '#d1fae5',
                              color:
                                check.severity === 'blocker' ? '#991b1b' : check.severity === 'warning' ? '#b45309' : '#065f46',
                            }}
                          >
                            {check.severity}
                          </span>
                          <span style={{ fontSize: '0.75rem', color: '#6b7280' }}>
                            {check.category}
                            {check.sectionNumber != null && ` (Section ${check.sectionNumber})`}
                          </span>
                        </div>
                        <div style={{ fontSize: '0.8125rem', color: '#374151' }}>
                          {check.message}
                        </div>
                        {check.suggestion && (
                          <div style={{ fontSize: '0.75rem', color: '#6b7280', marginTop: '0.25rem', fontStyle: 'italic' }}>
                            Suggestion: {check.suggestion}
                          </div>
                        )}
                      </div>
                    ))}
                  </div>
                )}
              </div>
            )}

            <div style={{ marginTop: '1rem' }}>
              <button
                type="button"
                style={buttonStyle}
                onClick={() => setActiveStage(5)}
              >
                Continue to Export
              </button>
            </div>
          </div>
        )}

        {/* Stage 5: Export */}
        {activeStage === 5 && (
          <div>
            <div style={sectionCardStyle}>
              <h3 style={sectionTitleStyle}>Export PRD</h3>
              <p style={{ fontSize: '0.8125rem', color: '#6b7280', marginBottom: '1rem' }}>
                Export your PRD in the desired format. The exported file will include all current
                sections and optional metadata.
              </p>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem', marginBottom: '1rem' }}>
                <label style={{ fontSize: '0.8125rem', fontWeight: 500, color: '#374151' }}>
                  Format:
                </label>
                <select
                  style={selectStyle}
                  value={exportFormat}
                  onChange={(e) => setExportFormat(e.target.value as typeof exportFormat)}
                >
                  <option value="markdown">Markdown (.md)</option>
                  <option value="yaml">YAML (.yaml)</option>
                  <option value="json">JSON (.json)</option>
                </select>
              </div>
              <div style={{ display: 'flex', gap: '0.5rem' }}>
                <button
                  type="button"
                  style={buttonSuccessStyle}
                  onClick={handleExport}
                  disabled={exportPRD.isPending}
                >
                  {exportPRD.isPending ? 'Exporting...' : 'Export'}
                </button>
                {exportResult && (
                  <button type="button" style={buttonStyle} onClick={handleDownload}>
                    Download {exportResult.filename}
                  </button>
                )}
              </div>
            </div>

            {/* Export preview */}
            {exportResult && (
              <div style={sectionCardStyle}>
                <h4 style={{ ...sectionTitleStyle, fontSize: '0.875rem' }}>Export Preview</h4>
                <pre
                  style={{
                    backgroundColor: '#f9fafb',
                    padding: '1rem',
                    borderRadius: '0.375rem',
                    fontSize: '0.75rem',
                    lineHeight: 1.5,
                    overflowX: 'auto',
                    maxHeight: '24rem',
                    overflowY: 'auto',
                    border: '1px solid #e5e7eb',
                    whiteSpace: 'pre-wrap',
                    wordBreak: 'break-word',
                  }}
                >
                  {exportResult.content}
                </pre>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

export default PRDWorkspace;
