import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import { CreatePromptTemplateSchema, UpdatePromptTemplateSchema } from './prompt-templates.validation.js';
import * as promptTemplatesService from './prompt-templates.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type { PromptTemplateRow } from './prompt-templates.service.js';

export const promptTemplatesRouter = Router();

// ── POST / — Create prompt template (admin only) ────────────────────────────
promptTemplatesRouter.post(
  '/',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<PromptTemplateRow>>, next: NextFunction) => {
    try {
      const parsed = CreatePromptTemplateSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid template data', parsed.error.flatten().fieldErrors);
      }

      const template = await promptTemplatesService.createTemplate(
        req.tenantId!,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.status(201).json({ success: true, data: template });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET / — List all active templates (authenticated) ───────────────────────
promptTemplatesRouter.get(
  '/',
  async (req: Request, res: Response<ApiResponse<PromptTemplateRow[]>>, next: NextFunction) => {
    try {
      const category = req.query.category as string | undefined;

      const templates = await promptTemplatesService.listTemplates(
        req.tenantId!,
        category,
        req.dbClient,
      );

      res.json({ success: true, data: templates });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /slug/:slug — Get template by slug (authenticated) ─────────────────
promptTemplatesRouter.get(
  '/slug/:slug',
  async (req: Request, res: Response<ApiResponse<PromptTemplateRow | null>>, next: NextFunction) => {
    try {
      const template = await promptTemplatesService.getTemplateBySlug(
        req.tenantId!,
        req.params.slug,
        req.dbClient,
      );

      res.json({ success: true, data: template });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:id — Get single template (authenticated) ─────────────────────────
promptTemplatesRouter.get(
  '/:id',
  async (req: Request, res: Response<ApiResponse<PromptTemplateRow>>, next: NextFunction) => {
    try {
      const template = await promptTemplatesService.getTemplate(
        req.tenantId!,
        req.params.id,
        req.dbClient,
      );

      res.json({ success: true, data: template });
    } catch (err) {
      next(err);
    }
  },
);

// ── PATCH /:id — Update template (admin only) ──────────────────────────────
promptTemplatesRouter.patch(
  '/:id',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<PromptTemplateRow>>, next: NextFunction) => {
    try {
      const parsed = UpdatePromptTemplateSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid update data', parsed.error.flatten().fieldErrors);
      }

      const template = await promptTemplatesService.updateTemplate(
        req.tenantId!,
        req.params.id,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: template });
    } catch (err) {
      next(err);
    }
  },
);

// ── DELETE /:id — Delete template (admin only) ─────────────────────────────
promptTemplatesRouter.delete(
  '/:id',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse>, next: NextFunction) => {
    try {
      await promptTemplatesService.deleteTemplate(
        req.tenantId!,
        req.params.id,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: { message: 'Prompt template deleted successfully' } });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:slug/reset — Reset to system default (admin only) ───────────────
promptTemplatesRouter.post(
  '/:slug/reset',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<PromptTemplateRow>>, next: NextFunction) => {
    try {
      const template = await promptTemplatesService.resetToDefault(
        req.tenantId!,
        req.params.slug,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: template });
    } catch (err) {
      next(err);
    }
  },
);
