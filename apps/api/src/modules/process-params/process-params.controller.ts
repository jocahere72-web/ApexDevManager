import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import * as processParamsService from './process-params.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import { type ProcessStage, PROCESS_STAGES, type ProcessParams } from '@apex-dev-manager/shared-types';

export const processParamsRouter = Router();

const VALID_STAGES = new Set<string>(PROCESS_STAGES);

function validateStage(stage: string): ProcessStage {
  if (!VALID_STAGES.has(stage)) {
    throw new ValidationError(`Invalid stage: ${stage}. Must be one of: ${PROCESS_STAGES.join(', ')}`);
  }
  return stage as ProcessStage;
}

// ── GET / — Get all stages with params (authenticated) ─────────────────────
processParamsRouter.get(
  '/',
  async (req: Request, res: Response<ApiResponse<ProcessParams[]>>, next: NextFunction) => {
    try {
      const params = await processParamsService.getAllParams(
        req.tenantId!,
        req.dbClient,
      );

      res.json({ success: true, data: params });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:stage — Get params for a specific stage (authenticated) ──────────
processParamsRouter.get(
  '/:stage',
  async (req: Request, res: Response<ApiResponse<ProcessParams>>, next: NextFunction) => {
    try {
      const stage = validateStage(req.params.stage);
      const params = await processParamsService.getParams(
        req.tenantId!,
        stage,
        req.dbClient,
      );

      res.json({ success: true, data: params });
    } catch (err) {
      next(err);
    }
  },
);

// ── PUT /:stage — Upsert params for a stage (admin only) ──────────────────
processParamsRouter.put(
  '/:stage',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<ProcessParams>>, next: NextFunction) => {
    try {
      const stage = validateStage(req.params.stage);
      const params = await processParamsService.upsertParams(
        req.tenantId!,
        stage,
        req.body,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: params });
    } catch (err) {
      next(err);
    }
  },
);

// ── DELETE /:stage — Reset to defaults (admin only) ────────────────────────
processParamsRouter.delete(
  '/:stage',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<ProcessParams>>, next: NextFunction) => {
    try {
      const stage = validateStage(req.params.stage);
      const params = await processParamsService.resetParams(
        req.tenantId!,
        stage,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: params });
    } catch (err) {
      next(err);
    }
  },
);
