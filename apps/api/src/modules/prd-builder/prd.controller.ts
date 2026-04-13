import { Router, type Request, type Response, type NextFunction } from 'express';
import {
  CreateSessionSchema,
  UploadSourceSchema,
  UpdateSectionSchema,
  ValidatePRDSchema,
  ExportPRDSchema,
  ListSessionsSchema,
  ExtractRequirementsSchema,
  GenerateSectionsSchema,
} from './prd.validation.js';
import * as prdService from './prd.service.js';
import { prdConfigRouter } from './prd-config.controller.js';
import { ValidationError } from '../../lib/errors.js';
import { checkRateLimit } from '../ai-studio/rate-limiter.js';
import type { ApiResponse, PaginatedResponse } from '../../types/index.js';
import type { PRDSession, PRDSource, PRDSection, ExtractionData, ValidationResult } from '@apex-dev-manager/shared-types';

export const prdRouter = Router();

// Mount config sub-router at /configs
prdRouter.use('/configs', prdConfigRouter);

// ---------------------------------------------------------------------------
// POST /sessions - Create a new PRD session
// ---------------------------------------------------------------------------

prdRouter.post(
  '/sessions',
  async (req: Request, res: Response<ApiResponse<PRDSession>>, next: NextFunction) => {
    try {
      const parsed = CreateSessionSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid session data', parsed.error.flatten().fieldErrors);
      }

      const session = await prdService.createSession(parsed.data, req.userId!, req.tenantId!, req.dbClient);

      res.status(201).json({ success: true, data: session });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /sessions - List PRD sessions
// ---------------------------------------------------------------------------

prdRouter.get(
  '/sessions',
  async (req: Request, res: Response<PaginatedResponse<PRDSession>>, next: NextFunction) => {
    try {
      const parsed = ListSessionsSchema.safeParse(req.query);
      if (!parsed.success) {
        throw new ValidationError('Invalid query parameters', parsed.error.flatten().fieldErrors);
      }

      const { page, limit, status, appId } = parsed.data;
      const { sessions, total } = await prdService.listSessions(
        req.tenantId!,
        page,
        limit,
        status,
        appId,
        req.dbClient,
      );
      const totalPages = Math.ceil(total / limit);

      res.json({
        success: true,
        data: sessions,
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
// GET /sessions/:id - Get a PRD session with sources and sections
// ---------------------------------------------------------------------------

prdRouter.get(
  '/sessions/:id',
  async (req: Request, res: Response<ApiResponse<PRDSession>>, next: NextFunction) => {
    try {
      const session = await prdService.getSession(req.params.id, req.tenantId!, req.dbClient);

      res.json({ success: true, data: session });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /sessions/:id/sources - Upload a source document
// ---------------------------------------------------------------------------

prdRouter.post(
  '/sessions/:id/sources',
  async (req: Request, res: Response<ApiResponse<PRDSource>>, next: NextFunction) => {
    try {
      const parsed = UploadSourceSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid source data', parsed.error.flatten().fieldErrors);
      }

      const source = await prdService.uploadSource(req.params.id, parsed.data, req.tenantId!, req.dbClient);

      res.status(201).json({ success: true, data: source });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /sessions/:id/extract - Extract requirements from sources
// ---------------------------------------------------------------------------

prdRouter.post(
  '/sessions/:id/extract',
  async (req: Request, res: Response<ApiResponse<ExtractionData>>, next: NextFunction) => {
    try {
      const parsed = ExtractRequirementsSchema.safeParse(req.body ?? {});
      if (!parsed.success) {
        throw new ValidationError('Invalid extraction options', parsed.error.flatten().fieldErrors);
      }

      await checkRateLimit(req.tenantId!, req.userId!, req.dbClient);

      const extraction = await prdService.extractRequirements(
        req.params.id,
        parsed.data,
        req.tenantId!,
        req.dbClient,
      );

      res.json({ success: true, data: extraction });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /sessions/:id/generate - Generate PRD sections
// ---------------------------------------------------------------------------

prdRouter.post(
  '/sessions/:id/generate',
  async (req: Request, res: Response<ApiResponse<PRDSection[]>>, next: NextFunction) => {
    try {
      const parsed = GenerateSectionsSchema.safeParse(req.body ?? {});
      if (!parsed.success) {
        throw new ValidationError('Invalid generation options', parsed.error.flatten().fieldErrors);
      }

      await checkRateLimit(req.tenantId!, req.userId!, req.dbClient);

      const sections = await prdService.generateSections(
        req.params.id,
        parsed.data,
        req.tenantId!,
        req.dbClient,
      );

      res.json({ success: true, data: sections });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /sessions/:id/validate - Validate the PRD
// ---------------------------------------------------------------------------

prdRouter.post(
  '/sessions/:id/validate',
  async (req: Request, res: Response<ApiResponse<ValidationResult>>, next: NextFunction) => {
    try {
      const parsed = ValidatePRDSchema.safeParse(req.body ?? {});
      if (!parsed.success) {
        throw new ValidationError('Invalid validation options', parsed.error.flatten().fieldErrors);
      }

      await checkRateLimit(req.tenantId!, req.userId!, req.dbClient);

      const result = await prdService.validatePRD(req.params.id, parsed.data, req.tenantId!, req.dbClient);

      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /sessions/:id/export - Export the PRD
// ---------------------------------------------------------------------------

prdRouter.post(
  '/sessions/:id/export',
  async (req: Request, res: Response<ApiResponse<{ content: string; format: string; filename: string }>>, next: NextFunction) => {
    try {
      const parsed = ExportPRDSchema.safeParse(req.body ?? {});
      if (!parsed.success) {
        throw new ValidationError('Invalid export options', parsed.error.flatten().fieldErrors);
      }

      const result = await prdService.exportPRD(req.params.id, parsed.data, req.tenantId!, req.dbClient);

      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// PUT /sections/:id - Update a PRD section
// ---------------------------------------------------------------------------

prdRouter.put(
  '/sections/:id',
  async (req: Request, res: Response<ApiResponse<PRDSection>>, next: NextFunction) => {
    try {
      const parsed = UpdateSectionSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid section data', parsed.error.flatten().fieldErrors);
      }

      const section = await prdService.updateSection(req.params.id, parsed.data, req.tenantId!, req.dbClient);

      res.json({ success: true, data: section });
    } catch (err) {
      next(err);
    }
  },
);
