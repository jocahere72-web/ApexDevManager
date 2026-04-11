import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import {
  CreateConnectionSchema,
  UpdateConnectionSchema,
  ListConnectionsQuerySchema,
  TestConnectionSchema,
} from './connections.validation.js';
import * as connectionsService from './connections.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse, PaginatedResponse } from '../../types/index.js';
import type { ConnectionProfile, ConnectionHealth } from './connections.service.js';
import type { TestResult } from './connections.validation.js';

export const connectionsRouter = Router();

// ── POST / — Create connection ───────────────────────────────────────────────
connectionsRouter.post(
  '/',
  authorize(['admin', 'developer', 'tech_lead', 'devops_engineer']),
  async (req: Request, res: Response<ApiResponse<ConnectionProfile>>, next: NextFunction) => {
    try {
      const parsed = CreateConnectionSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid connection data', parsed.error.flatten().fieldErrors);
      }

      const connection = await connectionsService.createConnection(
        req.tenantId!,
        parsed.data,
        req.userId!,
      );

      res.status(201).json({ success: true, data: connection });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET / — List connections (authenticated) ─────────────────────────────────
connectionsRouter.get(
  '/',
  async (req: Request, res: Response<PaginatedResponse<ConnectionProfile>>, next: NextFunction) => {
    try {
      const parsed = ListConnectionsQuerySchema.safeParse(req.query);
      if (!parsed.success) {
        throw new ValidationError('Invalid query parameters', parsed.error.flatten().fieldErrors);
      }

      const { connections, total } = await connectionsService.listConnections(
        req.tenantId!,
        parsed.data,
      );
      const { page, limit } = parsed.data;
      const totalPages = Math.ceil(total / limit);

      res.json({
        success: true,
        data: connections,
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

// ── GET /:id — Get connection by ID (authenticated) ─────────────────────────
connectionsRouter.get(
  '/:id',
  async (req: Request, res: Response<ApiResponse<ConnectionProfile>>, next: NextFunction) => {
    try {
      const connection = await connectionsService.getConnectionById(
        req.tenantId!,
        req.params.id,
      );

      res.json({ success: true, data: connection });
    } catch (err) {
      next(err);
    }
  },
);

// ── PATCH /:id — Update connection ───────────────────────────────────────────
connectionsRouter.patch(
  '/:id',
  authorize(['admin', 'tech_lead', 'devops_engineer']),
  async (req: Request, res: Response<ApiResponse<ConnectionProfile>>, next: NextFunction) => {
    try {
      const parsed = UpdateConnectionSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid update data', parsed.error.flatten().fieldErrors);
      }

      const connection = await connectionsService.updateConnection(
        req.tenantId!,
        req.params.id,
        parsed.data,
        req.userId!,
      );

      res.json({ success: true, data: connection });
    } catch (err) {
      next(err);
    }
  },
);

// ── DELETE /:id — Soft delete connection ─────────────────────────────────────
connectionsRouter.delete(
  '/:id',
  authorize(['admin', 'devops_engineer']),
  async (req: Request, res: Response<ApiResponse>, next: NextFunction) => {
    try {
      await connectionsService.softDeleteConnection(
        req.tenantId!,
        req.params.id,
        req.userId!,
      );

      res.json({ success: true, data: { message: 'Connection deleted successfully' } });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/test — Test connection ─────────────────────────────────────────
connectionsRouter.post(
  '/:id/test',
  authorize(['admin', 'developer', 'tech_lead', 'qa_analyst', 'devops_engineer']),
  async (req: Request, res: Response<ApiResponse<TestResult>>, next: NextFunction) => {
    try {
      const parsed = TestConnectionSchema.safeParse({ id: req.params.id });
      if (!parsed.success) {
        throw new ValidationError('Invalid connection ID', parsed.error.flatten().fieldErrors);
      }

      const result = await connectionsService.testConnection(req.tenantId!, parsed.data.id);

      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:id/health — Get connection health (authenticated) ──────────────────
connectionsRouter.get(
  '/:id/health',
  async (req: Request, res: Response<ApiResponse<ConnectionHealth>>, next: NextFunction) => {
    try {
      const health = await connectionsService.getHealthStatus(req.tenantId!, req.params.id);

      res.json({ success: true, data: health });
    } catch (err) {
      next(err);
    }
  },
);
