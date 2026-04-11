# Functional Design -- U5: AI Engine

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U5 -- AI Engine |
| **Sprint** | S4 (Fase 1) |
| **Duration** | 2 weeks (Weeks 10-11) |
| **Modules** | M4 (AI Studio) + M10 stub (AI Governance -- basic sanitization) |
| **Stories** | US-012, US-013, US-025 (stub), US-052 |
| **Components** | C07 (AI Orchestration Service), C08 (Safety Engine -- stub), C18 (Cost Tracker -- foundation) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. Claude API Integration with Streaming SSE

### 1.1 Claude API Client

The AI Engine uses the Anthropic Claude API as the primary LLM provider, with Server-Sent Events (SSE) for streaming responses to the UI.

```typescript
interface ClaudeClientConfig {
  apiKey: string;                              // From OCI Vault
  baseUrl: string;                             // https://api.anthropic.com
  defaultModel: string;                        // claude-sonnet-4-20250514
  maxRetries: number;                          // 2
  timeoutMs: number;                           // 60000
  rateLimitPerMinute: number;                  // Per-tenant rate limit
}

interface ClaudeRequest {
  model: string;
  messages: ClaudeMessage[];
  system: string;
  max_tokens: number;
  temperature: number;
  stream: boolean;
  metadata?: { user_id: string };
}

interface ClaudeMessage {
  role: 'user' | 'assistant';
  content: string;
}
```

### 1.2 Streaming Architecture

```
User             Chat UI              API Server           Claude API
  |                 |                     |                     |
  |-- send prompt ->|                     |                     |
  |                 |-- POST /ai/chat --->|                     |
  |                 |                     |-- sanitize input -->|
  |                 |                     |-- build context --->|
  |                 |                     |-- POST /messages -->|
  |                 |                     |   (stream: true)    |
  |                 |                     |<-- SSE chunk 1 -----|
  |                 |<-- SSE chunk 1 -----|                     |
  |<-- render chunk-|                     |                     |
  |                 |                     |<-- SSE chunk 2 -----|
  |                 |<-- SSE chunk 2 -----|                     |
  |<-- render chunk-|                     |                     |
  |                 |                     |<-- SSE [DONE] ------|
  |                 |<-- SSE [DONE] ------|                     |
  |                 |                     |-- validate output ->|
  |                 |                     |-- record tokens --->|
  |                 |                     |-- save conversation |
  |<-- final render-|                     |                     |
```

#### Streaming Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| STREAM-R01 | SSE format | Use `text/event-stream` content type; each chunk is a `data:` line |
| STREAM-R02 | Heartbeat | Send empty SSE comment every 15 seconds to keep connection alive |
| STREAM-R03 | Error event | Send `event: error` with JSON payload on failure |
| STREAM-R04 | Done event | Send `event: done` with token usage summary on completion |
| STREAM-R05 | Timeout | 60-second timeout for Claude API response; abort and notify user |
| STREAM-R06 | Retry | 2 retries on transient Claude API errors (429, 500, 503) with exponential backoff |
| STREAM-R07 | Abort | User can cancel streaming via SSE connection close |

---

## 2. Context Building Pipeline

### 2.1 Context Assembly

The context builder gathers relevant information from the workspace to ground the AI's response in the user's actual APEX environment.

#### Context Sources

| Source | Data | Collection Method | Max Tokens |
|--------|------|-------------------|------------|
| Component code | Current source code of the selected component | Editor session / MCP | 4,000 |
| Page context | Page definition, regions, items, processes, DAs on the same page | Explorer cache | 2,000 |
| Schema context | Table/column definitions referenced in the code | MCP schema query | 2,000 |
| Application context | App name, page list, shared components summary | Explorer cache | 500 |
| Knowledge rules | Relevant coding standards and best practices | Knowledge Engine (future, empty in U5) | 1,000 |
| Conversation history | Previous messages in this conversation | Conversation store | 3,000 |

#### Context Assembly Flow

