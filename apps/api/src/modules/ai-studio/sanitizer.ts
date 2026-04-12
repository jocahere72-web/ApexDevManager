import type { SanitizationResult } from '@apex-dev-manager/shared-types';
import { logger } from '../../lib/logger.js';

// ---------------------------------------------------------------------------
// Dangerous patterns for input sanitization (prompt injection defense)
// ---------------------------------------------------------------------------

const INPUT_BLOCK_PATTERNS: Array<{ pattern: RegExp; label: string }> = [
  { pattern: /DROP\s+TABLE/i, label: 'DROP TABLE' },
  { pattern: /DROP\s+DATABASE/i, label: 'DROP DATABASE' },
  { pattern: /TRUNCATE\s+TABLE/i, label: 'TRUNCATE TABLE' },
  { pattern: /ALTER\s+SYSTEM/i, label: 'ALTER SYSTEM' },
  { pattern: /GRANT\s+/i, label: 'GRANT' },
  { pattern: /REVOKE\s+/i, label: 'REVOKE' },
  { pattern: /CREATE\s+USER/i, label: 'CREATE USER' },
  { pattern: /DROP\s+USER/i, label: 'DROP USER' },
  { pattern: /ALTER\s+USER/i, label: 'ALTER USER' },
  { pattern: /DBMS_SCHEDULER/i, label: 'DBMS_SCHEDULER' },
  { pattern: /UTL_HTTP/i, label: 'UTL_HTTP' },
  { pattern: /UTL_FILE/i, label: 'UTL_FILE' },
  { pattern: /EXECUTE\s+IMMEDIATE/i, label: 'EXECUTE IMMEDIATE' },
];

const PROMPT_INJECTION_PATTERNS: Array<{ pattern: RegExp; label: string }> = [
  { pattern: /ignore\s+(all\s+)?previous\s+instructions/i, label: 'Prompt injection: ignore previous' },
  { pattern: /you\s+are\s+now\s+/i, label: 'Prompt injection: role override' },
  { pattern: /system\s*:\s*/i, label: 'Prompt injection: system role injection' },
  { pattern: /\[INST\]/i, label: 'Prompt injection: instruction tag' },
  { pattern: /<<SYS>>/i, label: 'Prompt injection: system tag' },
];

// ---------------------------------------------------------------------------
// Dangerous patterns for output sanitization
// ---------------------------------------------------------------------------

const OUTPUT_WARN_PATTERNS: Array<{ pattern: RegExp; label: string }> = [
  { pattern: /DROP\s+TABLE\s+\w+\s*;/i, label: 'Destructive SQL: DROP TABLE' },
  { pattern: /DROP\s+DATABASE/i, label: 'Destructive SQL: DROP DATABASE' },
  { pattern: /TRUNCATE\s+TABLE\s+\w+\s*;/i, label: 'Destructive SQL: TRUNCATE TABLE' },
  { pattern: /ALTER\s+SYSTEM/i, label: 'Destructive SQL: ALTER SYSTEM' },
  { pattern: /DELETE\s+FROM\s+\w+\s*(?:;|$)/i, label: 'Destructive SQL: DELETE without WHERE' },
  { pattern: /GRANT\s+DBA/i, label: 'Privilege escalation: GRANT DBA' },
  { pattern: /CREATE\s+USER\s+\w+\s+IDENTIFIED/i, label: 'Privilege escalation: CREATE USER' },
];

// ---------------------------------------------------------------------------
// Sanitization functions
// ---------------------------------------------------------------------------

/**
 * Sanitize user input prompt. Strips potential prompt injections and blocks
 * dangerous patterns like DDL statements in plain prompts.
 */
export function sanitizeInput(prompt: string): SanitizationResult {
  const warnings: string[] = [];
  const blockedPatterns: string[] = [];
  let sanitized = prompt.trim();

  // Check for prompt injection patterns
  for (const { pattern, label } of PROMPT_INJECTION_PATTERNS) {
    if (pattern.test(sanitized)) {
      blockedPatterns.push(label);
      sanitized = sanitized.replace(pattern, '[REDACTED]');
    }
  }

  // Check for dangerous SQL patterns outside of code blocks
  const codeBlockRegex = /```[\s\S]*?```/g;
  const withoutCodeBlocks = sanitized.replace(codeBlockRegex, '');

  for (const { pattern, label } of INPUT_BLOCK_PATTERNS) {
    if (pattern.test(withoutCodeBlocks)) {
      warnings.push(`Potentially dangerous pattern detected: ${label}`);
    }
  }

  // Strip null bytes and control characters (except newlines and tabs)
  sanitized = sanitized.replace(/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/g, '');

  const safe = blockedPatterns.length === 0;

  if (!safe) {
    logger.warn({ blockedPatterns, warnings }, 'Input sanitization blocked patterns');
  }

  return { safe, sanitized, warnings, blockedPatterns };
}

/**
 * Sanitize AI-generated output. Validates that generated code does not contain
 * destructive SQL or dangerous operations. Returns warnings but does not block
 * the output (the AI may legitimately discuss these patterns).
 */
export function sanitizeOutput(response: string): SanitizationResult {
  const warnings: string[] = [];
  const blockedPatterns: string[] = [];
  let sanitized = response;

  // Extract code blocks and check for dangerous patterns within them
  const codeBlockRegex = /```(?:sql|plsql|pl\/sql)?\s*\n([\s\S]*?)```/gi;
  let match: RegExpExecArray | null;

  while ((match = codeBlockRegex.exec(response)) !== null) {
    const codeContent = match[1];
    for (const { pattern, label } of OUTPUT_WARN_PATTERNS) {
      if (pattern.test(codeContent)) {
        warnings.push(`Generated code contains: ${label}`);
      }
    }
  }

  // If warnings exist, prepend a warning notice to the response
  if (warnings.length > 0) {
    const warningNotice = [
      '\n> **Warning**: The generated code contains potentially destructive operations:',
      ...warnings.map((w) => `> - ${w}`),
      '> Please review carefully before applying.\n',
    ].join('\n');

    sanitized = warningNotice + '\n' + sanitized;
  }

  return {
    safe: warnings.length === 0,
    sanitized,
    warnings,
    blockedPatterns,
  };
}
