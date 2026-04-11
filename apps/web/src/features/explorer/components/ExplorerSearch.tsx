import { useState, useEffect, useRef, useMemo, type CSSProperties } from 'react';
import type { SearchResultItem, TreeNodeType } from '@apex-dev-manager/shared-types';
import { useExplorerSearch } from '../hooks/useExplorer';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const wrapperStyle: CSSProperties = {
  padding: '0.5rem 0.75rem',
  borderBottom: '1px solid #e5e7eb',
};

const inputStyle: CSSProperties = {
  width: '100%',
  padding: '0.375rem 0.5rem',
  fontSize: '0.8125rem',
  border: '1px solid #d1d5db',
  borderRadius: 6,
  outline: 'none',
  boxSizing: 'border-box',
};

const resultsContainerStyle: CSSProperties = {
  maxHeight: 320,
  overflowY: 'auto',
  padding: '0.25rem 0.75rem 0.5rem',
  borderBottom: '1px solid #e5e7eb',
};

const groupHeaderStyle: CSSProperties = {
  fontSize: '0.6875rem',
  fontWeight: 600,
  color: '#6b7280',
  textTransform: 'uppercase',
  letterSpacing: '0.05em',
  marginTop: 8,
  marginBottom: 4,
};

const resultItemStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  gap: 2,
  padding: '4px 6px',
  borderRadius: 4,
  cursor: 'pointer',
  fontSize: '0.8125rem',
};

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

const NODE_TYPE_LABELS: Record<TreeNodeType, string> = {
  workspace: 'Workspaces',
  application: 'Applications',
  page: 'Pages',
  region: 'Regions',
  item: 'Items',
  process: 'Processes',
  dynamic_action: 'Dynamic Actions',
};

function groupByType(items: SearchResultItem[]): Record<string, SearchResultItem[]> {
  const groups: Record<string, SearchResultItem[]> = {};
  for (const item of items) {
    const key = item.nodeType;
    if (!groups[key]) groups[key] = [];
    groups[key].push(item);
  }
  return groups;
}

/** Render a label with bold match highlights. */
function HighlightedLabel({
  label,
  ranges,
}: {
  label: string;
  ranges: Array<{ start: number; end: number }>;
}) {
  if (ranges.length === 0) return <span>{label}</span>;

  const sorted = [...ranges].sort((a, b) => a.start - b.start);
  const parts: Array<{ text: string; bold: boolean }> = [];
  let cursor = 0;

  for (const { start, end } of sorted) {
    if (start > cursor) {
      parts.push({ text: label.slice(cursor, start), bold: false });
    }
    parts.push({ text: label.slice(start, end), bold: true });
    cursor = end;
  }
  if (cursor < label.length) {
    parts.push({ text: label.slice(cursor), bold: false });
  }

  return (
    <span>
      {parts.map((p, i) =>
        p.bold ? (
          <strong key={i} style={{ fontWeight: 700 }}>
            {p.text}
          </strong>
        ) : (
          <span key={i}>{p.text}</span>
        ),
      )}
    </span>
  );
}

// ---------------------------------------------------------------------------
// ExplorerSearch component
// ---------------------------------------------------------------------------

export interface ExplorerSearchProps {
  connectionId: string;
  /** Called when the user clicks a search result */
  onNavigate: (nodeId: string) => void;
}

export function ExplorerSearch({ connectionId, onNavigate }: ExplorerSearchProps) {
  const [inputValue, setInputValue] = useState('');
  const [debouncedTerm, setDebouncedTerm] = useState('');
  const timerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  // Debounce input by 300 ms, only emit when >= 2 chars
  useEffect(() => {
    if (timerRef.current) clearTimeout(timerRef.current);
    timerRef.current = setTimeout(() => {
      setDebouncedTerm(inputValue.length >= 2 ? inputValue : '');
    }, 300);
    return () => {
      if (timerRef.current) clearTimeout(timerRef.current);
    };
  }, [inputValue]);

  const { data: searchResult, isFetching } = useExplorerSearch(connectionId, debouncedTerm);

  const grouped = useMemo(
    () => (searchResult ? groupByType(searchResult.items) : {}),
    [searchResult],
  );
  const hasResults = searchResult && searchResult.items.length > 0;
  const showEmpty = debouncedTerm.length >= 2 && !isFetching && !hasResults;

  return (
    <div>
      <div style={wrapperStyle}>
        <input
          type="search"
          placeholder="Search components..."
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          style={inputStyle}
          aria-label="Search explorer"
        />
      </div>

      {/* Results */}
      {debouncedTerm.length >= 2 && (
        <div style={resultsContainerStyle}>
          {isFetching && (
            <p style={{ fontSize: '0.75rem', color: '#9ca3af' }}>Searching...</p>
          )}

          {showEmpty && (
            <p style={{ fontSize: '0.8125rem', color: '#9ca3af', textAlign: 'center', marginTop: 12 }}>
              No results found for "{debouncedTerm}".
            </p>
          )}

          {hasResults &&
            Object.entries(grouped).map(([type, items]) => (
              <div key={type}>
                <div style={groupHeaderStyle}>
                  {NODE_TYPE_LABELS[type as TreeNodeType] ?? type}
                </div>
                {items.map((item) => (
                  <div
                    key={item.id}
                    style={resultItemStyle}
                    onClick={() => onNavigate(item.id)}
                    onMouseEnter={(e) => {
                      (e.currentTarget as HTMLDivElement).style.backgroundColor = '#f3f4f6';
                    }}
                    onMouseLeave={(e) => {
                      (e.currentTarget as HTMLDivElement).style.backgroundColor = 'transparent';
                    }}
                    role="option"
                    tabIndex={0}
                  >
                    <HighlightedLabel label={item.label} ranges={item.matchRanges} />
                    <span style={{ fontSize: '0.6875rem', color: '#9ca3af' }}>{item.path}</span>
                  </div>
                ))}
              </div>
            ))}
        </div>
      )}
    </div>
  );
}

export default ExplorerSearch;
