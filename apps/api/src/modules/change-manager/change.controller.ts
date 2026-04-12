import { Router, type Request, type Response, type NextFunction } from 'express';
import * as changeService from './change.service.js';
import type { ApiResponse } from '../../types/index.js';
import type { ChangeSet, ConflictDetail } from '@apex-dev-manager/shared-types';

export const changeManagerRouter = Router();

// ── POST / ── Create change set ─────────────────────────────────────────────
changeManagerRouter.post(
  '/',
  async (req: Request, res: Response<ApiResponse<ChangeSet>>, next: NextFunction) => {
    try {
      const { connectionId, name, description } = req.body;
      const cs = await changeService.createChangeSet(
        req.tenantId!,
        connectionId,
        name,
        description ?? null,
        req.userId!,
      );
      res.status(201).json({ success: true, data: cs });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET / ── List change sets ───────────────────────────────────────────────
changeManagerRouter.get(
  '/',
  async (req: Request, res: Response<ApiResponse<{ items: ChangeSet[]; total: number }>>, next: NextFunction) => {
    try {
      const { connectionId, status, limit, offset } = req.query;
      const result = await changeService.listChangeSets(
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

// ── GET /:id ── Get change set detail ───────────────────────────────────────
changeManagerRouter.get(
  '/:id',
  async (req: Request, res: Response<ApiResponse<ChangeSet>>, next: NextFunction) => {
    try {
      const cs = await changeService.getChangeSet(req.tenantId!, req.params.id);
      res.json({ success: true, data: cs });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/objects ── Add object to change set ───────────────────────────
changeManagerRouter.post(
  '/:id/objects',
  async (req: Request, res: Response<ApiResponse<ChangeSet>>, next: NextFunction) => {
    try {
      const cs = await changeService.addObject(req.tenantId!, req.params.id, req.body);
      res.json({ success: true, data: cs });
    } catch (err) {
      next(err);
    }
  },
);

// ── DELETE /:id/objects/:index ── Remove object from change set ─────────────
changeManagerRouter.delete(
  '/:id/objects/:index',
  async (req: Request, res: Response<ApiResponse<ChangeSet>>, next: NextFunction) => {
    try {
      const cs = await changeService.removeObject(
        req.tenantId!,
        req.params.id,
        parseInt(req.params.index, 10),
      );
      res.json({ success: true, data: cs });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/detect-conflicts ── Detect conflicts ─────────────────────────
changeManagerRouter.post(
  '/:id/detect-conflicts',
  async (req: Request, res: Response<ApiResponse<ConflictDetail[]>>, next: NextFunction) => {
    try {
      const conflicts = await changeService.detectConflicts(req.tenantId!, req.params.id);
      res.json({ success: true, data: conflicts });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/submit ── Submit for review ───────────────────────────────────
changeManagerRouter.post(
  '/:id/submit',
  async (req: Request, res: Response<ApiResponse<ChangeSet>>, next: NextFunction) => {
    try {
      const cs = await changeService.submitForReview(req.tenantId!, req.params.id);
      res.json({ success: true, data: cs });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/approve ── Approve change set ─────────────────────────────────
changeManagerRouter.post(
  '/:id/approve',
  async (req: Request, res: Response<ApiResponse<ChangeSet>>, next: NextFunction) => {
    try {
      const cs = await changeService.approve(req.tenantId!, req.params.id, req.userId!);
      res.json({ success: true, data: cs });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/reject ── Reject change set ───────────────────────────────────
changeManagerRouter.post(
  '/:id/reject',
  async (req: Request, res: Response<ApiResponse<ChangeSet>>, next: NextFunction) => {
    try {
      const cs = await changeService.reject(req.tenantId!, req.params.id);
      res.json({ success: true, data: cs });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/apply ── Apply change set ─────────────────────────────────────
changeManagerRouter.post(
  '/:id/apply',
  async (req: Request, res: Response<ApiResponse<ChangeSet>>, next: NextFunction) => {
    try {
      const cs = await changeService.applyChangeSet(req.tenantId!, req.params.id);
      res.json({ success: true, data: cs });
    } catch (err) {
      next(err);
    }
  },
);
