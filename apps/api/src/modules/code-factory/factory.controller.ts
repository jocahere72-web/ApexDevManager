// ---------------------------------------------------------------------------
// Code Factory Controller (M16 AI Code Generation)
// ---------------------------------------------------------------------------

import { Router, type Request, type Response, type NextFunction } from 'express';
import * as factoryService from './factory.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type { FactoryJob, FactoryTemplate } from '@apex-dev-manager/shared-types';

export const factoryRouter = Router();

// ---------------------------------------------------------------------------
// POST /generate - Generate code from spec
// ---------------------------------------------------------------------------

factoryRouter.post(
  '/generate',
  async (req: Request, res: Response<ApiResponse<FactoryJob>>, next: NextFunction) => {
    try {
      const { spec } = req.body;

      if (!spec?.name || !spec?.componentType || !spec?.requirements || !spec?.connectionId) {
        throw new ValidationError('spec with name, componentType, requirements, and connectionId is required');
      }

      const job = await factoryService.generateFromSpec(spec, req.tenantId!, req.userId!);
      res.status(201).json({ success: true, data: job });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /batch - Generate multiple components
// ---------------------------------------------------------------------------

factoryRouter.post(
  '/batch',
  async (req: Request, res: Response<ApiResponse<FactoryJob[]>>, next: NextFunction) => {
    try {
      const { specs, connectionId } = req.body;

      if (!specs?.length || !connectionId) {
        throw new ValidationError('specs array and connectionId are required');
      }

      const jobs = await factoryService.generateBatch(specs, connectionId, req.tenantId!, req.userId!);
      res.status(201).json({ success: true, data: jobs });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /templates - List templates
// ---------------------------------------------------------------------------

factoryRouter.get(
  '/templates',
  async (req: Request, res: Response<ApiResponse<FactoryTemplate[]>>, next: NextFunction) => {
    try {
      const componentType = req.query.componentType as string | undefined;
      const templates = await factoryService.getTemplates(req.tenantId!, componentType as any);
      res.json({ success: true, data: templates });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /templates - Create template
// ---------------------------------------------------------------------------

factoryRouter.post(
  '/templates',
  async (req: Request, res: Response<ApiResponse<FactoryTemplate>>, next: NextFunction) => {
    try {
      const { name, description, componentType, templateContent, variables, tags } = req.body;

      if (!name || !description || !componentType || !templateContent) {
        throw new ValidationError('name, description, componentType, and templateContent are required');
      }

      const template = await factoryService.createTemplate(
        { name, description, componentType, templateContent, variables, tags },
        req.tenantId!,
        req.userId!,
      );

      res.status(201).json({ success: true, data: template });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// DELETE /templates/:id - Delete template
// ---------------------------------------------------------------------------

factoryRouter.delete(
  '/templates/:id',
  async (req: Request, res: Response<ApiResponse>, next: NextFunction) => {
    try {
      await factoryService.deleteTemplate(req.params.id, req.tenantId!);
      res.json({ success: true, data: { message: 'Template deleted successfully' } });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /jobs - List generation jobs
// ---------------------------------------------------------------------------

factoryRouter.get(
  '/jobs',
  async (req: Request, res: Response<ApiResponse<FactoryJob[]>>, next: NextFunction) => {
    try {
      const status = req.query.status as string | undefined;
      const jobs = await factoryService.listJobs(req.tenantId!, status as any);
      res.json({ success: true, data: jobs });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /jobs/:id - Get job details
// ---------------------------------------------------------------------------

factoryRouter.get(
  '/jobs/:id',
  async (req: Request, res: Response<ApiResponse<FactoryJob>>, next: NextFunction) => {
    try {
      const job = await factoryService.getJob(req.params.id, req.tenantId!);
      res.json({ success: true, data: job });
    } catch (err) {
      next(err);
    }
  },
);
