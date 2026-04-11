# Code Generation Plan -- U5: AI Engine

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U5 -- AI Engine |
| **Sprint** | S4 (Fase 1, Weeks 10-11) |
| **Modules** | M4 (AI Studio) + M10 stub (AI Governance -- basic sanitization) |
| **Stories** | US-012, US-013, US-025 (stub), US-052 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Prerequisites

Before starting code generation, verify prior unit deliverables:
- [ ] U2 completed: JWT auth, RBAC, connections backend operational
- [ ] U3 completed: Explorer tree, MCP connector, Redis cache operational
- [ ] U4 completed: Editor sessions, apply flow, change log operational
- [ ] Claude API key provisioned and stored in OCI Vault
- [ ] Claude API rate limits understood and documented
- [ ] Redis is operational for rate limiting and caching

---

## Plan Checklist

### 1. Database Migrations

- [ ] `migrations/013_ai_conversations.sql`
  - [ ] Create `ai_conversations` table (id, tenant_id, user_id, connection_id, app_id, page_id, title, created_at, updated_at, message_count, total_tokens)
  - [ ] Enable RLS on `ai_conversations`
  - [ ] Create `ai_conversations_tenant_isolation` policy
  - [ ] Create index on `(tenant_id, connection_id, app_id, page_id)` for page lookup
  - [ ] Create index on `(user_id, updated_at)` for user conversations list

- [ ] `migrations/014_ai_messages.sql`
  - [ ] Create `ai_messages` table (id, conversation_id FK with CASCADE, tenant_id, role, content, action, tokens_input, tokens_output, model, created_at)
  - [ ] Enable RLS on `ai_messages`
  - [ ] Create `ai_messages_tenant_isolation` policy
  - [ ] Create index on `(conversation_id, created_at)` for message ordering

- [ ] `migrations/015_ai_token_usage.sql`
  - [ ] Create `ai_token_usage` table (id, tenant_id, user_id, conversation_id FK, message_id FK, model, input_tokens, output_tokens, cache_read_tokens, cache_write_tokens, total_tokens, estimated_cost_usd, created_at)
  - [ ] Enable RLS on `ai_token_usage`
  - [ ] Create `ai_token_usage_tenant_isolation` policy
  - [ ] Create index on `(tenant_id, created_at)` for usage reports
  - [ ] Create index on `(user_id, created_at)` for per-user reports
  - [ ] Create index on `(model, created_at)` for per-model reports

---

### 2. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/ai.ts`
  - [ ] `QuickActionType` union ('explain' | 'refactor' | 'bugs' | 'document' | 'optimize' | 'security')
  - [ ] `ConversationMessage` interface (id, role, content, codeBlocks, timestamp, tokensUsed, model, action)
  - [ ] `CodeBlock` interface (id, language, code, canApply)
  - [ ] `Conversation` interface (id, tenantId, userId, connectionId, appId, pageId, title, messages, createdAt, updatedAt, messageCount, totalTokensUsed)
  - [ ] `AIRequest` interface (prompt, connectionId, appId, pageId, componentType, componentId, conversationId, action, selectedCode, model)
  - [ ] `AIStreamEvent` interface (type, text, usage, error)
  - [ ] `TokenUsageSummary` interface (inputTokens, outputTokens, cacheReadTokens, totalTokens, estimatedCostUsd)
  - [ ] `LLMProviderConfig` interface (id, name, enabled, models, rateLimits, priority)
  - [ ] `ModelConfig` interface (modelId, displayName, contextWindow, maxOutputTokens, costPer1kInput, costPer1kOutput, capabilities, isDefault)
  - [ ] `SanitizationResult` interface (allowed, cleanedPrompt, blockedPatterns, warnings)
  - [ ] `OutputValidationResult` interface (valid, sanitizedOutput, findings, riskLevel)
  - [ ] Re-export from `index.ts`

---

### 3. Claude API Client with Streaming SSE (apps/api/src/modules/ai-studio/)

- [ ] `src/modules/ai-studio/claude.client.ts`
  - [ ] `ClaudeClient` class with Anthropic SDK
  - [ ] `chat(request: ClaudeRequest): Promise<ClaudeResponse>` -- non-streaming
  - [ ] `stream(request: ClaudeRequest): AsyncIterable<ClaudeStreamChunk>` -- streaming via SSE
  - [ ] Configuration from OCI Vault (API key) and environment (model, timeouts)
  - [ ] Retry logic: 2 retries on 429/500/503 with exponential backoff
  - [ ] Timeout: 60 seconds
  - [ ] Request logging (prompt length, model, latency -- NOT prompt content)

