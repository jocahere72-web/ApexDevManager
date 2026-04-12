import type { QuickActionType } from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

export interface PromptContext {
  appName?: string;
  pageName?: string;
  componentSource?: string;
  connectionInfo?: string;
}

// ---------------------------------------------------------------------------
// System Prompt Builder
// ---------------------------------------------------------------------------

/**
 * Builds a system prompt with APEX context for the AI assistant.
 */
export function buildSystemPrompt(context: PromptContext): string {
  const parts: string[] = [
    `You are an expert Oracle APEX developer assistant integrated into the APEX Dev Manager IDE.`,
    `You help developers understand, write, debug, and optimize Oracle APEX applications.`,
    ``,
    `Your capabilities:`,
    `- Explain PL/SQL, JavaScript, HTML, and CSS code used in Oracle APEX`,
    `- Generate and refactor APEX components (regions, items, processes, dynamic actions)`,
    `- Identify bugs, security vulnerabilities, and performance issues`,
    `- Write documentation for APEX code and components`,
    `- Provide best practices for Oracle APEX development`,
    ``,
    `Guidelines:`,
    `- Always provide code examples when relevant`,
    `- Use Oracle APEX conventions and best practices`,
    `- When generating SQL or PL/SQL, use bind variables to prevent SQL injection`,
    `- Wrap code blocks in markdown fenced code blocks with the appropriate language tag`,
    `- Be concise but thorough in explanations`,
  ];

  if (context.appName) {
    parts.push(``, `Current APEX Application: ${context.appName}`);
  }

  if (context.pageName) {
    parts.push(`Current Page: ${context.pageName}`);
  }

  if (context.componentSource) {
    parts.push(
      ``,
      `The user is currently viewing the following component source:`,
      '```',
      context.componentSource,
      '```',
    );
  }

  return parts.join('\n');
}

// ---------------------------------------------------------------------------
// Quick Action Prompts
// ---------------------------------------------------------------------------

const QUICK_ACTION_PROMPTS: Record<QuickActionType, (code: string, language?: string) => string> = {
  explain: (code, language) =>
    `Explain the following ${language ?? 'code'} in detail. Break down what each section does, identify key patterns, and note any APEX-specific features:\n\n\`\`\`${language ?? ''}\n${code}\n\`\`\``,

  refactor: (code, language) =>
    `Refactor the following ${language ?? 'code'} to improve readability, maintainability, and adherence to Oracle APEX best practices. Explain each change you make:\n\n\`\`\`${language ?? ''}\n${code}\n\`\`\``,

  'find-bugs': (code, language) =>
    `Analyze the following ${language ?? 'code'} for bugs, logic errors, edge cases, and potential runtime issues. For each issue found, explain the problem and provide a fix:\n\n\`\`\`${language ?? ''}\n${code}\n\`\`\``,

  document: (code, language) =>
    `Generate comprehensive documentation for the following ${language ?? 'code'}. Include:\n- A summary of purpose and functionality\n- Parameter descriptions (if applicable)\n- Return value descriptions (if applicable)\n- Usage examples\n- Any important notes or caveats\n\n\`\`\`${language ?? ''}\n${code}\n\`\`\``,

  optimize: (code, language) =>
    `Optimize the following ${language ?? 'code'} for performance. Consider:\n- Query optimization (if SQL/PL/SQL)\n- Reducing unnecessary operations\n- Caching opportunities\n- Index usage recommendations\n- APEX-specific performance tips\n\nExplain each optimization and its expected impact:\n\n\`\`\`${language ?? ''}\n${code}\n\`\`\``,

  security: (code, language) =>
    `Perform a security review of the following ${language ?? 'code'}. Check for:\n- SQL injection vulnerabilities\n- Cross-site scripting (XSS)\n- Authorization bypass risks\n- Sensitive data exposure\n- APEX security best practices violations\n\nFor each finding, rate its severity (Critical/High/Medium/Low) and provide a remediation:\n\n\`\`\`${language ?? ''}\n${code}\n\`\`\``,
};

/**
 * Generates a user prompt for a specific quick action type.
 */
export function buildQuickActionPrompt(
  action: QuickActionType,
  code: string,
  language?: string,
): string {
  const builder = QUICK_ACTION_PROMPTS[action];
  if (!builder) {
    throw new Error(`Unknown quick action type: ${action}`);
  }
  return builder(code, language);
}
