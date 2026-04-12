import { Router, type Request, type Response, type NextFunction } from 'express';
import * as docsService from './docs.service.js';
import type { ApiResponse } from '../../types/index.js';
import type { GeneratedDoc } from '@apex-dev-manager/shared-types';

export const docsRouter = Router();

// ── POST /generate ── Generate documentation ────────────────────────────────
docsRouter.post(
  '/generate',
  async (req: Request, res: Response<ApiResponse<GeneratedDoc>>, next: NextFunction) => {
    try {
      const doc = await docsService.generateDocs(req.tenantId!, req.userId!, req.body, req.dbClient);
      res.status(201).json({ success: true, data: doc });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /generate-api ── Generate API documentation ────────────────────────
docsRouter.post(
  '/generate-api',
  async (req: Request, res: Response<ApiResponse<GeneratedDoc>>, next: NextFunction) => {
    try {
      const { connectionId } = req.body;
      const doc = await docsService.generateAPIDoc(req.tenantId!, req.userId!, connectionId, req.dbClient);
      res.status(201).json({ success: true, data: doc });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /docs ── List all docs ──────────────────────────────────────────────
docsRouter.get(
  '/docs',
  async (req: Request, res: Response<ApiResponse<GeneratedDoc[]>>, next: NextFunction) => {
    try {
      const docs = docsService.listDocs(req.tenantId!);
      res.json({ success: true, data: docs });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /docs/:id ── Get single doc ─────────────────────────────────────────
docsRouter.get(
  '/docs/:id',
  async (req: Request, res: Response<ApiResponse<GeneratedDoc>>, next: NextFunction) => {
    try {
      const doc = docsService.getDoc(req.tenantId!, req.params.id);
      res.json({ success: true, data: doc });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /docs/:id/export ── Export document ────────────────────────────────
docsRouter.post(
  '/docs/:id/export',
  async (req: Request, res: Response<ApiResponse<{ content: string; mimeType: string }>>, next: NextFunction) => {
    try {
      const { format } = req.body;
      const result = await docsService.exportDoc(req.params.id, format ?? 'markdown');
      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);