- [ ] `src/modules/ai-studio/llm-router.ts`
  - [ ] `LLMRouter` class implementing provider abstraction
  - [ ] `route(request): Promise<LLMProvider>` -- select provider based on enabled flag and priority
  - [ ] `listProviders(): LLMProviderConfig[]` -- return configured providers
  - [ ] `getProvider(id): LLMProviderConfig` -- single provider config
  - [ ] `setDefaultProvider(id): Promise<void>` -- update default (admin only)
  - [ ] Register Claude as the single provider in U5
  - [ ] Provider interface: chat(), stream(), estimateTokens(), getModelInfo()

---

### 4. Context Builder Service (apps/api/src/modules/ai-studio/)

- [ ] `src/modules/ai-studio/context-builder.ts`
  - [ ] `ContextBuilderService` class
  - [ ] `buildContext(request: ContextBuildRequest): Promise<ContextWindow>` -- orchestrate context assembly
  - [ ] `getComponentCode(connectionId, componentType, componentId): Promise<string>` -- from editor session or MCP
  - [ ] `getPageContext(connectionId, appId, pageId): Promise<PageContextSummary>` -- from explorer cache
  - [ ] `getSchemaMetadata(connectionId, code): Promise<SchemaObject[]>` -- parse SQL for table refs, fetch columns via MCP
  - [ ] `getConversationHistory(conversationId, maxTokens): Promise<ConversationMessage[]>` -- last N messages within budget
  - [ ] `estimateTokens(text: string): number` -- approximate token count (chars / 4 heuristic)
  - [ ] `truncateToFit(context, maxTokens): ContextWindow` -- priority-based truncation
  - [ ] Token budget allocation: component(4000) > schema(2000) > page(2000) > conversation(3000) > knowledge(1000)

---

### 5. AI Studio React Chat UI (apps/web/src/features/ai-studio/)

- [ ] `components/AIChatPanel.tsx`
  - [ ] Chat panel with message list and input area
  - [ ] SSE connection for streaming responses
  - [ ] Auto-scroll during streaming
  - [ ] Context badge showing current app/page/component
  - [ ] Model selector dropdown
  - [ ] Clear conversation button
  - [ ] Stop generation button (cancels SSE)
  - [ ] Retry button on failed messages
  - [ ] Connection status indicator

- [ ] `components/ChatMessage.tsx`
  - [ ] Render user messages and AI responses
  - [ ] Markdown rendering with syntax-highlighted code blocks
  - [ ] "Copy Code" button per code block
  - [ ] "Apply in APEX" button for code blocks (when component context exists)
  - [ ] Token usage display (subtle, in message metadata)
  - [ ] Timestamp display

- [ ] `components/QuickActionBar.tsx`
  - [ ] Horizontal bar with 6 quick action buttons (Explain, Refactor, Bugs, Document, Optimize, Security)
  - [ ] Each button triggers quick action with current component/selection
  - [ ] Disabled state when no component is selected
  - [ ] Tooltip descriptions for each action

- [ ] `components/ModelSelector.tsx`
  - [ ] Dropdown showing available models
  - [ ] Display model name and capabilities badge
  - [ ] Admin-only "Configure" link to model settings
  - [ ] Default model pre-selected

- [ ] `components/ApplyAICodeDialog.tsx`
  - [ ] Confirmation dialog before applying AI code
  - [ ] Show diff (original vs AI-generated)
  - [ ] Component target display
  - [ ] "Apply" and "Cancel" buttons
  - [ ] Loading state during apply

---

### 6. Quick Action Handlers (apps/api/src/modules/ai-studio/)

- [ ] `src/modules/ai-studio/quick-actions.ts`
  - [ ] `QuickActionService` class
  - [ ] `executeAction(action: QuickActionType, context: QuickActionContext): AsyncIterable<StreamChunk>`
  - [ ] System prompt templates for each action type (explain, refactor, bugs, document, optimize, security)
  - [ ] Context enrichment: always include component code + page context + schema
  - [ ] Streaming delegation to LLM router
  - [ ] Token tracking per action

- [ ] `src/modules/ai-studio/prompt-templates.ts`
  - [ ] System prompt templates for each quick action
  - [ ] Template variables: {language}, {componentName}, {pageName}, {appName}
  - [ ] Grounding instructions: "Only reference tables/columns that exist in the provided schema"
  - [ ] Output format instructions per action type

---

### 7. Apply-in-APEX Flow (apps/api/src/modules/ai-studio/)

