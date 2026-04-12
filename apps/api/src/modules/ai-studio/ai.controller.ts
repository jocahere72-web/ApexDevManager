import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import {
  ChatRequestSchema,
  QuickActionSchema,
  ListConversationsSchema,
} from './ai.validation.js';
import * as aiService from './ai.service.js';
import { buildSystemPrompt, buildQuickActionPrompt } from './prompt-builder.js';
import type { PromptContext } from './prompt-builder.js';
import { sanitizeInput } from './sanitizer.js';
import { checkRateLimit } from './rate-limiter.js';
import { claudeClient } from './claude.client.js';
import { ValidationError } from '../../lib/errors.js';
import { logger } from '../../lib/logger.js';
import type { ApiResponse, PaginatedResponse } from '../../types/index.js';
import type { Conversation, ConversationMessage, TokenUsageSummary } from '@apex-dev-manager/shared-types';

export const aiRouter = Router();

// All AI routes require authentication (applied in routes/index.ts)
// Authorize specific roles where needed

// ---------------------------------------------------------------------------
// POST /chat - Streaming SSE response
// ---------------------------------------------------------------------------

aiRouter.post(
  '/chat',
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const parsed = ChatRequestSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid chat request', parsed.error.flatten().fieldErrors);
      }

      // Set up SSE headers
      res.writeHead(200, {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        Connection: 'keep-alive',
        'X-Accel-Buffering': 'no',
      });

      // Stream response
      const stream = aiService.streamChat(parsed.data, req.userId!, req.tenantId!);

      for await (const event of stream) {
        res.write(`data: ${JSON.stringify(event)}\n\n`);

        if (event.type === 'done' || event.type === 'error') {
          break;
        }
      }

      res.end();
    } catch (err) {
      // If headers already sent, we can't use the error handler
      if (res.headersSent) {
        res.write(`data: ${JSON.stringify({ type: 'error', error: (err as Error).message })}\n\n`);
        res.end();
      } else {
        next(err);
      }
    }
  },
);

// ---------------------------------------------------------------------------
// POST /quick-action - Non-streaming quick action
// ---------------------------------------------------------------------------

aiRouter.post(
  '/quick-action',
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const parsed = QuickActionSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid quick action request', parsed.error.flatten().fieldErrors);
      }

      // Rate limit
      await checkRateLimit(req.tenantId!, req.userId!);

      // Sanitize the code input
      const sanitized = sanitizeInput(parsed.data.code);

      // Build context & prompt
      const context: PromptContext = {
        appName: parsed.data.appName,
        pageName: parsed.data.pageName,
      };
      const systemPrompt = buildSystemPrompt(context);
      const userPrompt = buildQuickActionPrompt(
        parsed.data.action,
        sanitized.sanitized,
        parsed.data.language,
      );

      // Call Claude (non-streaming for quick actions)
      const response = await claudeClient.chat(
        [{ role: 'user', content: userPrompt }],
        { systemPrompt },
      );

      res.json({
        success: true,
        data: {
          content: response.content,
          action: parsed.data.action,
          model: response.model,
          usage: {
            inputTokens: response.inputTokens,
            outputTokens: response.outputTokens,
            totalTokens: response.inputTokens + response.outputTokens,
          },
        },
      });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /conversations - List conversations
// ---------------------------------------------------------------------------

aiRouter.get(
  '/conversations',
  async (req: Request, res: Response<PaginatedResponse<Conversation>>, next: NextFunction) => {
    try {
      const parsed = ListConversationsSchema.safeParse(req.query);
      if (!parsed.success) {
        throw new ValidationError('Invalid query parameters', parsed.error.flatten().fieldErrors);
      }

      const { page, limit, connectionId } = parsed.data;
      const { conversations, total } = await aiService.getConversations(
        req.userId!,
        req.tenantId!,
        page,
        limit,
        connectionId,
      );
      const totalPages = Math.ceil(total / limit);

      res.json({
        success: true,
        data: conversations,
        pagination: {
          page,
          pageSize: limit,
          totalItems: total,
          totalPages,
          hasNext: page < totalPages,
          hasPrevious: page > 1,
        },
      });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /conversations/:id - Get conversation with messages
// ---------------------------------------------------------------------------

aiRouter.get(
  '/conversations/:id',
  async (req: Request, res: Response<ApiResponse<Conversation>>, next: NextFunction) => {
    try {
      const conversation = await aiService.getConversation(req.params.id, req.tenantId!);

      res.json({ success: true, data: conversation });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// DELETE /conversations/:id - Delete conversation
// ---------------------------------------------------------------------------

aiRouter.delete(
  '/conversations/:id',
  async (req: Request, res: Response<ApiResponse>, next: NextFunction) => {
    try {
      await aiService.deleteConversation(req.params.id, req.tenantId!, req.userId!);

      res.json({ success: true, data: { message: 'Conversation deleted successfully' } });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /usage - Token usage summary
// ---------------------------------------------------------------------------

aiRouter.get(
  '/usage',
  authorize(['admin', 'tech_lead']),
  async (req: Request, res: Response<ApiResponse<TokenUsageSummary>>, next: NextFunction) => {
    try {
      const period = (req.query.period as 'day' | 'week' | 'month') ?? 'month';
      const usage = await aiService.getUsageSummary(req.tenantId!, period);

      res.json({ success: true, data: usage });
    } catch (err) {
      next(err);
    }
  },
);
