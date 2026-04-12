import Anthropic from '@anthropic-ai/sdk';
import type { MessageParam, ContentBlock } from '@anthropic-ai/sdk/resources/messages';
import { logger } from '../../lib/logger.js';
import { getActiveProvider, getDecryptedApiKey } from '../llm-providers/llm-providers.service.js';

// ---------------------------------------------------------------------------
// Configuration
// ---------------------------------------------------------------------------

const DEFAULT_MODEL = 'claude-sonnet-4-20250514';
const MAX_RETRIES = 2;
const RETRYABLE_STATUS_CODES = [429, 500, 503];
const BASE_DELAY_MS = 1000;

interface ClaudeConfig {
  apiKey: string;
  model: string;
  maxTokens: number;
}

/** Cached config so we don't query DB on every request. */
let cachedConfig: ClaudeConfig | null = null;
let cachedConfigTimestamp = 0;
const CONFIG_CACHE_TTL_MS = 5 * 60 * 1000; // 5 minutes

function loadConfig(): ClaudeConfig {
  // Synchronous fallback — used only during construction.
  // The async loadConfigFromDb() is preferred and called before first use.
  const apiKey = process.env.ANTHROPIC_API_KEY ?? '';
  if (!apiKey && process.env.NODE_ENV === 'production') {
    throw new Error('ANTHROPIC_API_KEY environment variable is required');
  }
  return {
    apiKey: apiKey || 'test-placeholder-key',
    model: process.env.ANTHROPIC_MODEL ?? DEFAULT_MODEL,
    maxTokens: parseInt(process.env.ANTHROPIC_MAX_TOKENS ?? '4096', 10),
  };
}

/**
 * Load config from the DB (active LLM provider for a tenant), falling back
 * to the ANTHROPIC_API_KEY env var, and finally to a dev/test placeholder.
 */
async function loadConfigFromDb(tenantId?: string): Promise<ClaudeConfig> {
  // Return cached config if still fresh
  if (cachedConfig && Date.now() - cachedConfigTimestamp < CONFIG_CACHE_TTL_MS) {
    return cachedConfig;
  }

  // Try DB-based provider if tenantId available
  if (tenantId) {
    try {
      const activeProvider = await getActiveProvider(tenantId);
      if (activeProvider) {
        const apiKey = await getDecryptedApiKey(tenantId, activeProvider.id);
        cachedConfig = {
          apiKey,
          model: activeProvider.defaultModel,
          maxTokens: activeProvider.maxTokensPerRequest,
        };
        cachedConfigTimestamp = Date.now();
        logger.debug({ tenantId, provider: activeProvider.providerName }, 'Loaded LLM config from DB');
        return cachedConfig;
      }
    } catch (err) {
      logger.warn({ tenantId, err }, 'Failed to load LLM provider from DB, falling back to env');
    }
  }

  // Fallback to env var
  const apiKey = process.env.ANTHROPIC_API_KEY ?? '';
  if (apiKey) {
    cachedConfig = {
      apiKey,
      model: process.env.ANTHROPIC_MODEL ?? DEFAULT_MODEL,
      maxTokens: parseInt(process.env.ANTHROPIC_MAX_TOKENS ?? '4096', 10),
    };
    cachedConfigTimestamp = Date.now();
    return cachedConfig;
  }

  // Dev/test mode placeholder
  if (process.env.NODE_ENV !== 'production') {
    cachedConfig = {
      apiKey: 'test-placeholder-key',
      model: DEFAULT_MODEL,
      maxTokens: 4096,
    };
    cachedConfigTimestamp = Date.now();
    return cachedConfig;
  }

  throw new Error('No LLM provider configured and ANTHROPIC_API_KEY is not set');
}

/** Invalidate the cached config (e.g., when a provider is activated). */
export function invalidateConfigCache(): void {
  cachedConfig = null;
  cachedConfigTimestamp = 0;
}

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

export interface ChatMessage {
  role: 'user' | 'assistant';
  content: string;
}

export interface ChatOptions {
  model?: string;
  maxTokens?: number;
  systemPrompt?: string;
  temperature?: number;
}

export interface ChatResponse {
  content: string;
  model: string;
  inputTokens: number;
  outputTokens: number;
  stopReason: string | null;
}

export interface StreamChunk {
  type: 'content_delta' | 'message_start' | 'message_stop' | 'error';
  content?: string;
  model?: string;
  inputTokens?: number;
  outputTokens?: number;
  stopReason?: string | null;
}

// ---------------------------------------------------------------------------
// ClaudeClient
// ---------------------------------------------------------------------------

export class ClaudeClient {
  private client: Anthropic;
  private config: ClaudeConfig;

  constructor() {
    this.config = loadConfig();
    this.client = new Anthropic({
      apiKey: this.config.apiKey,
    });
  }

