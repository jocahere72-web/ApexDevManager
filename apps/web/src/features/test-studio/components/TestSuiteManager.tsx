import { useState, useEffect, useCallback, type CSSProperties } from 'react';
import type {
  TestSuite,
  TestCase,
  TestResult,
  TestCoverage,
  TestStatus,
} from '@apex-dev-manager/shared-types';
import * as testStudioApi from '@/services/test-studio.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  height: '100%',
  overflowY: 'auto',
};

const headerStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  marginBottom: '1.5rem',
};

const titleStyle: CSSProperties = {
  fontSize: '1.25rem',
  fontWeight: 600,
  color: '#111827',
};

const buttonStyle: CSSProperties = {
  padding: '0.5rem 1rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  backgroundColor: '#2563eb',
  color: '#fff',
  transition: 'background-color 0.15s',
};

const secondaryButtonStyle: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#f3f4f6',
  color: '#374151',
  border: '1px solid #d1d5db',
};

const dangerButtonStyle: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#ef4444',
  color: '#fff',
};

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1rem',
  marginBottom: '0.75rem',
  backgroundColor: '#fff',
};

const badgeBase: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.5rem',
  borderRadius: '9999px',
  fontSize: '0.75rem',
  fontWeight: 600,
};

const coverageBarOuter: CSSProperties = {
  width: '100%',
  height: '0.5rem',
  backgroundColor: '#e5e7eb',
  borderRadius: '9999px',
  overflow: 'hidden',
  marginTop: '0.25rem',
};

const gridStyle: CSSProperties = {
  display: 'grid',
  gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))',
  gap: '1rem',
  marginBottom: '1.5rem',
};

const statCardStyle: CSSProperties = {
  ...cardStyle,
  textAlign: 'center' as const,
};

const testCaseRowStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  padding: '0.5rem 0',
  borderBottom: '1px solid #f3f4f6',
};

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function statusBadge(status: TestStatus): CSSProperties {
  const colors: Record<TestStatus, { bg: string; color: string }> = {
    passed: { bg: '#dcfce7', color: '#166534' },
    failed: { bg: '#fef2f2', color: '#991b1b' },
    error: { bg: '#fef2f2', color: '#991b1b' },
    running: { bg: '#dbeafe', color: '#1e40af' },
    pending: { bg: '#f3f4f6', color: '#6b7280' },
    skipped: { bg: '#fefce8', color: '#854d0e' },
  };
  const c = colors[status] ?? colors.pending;
  return { ...badgeBase, backgroundColor: c.bg, color: c.color };
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function TestSuiteManager() {
  const [suites, setSuites] = useState<TestSuite[]>([]);
  const [coverage, setCoverage] = useState<TestCoverage | null>(null);
  const [selectedSuite, setSelectedSuite] = useState<TestSuite | null>(null);
  const [results, setResults] = useState<TestResult[]>([]);
  const [loading, setLoading] = useState(false);
  const [generating, setGenerating] = useState(false);
  const [executing, setExecuting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Fetch suites on mount
  useEffect(() => {
    loadSuites();
  }, []);

  const loadSuites = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const data = await testStudioApi.listTestSuites();
      setSuites(data);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setLoading(false);
    }
  }, []);

  const handleGenerateTests = useCallback(async () => {
    setGenerating(true);
    setError(null);
    try {
      // Generate tests for the first available connection
      const testCases = await testStudioApi.generateTests({
        connectionId: 'default',
        componentType: 'page',
        testTypes: ['unit', 'integration'],
      });
      // Reload suites after generation
      await loadSuites();
      console.info('[TestStudio] Generated', testCases.length, 'test cases');
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setGenerating(false);
    }
  }, [loadSuites]);

  const handleExecuteTests = useCallback(async (suite: TestSuite) => {
    setExecuting(true);
    setError(null);
    try {
      const testResults = await testStudioApi.executeTests({
        suiteId: suite.id,
        connectionId: suite.connectionId,
      });
      setResults(testResults);
      await loadSuites();
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setExecuting(false);
    }
  }, [loadSuites]);

  const handleViewResults = useCallback(async (suite: TestSuite) => {
    setSelectedSuite(suite);
    try {
      const testResults = await testStudioApi.getTestResults(suite.id);
      setResults(testResults);
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  const handleDeleteSuite = useCallback(async (id: string) => {
    try {
      await testStudioApi.deleteTestSuite(id);
      await loadSuites();
      if (selectedSuite?.id === id) {
        setSelectedSuite(null);
        setResults([]);
      }
    } catch (err) {
      setError((err as Error).message);
    }
  }, [loadSuites, selectedSuite]);

  const handleLoadCoverage = useCallback(async (connectionId: string) => {
    try {
      const cov = await testStudioApi.getTestCoverage(connectionId);
      setCoverage(cov);
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  // -----------------------------------------------------------------------
  // Render
  // -----------------------------------------------------------------------

  return (
    <div style={containerStyle}>
      {/* Header */}
      <div style={headerStyle}>
        <h2 style={titleStyle}>Test Studio</h2>
        <div style={{ display: 'flex', gap: '0.5rem' }}>
          <button
            type="button"
            style={buttonStyle}
            onClick={handleGenerateTests}
            disabled={generating}
          >
            {generating ? 'Generating...' : 'Generate Tests (AI)'}
          </button>
          <button
            type="button"
            style={secondaryButtonStyle}
            onClick={loadSuites}
            disabled={loading}
          >
            Refresh
          </button>
        </div>
      </div>

      {/* Error banner */}
      {error && (
        <div style={{ padding: '0.75rem', backgroundColor: '#fef2f2', border: '1px solid #fecaca', borderRadius: '0.375rem', color: '#991b1b', marginBottom: '1rem', fontSize: '0.875rem' }}>
          {error}
        </div>
      )}

      {/* Coverage summary */}
      {coverage && (
        <div style={{ ...cardStyle, marginBottom: '1.5rem' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.5rem' }}>
            <span style={{ fontWeight: 600 }}>Test Coverage</span>
            <span style={{ fontSize: '1.25rem', fontWeight: 700, color: coverage.coveragePercent >= 80 ? '#166534' : coverage.coveragePercent >= 50 ? '#854d0e' : '#991b1b' }}>
              {coverage.coveragePercent}%
            </span>
          </div>
          <div style={coverageBarOuter}>
            <div style={{ width: `${coverage.coveragePercent}%`, height: '100%', backgroundColor: coverage.coveragePercent >= 80 ? '#22c55e' : coverage.coveragePercent >= 50 ? '#eab308' : '#ef4444', borderRadius: '9999px', transition: 'width 0.3s' }} />
          </div>
          <div style={{ marginTop: '0.5rem', fontSize: '0.75rem', color: '#6b7280' }}>
            {coverage.testedComponents} of {coverage.totalComponents} components tested
          </div>
        </div>
      )}

      {/* Stats grid */}
      <div style={gridStyle}>
        <div style={statCardStyle}>
          <div style={{ fontSize: '2rem', fontWeight: 700, color: '#2563eb' }}>{suites.length}</div>
          <div style={{ fontSize: '0.8125rem', color: '#6b7280' }}>Test Suites</div>
        </div>
        <div style={statCardStyle}>
          <div style={{ fontSize: '2rem', fontWeight: 700, color: '#22c55e' }}>
            {suites.reduce((sum, s) => sum + s.passedTests, 0)}
          </div>
          <div style={{ fontSize: '0.8125rem', color: '#6b7280' }}>Passed</div>
        </div>
        <div style={statCardStyle}>
          <div style={{ fontSize: '2rem', fontWeight: 700, color: '#ef4444' }}>
            {suites.reduce((sum, s) => sum + s.failedTests, 0)}
          </div>
          <div style={{ fontSize: '0.8125rem', color: '#6b7280' }}>Failed</div>
        </div>
      </div>

      {/* Suite list */}
      {loading ? (
        <div style={{ textAlign: 'center', padding: '2rem', color: '#6b7280' }}>Loading test suites...</div>
      ) : suites.length === 0 ? (
        <div style={{ textAlign: 'center', padding: '2rem', color: '#6b7280' }}>
          No test suites found. Click "Generate Tests (AI)" to create test cases.
        </div>
      ) : (
        suites.map((suite) => (
          <div key={suite.id} style={cardStyle}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
              <div>
                <div style={{ fontWeight: 600, marginBottom: '0.25rem' }}>{suite.name}</div>
                {suite.description && (
                  <div style={{ fontSize: '0.8125rem', color: '#6b7280', marginBottom: '0.5rem' }}>{suite.description}</div>
                )}
                <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap' }}>
                  <span style={statusBadge('passed')}>{suite.passedTests} passed</span>
                  <span style={statusBadge('failed')}>{suite.failedTests} failed</span>
                  <span style={statusBadge('pending')}>{suite.totalTests} total</span>
                </div>
              </div>
              <div style={{ display: 'flex', gap: '0.5rem' }}>
                <button type="button" style={buttonStyle} onClick={() => handleExecuteTests(suite)} disabled={executing}>
                  {executing ? 'Running...' : 'Run Tests'}
                </button>
                <button type="button" style={secondaryButtonStyle} onClick={() => handleViewResults(suite)}>
                  Results
                </button>
                <button type="button" style={dangerButtonStyle} onClick={() => handleDeleteSuite(suite.id)}>
                  Delete
                </button>
              </div>
            </div>

            {/* Test cases */}
            {selectedSuite?.id === suite.id && (
              <div style={{ marginTop: '1rem', borderTop: '1px solid #e5e7eb', paddingTop: '0.75rem' }}>
                <div style={{ fontWeight: 500, marginBottom: '0.5rem', fontSize: '0.875rem' }}>Test Cases</div>
                {suite.testCases.map((tc) => (
                  <div key={tc.id} style={testCaseRowStyle}>
                    <div>
                      <span style={{ fontSize: '0.8125rem', fontWeight: 500 }}>{tc.name}</span>
                      <span style={{ marginLeft: '0.5rem', ...statusBadge(tc.status) }}>{tc.status}</span>
                    </div>
                    {tc.executionTimeMs !== undefined && (
                      <span style={{ fontSize: '0.75rem', color: '#6b7280' }}>{tc.executionTimeMs}ms</span>
                    )}
                  </div>
                ))}

                {/* Results */}
                {results.length > 0 && (
                  <div style={{ marginTop: '0.75rem' }}>
                    <div style={{ fontWeight: 500, marginBottom: '0.5rem', fontSize: '0.875rem' }}>Latest Results</div>
                    {results.map((r) => (
                      <div key={r.id} style={testCaseRowStyle}>
                        <span style={statusBadge(r.status)}>{r.status}</span>
                        <span style={{ fontSize: '0.75rem', color: '#6b7280' }}>{r.executionTimeMs}ms</span>
                        {r.errorMessage && (
                          <span style={{ fontSize: '0.75rem', color: '#991b1b' }}>{r.errorMessage}</span>
                        )}
                      </div>
                    ))}
                  </div>
                )}
              </div>
            )}

            {/* Coverage bar */}
            {suite.coveragePercent > 0 && (
              <div style={{ marginTop: '0.5rem' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '0.75rem', color: '#6b7280' }}>
                  <span>Coverage</span>
                  <span>{suite.coveragePercent}%</span>
                </div>
                <div style={coverageBarOuter}>
                  <div style={{ width: `${suite.coveragePercent}%`, height: '100%', backgroundColor: '#2563eb', borderRadius: '9999px' }} />
                </div>
              </div>
            )}

            {suite.lastRunAt && (
              <div style={{ marginTop: '0.5rem', fontSize: '0.75rem', color: '#9ca3af' }}>
                Last run: {new Date(suite.lastRunAt).toLocaleString()}
              </div>
            )}
          </div>
        ))
      )}
    </div>
  );
}

export default TestSuiteManager;
