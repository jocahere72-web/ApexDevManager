import { useState, useCallback, type CSSProperties } from 'react';
import type {
  SearchResult,
  ContextualHelp,
  LearningPath,
  LearningResource,
  KnowledgeCategory,
} from '@apex-dev-manager/shared-types';
import * as knowledgeApi from '@/services/knowledge.api';

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

const mainPanelStyle: CSSProperties = {
  flex: 1,
  minWidth: 0,
};

const sidePanelStyle: CSSProperties = {
  width: 340,
  minWidth: 300,
  borderLeft: '1px solid #e5e7eb',
  paddingLeft: '1.5rem',
};

const searchBoxStyle: CSSProperties = {
  display: 'flex',
  gap: '0.5rem',
  marginBottom: '1.5rem',
};

const inputStyle: CSSProperties = {
  flex: 1,
  padding: '0.625rem 0.75rem',
  fontSize: '0.875rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  outline: 'none',
};

const buttonStyle: CSSProperties = {
  padding: '0.625rem 1rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  backgroundColor: '#2563eb',
  color: '#fff',
};

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1rem',
  marginBottom: '0.75rem',
  backgroundColor: '#fff',
};

const scoreBadge: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.5rem',
  borderRadius: '9999px',
  fontSize: '0.75rem',
  fontWeight: 600,
  backgroundColor: '#dbeafe',
  color: '#1e40af',
};

const tagStyle: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.375rem',
  borderRadius: '0.25rem',
  fontSize: '0.6875rem',
  backgroundColor: '#f3f4f6',
  color: '#6b7280',
  marginRight: '0.25rem',
};

const sectionTitle: CSSProperties = {
  fontSize: '0.875rem',
  fontWeight: 600,
  color: '#111827',
  marginBottom: '0.75rem',
};

const helpItemStyle: CSSProperties = {
  padding: '0.5rem 0',
  borderBottom: '1px solid #f3f4f6',
  fontSize: '0.8125rem',
  color: '#374151',
};

const learningCardStyle: CSSProperties = {
  ...cardStyle,
  cursor: 'pointer',
  transition: 'border-color 0.15s',
};

const progressBarOuter: CSSProperties = {
  width: '100%',
  height: '0.375rem',
  backgroundColor: '#e5e7eb',
  borderRadius: '9999px',
  overflow: 'hidden',
  marginTop: '0.5rem',
};

