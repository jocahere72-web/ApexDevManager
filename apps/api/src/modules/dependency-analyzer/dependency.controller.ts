import { Router, type Request, type Response, type NextFunction } from 'express';
import * as dependencyService from './dependency.service.js';
import type { ApiResponse } from '../../types/index.js';
import type { DependencyGraph, ImpactAssessment } from '@apex-dev-manager/shared-types';

export const dependencyRouter = Router();

// ── GET /graph/:connectionId/:objectType/:objectId ── Dependency graph ──────
dependencyRouter.get(
  '/graph/:connectionId/:objectType/:objectId',
  async (req: Request, res: Response<ApiResponse<DependencyGraph>>, next: NextFunction) => {
    try {
      const graph = await dependencyService.getDependencyGraph(
        req.tenantId!,
        req.params.connectionId,
        req.params.objectType,
        req.params.objectId,
      );
      res.json({ success: true, data: graph });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /impact/:connectionId/:objectType/:objectId ── Impact assessment ────
dependencyRouter.get(
  '/impact/:connectionId/:objectType/:objectId',
  async (req: Request, res: Response<ApiResponse<ImpactAssessment>>, next: NextFunction) => {
    try {
      const assessment = await dependencyService.getImpactAssessment(
        req.tenantId!,
        req.params.connectionId,
        req.params.objectType,
        req.params.objectId,
      );
      res.json({ success: true, data: assessment });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /analyze/:connectionId ── Full dependency analysis ─────────────────
dependencyRouter.post(
  '/analyze/:connectionId',
  async (req: Request, res: Response<ApiResponse<DependencyGraph>>, next: NextFunction) => {
    try {
      const graph = await dependencyService.analyzeDependencies(
        req.tenantId!,
        req.params.connectionId,
      );
      res.json({ success: true, data: graph });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /export ── Export graph in DOT or Mermaid format ────────────────────
dependencyRouter.post(
  '/export',
  async (req: Request, res: Response<ApiResponse<{ content: string }>>, next: NextFunction) => {
    try {
      const { graph, format } = req.body;
      const content = await dependencyService.exportGraph(graph, format ?? 'mermaid');
      res.json({ success: true, data: { content } });
    } catch (err) {
      next(err);
    }
  },
);