```
AI Request arrives
       |
       +-- 1. Get component code (from editor session or MCP)
       |
       +-- 2. Get page context (from explorer cache)
       |       +-- Page regions, items, processes, DAs
       |
       +-- 3. Parse code for schema references
       |       +-- Extract table names from FROM, JOIN, INSERT, UPDATE clauses
       |       +-- Extract package references from calls
       |
       +-- 4. Fetch schema metadata for referenced tables
       |       +-- Column names, types, constraints
       |
       +-- 5. Get conversation history (last N messages, within token budget)
       |
       +-- 6. Assemble context window
       |       +-- Total must fit within model context limit
       |       +-- Priority: component code > schema > page > conversation > knowledge
       |
       +-- 7. Build system prompt with context
```

### 2.2 Context Builder Interface

```typescript
interface ContextBuilderService {
  buildContext(request: ContextBuildRequest): Promise<ContextWindow>;
  estimateTokens(text: string): number;
  truncateToFit(context: ContextWindow, maxTokens: number): ContextWindow;
}

interface ContextBuildRequest {
  connectionId: string;
  appId: number;
  pageId?: number;
  componentType?: ComponentType;
  componentId?: number;
  conversationId?: string;
  includeSchema: boolean;
  includePageContext: boolean;
  maxContextTokens: number;                    // Default: 12,000
}

interface ContextWindow {
  componentCode: string | null;
  pageContext: PageContextSummary | null;
  schemaMetadata: SchemaObject[];
  applicationSummary: string;
  knowledgeRules: string[];                    // Empty in U5 (future M14)
  conversationHistory: ConversationMessage[];
  totalTokens: number;
  truncated: boolean;
}

interface SchemaObject {
  objectType: 'table' | 'view' | 'package' | 'sequence';
  objectName: string;
  columns?: { name: string; type: string; nullable: boolean; comment?: string }[];
}

interface PageContextSummary {
  pageId: number;
  pageName: string;
  regions: { name: string; type: string }[];
  items: { name: string; type: string }[];
  processes: { name: string; type: string; point: string }[];
  dynamicActions: { name: string; event: string }[];
}
```

---

## 3. Quick Actions

### 3.1 Quick Action Definitions

Quick actions are pre-defined AI operations that can be triggered from the editor toolbar or context menu.

| Action | Label | System Prompt Template | Input |
|--------|-------|----------------------|-------|
| `explain` | Explain | "Explain the following {language} code clearly..." | Selected code or full component |
| `refactor` | Refactor | "Refactor the following {language} code for readability and maintainability..." | Selected code or full component |
| `bugs` | Find Bugs | "Analyze the following {language} code for potential bugs, edge cases, and issues..." | Selected code or full component |
| `document` | Document | "Add comprehensive comments and documentation to the following {language} code..." | Selected code or full component |
| `optimize` | Optimize | "Optimize the following {language} code for performance..." | Selected code or full component |
| `security` | Security Review | "Review the following {language} code for security vulnerabilities..." | Selected code or full component |

#### Quick Action Flow

```
User selects code     Quick Action Menu     AI Service          Claude API
       |                    |                    |                   |
       |-- right click ---->|                    |                   |
       |-- click "Explain"->|                    |                   |
       |                    |-- build request -->|                   |
       |                    |   (action: explain)|                   |
       |                    |                    |-- build context ->|
       |                    |                    |-- stream SSE ---->|
       |                    |<-- SSE chunks -----|                   |
       |<-- render in chat -|                    |                   |
```

#### Quick Action Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| QA-R01 | Code selection | If text is selected, use selection; otherwise use full component |
| QA-R02 | Context inclusion | Always include page context and schema context for grounding |
| QA-R03 | Streaming | All quick actions use streaming SSE |
| QA-R04 | Result panel | Results displayed in the AI Chat panel (right side) |
| QA-R05 | Copy button | Each response has a "Copy Code" button for generated code blocks |
| QA-R06 | Apply button | Code-generating actions (refactor, optimize) include "Apply in APEX" button |

---

## 4. Chat UI with Conversation History

### 4.1 Chat Interface Wireframe

