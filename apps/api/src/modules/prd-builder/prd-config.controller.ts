import { Router, type Request, type Response, type NextFunction } from 'express';
import { z } from 'zod';
import * as prdConfigService from './prd-config.service.js';
import { authorize } from '../auth/auth.middleware.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type { PRDConfig } from './prd-config.service.js';

export const prdConfigRouter = Router();

// ---------------------------------------------------------------------------
// Validation schemas
// ---------------------------------------------------------------------------

const CreateConfigSchema = z.object({
  name: z.string().min(1).max(200),
  exampleDocument: z.string().min(1).max(500_000),
  generationPrompt: z.string().min(1).max(100_000),
  extractionPrompt: z.string().max(100_000).nullable().optional(),
  validationPrompt: z.string().max(100_000).nullable().optional(),
});

const UpdateConfigSchema = z.object({
  name: z.string().min(1).max(200).optional(),
  exampleDocument: z.string().min(1).max(500_000).optional(),
  generationPrompt: z.string().min(1).max(100_000).optional(),
  extractionPrompt: z.string().max(100_000).nullable().optional(),
  validationPrompt: z.string().max(100_000).nullable().optional(),
});

// ---------------------------------------------------------------------------
// POST /configs (admin)
// ---------------------------------------------------------------------------

prdConfigRouter.post(
  '/',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<PRDConfig>>, next: NextFunction) => {
    try {
      const parsed = CreateConfigSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid config data', parsed.error.flatten().fieldErrors);
      }

      const config = await prdConfigService.createConfig(
        req.tenantId!,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.status(201).json({ success: true, data: config });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /configs (authenticated)
// ---------------------------------------------------------------------------

prdConfigRouter.get(
  '/',
  async (req: Request, res: Response<ApiResponse<PRDConfig[]>>, next: NextFunction) => {
    try {
      const configs = await prdConfigService.listConfigs(req.tenantId!, req.dbClient);
      res.json({ success: true, data: configs });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /configs/default (authenticated)
// ---------------------------------------------------------------------------

prdConfigRouter.get(
  '/default',
  async (req: Request, res: Response<ApiResponse<PRDConfig | null>>, next: NextFunction) => {
    try {
      const config = await prdConfigService.getDefaultConfig(req.tenantId!, req.dbClient);
      res.json({ success: true, data: config });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /configs/:id (authenticated)
// ---------------------------------------------------------------------------

prdConfigRouter.get(
  '/:id',
  async (req: Request, res: Response<ApiResponse<PRDConfig>>, next: NextFunction) => {
    try {
      const config = await prdConfigService.getConfig(req.tenantId!, req.params.id, req.dbClient);
      res.json({ success: true, data: config });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// PATCH /configs/:id (admin)
// ---------------------------------------------------------------------------

prdConfigRouter.patch(
  '/:id',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<PRDConfig>>, next: NextFunction) => {
    try {
      const parsed = UpdateConfigSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid config data', parsed.error.flatten().fieldErrors);
      }

      const config = await prdConfigService.updateConfig(
        req.tenantId!,
        req.params.id,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: config });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// DELETE /configs/:id (admin)
// ---------------------------------------------------------------------------

prdConfigRouter.delete(
  '/:id',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<{ deleted: boolean }>>, next: NextFunction) => {
    try {
      await prdConfigService.deleteConfig(
        req.tenantId!,
        req.params.id,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: { deleted: true } });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /configs/:id/set-default (admin)
// ---------------------------------------------------------------------------

prdConfigRouter.post(
  '/:id/set-default',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<PRDConfig>>, next: NextFunction) => {
    try {
      const config = await prdConfigService.setDefault(
        req.tenantId!,
        req.params.id,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: config });
    } catch (err) {
      next(err);
    }
  },
);
