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
        req.dbClient,
      );

      res.json({ success: true, data: issue });
    } catch (err) {
      next(err);
    }
  },
);
