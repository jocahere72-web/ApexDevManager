import { Router, type Request, type Response, type NextFunction } from 'express';
import {
  ListAppsParamsSchema,
  ListPagesParamsSchema,
  ListComponentsParamsSchema,
  ListComponentsQuerySchema,
  AppTreeParamsSchema,
  SearchQuerySchema,
  SyncParamsSchema,
} from './explorer.validation.js';
import * as explorerService from './explorer.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type { ApexApplication, ApexPage, ApexComponent, ApexSearchResult } from '../../integrations/mcp/mcp-apex-adapter.js';
import type { ApplicationTree, SyncStatus } from './explorer.service.js';

export const explorerRouter = Router();

// ── GET /apps/:connectionId — List applications ─────────────────────────────
explorerRouter.get(
  '/apps/:connectionId',
  async (req: Request, res: Response<ApiResponse<ApexApplication[]>>, next: NextFunction) => {
    try {
      const parsed = ListAppsParamsSchema.safeParse(req.params);
      if (!parsed.success) {
        throw new ValidationError('Invalid parameters', parsed.error.flatten().fieldErrors);
      }

      const apps = await explorerService.listApplications(
        req.tenantId!,
        parsed.data.connectionId,
        req.dbClient,
      );

      res.json({ success: true, data: apps });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /pages/:connectionId/:appId — List pages ────────────────────────────
explorerRouter.get(
  '/pages/:connectionId/:appId',
  async (req: Request, res: Response<ApiResponse<ApexPage[]>>, next: NextFunction) => {
    try {
      const parsed = ListPagesParamsSchema.safeParse(req.params);
      if (!parsed.success) {
        throw new ValidationError('Invalid parameters', parsed.error.flatten().fieldErrors);
      }

      const pages = await explorerService.listPages(
        req.tenantId!,
        parsed.data.connectionId,
        parsed.data.appId,
        req.dbClient,
      );

      res.json({ success: true, data: pages });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /components/:connectionId/:pageId — List components ─────────────────
explorerRouter.get(
  '/components/:connectionId/:pageId',
  async (req: Request, res: Response<ApiResponse<ApexComponent[]>>, next: NextFunction) => {
    try {
      const paramsParsed = ListComponentsParamsSchema.safeParse(req.params);
      if (!paramsParsed.success) {
        throw new ValidationError('Invalid parameters', paramsParsed.error.flatten().fieldErrors);
      }

      const queryParsed = ListComponentsQuerySchema.safeParse(req.query);
      if (!queryParsed.success) {
        throw new ValidationError('Invalid query parameters', queryParsed.error.flatten().fieldErrors);
      }

      const appId = req.query.appId ? Number(req.query.appId) : undefined;
      const components = await explorerService.listComponents(
        req.tenantId!,
        paramsParsed.data.connectionId,
        paramsParsed.data.pageId,
        queryParsed.data.type,
        appId,
        req.dbClient,
      );

      res.json({ success: true, data: components });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /tree/:connectionId/:appId — Get application tree ───────────────────
explorerRouter.get(
  '/tree/:connectionId/:appId',
  async (req: Request, res: Response<ApiResponse<ApplicationTree>>, next: NextFunction) => {
    try {
      const parsed = AppTreeParamsSchema.safeParse(req.params);
      if (!parsed.success) {
        throw new ValidationError('Invalid parameters', parsed.error.flatten().fieldErrors);
      }

      const tree = await explorerService.getApplicationTree(
        req.tenantId!,
        parsed.data.connectionId,
        parsed.data.appId,
        req.dbClient,
      );

      res.json({ success: true, data: tree });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /search — Search APEX objects ───────────────────────────────────────
explorerRouter.get(
  '/search',
  async (req: Request, res: Response<ApiResponse<{ results: ApexSearchResult[]; total: number }>>, next: NextFunction) => {
    try {
      const parsed = SearchQuerySchema.safeParse(req.query);
      if (!parsed.success) {
        throw new ValidationError('Invalid query parameters', parsed.error.flatten().fieldErrors);
      }

      const { connectionId, term, objectTypes, limit, offset } = parsed.data;

      const searchResult = await explorerService.searchObjects(
        req.tenantId!,
        connectionId,
        term,
        objectTypes,
        limit,
        offset,
        req.dbClient,
      );

      res.json({
        success: true,
        data: searchResult,
        meta: { limit, offset, total: searchResult.total },
      });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /sync/:connectionId — Sync (invalidate + re-fetch) ────────────────
explorerRouter.post(
  '/sync/:connectionId',
  async (req: Request, res: Response<ApiResponse<{ invalidatedKeys: number }>>, next: NextFunction) => {
    try {
      const parsed = SyncParamsSchema.safeParse(req.params);
      if (!parsed.success) {
        throw new ValidationError('Invalid parameters', parsed.error.flatten().fieldErrors);
      }

      const result = await explorerService.syncConnection(
        req.tenantId!,
        parsed.data.connectionId,
        req.dbClient,
      );

      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /sync-status/:connectionId — Get sync status ────────────────────────
explorerRouter.get(
  '/sync-status/:connectionId',
  async (req: Request, res: Response<ApiResponse<SyncStatus>>, next: NextFunction) => {
    try {
      const parsed = SyncParamsSchema.safeParse(req.params);
      if (!parsed.success) {
        throw new ValidationError('Invalid parameters', parsed.error.flatten().fieldErrors);
      }

      const status = await explorerService.getSyncStatus(
        req.tenantId!,
        parsed.data.connectionId,
        req.dbClient,
      );

      res.json({ success: true, data: status });
    } catch (err) {
      next(err);
    }
  },
);