```
+-------------------------------------------------------------------+
| AI Studio                                [Model: Sonnet v] [Clear] |
+-------------------------------------------------------------------+
| Context: HR Portal > Page 1: Home > Set Department Filter          |
| Connection: APEX-DEV-01  (G) Online                                |
+-------------------------------------------------------------------+
|                                                                    |
| [User]  Explain what this PL/SQL process does                      |
|                                                                    |
| [AI]    This PL/SQL process "Set Department Filter" executes       |
|         during page rendering and...                                |
|         ```plsql                                                   |
|         BEGIN                                                      |
|           IF :P1_DEPT IS NOT NULL THEN                             |
|             :P1_FILTER := 'Y';                                     |
|           END IF;                                                  |
|         END;                                                       |
|         ```                                                        |
|         [Copy Code]  [Apply in APEX]                               |
|                                                                    |
| [User]  Can you add error handling?                                |
|                                                                    |
| [AI]    Here's the updated version with proper exception           |
|         handling...                                                 |
|         ```plsql                                                   |
|         BEGIN                                                      |
|           ...                                                      |
|         EXCEPTION                                                  |
|           WHEN OTHERS THEN                                         |
|             apex_error.add_error(...);                              |
|         END;                                                       |
|         ```                                                        |
|         [Copy Code]  [Apply in APEX]                               |
|                                                                    |
+-------------------------------------------------------------------+
| Quick: [Explain] [Refactor] [Bugs] [Document] [Optimize] [Security]|
+-------------------------------------------------------------------+
| [Type your message...]                              [Send] [Stop]   |
+-------------------------------------------------------------------+
```

### 4.2 Chat Component Interfaces

```typescript
interface AIChatPanelProps {
  connectionId: string;
  appId: number;
  pageId?: number;
  componentType?: ComponentType;
  componentId?: number;
  selectedCode?: string;
}

interface ConversationMessage {
  id: string;
  role: 'user' | 'assistant';
  content: string;
  codeBlocks: CodeBlock[];
  timestamp: string;
  tokensUsed?: { input: number; output: number };
  model?: string;
  action?: QuickActionType;
}

interface CodeBlock {
  id: string;
  language: string;
  code: string;
  canApply: boolean;                // true if code can be applied to APEX
}

type QuickActionType = 'explain' | 'refactor' | 'bugs' | 'document' | 'optimize' | 'security';
```

### 4.3 Chat Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| CHAT-R01 | Conversation per page | Conversations are scoped to a page (connectionId + appId + pageId) |
| CHAT-R02 | History limit | Display last 50 messages; older messages lazy-loaded on scroll |
| CHAT-R03 | Context badge | Show current context (app > page > component) in header |
| CHAT-R04 | Context switch | Changing the selected component in Explorer updates chat context |
| CHAT-R05 | Clear conversation | "Clear" resets conversation history (with confirmation) |
| CHAT-R06 | Markdown rendering | AI responses rendered as Markdown with syntax-highlighted code blocks |
| CHAT-R07 | Stop generation | "Stop" button cancels in-progress SSE stream |
| CHAT-R08 | Auto-scroll | Chat auto-scrolls to bottom during streaming |
| CHAT-R09 | Retry | Failed messages show "Retry" button |

---

## 5. "Apply in APEX" Button Flow

When the AI generates code, the user can apply it directly to the APEX instance via the same flow as manual editor changes.

#### Apply-in-APEX Sequence

```
User              Chat UI              AI Service         Editor Apply       ORDS
  |                  |                     |                    |               |
  |-- click Apply -->|                     |                    |               |
  |                  |-- get code block -->|                    |               |
  |                  |-- open diff view -->|                    |               |
  |                  |   (before vs AI)    |                    |               |
  |<-- review diff --|                     |                    |               |
  |                  |                     |                    |               |
  |-- confirm ------>|                     |                    |               |
  |                  |-- apply request --->|                    |               |
  |                  |                     |-- delegate ------->|               |
  |                  |                     |                    |-- write ----->|
  |                  |                     |                    |<-- result ----|
  |                  |                     |                    |               |
  |                  |                     |-- record change    |               |
  |                  |                     |   (source: 'ai')   |               |
  |                  |<-- success ---------|                    |               |
  |<-- success toast-|                     |                    |               |
```

#### Apply Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| AI-APPLY-R01 | Diff preview | Always show diff before applying AI-generated code |
| AI-APPLY-R02 | Edit lock | Requires edit lock on the target component |
| AI-APPLY-R03 | Change log source | Change log entry marked with `source: 'ai'` and `ai_request_id` |
| AI-APPLY-R04 | Offline disabled | Apply disabled when connection is offline |
| AI-APPLY-R05 | Audit trail | Log AI_CODE_APPLIED audit event with request ID |
| AI-APPLY-R06 | Compilation check | Run ORDS compilation check after apply; roll back on critical errors |

