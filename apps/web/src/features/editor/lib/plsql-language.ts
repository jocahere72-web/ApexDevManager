import type * as Monaco from 'monaco-editor';

// ---------------------------------------------------------------------------
// PL/SQL Language Definition for Monaco Editor
// ---------------------------------------------------------------------------

export const PLSQL_LANGUAGE_ID = 'plsql';

// ── Keywords ───────────────────────────────────────────────────────────────

const PLSQL_KEYWORDS = [
  'ABORT', 'ACCEPT', 'ACCESS', 'ADD', 'ALL', 'ALTER', 'AND', 'ANY', 'AS',
  'ASC', 'AT', 'AUDIT', 'AUTHORIZATION', 'AVG', 'BASE_TABLE', 'BEGIN',
  'BETWEEN', 'BODY', 'BOOLEAN', 'BULK', 'BY', 'CASE', 'CHAR', 'CHECK',
  'CLOSE', 'CLUSTER', 'COLLECT', 'COLUMN', 'COMMENT', 'COMMIT', 'COMPRESS',
  'CONNECT', 'CONSTANT', 'COUNT', 'CREATE', 'CURRENT', 'CURSOR', 'DATABASE',
  'DATE', 'DBA', 'DEBUGOFF', 'DEBUGON', 'DECLARE', 'DEFAULT', 'DEFINITION',
  'DELAY', 'DELETE', 'DESC', 'DIGITS', 'DISPOSE', 'DISTINCT', 'DO', 'DROP',
  'ELSE', 'ELSIF', 'ENABLE', 'END', 'ENTRY', 'EXCEPTION', 'EXCEPTION_INIT',
  'EXCHANGE', 'EXCLUSIVE', 'EXISTS', 'EXIT', 'EXTERNAL', 'FETCH', 'FILE',
  'FOR', 'FORALL', 'FORCE', 'FORM', 'FROM', 'FUNCTION', 'GENERIC', 'GOTO',
  'GRANT', 'GROUP', 'HAVING', 'IDENTIFIED', 'IF', 'IMMEDIATE', 'IN',
  'INCREMENT', 'INDEX', 'INDEXES', 'INDICATOR', 'INSERT', 'INTERFACE',
  'INTERSECT', 'INTO', 'IS', 'LEVEL', 'LIKE', 'LIMITED', 'LOCK', 'LOG',
  'LONG', 'LOOP', 'MASTER', 'MAXEXTENTS', 'MEMBER', 'MERGE', 'MINUS',
  'MLSLABEL', 'MOD', 'MODE', 'MODIFY', 'MULTISET', 'NEW', 'NEXT',
  'NOAUDIT', 'NOCOMPRESS', 'NOT', 'NOWAIT', 'NULL', 'NUMBER_BASE', 'OF',
  'OFF', 'OFFLINE', 'ON', 'ONLINE', 'OPEN', 'OPTION', 'OR', 'ORDER', 'OUT',
  'PACKAGE', 'PARTITION', 'PCTFREE', 'PIPE', 'PIPELINED', 'PRAGMA',
  'PRIOR', 'PRIVATE', 'PRIVILEGES', 'PROCEDURE', 'PUBLIC', 'RAISE',
  'RANGE', 'RAW', 'RECORD', 'REF', 'RELEASE', 'REMR', 'RENAME', 'REPLACE',
  'RESOURCE', 'RESULT', 'RETURN', 'RETURNING', 'REVERSE', 'REVOKE',
  'ROLLBACK', 'ROW', 'ROWLABEL', 'ROWNUM', 'ROWS', 'ROWTYPE', 'RUN',
  'SAVEPOINT', 'SCHEMA', 'SELECT', 'SEPARATE', 'SEQUENCE', 'SESSION',
  'SET', 'SHARE', 'SPACE', 'SQL', 'SQLCODE', 'SQLERRM', 'START',
  'STATEMENT', 'SUBTYPE', 'SUCCESSFUL', 'SUM', 'SYNONYM', 'SYSDATE',
  'TABAUTH', 'TABLE', 'TASK', 'TERMINATE', 'THEN', 'TO', 'TRIGGER',
  'TRUNCATE', 'TYPE', 'UNION', 'UNIQUE', 'UPDATE', 'USE', 'USING',
  'VALIDATE', 'VALUES', 'VIEW', 'VIEWS', 'WHEN', 'WHERE', 'WHILE', 'WITH',
  'WORK', 'WRITE', 'XOR',
];

