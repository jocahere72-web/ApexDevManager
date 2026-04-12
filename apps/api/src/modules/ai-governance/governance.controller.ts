import { Router, type Request, type Response, type NextFunction } from 'express';
import * as governanceService from './governance.service.js';
import type { ApiResponse } from '../../types/index.js';
import type {
  AIAuditEntry,
  SafetyRule,
  GovernanceDashboard,
  TenantQuota,
} from '@apex-dev-manager/shared-types';

export const governanceRouter = Router();

// ── GET /audit-log ── List audit entries ────────────────────────────────────
governanceRouter.get(
  '/audit-log',
  async (req: Request, res: Response<ApiResponse<{ items: AIAuditEntry[]; total: number }>>, next: NextFunction) => {
    try {
      const { limit, offset, userId, blocked, model } = req.query;
      const result = await governanceService.getAuditLog(
        req.tenantId!,
        limit ? parseInt(limit as string, 10) : undefined,
        offset ? parseInt(offset as string, 10) : undefined,
        {
          userId: userId as string | undefined,
          blocked: blocked !== undefined ? blocked === 'true' : undefined,
          model: model as string | undefined,
        },
      );
      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /audit-prompt ── Audit a prompt ────────────────────────────────────
governanceRouter.post(
  '/audit-prompt',
  async (req: Request, res: Response<ApiResponse<{ blocked: boolean; blockReason: string | null; auditId: string }>>, next: NextFunction) => {
    try {
      const result = await governanceService.auditPrompt(req.tenantId!, req.userId!, req.body);
      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /audit-output ── Audit an output ───────────────────────────────────
governanceRouter.post(
  '/audit-output',
  async (req: Request, res: Response<ApiResponse<AIAuditEntry>>, next: NextFunction) => {
    try {
      const { auditId, outputRiskLevel } = req.body;
      const entry = await governanceService.auditOutput(auditId, req.tenantId!, outputRiskLevel);
      res.json({ success: true, data: entry });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /dashboard ── Governance dashboard ──────────────────────────────────
governanceRouter.get(
  '/dashboard',
  async (req: Request, res: Response<ApiResponse<GovernanceDashboard>>, next: NextFunction) => {
    try {
      const dashboard = await governanceService.getDashboard(req.tenantId!);
      res.json({ success: true, data: dashboard });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /rules ── List safety rules ─────────────────────────────────────────
governanceRouter.get(
  '/rules',
  async (req: Request, res: Response<ApiResponse<SafetyRule[]>>, next: NextFunction) => {
    try {
      const rules = await governanceService.getSafetyRules(req.tenantId!);
      res.json({ success: true, data: rules });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /rules ── Create safety rule ───────────────────────────────────────
governanceRouter.post(
  '/rules',
  async (req: Request, res: Response<ApiResponse<SafetyRule>>, next: NextFunction) => {
    try {
      const { ruleName, pattern, action } = req.body;
      const rule = await governanceService.createRule(req.tenantId!, ruleName, pattern, action);
      res.status(201).json({ success: true, data: rule });
    } catch (err) {
      next(err);
    }
  },
);

// ── PUT /rules/:id ── Update safety rule ────────────────────────────────────
governanceRouter.put(
  '/rules/:id',
  async (req: Request, res: Response<ApiResponse<SafetyRule>>, next: NextFunction) => {
    try {
      const rule = await governanceService.updateRule(req.tenantId!, req.params.id, req.body);
      res.json({ success: true, data: rule });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /quota ── Get tenant quota ──────────────────────────────────────────
governanceRouter.get(
  '/quota',
  async (req: Request, res: Response<ApiResponse<TenantQuota>>, next: NextFunction) => {
    try {
      const quota = await governanceService.getTenantQuota(req.tenantId!);
      res.json({ success: true, data: quota });
    } catch (err) {
      next(err);
    }
  },
);

// ── PUT /quota ── Update tenant quota ───────────────────────────────────────
governanceRouter.put(
  '/quota',
  async (req: Request, res: Response<ApiResponse<TenantQuota>>, next: NextFunction) => {
    try {
      const quota = await governanceService.updateQuota(req.tenantId!, req.body);
      res.json({ success: true, data: quota });
    } catch (err) {
      next(err);
    }
  },
);