- [ ] `src/modules/ai-studio/ai-apply.service.ts`
  - [ ] `applyAICode(request: AIApplyRequest): Promise<ApplyResult>`
  - [ ] Validate user has edit lock on target component
  - [ ] Delegate to editor apply service (reuse U4 apply logic)
  - [ ] Record change_log with `source: 'ai'` and `ai_request_id`
  - [ ] Log AI_CODE_APPLIED audit event
  - [ ] Return apply result (success or compilation errors)

---

### 8. M10 Stub Middleware (apps/api/src/modules/ai-studio/)

- [ ] `src/modules/ai-studio/safety/input-sanitizer.ts`
  - [ ] `sanitizeInput(input: AIInput): SanitizationResult`
  - [ ] Regex patterns for SQL injection: DROP TABLE/INDEX/VIEW/SEQUENCE/PACKAGE, TRUNCATE TABLE, ALTER SYSTEM, GRANT DBA, CREATE USER
  - [ ] Regex patterns for suspicious code: EXECUTE IMMEDIATE with string concat, UTL_HTTP, UTL_FILE, DBMS_SCHEDULER
  - [ ] Block action: reject prompt entirely with error
  - [ ] Warn action: allow prompt but flag in response
  - [ ] Log all blocked/warned patterns

- [ ] `src/modules/ai-studio/safety/output-validator.ts`
  - [ ] `validateOutput(output: string): OutputValidationResult`
  - [ ] Scan for DROP, TRUNCATE, ALTER SYSTEM in generated code
  - [ ] Scan for dynamic SQL with string concatenation
  - [ ] Strip blocked patterns from output
  - [ ] Flag warned patterns in UI
  - [ ] Max output length check (50,000 chars)
  - [ ] Return risk level (low/medium/high)

- [ ] `src/modules/ai-studio/safety/ai-interaction-logger.ts`
  - [ ] `logInteraction(request, response, sanitization, validation): Promise<void>`
  - [ ] Record to ai_messages table
  - [ ] Record token usage to ai_token_usage table
  - [ ] Log blocked patterns as audit events

---

### 9. Conversation History Service (apps/api/src/modules/ai-studio/)

- [ ] `src/modules/ai-studio/conversation.service.ts`
  - [ ] `getOrCreateConversation(tenantId, userId, connectionId, appId, pageId): Promise<Conversation>`
  - [ ] `addMessage(conversationId, message): Promise<ConversationMessage>`
  - [ ] `getConversation(conversationId): Promise<Conversation>` -- with messages
  - [ ] `listConversations(tenantId, userId, connectionId, appId, pageId): Promise<Conversation[]>`
  - [ ] `deleteConversation(conversationId): Promise<void>`
  - [ ] `getRecentMessages(conversationId, limit): Promise<ConversationMessage[]>`
  - [ ] Auto-generate title from first user message (truncate to 100 chars)
  - [ ] Update message_count and total_tokens on each message

---

### 10. LLM Router Abstraction Layer (apps/api/src/modules/ai-studio/)

- [ ] `src/modules/ai-studio/providers/llm-provider.interface.ts`
  - [ ] `LLMProvider` interface definition
  - [ ] `chat(request): Promise<LLMChatResponse>`
  - [ ] `stream(request): AsyncIterable<LLMStreamChunk>`
  - [ ] `estimateTokens(text): number`
  - [ ] `getModelInfo(): ModelInfo`

- [ ] `src/modules/ai-studio/providers/claude.provider.ts`
  - [ ] Implements `LLMProvider` interface
  - [ ] Delegates to `ClaudeClient`
  - [ ] Maps Anthropic API response format to LLM interface
  - [ ] Maps Anthropic streaming events to LLMStreamChunk

---

### 11. Token Usage Recording (apps/api/src/modules/ai-studio/)

- [ ] `src/modules/ai-studio/token-tracker.ts`
  - [ ] `TokenTrackerService` class
  - [ ] `recordUsage(record: TokenUsageRecord): Promise<void>` -- insert into ai_token_usage
  - [ ] `getUserUsage(userId, startDate, endDate): Promise<TokenUsageSummary>`
  - [ ] `getTenantUsage(tenantId, startDate, endDate): Promise<TokenUsageSummary>`
  - [ ] `getModelUsage(model, startDate, endDate): Promise<TokenUsageSummary>`
  - [ ] `estimateCost(model, inputTokens, outputTokens): number` -- calculate from model pricing

---

### 12. Backend Endpoints (apps/api/src/modules/ai-studio/)

