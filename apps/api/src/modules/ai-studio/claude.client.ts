import Anthropic from '@anthropic-ai/sdk';
import type { MessageParam, ContentBlock } from '@anthropic-ai/sdk/resources/messages';
import { logger } from '../../lib/logger.js';

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

function loadConfig(): ClaudeConfig {
  const apiKey = process.env.ANTHROPIC_API_KEY ?? '';
  if (!apiKey && process.env.NODE_ENV !== 'test') {
    throw new Error('ANTHROPIC_API_KEY environment variable is required');
  }
  return {
    apiKey: apiKey || 'test-placeholder-key',
    model: process.env.ANTHROPIC_MODEL ?? DEFAULT_MODEL,
    maxTokens: parseInt(process.env.ANTHROPIC_MAX_TOKENS ?? '4096', 10),
  };
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
