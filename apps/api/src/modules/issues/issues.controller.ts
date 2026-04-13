import { Router, type Request, type Response, type NextFunction } from 'express';
import {
  CreateIssueSchema,
  UpdateIssueSchema,
  ListIssuesSchema,
  TransitionSchema,
  LinkArtifactSchema,
} from './issues.validation.js';
import * as issuesService from './issues.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse, PaginatedResponse } from '../../types/index.js';
import type { Issue, IssueStatus } from '@apex-dev-manager/shared-types';
import type { IssueActivity } from './issues.service.js';

export const issuesRouter = Router();

// ── POST / — Create issue ──────────────────────────────────────────────────
issuesRouter.post(
  '/',
  async (req: Request, res: Response<ApiResponse<Issue>>, next: NextFunction) => {
    try {
      const parsed = CreateIssueSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid issue data', parsed.error.flatten().fieldErrors);
      }

      const issue = await issuesService.createIssue(
        req.tenantId!,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.status(201).json({ success: true, data: issue });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET / — List issues ────────────────────────────────────────────────────
issuesRouter.get(
  '/',
  async (req: Request, res: Response<PaginatedResponse<Issue>>, next: NextFunction) => {
    try {
      const parsed = ListIssuesSchema.safeParse(req.query);
      if (!parsed.success) {
        throw new ValidationError('Invalid query parameters', parsed.error.flatten().fieldErrors);
      }

      const { issues, total } = await issuesService.listIssues(
        req.tenantId!,
        parsed.data,
        req.dbClient,
      );
      const { page, limit } = parsed.data;
      const totalPages = Math.ceil(total / limit);

      res.json({
        success: true,
        data: issues,
        pagination: {
          page,
          pageSize: limit,
          totalItems: total,
          totalPages,
          hasNext: page < totalPages,
          hasPrevious: page > 1,
        },
      });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /stats — Issue statistics ──────────────────────────────────────────
issuesRouter.get(
  '/stats',
  async (req: Request, res: Response<ApiResponse<Record<IssueStatus, number>>>, next: NextFunction) => {
    try {
      const clientId = req.query.clientId as string | undefined;
      const stats = await issuesService.getIssueStats(
        req.tenantId!,
        clientId,
        req.dbClient,
      );

      res.json({ success: true, data: stats });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /by-client/:clientId — Issues for a specific client ────────────────
issuesRouter.get(
  '/by-client/:clientId',
  async (req: Request, res: Response<ApiResponse<Issue[]>>, next: NextFunction) => {
    try {
      const issues = await issuesService.getIssuesByClient(
        req.tenantId!,
        req.params.clientId,
        req.dbClient,
      );

      res.json({ success: true, data: issues });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:id — Get issue by ID ─────────────────────────────────────────────
issuesRouter.get(
  '/:id',
  async (req: Request, res: Response<ApiResponse<Issue>>, next: NextFunction) => {
    try {
      const issue = await issuesService.getIssueById(
        req.tenantId!,
        req.params.id,
        req.dbClient,
      );

      res.json({ success: true, data: issue });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:id/activities — Get issue activity timeline ──────────────────────
issuesRouter.get(
  '/:id/activities',
  async (req: Request, res: Response<ApiResponse<IssueActivity[]>>, next: NextFunction) => {
    try {
      const activities = await issuesService.getActivities(
        req.tenantId!,
        req.params.id,
        req.dbClient,
      );

      res.json({ success: true, data: activities });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/link — Link an artifact to the issue ───────────────────────
issuesRouter.post(
  '/:id/link',
  async (req: Request, res: Response<ApiResponse<{ linked: true }>>, next: NextFunction) => {
    try {
      const parsed = LinkArtifactSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid link data', parsed.error.flatten().fieldErrors);
      }

      await issuesService.linkArtifact(
        req.tenantId!,
        req.params.id,
        parsed.data.artifactType,
        parsed.data.artifactId,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: { linked: true } });
    } catch (err) {
      next(err);
    }
  },
);

// ── PATCH /:id — Update issue ──────────────────────────────────────────────
issuesRouter.patch(
  '/:id',
  async (req: Request, res: Response<ApiResponse<Issue>>, next: NextFunction) => {
    try {
      const parsed = UpdateIssueSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid update data', parsed.error.flatten().fieldErrors);
      }

      const issue = await issuesService.updateIssue(
        req.tenantId!,
        req.params.id,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: issue });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/validation — Save AI validation result ──────────────────────
issuesRouter.post(
  '/:id/validation',
  async (req: Request, res: Response<ApiResponse<Issue>>, next: NextFunction) => {
    try {
      const body = req.body as { score?: number; notes?: Record<string, unknown> };
      if (typeof body.score !== 'number' || body.score < 0 || body.score > 100) {
        throw new ValidationError('score must be a number between 0 and 100');
      }
      const issue = await issuesService.saveIssueValidation(
        req.tenantId!,
        req.params.id,
        { score: body.score, notes: body.notes ?? {} },
        req.userId!,
        req.dbClient,
      );
      res.json({ success: true, data: issue });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/transition — Transition issue status ─────────────────────────
issuesRouter.post(
  '/:id/transition',
  async (req: Request, res: Response<ApiResponse<Issue>>, next: NextFunction) => {
    try {
      const parsed = TransitionSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid transition data', parsed.error.flatten().fieldErrors);
      }

      const issue = await issuesService.transitionIssue(
        req.tenantId!,
        req.params.id,
        parsed.data.status,
        req.userId!,
        {
          reason: req.body.reason as string | undefined,
          annotations: req.body.annotations as Record<string, unknown> | undefined,
        },
        req.dbClient,
      );

      res.json({ success: true, data: issue });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:id/approvals — Get approvals for issue stage ────────────────────
issuesRouter.get(
  '/:id/approvals',
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const stage = req.query.stage as IssueStatus;
      if (!stage) {
        throw new ValidationError('stage query parameter is required');
      }

      const approvals = await issuesService.getApprovals(
        req.tenantId!,
        req.params.id,
        stage,
        req.dbClient,
      );

      res.json({ success: true, data: approvals });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/approvals — Submit approval decision ───────────────────────
issuesRouter.post(
  '/:id/approvals',
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { stage, decision, comments } = req.body;
      if (!stage || !decision) {
        throw new ValidationError('stage and decision are required');
      }

      // Determine actor's relevant role for this approval
      const userRoles: string[] = (req as Record<string, unknown>).userRoles as string[] ?? [];
      const approverRole = stage === 'prd_approval'
        ? (userRoles.includes('ops_lead') ? 'ops_lead' : userRoles.includes('tech_lead') ? 'tech_lead' : userRoles[0])
        : userRoles[0];

      const approval = await issuesService.submitApproval(
        req.tenantId!,
        req.params.id,
        stage,
        req.userId!,
        approverRole,
        decision,
        comments,
        req.dbClient,
      );

      res.json({ success: true, data: approval });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:id/returns — Get return history ─────────────────────────────────
issuesRouter.get(
  '/:id/returns',
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const returns = await issuesService.getReturnHistory(
        req.tenantId!,
        req.params.id,
        req.dbClient,
      );

      res.json({ success: true, data: returns });
    } catch (err) {
      next(err);
    }
  },
);
