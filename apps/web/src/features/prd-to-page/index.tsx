import { type CSSProperties } from 'react';
import { PageGenerator } from './components/PageGenerator';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const layoutStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  height: '100%',
  overflow: 'hidden',
};

// ---------------------------------------------------------------------------
// PRDToPagePage
// ---------------------------------------------------------------------------

export function PRDToPagePage() {
  return (
    <div style={layoutStyle}>
      <PageGenerator />
    </div>
  );
}

export default PRDToPagePage;