- [ ] `src/modules/ai-studio/ai-studio.validation.ts`
  - [ ] `ChatRequestSchema` (Zod) -- prompt string (max 10,000 chars), connectionId UUID, appId int, pageId int, componentType optional, componentId optional, conversationId optional UUID, model optional string
  - [ ] `QuickActionSchema` (Zod) -- action QuickActionType enum, connectionId UUID, appId int, pageId int, componentType ComponentType, componentId int, selectedCode optional string
  - [ ] `AIApplySchema` (Zod) -- codeBlockId string, conversationId UUID, messageId UUID, componentType ComponentType, componentId int, connectionId UUID
  - [ ] `ConversationListSchema` (Zod) -- connectionId UUID, appId int, pageId int
  - [ ] `ModelUpdateSchema` (Zod) -- enabled boolean
  - [ ] `UsageQuerySchema` (Zod) -- startDate ISO string, endDate ISO string, userId optional UUID

- [ ] `src/modules/ai-studio/ai-studio.service.ts`
  - [ ] `chat(request, userId, tenantId): AsyncIterable<StreamChunk>` -- orchestrate: sanitize -> build context -> route to LLM -> stream -> validate output -> record tokens -> save message
  - [ ] `quickAction(request, userId, tenantId): AsyncIterable<StreamChunk>` -- similar to chat but with action-specific prompt
  - [ ] `applyCode(request, userId, tenantId): Promise<ApplyResult>` -- delegate to ai-apply.service
  - [ ] `listModels(): LLMProviderConfig[]`
  - [ ] `updateModel(modelId, updates, tenantId): Promise<void>`
  - [ ] `getUsageSummary(query, tenantId): Promise<TokenUsageSummary>`

- [ ] `src/modules/ai-studio/ai-studio.controller.ts`
  - [ ] `POST /api/v1/ai/chat` -- authenticate(), validate ChatRequestSchema, SSE response, call service.chat
  - [ ] `POST /api/v1/ai/quick-action` -- authenticate(), validate QuickActionSchema, SSE response, call service.quickAction
  - [ ] `POST /api/v1/ai/apply` -- authorize(['developer','tech_lead','admin']), validate AIApplySchema, call service.applyCode
  - [ ] `GET /api/v1/ai/conversations` -- authenticate(), validate ConversationListSchema, list conversations
  - [ ] `GET /api/v1/ai/conversations/:id` -- authenticate(), get conversation with messages
  - [ ] `DELETE /api/v1/ai/conversations/:id` -- authenticate(), delete conversation
  - [ ] `GET /api/v1/ai/models` -- authenticate(), list models
  - [ ] `PUT /api/v1/ai/models/:id` -- authorize(['admin']), validate ModelUpdateSchema, update model
  - [ ] `GET /api/v1/ai/usage` -- authorize(['admin']), validate UsageQuerySchema, get usage summary
  - [ ] `GET /api/v1/ai/usage/:userId` -- authorize(['admin']), validate UsageQuerySchema, get user usage
  - [ ] Mount routes on Express Router with SSE headers middleware

---

### 13. Tests

#### Frontend Tests (apps/web/src/__tests__/features/ai-studio/)

- [ ] `AIChatPanel.test.tsx`
  - [ ] Renders chat panel with input area
  - [ ] Sends message on submit
  - [ ] Renders streaming response chunks
  - [ ] Auto-scrolls during streaming
  - [ ] Stop button cancels stream
  - [ ] Context badge shows current component
  - [ ] Clear button resets conversation

- [ ] `ChatMessage.test.tsx`
  - [ ] Renders user message correctly
  - [ ] Renders AI message with Markdown
  - [ ] Code blocks have syntax highlighting
  - [ ] "Copy Code" button copies to clipboard
  - [ ] "Apply in APEX" button visible for code blocks
  - [ ] Token usage displayed in metadata

- [ ] `QuickActionBar.test.tsx`
  - [ ] Renders all 6 action buttons
  - [ ] Buttons disabled when no component selected
  - [ ] Click triggers action with current context
  - [ ] Loading state during action

- [ ] `ApplyAICodeDialog.test.tsx`
  - [ ] Shows diff before applying
  - [ ] Cancel closes without action
  - [ ] Apply triggers apply flow
  - [ ] Loading state during apply
  - [ ] Error display on failure

#### Backend Tests (apps/api/tests/modules/ai-studio/)

- [ ] `claude.client.test.ts`
  - [ ] Non-streaming chat returns response
  - [ ] Streaming returns iterable chunks
  - [ ] Retries on 429 with backoff
  - [ ] Retries on 500/503
  - [ ] Times out after 60 seconds
  - [ ] API key loaded from config (not hardcoded)

