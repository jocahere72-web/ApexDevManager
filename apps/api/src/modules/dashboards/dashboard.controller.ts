// ---------------------------------------------------------------------------
// Dashboard & Observability Controller (M17)
// ---------------------------------------------------------------------------

import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import * as dashboardService from './dashboard.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type {
  DashboardOverview,
  Alert,
  Incident,
  IncidentStatus,
} from '@apex-dev-manager/shared-types';

export const dashboardRouter = Router();

// ---------------------------------------------------------------------------
// GET /overview - Main dashboard overview
// ---------------------------------------------------------------------------

dashboardRouter.get(
  '/overview',
  async (req: Request, res: Response<ApiResponse<DashboardOverview>>, next: NextFunction) => {
    try {
      const overview = await dashboardService.getDashboardData(req.tenantId!);
      res.json({ success: true, data: overview });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /alerts - Get active alerts
// ---------------------------------------------------------------------------

dashboardRouter.get(
  '/alerts',
  async (req: Request, res: Response<ApiResponse<Alert[]>>, next: NextFunction) => {
    try {
      const acknowledged = req.query.acknowledged !== undefined
        ? req.query.acknowledged === 'true'
        : undefined;

      const alerts = await dashboardService.getAlerts(req.tenantId!, acknowledged);
      res.json({ success: true, data: alerts });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /incidents - List incidents
// ---------------------------------------------------------------------------

dashboardRouter.get(
  '/incidents',
  async (req: Request, res: Response<ApiResponse<Incident[]>>, next: NextFunction) => {
    try {
      const status = req.query.status as IncidentStatus | undefined;
      const incidents = await dashboardService.getIncidents(req.tenantId!, status);
      res.json({ success: true, data: incidents });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /incidents - Create incident
// ---------------------------------------------------------------------------

dashboardRouter.post(
  '/incidents',
  authorize(['admin', 'tech_lead']),
  async (req: Request, res: Response<ApiResponse<Incident>>, next: NextFunction) => {
    try {
      const { title, description, severity, assignedTo, alertIds } = req.body;

      if (!title || !description || !severity) {
        throw new ValidationError('title, description, and severity are required');
      }

      const incident = await dashboardService.createIncident(
        { title, description, severity, assignedTo, alertIds },
        req.tenantId!,
        req.userId!,
      );

      res.status(201).json({ success: true, data: incident });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /incidents/:id/resolve - Resolve incident
// ---------------------------------------------------------------------------

dashboardRouter.post(
  '/incidents/:id/resolve',
  authorize(['admin', 'tech_lead']),
  async (req: Request, res: Response<ApiResponse<Incident>>, next: NextFunction) => {
    try {
      const { rootCause, resolution } = req.body;

      if (!resolution) {
        throw new ValidationError('resolution is required');
      }

      const incident = await dashboardService.resolveIncident(
        req.params.id,
        { rootCause, resolution },
        req.tenantId!,
        req.userId!,
      );

      res.json({ success: true, data: incident });
    } catch (err) {
      next(err);
    }
  },
);
