// ---------------------------------------------------------------------------
// Usage Intelligence Controller (M15 Cost & Usage Analytics)
// ---------------------------------------------------------------------------

import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import * as usageService from './usage.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type {
  UsageMetrics,
  CostBreakdown,
  OptimizationSuggestion,
  UsageTrends,
} from '@apex-dev-manager/shared-types';

export const usageRouter = Router();

// All usage routes require admin or tech_lead role
usageRouter.use(authorize(['admin', 'tech_lead']));

// ---------------------------------------------------------------------------
// GET /metrics - Get usage metrics
// ---------------------------------------------------------------------------

usageRouter.get(
  '/metrics',
  async (req: Request, res: Response<ApiResponse<UsageMetrics>>, next: NextFunction) => {
    try {
      const start = req.query.start as string | undefined;
      const end = req.query.end as string | undefined;
      const period = start && end ? { start, end } : undefined;

      const metrics = await usageService.getUsageMetrics(req.tenantId!, period);
      res.json({ success: true, data: metrics });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /costs - Get cost breakdown
// ---------------------------------------------------------------------------

usageRouter.get(
  '/costs',
  async (req: Request, res: Response<ApiResponse<CostBreakdown>>, next: NextFunction) => {
    try {
      const start = req.query.start as string | undefined;
      const end = req.query.end as string | undefined;
      const period = start && end ? { start, end } : undefined;

      const breakdown = await usageService.getCostBreakdown(req.tenantId!, period);
      res.json({ success: true, data: breakdown });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /suggestions - Get optimization suggestions
// ---------------------------------------------------------------------------

usageRouter.get(
  '/suggestions',
  async (req: Request, res: Response<ApiResponse<OptimizationSuggestion[]>>, next: NextFunction) => {
    try {
      const suggestions = await usageService.getOptimizationSuggestions(req.tenantId!);
      res.json({ success: true, data: suggestions });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /trends - Get usage trends
// ---------------------------------------------------------------------------

usageRouter.get(
  '/trends',
  async (req: Request, res: Response<ApiResponse<UsageTrends>>, next: NextFunction) => {
    try {
      const granularity = (req.query.granularity as string) ?? 'day';
      const days = req.query.days ? parseInt(req.query.days as string, 10) : 30;

      const trends = await usageService.getUsageTrends(
        req.tenantId!,
        granularity as any,
        days,
      );
      res.json({ success: true, data: trends });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /export - Export usage report
// ---------------------------------------------------------------------------

usageRouter.post(
  '/export',
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { format, period, includeBreakdown, includeSuggestions } = req.body;

      if (!format || !period?.start || !period?.end) {
        throw new ValidationError('format and period (start, end) are required');
      }

      const report = await usageService.exportReport(req.tenantId!, {
        format,
        period,
        includeBreakdown: includeBreakdown ?? true,
        includeSuggestions: includeSuggestions ?? true,
      });

      res.setHeader('Content-Type', report.contentType);
      res.setHeader('Content-Disposition', `attachment; filename="${report.filename}"`);
      res.send(report.content);
    } catch (err) {
      next(err);
    }
  },
);