  /**
   * Refresh config from DB for the given tenant, re-creating the Anthropic
   * client if the API key has changed.
   */
  async refreshConfig(tenantId?: string): Promise<void> {
    const newConfig = await loadConfigFromDb(tenantId);
    if (newConfig.apiKey !== this.config.apiKey) {
      this.client = new Anthropic({ apiKey: newConfig.apiKey });
    }
    this.config = newConfig;
  }

  /**
   * Non-streaming chat completion. Retries up to 2x on 429/500/503 with
   * exponential backoff.
   */
  async chat(
    messages: ChatMessage[],
    options: ChatOptions = {},
  ): Promise<ChatResponse> {
    const model = options.model ?? this.config.model;
    const maxTokens = options.maxTokens ?? this.config.maxTokens;

    const params: Anthropic.MessageCreateParams = {
      model,
      max_tokens: maxTokens,
      messages: messages as MessageParam[],
      ...(options.systemPrompt ? { system: options.systemPrompt } : {}),
      ...(options.temperature !== undefined
        ? { temperature: options.temperature }
        : {}),
    };

    let lastError: unknown;

    for (let attempt = 0; attempt <= MAX_RETRIES; attempt++) {
      try {
        const response = await this.client.messages.create(params);

        const textContent = response.content
          .filter((block: ContentBlock) => block.type === 'text')
          .map((block: ContentBlock) => (block as { type: 'text'; text: string }).text)
          .join('');

        return {
          content: textContent,
          model: response.model,
          inputTokens: response.usage.input_tokens,
          outputTokens: response.usage.output_tokens,
          stopReason: response.stop_reason,
        };
      } catch (err: unknown) {
        lastError = err;
        const status = (err as { status?: number }).status;

        if (status && RETRYABLE_STATUS_CODES.includes(status) && attempt < MAX_RETRIES) {
          const delay = BASE_DELAY_MS * Math.pow(2, attempt);
          logger.warn(
            { attempt: attempt + 1, status, delay },
            'Retrying Claude API request',
          );
          await this.sleep(delay);
          continue;
        }

        throw err;
      }
    }

    throw lastError;
  }

  /**
   * Streaming chat completion. Returns an async iterable of chunks.
   * Retries up to 2x on 429/500/503 with exponential backoff.
   */
  async *stream(
    messages: ChatMessage[],
    options: ChatOptions = {},
  ): AsyncIterable<StreamChunk> {
    const model = options.model ?? this.config.model;
    const maxTokens = options.maxTokens ?? this.config.maxTokens;

    const params: Anthropic.MessageCreateParams = {
      model,
      max_tokens: maxTokens,
      messages: messages as MessageParam[],
      stream: true,
      ...(options.systemPrompt ? { system: options.systemPrompt } : {}),
      ...(options.temperature !== undefined
        ? { temperature: options.temperature }
        : {}),
    };

    let lastError: unknown;

    for (let attempt = 0; attempt <= MAX_RETRIES; attempt++) {
      try {
        const stream = this.client.messages.stream(params);

        yield {
          type: 'message_start',
          model,
        };

        let inputTokens = 0;
        let outputTokens = 0;

        for await (const event of stream) {
          if (event.type === 'content_block_delta') {
            const delta = event.delta as { type: string; text?: string };
            if (delta.type === 'text_delta' && delta.text) {
              yield {
                type: 'content_delta',
                content: delta.text,
              };
            }
          } else if (event.type === 'message_delta') {
            const messageDelta = event as unknown as {
              usage?: { output_tokens: number };
            };
            if (messageDelta.usage) {
              outputTokens = messageDelta.usage.output_tokens;
            }
          } else if (event.type === 'message_start') {
            const messageStart = event as unknown as {
              message?: { usage?: { input_tokens: number } };
            };
            if (messageStart.message?.usage) {
              inputTokens = messageStart.message.usage.input_tokens;
            }
          }
        }

        const finalMessage = await stream.finalMessage();

        yield {
          type: 'message_stop',
          inputTokens: finalMessage.usage.input_tokens || inputTokens,
          outputTokens: finalMessage.usage.output_tokens || outputTokens,
          stopReason: finalMessage.stop_reason,
          model: finalMessage.model,
        };

        return; // Success - exit retry loop
      } catch (err: unknown) {
        lastError = err;
        const status = (err as { status?: number }).status;

        if (status && RETRYABLE_STATUS_CODES.includes(status) && attempt < MAX_RETRIES) {
          const delay = BASE_DELAY_MS * Math.pow(2, attempt);
          logger.warn(
            { attempt: attempt + 1, status, delay },
            'Retrying Claude streaming request',
          );
          await this.sleep(delay);
          continue;
        }

        yield {
          type: 'error',
          content: (err as Error).message ?? 'Unknown error from Claude API',
        };
        return;
      }
    }

    yield {
      type: 'error',
      content: (lastError as Error).message ?? 'Max retries exceeded',
    };
  }

  private sleep(ms: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }
}

/** Singleton instance. */
export const claudeClient = new ClaudeClient();