const categoryOptions: KnowledgeCategory[] = [
  'apex-component', 'plsql', 'ords', 'security', 'performance', 'best-practice', 'tutorial', 'reference',
];

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function KnowledgeSearch() {
  const [query, setQuery] = useState('');
  const [category, setCategory] = useState<KnowledgeCategory | ''>('');
  const [results, setResults] = useState<SearchResult[]>([]);
  const [contextHelp, setContextHelp] = useState<ContextualHelp | null>(null);
  const [learningPaths, setLearningPaths] = useState<LearningPath[]>([]);
  const [searching, setSearching] = useState(false);
  const [activeTab, setActiveTab] = useState<'help' | 'learning'>('help');
  const [error, setError] = useState<string | null>(null);

  const handleSearch = useCallback(async () => {
    if (!query.trim()) return;
    setSearching(true);
    setError(null);
    try {
      const data = await knowledgeApi.searchKnowledge(
        query,
        category || undefined,
        undefined,
        20,
      );
      setResults(data);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setSearching(false);
    }
  }, [query, category]);

  const handleKeyDown = useCallback(
    (e: React.KeyboardEvent) => {
      if (e.key === 'Enter') handleSearch();
    },
    [handleSearch],
  );

  const handleLoadHelp = useCallback(async (componentType: string) => {
    try {
      const help = await knowledgeApi.getContextualHelp(componentType);
      setContextHelp(help);
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  const handleLoadLearning = useCallback(async (role: string) => {
    try {
      const paths = await knowledgeApi.getLearningPath(role);
      setLearningPaths(paths);
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  return (
    <div style={containerStyle}>
      {/* Main panel: Search */}
      <div style={mainPanelStyle}>
        <h2 style={{ fontSize: '1.25rem', fontWeight: 600, color: '#111827', marginBottom: '1rem' }}>
          Knowledge Engine
        </h2>

        {/* Search box */}
        <div style={searchBoxStyle}>
          <input
            type="text"
            style={inputStyle}
            placeholder="Search APEX knowledge base..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            onKeyDown={handleKeyDown}
          />
          <select
            style={{ ...inputStyle, flex: 'none', width: 160 }}
            value={category}
            onChange={(e) => setCategory(e.target.value as KnowledgeCategory | '')}
          >
            <option value="">All Categories</option>
            {categoryOptions.map((cat) => (
              <option key={cat} value={cat}>{cat.replace(/-/g, ' ')}</option>
            ))}
          </select>
          <button type="button" style={buttonStyle} onClick={handleSearch} disabled={searching}>
            {searching ? 'Searching...' : 'Search'}
          </button>
        </div>

        {/* Error */}
        {error && (
          <div style={{ padding: '0.75rem', backgroundColor: '#fef2f2', border: '1px solid #fecaca', borderRadius: '0.375rem', color: '#991b1b', marginBottom: '1rem', fontSize: '0.875rem' }}>
            {error}
          </div>
        )}

        {/* Results */}
        {results.length === 0 && !searching ? (
          <div style={{ textAlign: 'center', padding: '3rem', color: '#6b7280' }}>
            Search the knowledge base for APEX documentation, best practices, and tutorials.
          </div>
        ) : (
          results.map((result) => (
            <div key={result.article.id} style={cardStyle}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '0.5rem' }}>
                <div style={{ fontWeight: 600, fontSize: '0.9375rem' }}>{result.article.title}</div>
                <span style={scoreBadge}>{Math.round(result.score * 100)}% match</span>
              </div>
              <div style={{ fontSize: '0.8125rem', color: '#6b7280', marginBottom: '0.5rem' }}>
                {result.snippet}
              </div>
              <div style={{ display: 'flex', gap: '0.25rem', flexWrap: 'wrap', alignItems: 'center' }}>
                <span style={{ ...tagStyle, backgroundColor: '#dbeafe', color: '#1e40af' }}>
                  {result.article.category}
                </span>
                {result.article.tags.map((tag) => (
                  <span key={tag} style={tagStyle}>{tag}</span>
                ))}
                {result.highlights.length > 0 && (
                  <span style={{ fontSize: '0.6875rem', color: '#9ca3af', marginLeft: '0.5rem' }}>
                    Matches: {result.highlights.join(', ')}
                  </span>
                )}
              </div>
            </div>
          ))
        )}
      </div>

      {/* Side panel: Contextual help / Learning paths */}
      <div style={sidePanelStyle}>
        {/* Tab bar */}
        <div style={{ display: 'flex', borderBottom: '1px solid #e5e7eb', marginBottom: '1rem' }}>
          <button
            type="button"
            style={{
              padding: '0.5rem 1rem',
              fontSize: '0.8125rem',
              fontWeight: 500,
              border: 'none',
              cursor: 'pointer',
              backgroundColor: 'transparent',
              borderBottom: activeTab === 'help' ? '2px solid #2563eb' : '2px solid transparent',
              color: activeTab === 'help' ? '#2563eb' : '#6b7280',
            }}
            onClick={() => setActiveTab('help')}
          >
            Contextual Help
          </button>
          <button
            type="button"
            style={{
              padding: '0.5rem 1rem',
              fontSize: '0.8125rem',
              fontWeight: 500,
              border: 'none',
              cursor: 'pointer',
              backgroundColor: 'transparent',
              borderBottom: activeTab === 'learning' ? '2px solid #2563eb' : '2px solid transparent',
              color: activeTab === 'learning' ? '#2563eb' : '#6b7280',
            }}
            onClick={() => setActiveTab('learning')}
          >
            Learning Paths
          </button>
        </div>

        {activeTab === 'help' ? (
          <>
            {/* Quick help buttons */}
            <div style={{ marginBottom: '1rem' }}>
              <div style={sectionTitle}>Component Help</div>
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.375rem' }}>
                {['page', 'region', 'process', 'dynamic-action', 'validation', 'computation'].map((type) => (
                  <button
                    key={type}
                    type="button"
                    style={{ ...tagStyle, cursor: 'pointer', padding: '0.25rem 0.5rem', fontSize: '0.75rem' }}
                    onClick={() => handleLoadHelp(type)}
                  >
                    {type}
                  </button>
                ))}
              </div>
            </div>

            {/* Contextual help content */}
            {contextHelp ? (
              <div>
                <div style={sectionTitle}>{contextHelp.componentType}</div>
                <p style={{ fontSize: '0.8125rem', color: '#374151', marginBottom: '0.75rem' }}>
                  {contextHelp.summary}
                </p>

                <div style={sectionTitle}>Best Practices</div>
                {contextHelp.bestPractices.map((bp, i) => (
                  <div key={i} style={helpItemStyle}>
                    <span style={{ color: '#22c55e', marginRight: '0.5rem' }}>&#10003;</span>
                    {bp}
                  </div>
                ))}

                <div style={{ ...sectionTitle, marginTop: '0.75rem' }}>Common Issues</div>
                {contextHelp.commonIssues.map((issue, i) => (
                  <div key={i} style={helpItemStyle}>
                    <span style={{ color: '#ef4444', marginRight: '0.5rem' }}>&#9888;</span>
                    {issue}
                  </div>
                ))}

                {contextHelp.exampleCode && (
                  <div style={{ marginTop: '0.75rem' }}>
                    <div style={sectionTitle}>Example</div>
                    <pre style={{ fontSize: '0.75rem', backgroundColor: '#f9fafb', padding: '0.75rem', borderRadius: '0.375rem', overflow: 'auto', maxHeight: 200 }}>
                      {contextHelp.exampleCode}
                    </pre>
                  </div>
                )}
              </div>
            ) : (
              <div style={{ color: '#9ca3af', fontSize: '0.8125rem', textAlign: 'center', padding: '1rem' }}>
                Select a component type to see contextual help.
              </div>
            )}
          </>
        ) : (
          <>
            {/* Learning path buttons */}
            <div style={{ marginBottom: '1rem' }}>
              <div style={sectionTitle}>Learning by Role</div>
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.375rem' }}>
                {['developer', 'admin', 'architect', 'tester'].map((role) => (
                  <button
                    key={role}
                    type="button"
                    style={{ ...buttonStyle, fontSize: '0.75rem', padding: '0.25rem 0.75rem' }}
                    onClick={() => handleLoadLearning(role)}
                  >
                    {role}
                  </button>
                ))}
              </div>
            </div>

            {/* Learning paths */}
            {learningPaths.length === 0 ? (
              <div style={{ color: '#9ca3af', fontSize: '0.8125rem', textAlign: 'center', padding: '1rem' }}>
                Select a role to see learning paths.
              </div>
            ) : (
              learningPaths.map((path) => (
                <div key={path.id} style={learningCardStyle}>
                  <div style={{ fontWeight: 600, fontSize: '0.875rem', marginBottom: '0.25rem' }}>{path.title}</div>
                  <div style={{ fontSize: '0.75rem', color: '#6b7280', marginBottom: '0.5rem' }}>{path.description}</div>
                  <div style={{ display: 'flex', gap: '0.5rem', fontSize: '0.6875rem', color: '#9ca3af', marginBottom: '0.5rem' }}>
                    <span>{path.level}</span>
                    <span>|</span>
                    <span>{path.totalDurationMinutes} min</span>
                    <span>|</span>
                    <span>{path.completedCount}/{path.totalCount} completed</span>
                  </div>
                  <div style={progressBarOuter}>
                    <div style={{ width: `${path.progressPercent}%`, height: '100%', backgroundColor: '#2563eb', borderRadius: '9999px' }} />
                  </div>

                  {/* Resources list */}
                  <div style={{ marginTop: '0.75rem' }}>
                    {path.resources.map((resource) => (
                      <div key={resource.id} style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', padding: '0.25rem 0', fontSize: '0.75rem' }}>
                        <span style={{ color: resource.completed ? '#22c55e' : '#d1d5db' }}>
                          {resource.completed ? '&#9745;' : '&#9744;'}
                        </span>
                        <span style={{ flex: 1, color: '#374151' }}>{resource.title}</span>
                        <span style={tagStyle}>{resource.type}</span>
                        <span style={{ color: '#9ca3af' }}>{resource.durationMinutes}m</span>
                      </div>
                    ))}
                  </div>
                </div>
              ))
            )}
          </>
        )}
      </div>
    </div>
  );
}

export default KnowledgeSearch;
