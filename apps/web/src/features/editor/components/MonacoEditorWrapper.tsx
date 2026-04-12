import { useRef, useEffect, useCallback } from 'react';
import Editor, { type OnMount, type OnChange } from '@monaco-editor/react';
import type * as Monaco from 'monaco-editor';
import {
  PLSQL_LANGUAGE_ID,
  plsqlMonarchLanguage,
  plsqlLanguageConfiguration,
  createPlsqlCompletionProvider,
} from '../lib/plsql-language';

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

export interface MonacoEditorWrapperProps {
  value: string;
  onChange?: (value: string) => void;
  language?: string;
  readOnly?: boolean;
  theme?: 'vs-dark' | 'light' | 'hc-black';
  onSave?: () => void;
  onFormat?: () => void;
  className?: string;
}

// ---------------------------------------------------------------------------
// Track whether PL/SQL has been registered (once per Monaco instance)
// ---------------------------------------------------------------------------

let plsqlRegistered = false;

function registerPlsqlLanguage(monaco: typeof Monaco): void {
  if (plsqlRegistered) return;

  monaco.languages.register({ id: PLSQL_LANGUAGE_ID });
  monaco.languages.setMonarchTokensProvider(PLSQL_LANGUAGE_ID, plsqlMonarchLanguage);
  monaco.languages.setLanguageConfiguration(PLSQL_LANGUAGE_ID, plsqlLanguageConfiguration);
  monaco.languages.registerCompletionItemProvider(
    PLSQL_LANGUAGE_ID,
    createPlsqlCompletionProvider(monaco),
  );

  plsqlRegistered = true;
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function MonacoEditorWrapper({
  value,
  onChange,
  language = 'plsql',
  readOnly = false,
  theme = 'vs-dark',
  onSave,
  onFormat,
  className,
}: MonacoEditorWrapperProps) {
  const editorRef = useRef<Monaco.editor.IStandaloneCodeEditor | null>(null);
  const monacoRef = useRef<typeof Monaco | null>(null);

  // ── Handle mount ──────────────────────────────────────────────────────

  const handleEditorDidMount: OnMount = useCallback(
    (editor, monaco) => {
      editorRef.current = editor;
      monacoRef.current = monaco;

      // Register PL/SQL language support
      registerPlsqlLanguage(monaco);

      // Ctrl+S / Cmd+S — save
      editor.addCommand(monaco.KeyMod.CtrlCmd | monaco.KeyCode.KeyS, () => {
        onSave?.();
      });

      // Shift+Alt+F — format
      editor.addCommand(
        monaco.KeyMod.Shift | monaco.KeyMod.Alt | monaco.KeyCode.KeyF,
        () => {
          onFormat?.();
        },
      );

      // Focus the editor
      editor.focus();
    },
    [onSave, onFormat],
  );

  // ── Handle change ─────────────────────────────────────────────────────

  const handleChange: OnChange = useCallback(
    (val) => {
      if (val !== undefined) {
        onChange?.(val);
      }
    },
    [onChange],
  );

  // ── Sync readOnly prop ────────────────────────────────────────────────

  useEffect(() => {
    editorRef.current?.updateOptions({ readOnly });
  }, [readOnly]);

  // ── Render ────────────────────────────────────────────────────────────

  return (
    <div className={className} style={{ height: '100%', width: '100%' }}>
      <Editor
        height="100%"
        language={language === 'plsql' ? PLSQL_LANGUAGE_ID : language}
        value={value}
        theme={theme}
        onChange={handleChange}
        onMount={handleEditorDidMount}
        options={{
          readOnly,
          minimap: { enabled: true },
          lineNumbers: 'on',
          fontSize: 14,
          tabSize: 2,
          wordWrap: 'on',
          automaticLayout: true,
          scrollBeyondLastLine: false,
          renderLineHighlight: 'all',
          cursorBlinking: 'smooth',
          smoothScrolling: true,
          bracketPairColorization: { enabled: true },
          padding: { top: 8 },
        }}
      />
    </div>
  );
}