---

## 6. M10 Stub: Basic Safety Layer

### 6.1 Input Sanitization

The M10 stub provides basic input sanitization as a middleware before prompts reach the Claude API. The full M10 implementation is in U8.

#### Sanitization Rules

| Pattern | Type | Action | Example |
|---------|------|--------|---------|
| `(?i)(DROP\s+(TABLE\|INDEX\|VIEW\|SEQUENCE\|PACKAGE))` | Regex | Block | "DROP TABLE employees" |
| `(?i)(TRUNCATE\s+TABLE)` | Regex | Block | "TRUNCATE TABLE employees" |
| `(?i)(DELETE\s+FROM\s+\w+\s*$)` | Regex | Warn | "DELETE FROM employees" (no WHERE) |
| `(?i)(ALTER\s+SYSTEM)` | Regex | Block | "ALTER SYSTEM SET ..." |
| `(?i)(GRANT\s+DBA)` | Regex | Block | "GRANT DBA TO user" |
| `(?i)(CREATE\s+USER)` | Regex | Block | "CREATE USER hacker ..." |
| `(?i)(EXECUTE\s+IMMEDIATE\s+['"])` | Regex | Warn | Dynamic SQL injection risk |
| `(?i)(UTL_HTTP\|UTL_FILE\|DBMS_SCHEDULER)` | Regex | Warn | Privileged package usage |

```typescript
interface SanitizationResult {
  allowed: boolean;
  cleanedPrompt: string;
  blockedPatterns: BlockedPattern[];
  warnings: string[];
}

interface BlockedPattern {
  pattern: string;
  matchedText: string;
  action: 'block' | 'warn';
  reason: string;
}
```

### 6.2 Output Validation

AI-generated code is validated before being presented to the user.

#### Output Validation Rules

| Rule | Check | Action |
|------|-------|--------|
| No DROP statements | Scan output for DROP TABLE/INDEX/etc. | Strip and warn |
| No TRUNCATE statements | Scan output for TRUNCATE TABLE | Strip and warn |
| No system-level commands | Scan for ALTER SYSTEM, CREATE USER, GRANT DBA | Strip and warn |
| No dynamic SQL with string concat | Scan for EXECUTE IMMEDIATE with \|\| | Warn (flag in UI) |
| Max output length | Output < 50,000 characters | Truncate with warning |

```typescript
interface OutputValidationResult {
  valid: boolean;
  sanitizedOutput: string;
  findings: SafetyFinding[];
  riskLevel: 'low' | 'medium' | 'high';
}

interface SafetyFinding {
  rule: string;
  severity: 'info' | 'warning' | 'error';
  message: string;
  matchedText: string;
  action: 'stripped' | 'flagged';
}
```

---

## 7. Conversation Persistence

### 7.1 Conversation Model

Conversations are stored per page context and persist across sessions.

```typescript
interface Conversation {
  id: string;                       // UUID
  tenantId: string;
  userId: string;
  connectionId: string;
  appId: number;
  pageId: number;
  title: string;                    // Auto-generated from first message
  messages: ConversationMessage[];
  createdAt: string;
  updatedAt: string;
  messageCount: number;
  totalTokensUsed: number;
}
```

### 7.2 Database Schema

```sql
CREATE TABLE ai_conversations (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id       UUID NOT NULL REFERENCES tenants(id),
  user_id         UUID NOT NULL REFERENCES users(id),
  connection_id   UUID NOT NULL REFERENCES connections(id),
  app_id          INTEGER NOT NULL,
  page_id         INTEGER NOT NULL,
  title           VARCHAR(255),
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  message_count   INTEGER NOT NULL DEFAULT 0,
  total_tokens    INTEGER NOT NULL DEFAULT 0
);

ALTER TABLE ai_conversations ENABLE ROW LEVEL SECURITY;
CREATE POLICY ai_conversations_tenant_isolation ON ai_conversations
  USING (tenant_id::text = current_setting('app.current_tenant', true));

CREATE INDEX idx_ai_conversations_page ON ai_conversations(tenant_id, connection_id, app_id, page_id);
CREATE INDEX idx_ai_conversations_user ON ai_conversations(user_id, updated_at);

CREATE TABLE ai_messages (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  conversation_id UUID NOT NULL REFERENCES ai_conversations(id) ON DELETE CASCADE,
  tenant_id       UUID NOT NULL REFERENCES tenants(id),
  role            VARCHAR(10) NOT NULL CHECK (role IN ('user', 'assistant')),
  content         TEXT NOT NULL,
  action          VARCHAR(20),
  tokens_input    INTEGER,
  tokens_output   INTEGER,
  model           VARCHAR(50),
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE ai_messages ENABLE ROW LEVEL SECURITY;
CREATE POLICY ai_messages_tenant_isolation ON ai_messages
  USING (tenant_id::text = current_setting('app.current_tenant', true));

CREATE INDEX idx_ai_messages_conversation ON ai_messages(conversation_id, created_at);
```