- [ ] `context-builder.test.ts`
  - [ ] Builds context with component code
  - [ ] Includes page context from cache
  - [ ] Parses SQL for table references
  - [ ] Fetches schema metadata for referenced tables
  - [ ] Includes conversation history within token budget
  - [ ] Truncates to fit within maxTokens
  - [ ] Priority order maintained during truncation

- [ ] `input-sanitizer.test.ts`
  - [ ] Blocks DROP TABLE prompts
  - [ ] Blocks TRUNCATE TABLE prompts
  - [ ] Blocks ALTER SYSTEM prompts
  - [ ] Warns on EXECUTE IMMEDIATE with string concat
  - [ ] Warns on UTL_HTTP usage
  - [ ] Allows normal PL/SQL prompts
  - [ ] Case-insensitive pattern matching

- [ ] `output-validator.test.ts`
  - [ ] Strips DROP TABLE from output
  - [ ] Strips TRUNCATE from output
  - [ ] Flags dynamic SQL with concatenation
  - [ ] Passes clean PL/SQL output
  - [ ] Truncates output exceeding 50,000 chars
  - [ ] Returns correct risk level

- [ ] `conversation.service.test.ts`
  - [ ] Creates new conversation
  - [ ] Returns existing conversation for same page
  - [ ] Adds messages with token tracking
  - [ ] Lists conversations for user and page
  - [ ] Deletes conversation and cascade messages
  - [ ] Auto-generates title from first message

- [ ] `quick-actions.test.ts`
  - [ ] Explain action uses correct system prompt
  - [ ] Refactor action includes code and context
  - [ ] Each action type produces valid output
  - [ ] Token tracking per action
  - [ ] Streaming works for all actions

- [ ] `token-tracker.test.ts`
  - [ ] Records token usage
  - [ ] Calculates estimated cost correctly
  - [ ] Aggregates by user
  - [ ] Aggregates by tenant
  - [ ] Aggregates by model

- [ ] `ai-studio.controller.test.ts`
  - [ ] POST /ai/chat returns SSE stream (200)
  - [ ] POST /ai/chat without auth returns 401
  - [ ] POST /ai/chat with blocked prompt returns 400
  - [ ] POST /ai/quick-action returns SSE stream
  - [ ] POST /ai/apply as developer returns 200
  - [ ] POST /ai/apply as auditor returns 403
  - [ ] GET /ai/conversations returns list
  - [ ] DELETE /ai/conversations/:id returns 204
  - [ ] GET /ai/models returns model list
  - [ ] PUT /ai/models/:id as admin returns 200
  - [ ] PUT /ai/models/:id as developer returns 403
  - [ ] GET /ai/usage as admin returns summary

---

## File Summary

| Category | File Count |
|----------|------------|
| Database migrations | 3 |
| Shared types | 1 |
| Claude client + LLM router | 2 |
| Context builder | 1 |
| Chat UI components | 5 |
| Quick action handlers | 2 |
| Apply flow | 1 |
| M10 stub (safety) | 3 |
| Conversation service | 1 |
| LLM provider abstraction | 2 |
| Token tracker | 1 |
| Backend endpoints (validation, service, controller) | 3 |
| Frontend tests | 4 |
| Backend tests | 8 |
| **Total** | **37** |

---

## Execution Order

1. Database migrations (013, 014, 015) -- schema must exist before service code
2. Shared types (ai.ts) -- interfaces used by frontend and backend
3. LLM provider interface + Claude provider -- abstraction layer
4. Claude client (claude.client.ts) -- core API integration
5. LLM router (llm-router.ts) -- depends on provider interface + Claude provider
6. M10 stub (input-sanitizer, output-validator, ai-interaction-logger) -- middleware for AI pipeline
7. Context builder (context-builder.ts) -- depends on explorer cache, MCP
8. Conversation service -- depends on database schema
9. Token tracker -- depends on database schema
10. Quick action handlers (prompt-templates, quick-actions) -- depends on LLM router + context builder
11. AI apply service -- depends on editor apply (U4) + conversation service
12. Backend endpoints (validation -> service -> controller) -- depends on all services
13. Frontend: AI chat panel components (AIChatPanel -> ChatMessage -> QuickActionBar -> ModelSelector -> ApplyAICodeDialog)
14. Frontend tests (parallel)
15. Backend tests (parallel)

---

## Approval

**Please review this code generation plan.**

**Options**:
1. **Request Changes** -- Modify the plan before execution
2. **Approve Plan** -- Proceed to Part 2 (Code Generation execution)
