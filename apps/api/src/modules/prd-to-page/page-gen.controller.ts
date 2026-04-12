import { Router, type Request, type Response, type NextFunction } from 'express';
import { z } from 'zod';
import * as pageGenService from './page-gen.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse, PaginatedResponse } from '../../types/index.js';
import type { PageGenerationJob } from '@apex-dev-manager/shared-types';

export const pageGenRouter = Router();

// ---------------------------------------------------------------------------
// Validation Schemas
// ---------------------------------------------------------------------------

const GeneratePageSchema = z.object({
  prdSessionId: z.string().uuid().optional(),
  connectionId: z.string().uuid().optional(),
  appId: z.coerce.number().int().positive().optional(),
  inputType: z.enum(['prd_section', 'freeform', 'requirements'], {
    required_error: 'Input type is required',
  }),
  inputContent: z
    .string({ required_error: 'Input content is required' })
    .min(1, 'Input content cannot be empty')
    .max(500_000, 'Input content too long'),
});

const ListJobsSchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  status: z
    .enum(['pending', 'generating', 'preview', 'applying', 'applied', 'error'])
    .optional(),
});

// ---------------------------------------------------------------------------
// POST /generate - Generate an APEX page from input
// ---------------------------------------------------------------------------

pageGenRouter.post(
  '/generate',
  async (req: Request, res: Response<ApiResponse<PageGenerationJob>>, next: NextFunction) => {
    try {
      const parsed = GeneratePageSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid generation request', parsed.error.flatten().fieldErrors);
      }

      const job = await pageGenService.generatePage(parsed.data, req.userId!, req.tenantId!, req.dbClient);

      res.status(201).json({ success: true, data: job });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /jobs - List page generation jobs
// ---------------------------------------------------------------------------

pageGenRouter.get(
  '/jobs',
  async (req: Request, res: Response<PaginatedResponse<PageGenerationJob>>, next: NextFunction) => {
    try {
      const parsed = ListJobsSchema.safeParse(req.query);
      if (!parsed.success) {
        throw new ValidationError('Invalid query parameters', parsed.error.flatten().fieldErrors);
      }

      const { page, limit, status } = parsed.data;
      const { jobs, total } = await pageGenService.listJobs(req.tenantId!, page, limit, status, req.dbClient);
      const totalPages = Math.ceil(total / limit);

      res.json({
        success: true,
        data: jobs,
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

// ---------------------------------------------------------------------------
// GET /jobs/:id - Get a page generation job
// ---------------------------------------------------------------------------

pageGenRouter.get(
  '/jobs/:id',
  async (req: Request, res: Response<ApiResponse<PageGenerationJob>>, next: NextFunction) => {
    try {
      const job = await pageGenService.getJob(req.params.id, req.tenantId!, req.dbClient);

      res.json({ success: true, data: job });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /jobs/:id/apply - Apply the generated page to APEX
// ---------------------------------------------------------------------------

pageGenRouter.post(
  '/jobs/:id/apply',
  async (req: Request, res: Response<ApiResponse<PageGenerationJob>>, next: NextFunction) => {
    try {
      const job = await pageGenService.applyPage(req.params.id, req.tenantId!, req.userId!, req.dbClient);

      res.json({ success: true, data: job });
    } catch (err) {
      next(err);
    }
  },
);
