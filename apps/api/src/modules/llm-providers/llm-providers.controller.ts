import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import { CreateLLMProviderSchema, UpdateLLMProviderSchema } from './llm-providers.validation.js';
import * as llmProvidersService from './llm-providers.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type { LLMProviderRow } from './llm-providers.service.js';

export const llmProvidersRouter = Router();

// ── POST / — Create LLM provider (admin only) ─────────────────────────────
llmProvidersRouter.post(
  '/',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<LLMProviderRow>>, next: NextFunction) => {
    try {
      const parsed = CreateLLMProviderSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid provider data', parsed.error.flatten().fieldErrors);
      }

      const provider = await llmProvidersService.createProvider(
        req.tenantId!,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.status(201).json({ success: true, data: provider });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET / — List all providers for tenant ──────────────────────────────────
llmProvidersRouter.get(
  '/',
  async (req: Request, res: Response<ApiResponse<LLMProviderRow[]>>, next: NextFunction) => {
    try {
      const providers = await llmProvidersService.listProviders(
        req.tenantId!,
        req.dbClient,
      );

      res.json({ success: true, data: providers });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /active — Get active provider ──────────────────────────────────────
llmProvidersRouter.get(
  '/active',
  async (req: Request, res: Response<ApiResponse<LLMProviderRow | null>>, next: NextFunction) => {
    try {
      const provider = await llmProvidersService.getActiveProvider(
        req.tenantId!,
        req.dbClient,
      );

      res.json({ success: true, data: provider });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:id — Get single provider (admin only) ───────────────────────────
llmProvidersRouter.get(
  '/:id',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<LLMProviderRow>>, next: NextFunction) => {
    try {
      const provider = await llmProvidersService.getProvider(
        req.tenantId!,
        req.params.id,
        req.dbClient,
      );

      res.json({ success: true, data: provider });
    } catch (err) {
      next(err);
    }
  },
);

// ── PATCH /:id — Update provider (admin only) ─────────────────────────────
llmProvidersRouter.patch(
  '/:id',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<LLMProviderRow>>, next: NextFunction) => {
    try {
      const parsed = UpdateLLMProviderSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid update data', parsed.error.flatten().fieldErrors);
      }

      const provider = await llmProvidersService.updateProvider(
        req.tenantId!,
        req.params.id,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: provider });
    } catch (err) {
      next(err);
    }
  },
);

// ── DELETE /:id — Delete provider (admin only) ────────────────────────────
llmProvidersRouter.delete(
  '/:id',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse>, next: NextFunction) => {
    try {
      await llmProvidersService.deleteProvider(
        req.tenantId!,
        req.params.id,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: { message: 'LLM provider deleted successfully' } });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/activate — Set as active provider (admin only) ──────────────
llmProvidersRouter.post(
  '/:id/activate',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<LLMProviderRow>>, next: NextFunction) => {
    try {
      const provider = await llmProvidersService.activateProvider(
        req.tenantId!,
        req.params.id,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: provider });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/test — Test API key (admin only) ───────────────────────────
llmProvidersRouter.post(
  '/:id/test',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<{ success: boolean; message: string; latencyMs: number }>>, next: NextFunction) => {
    try {
      const result = await llmProvidersService.testProvider(
        req.tenantId!,
        req.params.id,
        req.dbClient,
      );

      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);