const PLSQL_TYPES = [
  'NUMBER', 'VARCHAR2', 'VARCHAR', 'CHAR', 'DATE', 'BOOLEAN', 'CLOB',
  'BLOB', 'NCLOB', 'BFILE', 'BINARY_INTEGER', 'PLS_INTEGER',
  'BINARY_FLOAT', 'BINARY_DOUBLE', 'TIMESTAMP', 'INTERVAL', 'XMLTYPE',
  'SYS_REFCURSOR', 'NATURAL', 'NATURALN', 'POSITIVE', 'POSITIVEN',
  'SIGNTYPE', 'SIMPLE_INTEGER', 'SIMPLE_FLOAT', 'SIMPLE_DOUBLE',
  'INTEGER', 'INT', 'SMALLINT', 'REAL', 'FLOAT', 'DECIMAL', 'NUMERIC',
  'DEC', 'DOUBLE', 'PRECISION', 'LONG', 'RAW', 'ROWID', 'UROWID',
  'NCHAR', 'NVARCHAR2',
];

const PLSQL_BUILTINS = [
  'ABS', 'ACOS', 'ADD_MONTHS', 'ASCII', 'ASIN', 'ATAN', 'ATAN2', 'CEIL',
  'CHR', 'COALESCE', 'CONCAT', 'COS', 'COSH', 'DECODE', 'EXP', 'FLOOR',
  'GREATEST', 'INITCAP', 'INSTR', 'LAST_DAY', 'LENGTH', 'LN', 'LOG',
  'LOWER', 'LPAD', 'LTRIM', 'MAX', 'MIN', 'MOD', 'MONTHS_BETWEEN',
  'NEXT_DAY', 'NVL', 'NVL2', 'POWER', 'REPLACE', 'ROUND', 'RPAD',
  'RTRIM', 'SIGN', 'SIN', 'SINH', 'SQRT', 'SUBSTR', 'SYSDATE', 'TAN',
  'TANH', 'TO_CHAR', 'TO_DATE', 'TO_NUMBER', 'TO_TIMESTAMP', 'TRANSLATE',
  'TRIM', 'TRUNC', 'UPPER', 'DBMS_OUTPUT', 'DBMS_SQL', 'DBMS_LOB',
  'UTL_FILE', 'UTL_HTTP', 'APEX_JSON', 'APEX_UTIL', 'APEX_COLLECTION',
  'APEX_APPLICATION', 'APEX_PAGE', 'APEX_REGION', 'APEX_DEBUG',
  'APEX_STRING', 'APEX_EXEC', 'APEX_DATA_PARSER',
];

// ── Monarch Tokenizer ──────────────────────────────────────────────────────

