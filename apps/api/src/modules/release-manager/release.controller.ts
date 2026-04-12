import { Router, type Request, type Response, type NextFunction } from 'express';
import * as releaseService from './release.service.js';
import type { ApiResponse } from '../../types/index.js';
import type { Release, Pipeline } from '@apex-dev-manager/shared-types';

export const releaseManagerRouter = Router();

// ── POST / ── Create release ────────────────────────────────────────────────
releaseManagerRouter.post(
  '/',
  async (req: Request, res: Response<ApiResponse<Release>>, next: NextFunction) => {
    try {
      const { connectionId, version, changeSetIds } = req.body;
      const release = await releaseService.createRelease(
        req.tenantId!,
        connectionId,
        version,
        changeSetIds ?? [],
      );
      res.status(201).json({ success: true, data: release });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET / ── List releases ──────────────────────────────────────────────────
releaseManagerRouter.get(
  '/',
  async (req: Request, res: Response<ApiResponse<{ items: Release[]; total: number }>>, next: NextFunction) => {
    try {
      const { connectionId, status, limit, offset } = req.query;
      const result = await releaseService.listReleases(
        req.tenantId!,
        connectionId as string | undefined,
        status as any,
        limit ? parseInt(limit as string, 10) : undefined,
        offset ? parseInt(offset as string, 10) : undefined,
      );
      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:id ── Get release ─────────────────────────────────────────────────
releaseManagerRouter.get(
  '/:id',
  async (req: Request, res: Response<ApiResponse<Release>>, next: NextFunction) => {
    try {
      const release = await releaseService.getRelease(req.tenantId!, req.params.id);
      res.json({ success: true, data: release });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:id/pipeline ── Get pipeline status ────────────────────────────────
releaseManagerRouter.get(
  '/:id/pipeline',
  async (req: Request, res: Response<ApiResponse<Pipeline>>, next: NextFunction) => {
    try {
      const pipeline = await releaseService.getPipelineStatus(req.tenantId!, req.params.id);
      res.json({ success: true, data: pipeline });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/build ── Build release ────────────────────────────────────────
releaseManagerRouter.post(
  '/:id/build',
  async (req: Request, res: Response<ApiResponse<Release>>, next: NextFunction) => {
    try {
      const release = await releaseService.buildRelease(req.tenantId!, req.params.id);
      res.json({ success: true, data: release });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/promote ── Promote to staging ─────────────────────────────────
releaseManagerRouter.post(
  '/:id/promote',
  async (req: Request, res: Response<ApiResponse<Release>>, next: NextFunction) => {
    try {
      const release = await releaseService.promoteToStaging(req.tenantId!, req.params.id);
      res.json({ success: true, data: release });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/deploy ── Deploy to production ────────────────────────────────
releaseManagerRouter.post(
  '/:id/deploy',
  async (req: Request, res: Response<ApiResponse<Release>>, next: NextFunction) => {
    try {
      const release = await releaseService.deployToProduction(
        req.tenantId!,
        req.params.id,
        req.userId!,
      );
      res.json({ success: true, data: release });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/rollback ── Rollback release ──────────────────────────────────
releaseManagerRouter.post(
  '/:id/rollback',
  async (req: Request, res: Response<ApiResponse<Release>>, next: NextFunction) => {
    try {
      const { reason } = req.body;
      const release = await releaseService.rollback(req.tenantId!, req.params.id, reason);
      res.json({ success: true, data: release });
    } catch (err) {
      next(err);
    }
  },
);
