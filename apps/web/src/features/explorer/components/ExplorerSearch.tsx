import { useState, useEffect, useRef, useMemo } from 'react';
import type { SearchResultItem, TreeNodeType } from '@apex-dev-manager/shared-types';
import { useExplorerSearch } from '../hooks/useExplorer';

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
          <strong key={i} className="explorer-search-highlight">
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
      <div className="explorer-search-wrapper">
        <input
          type="search"
          placeholder="Search components..."
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          className="app-input"
          aria-label="Search explorer"
        />
      </div>

      {/* Results */}
      {debouncedTerm.length >= 2 && (
        <div className="explorer-search-results">
          {isFetching && (
            <p className="explorer-placeholder-text explorer-placeholder-text-sm">Searching...</p>
          )}

          {showEmpty && (
            <p className="explorer-placeholder-text">
              No results found for &quot;{debouncedTerm}&quot;.
            </p>
          )}

          {hasResults &&
            Object.entries(grouped).map(([type, items]) => (
              <div key={type}>
                <div className="explorer-search-group-header">
                  {NODE_TYPE_LABELS[type as TreeNodeType] ?? type}
                </div>
                {items.map((item) => (
                  <div
                    key={item.id}
                    className="explorer-search-result-item"
                    onClick={() => onNavigate(item.id)}
                    role="option"
                    tabIndex={0}
                  >
                    <HighlightedLabel label={item.label} ranges={item.matchRanges} />
                    <span className="explorer-search-result-path">{item.path}</span>
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