---

## 8. LLM Router Interface

### 8.1 Pluggable Provider Architecture

The LLM Router abstracts the AI provider, allowing future addition of other models without changing business logic.

```typescript
interface LLMRouter {
  route(request: LLMRequest): Promise<LLMProvider>;
  listProviders(): LLMProviderConfig[];
  getProvider(id: string): LLMProviderConfig;
  setDefaultProvider(id: string): Promise<void>;
}

interface LLMProvider {
  id: string;
  name: string;
  chat(request: LLMChatRequest): Promise<LLMChatResponse>;
  stream(request: LLMChatRequest): AsyncIterable<LLMStreamChunk>;
  estimateTokens(text: string): number;
  getModelInfo(): ModelInfo;
}

interface LLMProviderConfig {
  id: string;
  name: string;                    // "Anthropic Claude"
  enabled: boolean;
  models: ModelConfig[];
  rateLimits: {
    requestsPerMinute: number;
    tokensPerMinute: number;
  };
  priority: number;                // Lower = higher priority
}

interface ModelConfig {
  modelId: string;                 // "claude-sonnet-4-20250514"
  displayName: string;             // "Claude Sonnet"
  contextWindow: number;           // 200000
  maxOutputTokens: number;         // 8192
  costPer1kInput: number;          // USD
  costPer1kOutput: number;         // USD
  capabilities: string[];          // ['code', 'analysis', 'chat']
  isDefault: boolean;
}

interface LLMChatRequest {
  model: string;
  systemPrompt: string;
  messages: { role: 'user' | 'assistant'; content: string }[];
  maxTokens: number;
  temperature: number;
  stream: boolean;
}

interface LLMStreamChunk {
  type: 'content_block_delta' | 'message_start' | 'message_stop' | 'error';
  text?: string;
  usage?: { input_tokens: number; output_tokens: number };
}
```

#### Router Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| ROUTER-R01 | Default provider | Claude is the default and only provider in U5 |
| ROUTER-R02 | Provider selection | Route based on enabled flag and priority |
| ROUTER-R03 | Fallback | If primary provider fails, no fallback in U5 (future: secondary provider) |
| ROUTER-R04 | Admin configuration | Admins can enable/disable providers and set defaults |
| ROUTER-R05 | Model selection | Users can select model from enabled models in chat UI |

---

## 9. Token Tracking (M15 Preparation)

### 9.1 Token Recording

Every AI interaction records token usage for future cost tracking (M15).

```typescript
interface TokenUsageRecord {
  id: string;
  tenantId: string;
  userId: string;
  conversationId: string;
  messageId: string;
  model: string;
  inputTokens: number;
  outputTokens: number;
  cacheReadTokens: number;
  cacheWriteTokens: number;
  totalTokens: number;
  estimatedCostUsd: number;
  createdAt: string;
}
```

### 9.2 Database Schema

