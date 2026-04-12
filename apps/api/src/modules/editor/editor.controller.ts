import { Router, type Request, type Response, type NextFunction } from 'express';
import {
  SourceParamsSchema,
  OpenSessionSchema,
  SessionIdParamSchema,
  SaveDraftSchema,
  ApplyCodeSchema,
  FormatCodeSchema,
  ListChangeLogSchema,
} from './editor.validation.js';
import * as editorService from './editor.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type {
  ComponentSource,
  EditorSession,
  ChangeLogEntry,
  FormatResponse,
} from '@apex-dev-manager/shared-types';

export const editorRouter = Router();

// ── GET /source/:connectionId/:componentType/:componentId ─────────────────
editorRouter.get(
  '/source/:connectionId/:componentType/:componentId',
  async (req: Request, res: Response<ApiResponse<ComponentSource>>, next: NextFunction) => {
    try {
      const parsed = SourceParamsSchema.safeParse(req.params);
      if (!parsed.success) {
        throw new ValidationError('Invalid parameters', parsed.error.flatten().fieldErrors);
      }

      const source = await editorService.getComponentSource(
        req.tenantId!,
        parsed.data.connectionId,
        parsed.data.componentType,
        parsed.data.componentId,
        req.dbClient,
      );

      res.json({ success: true, data: source });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /session/open ────────────────────────────────────────────────────
editorRouter.post(
  '/session/open',
  async (req: Request, res: Response<ApiResponse<EditorSession>>, next: NextFunction) => {
    try {
      const parsed = OpenSessionSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid request body', parsed.error.flatten().fieldErrors);
      }

      const session = await editorService.openSession(
        req.tenantId!,
        req.userId!,
        parsed.data.connectionId,
        parsed.data.componentType,
        parsed.data.componentId,
        parsed.data.mode,
        req.dbClient,
      );

      res.status(201).json({ success: true, data: session });
    } catch (err) {
      next(err);
    }
  },
);

// ── PUT /session/:id/draft ────────────────────────────────────────────────
editorRouter.put(
  '/session/:id/draft',
  async (req: Request, res: Response<ApiResponse<EditorSession>>, next: NextFunction) => {
    try {
      const paramsParsed = SessionIdParamSchema.safeParse(req.params);
      if (!paramsParsed.success) {
        throw new ValidationError('Invalid parameters', paramsParsed.error.flatten().fieldErrors);
      }

      const bodyParsed = SaveDraftSchema.safeParse(req.body);
      if (!bodyParsed.success) {
        throw new ValidationError('Invalid request body', bodyParsed.error.flatten().fieldErrors);
      }

      const session = await editorService.saveDraft(
        req.tenantId!,
        paramsParsed.data.id,
        bodyParsed.data.draftContent,
        bodyParsed.data.cursorLine,
        bodyParsed.data.cursorColumn,
        req.dbClient,
      );

      res.json({ success: true, data: session });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /session/:id/apply ───────────────────────────────────────────────
editorRouter.post(
  '/session/:id/apply',
  async (req: Request, res: Response<ApiResponse<{ changeLogId: string; appliedAt: string }>>, next: NextFunction) => {
    try {
      const paramsParsed = SessionIdParamSchema.safeParse(req.params);
      if (!paramsParsed.success) {
        throw new ValidationError('Invalid parameters', paramsParsed.error.flatten().fieldErrors);
      }

      const bodyParsed = ApplyCodeSchema.safeParse(req.body);
      if (!bodyParsed.success) {
        throw new ValidationError('Invalid request body', bodyParsed.error.flatten().fieldErrors);
      }

      const result = await editorService.applyCode(
        req.tenantId!,
        req.userId!,
        paramsParsed.data.id,
        bodyParsed.data.code,
        bodyParsed.data.componentName,
        bodyParsed.data.appId,
        bodyParsed.data.pageId,
        bodyParsed.data.source,
        bodyParsed.data.aiRequestId,
        req.dbClient,
      );

      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ── DELETE /session/:id ───────────────────────────────────────────────────
editorRouter.delete(
  '/session/:id',
  async (req: Request, res: Response<ApiResponse<{ released: boolean }>>, next: NextFunction) => {
    try {
      const parsed = SessionIdParamSchema.safeParse(req.params);
      if (!parsed.success) {
        throw new ValidationError('Invalid parameters', parsed.error.flatten().fieldErrors);
      }

      await editorService.releaseLock(req.tenantId!, parsed.data.id, req.dbClient);

      res.json({ success: true, data: { released: true } });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /format ──────────────────────────────────────────────────────────
editorRouter.post(
  '/format',
  async (req: Request, res: Response<ApiResponse<FormatResponse>>, next: NextFunction) => {
    try {
      const parsed = FormatCodeSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid request body', parsed.error.flatten().fieldErrors);
      }

      const result = await editorService.formatCode(
        parsed.data.source,
        parsed.data.language,
      );

      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /changelog/:connectionId/:componentType/:componentId ──────────────
editorRouter.get(
  '/changelog/:connectionId/:componentType/:componentId',
  async (
    req: Request,
    res: Response<ApiResponse<{ entries: ChangeLogEntry[]; total: number }>>,
    next: NextFunction,
  ) => {
    try {
      const parsed = ListChangeLogSchema.safeParse({
        ...req.params,
        ...req.query,
      });
      if (!parsed.success) {
        throw new ValidationError('Invalid parameters', parsed.error.flatten().fieldErrors);
      }

      const result = await editorService.getChangeLog(
        req.tenantId!,
        parsed.data.connectionId,
        parsed.data.componentType,
        parsed.data.componentId,
        parsed.data.limit,
        parsed.data.offset,
        req.dbClient,
      );

      res.json({
        success: true,
        data: result,
        meta: {
          limit: parsed.data.limit,
          offset: parsed.data.offset,
          total: result.total,
        },
      });
    } catch (err) {
      next(err);
    }
  },
);