export const plsqlMonarchLanguage: Monaco.languages.IMonarchLanguage = {
  defaultToken: '',
  tokenPostfix: '.plsql',
  ignoreCase: true,

  keywords: PLSQL_KEYWORDS,
  typeKeywords: PLSQL_TYPES,
  builtins: PLSQL_BUILTINS,

  operators: [
    '+', '-', '*', '/', '=', '<', '>', '<=', '>=', '<>', '!=',
    ':=', '=>', '||', '..', '@',
  ],

  symbols: /[=><!~?:&|+\-*/^%@]+/,

  tokenizer: {
    root: [
      // Single-line comment
      [/--.*$/, 'comment'],

      // Multi-line comment
      [/\/\*/, 'comment', '@comment'],

      // Strings (single-quoted)
      [/'/, 'string', '@string'],

      // Quoted identifiers
      [/"/, 'identifier.quote', '@quotedIdentifier'],

      // Numbers
      [/\d+(\.\d+)?([eE][+-]?\d+)?/, 'number'],
      [/\.\d+([eE][+-]?\d+)?/, 'number'],

      // Bind variables
      [/:[\w$]+/, 'variable'],

      // Substitution variables
      [/&[\w$]+\.?/, 'variable'],

      // Identifiers and keywords
      [
        /[a-zA-Z_$][\w$]*/,
        {
          cases: {
            '@keywords': 'keyword',
            '@typeKeywords': 'type',
            '@builtins': 'predefined',
            '@default': 'identifier',
          },
        },
      ],

      // Operators
      [/@symbols/, {
        cases: {
          '@operators': 'operator',
          '@default': '',
        },
      }],

      // Delimiters
      [/[;,.]/, 'delimiter'],
      [/[()[\]]/, 'delimiter.parenthesis'],

      // Whitespace
      [/\s+/, 'white'],
    ],

    comment: [
      [/[^/*]+/, 'comment'],
      [/\*\//, 'comment', '@pop'],
      [/[/*]/, 'comment'],
    ],

    string: [
      [/[^']+/, 'string'],
      [/''/, 'string.escape'],
      [/'/, 'string', '@pop'],
    ],

    quotedIdentifier: [
      [/[^"]+/, 'identifier.quote'],
      [/""/, 'identifier.quote'],
      [/"/, 'identifier.quote', '@pop'],
    ],
  },
};

// ── Language Configuration ─────────────────────────────────────────────────

export const plsqlLanguageConfiguration: Monaco.languages.LanguageConfiguration = {
  comments: {
    lineComment: '--',
    blockComment: ['/*', '*/'],
  },
  brackets: [
    ['(', ')'],
    ['[', ']'],
  ],
  autoClosingPairs: [
    { open: '(', close: ')' },
    { open: '[', close: ']' },
    { open: "'", close: "'", notIn: ['string'] },
    { open: '"', close: '"', notIn: ['string'] },
    { open: '/*', close: '*/', notIn: ['string'] },
  ],
  surroundingPairs: [
    { open: '(', close: ')' },
    { open: '[', close: ']' },
    { open: "'", close: "'" },
    { open: '"', close: '"' },
  ],
  folding: {
    markers: {
      start: /^\s*(BEGIN|DECLARE|IF|LOOP|FOR|WHILE|CASE)\b/i,
      end: /^\s*END\b/i,
    },
  },
  wordPattern: /(-?\d*\.\d\w*)|([^`~!@#%^&*()\-=+[{\]}\\|;:'",.<>/?\s]+)/,
  indentationRules: {
    increaseIndentPattern: /^\s*(BEGIN|DECLARE|IF|THEN|ELSE|ELSIF|LOOP|FOR|WHILE|CASE|WHEN|EXCEPTION)\b/i,
    decreaseIndentPattern: /^\s*(END|ELSE|ELSIF|WHEN|EXCEPTION)\b/i,
  },
};

// ── Autocomplete Provider ──────────────────────────────────────────────────

export function createPlsqlCompletionProvider(
  monaco: typeof Monaco,
): Monaco.languages.CompletionItemProvider {
  const allKeywords = [...PLSQL_KEYWORDS, ...PLSQL_TYPES, ...PLSQL_BUILTINS];

  return {
    provideCompletionItems(model, position) {
      const word = model.getWordUntilPosition(position);
      const range: Monaco.IRange = {
        startLineNumber: position.lineNumber,
        endLineNumber: position.lineNumber,
        startColumn: word.startColumn,
        endColumn: word.endColumn,
      };

      const suggestions: Monaco.languages.CompletionItem[] = allKeywords.map(
        (kw) => ({
          label: kw,
          kind: PLSQL_KEYWORDS.includes(kw)
            ? monaco.languages.CompletionItemKind.Keyword
            : PLSQL_TYPES.includes(kw)
              ? monaco.languages.CompletionItemKind.TypeParameter
              : monaco.languages.CompletionItemKind.Function,
          insertText: kw,
          range,
        }),
      );

      return { suggestions };
    },
  };
}