```sql
CREATE TABLE ai_token_usage (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id         UUID NOT NULL REFERENCES tenants(id),
  user_id           UUID NOT NULL REFERENCES users(id),
  conversation_id   UUID REFERENCES ai_conversations(id),
  message_id        UUID REFERENCES ai_messages(id),
  model             VARCHAR(50) NOT NULL,
  input_tokens      INTEGER NOT NULL DEFAULT 0,
  output_tokens     INTEGER NOT NULL DEFAULT 0,
  cache_read_tokens INTEGER NOT NULL DEFAULT 0,
  cache_write_tokens INTEGER NOT NULL DEFAULT 0,
  total_tokens      INTEGER NOT NULL DEFAULT 0,
  estimated_cost_usd NUMERIC(10, 6) NOT NULL DEFAULT 0,
  created_at        TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE ai_token_usage ENABLE ROW LEVEL SECURITY;
CREATE POLICY ai_token_usage_tenant_isolation ON ai_token_usage
  USING (tenant_id::text = current_setting('app.current_tenant', true));

CREATE INDEX idx_ai_token_usage_tenant_date ON ai_token_usage(tenant_id, created_at);
CREATE INDEX idx_ai_token_usage_user ON ai_token_usage(user_id, created_at);
CREATE INDEX idx_ai_token_usage_model ON ai_token_usage(model, created_at);
```

#### Token Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| TOKEN-R01 | Record every interaction | Every Claude API call records input, output, and cache tokens |
| TOKEN-R02 | Cost estimation | Estimated cost calculated from model pricing at time of request |
| TOKEN-R03 | Display to user | Token count shown in chat message metadata (subtle) |
| TOKEN-R04 | Admin dashboard | Admins can view aggregated token usage per user/day/model |
| TOKEN-R05 | No enforcement in U5 | Rate limiting by tokens is deferred to U11 (M15) |

---

## 10. API Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| `POST` | `/api/v1/ai/chat` | authenticate() | Send chat message (SSE streaming) |
| `POST` | `/api/v1/ai/quick-action` | authenticate() | Trigger quick action (SSE streaming) |
| `POST` | `/api/v1/ai/apply` | authorize(['developer','tech_lead','admin']) | Apply AI-generated code to APEX |
| `GET` | `/api/v1/ai/conversations` | authenticate() | List conversations for page |
| `GET` | `/api/v1/ai/conversations/:id` | authenticate() | Get conversation with messages |
| `DELETE` | `/api/v1/ai/conversations/:id` | authenticate() | Delete conversation |
| `GET` | `/api/v1/ai/models` | authenticate() | List available AI models |
| `PUT` | `/api/v1/ai/models/:id` | authorize(['admin']) | Enable/disable model |
| `GET` | `/api/v1/ai/usage` | authorize(['admin']) | Token usage summary |
| `GET` | `/api/v1/ai/usage/:userId` | authorize(['admin']) | Per-user token usage |

---

## 11. Error Handling

| Error Code | HTTP Status | Condition | User Message |
|------------|-------------|-----------|-------------|
| `AI_PROMPT_BLOCKED` | 400 | Input sanitization blocked the prompt | "Your request contains restricted patterns ({patterns}). Please rephrase." |
| `AI_RATE_LIMITED` | 429 | Claude API rate limit exceeded | "AI service is temporarily busy. Please wait and retry." |
| `AI_TIMEOUT` | 504 | Claude API did not respond within 60s | "AI response timed out. Please try a simpler request." |
| `AI_CONTEXT_TOO_LARGE` | 400 | Context exceeds model window | "Context is too large. Try selecting a specific component." |
| `AI_MODEL_UNAVAILABLE` | 503 | Selected model is disabled or down | "Selected AI model is currently unavailable." |
| `AI_OUTPUT_UNSAFE` | 422 | Output validation found critical findings | "AI response contained unsafe patterns and was filtered." |
| `AI_APPLY_FAILED` | 500 | Applying AI code to APEX failed | "Failed to apply changes. See compilation errors." |
| `AI_CONVERSATION_NOT_FOUND` | 404 | Conversation ID invalid | "Conversation not found." |

---

## 12. Security Considerations

| Concern | Mitigation |
|---------|-----------|
| Prompt injection | M10 stub sanitizes input; patterns block SQL DDL and system commands |
| AI-generated malicious code | Output validation strips DROP, TRUNCATE, ALTER SYSTEM |
| API key exposure | Claude API key stored in OCI Vault; never logged or returned to client |
| Token abuse | Token tracking per user; admin visibility; rate limiting in future M15 |
| Conversation data privacy | Conversations scoped by tenant (RLS); only conversation owner can access |
| Cross-tenant context leakage | Context builder scoped by connectionId which is tenant-bound |
| SSE connection hijacking | SSE endpoint requires valid JWT; connection tied to userId |
