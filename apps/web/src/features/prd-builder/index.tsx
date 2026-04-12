import { useState, useCallback, type CSSProperties } from 'react';
import type { PRDSession } from '@apex-dev-manager/shared-types';
import { PRDSessionList } from './components/PRDSessionList';
import { PRDWorkspace } from './components/PRDWorkspace';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const layoutStyle: CSSProperties = {
  display: 'flex',
  height: '100%',
  minHeight: 0,
};

const sidebarStyle: CSSProperties = {
  width: 300,
  minWidth: 260,
  maxWidth: 340,
  display: 'flex',
  flexDirection: 'column',
  overflow: 'hidden',
  borderRight: '1px solid #e5e7eb',
};

const mainStyle: CSSProperties = {
  flex: 1,
  display: 'flex',
  flexDirection: 'column',
  overflow: 'hidden',
  minWidth: 0,
};

const emptyStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  alignItems: 'center',
  justifyContent: 'center',
  height: '100%',
  color: '#6b7280',
  fontSize: '0.9375rem',
  textAlign: 'center',
  padding: '2rem',
};

// ---------------------------------------------------------------------------
// PRDBuilderPage
// ---------------------------------------------------------------------------

export function PRDBuilderPage() {
  const [selectedSessionId, setSelectedSessionId] = useState<string | null>(null);

  const handleSelect = useCallback((session: PRDSession) => {
    setSelectedSessionId(session.id);
  }, []);

  const handleCreateNew = useCallback(() => {
    setSelectedSessionId(null);
  }, []);

  return (
    <div style={layoutStyle}>
      {/* Sidebar: session list */}
      <div style={sidebarStyle}>
        <PRDSessionList
          selectedId={selectedSessionId}
          onSelect={handleSelect}
          onCreateNew={handleCreateNew}
        />
      </div>

      {/* Main: workspace */}
      <div style={mainStyle}>
        {selectedSessionId ? (
          <PRDWorkspace sessionId={selectedSessionId} />
        ) : (
          <div style={emptyStyle}>
            <h3 style={{ margin: '0 0 0.5rem', color: '#111827', fontWeight: 600 }}>
              PRD Builder
            </h3>
            <p>Select a session from the sidebar or create a new one to get started.</p>
            <p style={{ fontSize: '0.8125rem', color: '#9ca3af', marginTop: '0.5rem' }}>
              Upload documents, extract requirements, generate PRD sections, validate, and export.
            </p>
          </div>
        )}
      </div>
    </div>
  );
}

export default PRDBuilderPage;
