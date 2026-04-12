import { useRef, useEffect, useCallback } from 'react';
import { DiffEditor, type DiffOnMount } from '@monaco-editor/react';
import type * as Monaco from 'monaco-editor';
import {
  PLSQL_LANGUAGE_ID,
  plsqlMonarchLanguage,
  plsqlLanguageConfiguration,
} from '../lib/plsql-language';

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

export interface DiffViewerProps {
  original: string;
  modified: string;
  language?: string;
  theme?: 'vs-dark' | 'light' | 'hc-black';
  className?: string;
}

// ---------------------------------------------------------------------------
// Track registration
// ---------------------------------------------------------------------------

let plsqlRegisteredForDiff = false;

function ensurePlsqlRegistered(monaco: typeof Monaco): void {
  if (plsqlRegisteredForDiff) return;

  // Only register if not already registered
  const langs = monaco.languages.getLanguages();
  if (!langs.some((l) => l.id === PLSQL_LANGUAGE_ID)) {
    monaco.languages.register({ id: PLSQL_LANGUAGE_ID });
    monaco.languages.setMonarchTokensProvider(PLSQL_LANGUAGE_ID, plsqlMonarchLanguage);
    monaco.languages.setLanguageConfiguration(PLSQL_LANGUAGE_ID, plsqlLanguageConfiguration);
  }

  plsqlRegisteredForDiff = true;
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function DiffViewer({
  original,
  modified,
  language = 'plsql',
  theme = 'vs-dark',
  className,
}: DiffViewerProps) {
  const diffEditorRef = useRef<Monaco.editor.IStandaloneDiffEditor | null>(null);

  const handleDiffDidMount: DiffOnMount = useCallback((editor, monaco) => {
    diffEditorRef.current = editor;
    ensurePlsqlRegistered(monaco);
  }, []);

  // Cleanup
  useEffect(() => {
    return () => {
      diffEditorRef.current?.dispose();
    };
  }, []);

  return (
    <div className={className} style={{ height: '100%', width: '100%' }}>
      <DiffEditor
        height="100%"
        language={language === 'plsql' ? PLSQL_LANGUAGE_ID : language}
        original={original}
        modified={modified}
        theme={theme}
        onMount={handleDiffDidMount}
        options={{
          readOnly: true,
          renderSideBySide: true,
          minimap: { enabled: false },
          lineNumbers: 'on',
          fontSize: 13,
          scrollBeyondLastLine: false,
          automaticLayout: true,
          renderOverviewRuler: true,
          padding: { top: 8 },
        }}
      />
    </div>
  );
}
