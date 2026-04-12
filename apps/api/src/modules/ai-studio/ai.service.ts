import { pool, getClient } from '../../config/database.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import type { PoolClient } from 'pg';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import { claudeClient } from './claude.client.js';
import type { ChatMessage, StreamChunk } from './claude.client.js';
import { buildSystemPrompt, buildQuickActionPrompt } from './prompt-builder.js';
import type { PromptContext } from './prompt-builder.js';
import { sanitizeInput, sanitizeOutput } from './sanitizer.js';
import { checkRateLimit } from './rate-limiter.js';
import type { ChatRequestInput, QuickActionInput } from './ai.validation.js';
import type {
  Conversation,
  ConversationMessage,
  TokenUsageSummary,
  AIStreamEvent,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Cost estimation helpers
// ---------------------------------------------------------------------------

const MODEL_COSTS: Record<string, { inputPer1k: number; outputPer1k: number }> = {
  'claude-sonnet-4-20250514': { inputPer1k: 0.003, outputPer1k: 0.015 },
  'claude-3-5-sonnet-20241022': { inputPer1k: 0.003, outputPer1k: 0.015 },
  'claude-3-haiku-20240307': { inputPer1k: 0.00025, outputPer1k: 0.00125 },
};

function estimateCost(model: string, inputTokens: number, outputTokens: number): number {
  const costs = MODEL_COSTS[model] ?? MODEL_COSTS['claude-sonnet-4-20250514'];
  return (inputTokens / 1000) * costs.inputPer1k + (outputTokens / 1000) * costs.outputPer1k;
}

// ---------------------------------------------------------------------------
// Row mappers
// ---------------------------------------------------------------------------

function rowToConversation(row: Record<string, unknown>): Conversation {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    userId: row.user_id as string,
    connectionId: (row.connection_id as string) ?? undefined,
    appId: (row.app_id as number) ?? undefined,
    pageId: (row.page_id as number) ?? undefined,
    title: row.title as string,
    messageCount: row.message_count as number,
    totalTokens: row.total_tokens as number,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

function rowToMessage(row: Record<string, unknown>): ConversationMessage {
  return {
    id: row.id as string,
    conversationId: row.conversation_id as string,
    role: row.role as 'user' | 'assistant' | 'system',
    content: row.content as string,
    action: (row.action as string) ?? undefined,
    tokensInput: (row.tokens_input as number) ?? undefined,
    tokensOutput: (row.tokens_output as number) ?? undefined,
    model: (row.model as string) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
  };
}

// ---------------------------------------------------------------------------
// Chat (non-streaming, used internally by streamChat as well)
// ---------------------------------------------------------------------------

/**
 * Process a chat request: validate, sanitize, build prompt with context,
 * call Claude, log tokens, and save to conversation.
 */
export async function chat(
  request: ChatRequestInput,
  userId: string,
  tenantId: string,
  client?: PoolClient,
): Promise<{ conversation: Conversation; message: ConversationMessage }> {
  // Rate limit check
  await checkRateLimit(tenantId, userId);

  // Sanitize input
  const sanitized = sanitizeInput(request.message);
  if (!sanitized.safe) {
    throw new ValidationError('Message contains blocked patterns', {
      blockedPatterns: sanitized.blockedPatterns,
    });
  }

  // Build context
  const context: PromptContext = {
    appName: request.appName,
    pageName: request.pageName,
    componentSource: request.componentSource,
  };
  const systemPrompt = buildSystemPrompt(context);

  // Get or create conversation
  const txClient = await getClient();
  try {
    await txClient.query('BEGIN');

    let conversationId = request.conversationId;
    let existingMessages: ChatMessage[] = [];

    if (conversationId) {
      // Load existing messages for context
      const msgResult = await txClient.query(
        `SELECT role, content FROM ai_messages
         WHERE conversation_id = $1 AND tenant_id = $2
         ORDER BY created_at ASC`,
        [conversationId, tenantId],
      );
      existingMessages = msgResult.rows.map((r) => ({
        role: r.role as 'user' | 'assistant',
        content: r.content as string,
      }));
    } else {
      // Create new conversation
      const title =
        sanitized.sanitized.length > 100
          ? sanitized.sanitized.substring(0, 97) + '...'
          : sanitized.sanitized;

      const convResult = await txClient.query(
        `INSERT INTO ai_conversations (tenant_id, user_id, connection_id, app_id, page_id, title)
         VALUES ($1, $2, $3, $4, $5, $6)
         RETURNING *`,
        [tenantId, userId, request.connectionId ?? null, request.appId ?? null, request.pageId ?? null, title],
      );
      conversationId = convResult.rows[0].id as string;
    }

    // Build messages array
    const messages: ChatMessage[] = [
      ...existingMessages,
      { role: 'user', content: sanitized.sanitized },
    ];

    // Save user message
    await txClient.query(
      `INSERT INTO ai_messages (conversation_id, tenant_id, role, content)
       VALUES ($1, $2, 'user', $3)`,
      [conversationId, tenantId, sanitized.sanitized],
    );

    // Call Claude
    const response = await claudeClient.chat(messages, {
      systemPrompt,
      model: request.model,
    });

    // Sanitize output
    const sanitizedOutput = sanitizeOutput(response.content);

    // Save assistant message
    const msgResult = await txClient.query(
      `INSERT INTO ai_messages (conversation_id, tenant_id, role, content, tokens_input, tokens_output, model)
       VALUES ($1, $2, 'assistant', $3, $4, $5, $6)
       RETURNING *`,
      [conversationId, tenantId, sanitizedOutput.sanitized, response.inputTokens, response.outputTokens, response.model],
    );

    // Log token usage
    const totalTokens = response.inputTokens + response.outputTokens;
    const cost = estimateCost(response.model, response.inputTokens, response.outputTokens);

    await txClient.query(
      `INSERT INTO ai_token_usage (tenant_id, user_id, conversation_id, message_id, model, input_tokens, output_tokens, total_tokens, estimated_cost_usd)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`,
      [tenantId, userId, conversationId, msgResult.rows[0].id, response.model, response.inputTokens, response.outputTokens, totalTokens, cost],
    );

    // Update conversation counters
    await txClient.query(
      `UPDATE ai_conversations
       SET message_count = message_count + 2,
           total_tokens = total_tokens + $1,
           updated_at = NOW()
       WHERE id = $2`,
      [totalTokens, conversationId],
    );

    await txClient.query('COMMIT');

    // Fetch updated conversation
    const convResult = await tenantQuery(client,
      `SELECT * FROM ai_conversations WHERE id = $1`,
      [conversationId],
    );

    return {
      conversation: rowToConversation(convResult.rows[0]),
      message: rowToMessage(msgResult.rows[0]),
    };
  } catch (err) {
    await txClient.query('ROLLBACK');
    throw err;
  } finally {
    txClient.release();
  }
}

// ---------------------------------------------------------------------------
// Stream Chat (SSE)
// ---------------------------------------------------------------------------

/**
 * Process a streaming chat request. Returns an async iterable of AIStreamEvents.
 */
export async function* streamChat(
  request: ChatRequestInput,
  userId: string,
  tenantId: string,
  client?: PoolClient,
): AsyncGenerator<AIStreamEvent> {
  // Rate limit check
  await checkRateLimit(tenantId, userId);

  // Sanitize input
  const sanitized = sanitizeInput(request.message);
  if (!sanitized.safe) {
    yield {
      type: 'error',
      error: 'Message contains blocked patterns: ' + sanitized.blockedPatterns.join(', '),
    };
    return;
  }

  // Build context
  const context: PromptContext = {
    appName: request.appName,
    pageName: request.pageName,
    componentSource: request.componentSource,
  };
  const systemPrompt = buildSystemPrompt(context);

  // Get or create conversation
  let conversationId = request.conversationId;
  let existingMessages: ChatMessage[] = [];

  if (conversationId) {
    const msgResult = await tenantQuery(client,
      `SELECT role, content FROM ai_messages
       WHERE conversation_id = $1 AND tenant_id = $2
       ORDER BY created_at ASC`,
      [conversationId, tenantId],
    );
    existingMessages = msgResult.rows.map((r) => ({
      role: r.role as 'user' | 'assistant',
      content: r.content as string,
    }));
  } else {
    const title =
      sanitized.sanitized.length > 100
        ? sanitized.sanitized.substring(0, 97) + '...'
        : sanitized.sanitized;

    const convResult = await tenantQuery(client,
      `INSERT INTO ai_conversations (tenant_id, user_id, connection_id, app_id, page_id, title)
       VALUES ($1, $2, $3, $4, $5, $6)
       RETURNING *`,
      [tenantId, userId, request.connectionId ?? null, request.appId ?? null, request.pageId ?? null, title],
    );
    conversationId = convResult.rows[0].id as string;
  }

  // Save user message
  await tenantQuery(client,
    `INSERT INTO ai_messages (conversation_id, tenant_id, role, content)
     VALUES ($1, $2, 'user', $3)`,
    [conversationId, tenantId, sanitized.sanitized],
  );

  const messages: ChatMessage[] = [
    ...existingMessages,
    { role: 'user', content: sanitized.sanitized },
  ];

  // Start streaming
  let fullContent = '';
  let inputTokens = 0;
  let outputTokens = 0;
  let model = '';

  yield { type: 'start', conversationId };

  try {
    for await (const chunk of claudeClient.stream(messages, {
      systemPrompt,
      model: request.model,
    })) {
      if (chunk.type === 'content_delta' && chunk.content) {
        fullContent += chunk.content;
        yield { type: 'delta', content: chunk.content };
      } else if (chunk.type === 'message_stop') {
        inputTokens = chunk.inputTokens ?? 0;
        outputTokens = chunk.outputTokens ?? 0;
        model = chunk.model ?? request.model ?? 'claude-sonnet-4-20250514';
      } else if (chunk.type === 'error') {
        yield { type: 'error', error: chunk.content };
        return;
      }
    }

    // Sanitize final output (for warnings only; content already streamed)
    sanitizeOutput(fullContent);

    // Save assistant message
    const msgResult = await tenantQuery(client,
      `INSERT INTO ai_messages (conversation_id, tenant_id, role, content, tokens_input, tokens_output, model)
       VALUES ($1, $2, 'assistant', $3, $4, $5, $6)
       RETURNING id`,
      [conversationId, tenantId, fullContent, inputTokens, outputTokens, model],
    );
    const messageId = msgResult.rows[0].id as string;

    // Log token usage
    const totalTokens = inputTokens + outputTokens;
    const cost = estimateCost(model, inputTokens, outputTokens);

    await tenantQuery(client,
      `INSERT INTO ai_token_usage (tenant_id, user_id, conversation_id, message_id, model, input_tokens, output_tokens, total_tokens, estimated_cost_usd)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`,
      [tenantId, userId, conversationId, messageId, model, inputTokens, outputTokens, totalTokens, cost],
    );

    // Update conversation counters
    await tenantQuery(client,
      `UPDATE ai_conversations
       SET message_count = message_count + 2,
           total_tokens = total_tokens + $1,
           updated_at = NOW()
       WHERE id = $2`,
      [totalTokens, conversationId],
    );

    yield {
      type: 'done',
      conversationId,
      messageId,
      usage: { inputTokens, outputTokens, totalTokens },
    };
  } catch (err) {
    logger.error({ err, conversationId }, 'Stream chat error');
    yield { type: 'error', error: (err as Error).message };
  }
}

// ---------------------------------------------------------------------------
// Conversation CRUD
// ---------------------------------------------------------------------------

/**
 * List conversations for a user within a tenant.
 */
export async function getConversations(
  userId: string,
  tenantId: string,
  page = 1,
  limit = 20,
  connectionId?: string,
  client?: PoolClient,
): Promise<{ conversations: Conversation[]; total: number }> {
  const conditions = ['tenant_id = $1', 'user_id = $2'];
  const params: unknown[] = [tenantId, userId];
  let paramIdx = 3;

  if (connectionId) {
    conditions.push(`connection_id = $${paramIdx}`);
    params.push(connectionId);
    paramIdx++;
  }

  const where = conditions.join(' AND ');
  const offset = (page - 1) * limit;

  const [dataResult, countResult] = await Promise.all([
    tenantQuery(client,
      `SELECT * FROM ai_conversations
       WHERE ${where}
       ORDER BY updated_at DESC
       LIMIT $${paramIdx} OFFSET $${paramIdx + 1}`,
      [...params, limit, offset],
    ),
    tenantQuery(client,
      `SELECT COUNT(*)::int AS total FROM ai_conversations WHERE ${where}`,
      params,
    ),
  ]);

  return {
    conversations: dataResult.rows.map(rowToConversation),
    total: countResult.rows[0].total as number,
  };
}

/**
 * Get a single conversation with all its messages.
 */
export async function getConversation(
  id: string,
  tenantId: string,
  client?: PoolClient,
): Promise<Conversation> {
  const convResult = await tenantQuery(client,
    `SELECT * FROM ai_conversations WHERE id = $1 AND tenant_id = $2`,
    [id, tenantId],
  );

  if (convResult.rowCount === 0) {
    throw new NotFoundError('Conversation not found');
  }

  const conversation = rowToConversation(convResult.rows[0]);

  const msgResult = await tenantQuery(client,
    `SELECT * FROM ai_messages
     WHERE conversation_id = $1 AND tenant_id = $2
     ORDER BY created_at ASC`,
    [id, tenantId],
  );

  conversation.messages = msgResult.rows.map(rowToMessage);

  return conversation;
}

/**
 * Delete a conversation and all its messages (cascade).
 */
export async function deleteConversation(
  id: string,
  tenantId: string,
  userId: string,
  client?: PoolClient,
): Promise<void> {
  const result = await tenantQuery(client,
    `DELETE FROM ai_conversations
     WHERE id = $1 AND tenant_id = $2 AND user_id = $3
     RETURNING id`,
    [id, tenantId, userId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Conversation not found');
  }

  logger.info({ conversationId: id, tenantId }, 'Conversation deleted');
}

// ---------------------------------------------------------------------------
// Usage Summary
// ---------------------------------------------------------------------------

/**
 * Get token usage summary for a tenant within a given period.
 */
export async function getUsageSummary(
  tenantId: string,
  period: 'day' | 'week' | 'month' = 'month',
  client?: PoolClient,
): Promise<TokenUsageSummary> {
  const periodMap = {
    day: "date_trunc('day', NOW())",
    week: "date_trunc('week', NOW())",
    month: "date_trunc('month', NOW())",
  };
  const since = periodMap[period];

  // Totals
  const totalsResult = await tenantQuery(client,
    `SELECT
       COALESCE(SUM(input_tokens), 0)::int AS total_input,
       COALESCE(SUM(output_tokens), 0)::int AS total_output,
       COALESCE(SUM(total_tokens), 0)::int AS total_tokens,
       COALESCE(SUM(estimated_cost_usd), 0)::numeric AS total_cost
     FROM ai_token_usage
     WHERE tenant_id = $1 AND created_at >= ${since}`,
    [tenantId],
  );

  const totals = totalsResult.rows[0];

  // By model
  const byModelResult = await tenantQuery(client,
    `SELECT
       model,
       COALESCE(SUM(input_tokens), 0)::int AS input_tokens,
       COALESCE(SUM(output_tokens), 0)::int AS output_tokens,
       COALESCE(SUM(total_tokens), 0)::int AS total_tokens,
       COALESCE(SUM(estimated_cost_usd), 0)::numeric AS estimated_cost_usd,
       COUNT(*)::int AS request_count
     FROM ai_token_usage
     WHERE tenant_id = $1 AND created_at >= ${since}
     GROUP BY model`,
    [tenantId],
  );

  const byModel: TokenUsageSummary['byModel'] = {};
  for (const row of byModelResult.rows) {
    byModel[row.model as string] = {
      inputTokens: row.input_tokens as number,
      outputTokens: row.output_tokens as number,
      totalTokens: row.total_tokens as number,
      estimatedCostUsd: parseFloat(row.estimated_cost_usd as string),
      requestCount: row.request_count as number,
    };
  }

  // By user
  const byUserResult = await tenantQuery(client,
    `SELECT
       user_id,
       COALESCE(SUM(input_tokens), 0)::int AS input_tokens,
       COALESCE(SUM(output_tokens), 0)::int AS output_tokens,
       COALESCE(SUM(total_tokens), 0)::int AS total_tokens
     FROM ai_token_usage
     WHERE tenant_id = $1 AND created_at >= ${since}
     GROUP BY user_id`,
    [tenantId],
  );

  const byUser: TokenUsageSummary['byUser'] = {};
  for (const row of byUserResult.rows) {
    byUser[row.user_id as string] = {
      inputTokens: row.input_tokens as number,
      outputTokens: row.output_tokens as number,
      totalTokens: row.total_tokens as number,
    };
  }

  // Daily breakdown
  const dailyResult = await tenantQuery(client,
    `SELECT
       DATE(created_at) AS date,
       COALESCE(SUM(total_tokens), 0)::int AS total_tokens,
       COALESCE(SUM(estimated_cost_usd), 0)::numeric AS estimated_cost_usd
     FROM ai_token_usage
     WHERE tenant_id = $1 AND created_at >= ${since}
     GROUP BY DATE(created_at)
     ORDER BY DATE(created_at)`,
    [tenantId],
  );

  const dailyBreakdown = dailyResult.rows.map((row) => ({
    date: (row.date as Date).toISOString().split('T')[0],
    totalTokens: row.total_tokens as number,
    estimatedCostUsd: parseFloat(row.estimated_cost_usd as string),
  }));

  return {
    tenantId,
    period,
    totalInputTokens: totals.total_input as number,
    totalOutputTokens: totals.total_output as number,
    totalTokens: totals.total_tokens as number,
    estimatedCostUsd: parseFloat(totals.total_cost as string),
    byModel,
    byUser,
    dailyBreakdown,
  };
}
