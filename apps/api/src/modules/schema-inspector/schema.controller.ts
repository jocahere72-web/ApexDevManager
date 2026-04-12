import { Router, type Request, type Response, type NextFunction } from 'express';
import * as schemaService from './schema.service.js';
import type { ApiResponse } from '../../types/index.js';
import type {
  SchemaSnapshot,
  SchemaTable,
  DDLScript,
  SchemaDiff,
} from '@apex-dev-manager/shared-types';

export const schemaInspectorRouter = Router();

// ── GET /schema/:connectionId ── Full schema ────────────────────────────────
schemaInspectorRouter.get(
  '/schema/:connectionId',
  async (req: Request, res: Response<ApiResponse<{ tables: SchemaTable[]; views: SchemaTable[] }>>, next: NextFunction) => {
    try {
      const schema = await schemaService.getSchema(req.tenantId!, req.params.connectionId);
      res.json({ success: true, data: schema });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /tables/:connectionId/:tableName ── Single table detail ─────────────
schemaInspectorRouter.get(
  '/tables/:connectionId/:tableName',
  async (req: Request, res: Response<ApiResponse<SchemaTable>>, next: NextFunction) => {
    try {
      const table = await schemaService.getTable(
        req.tenantId!,
        req.params.connectionId,
        req.params.tableName,
      );
      res.json({ success: true, data: table });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /ddl/:connectionId/:tableName ── Table DDL ──────────────────────────
schemaInspectorRouter.get(
  '/ddl/:connectionId/:tableName',
  async (req: Request, res: Response<ApiResponse<DDLScript>>, next: NextFunction) => {
    try {
      const ddl = await schemaService.getTableDDL(
        req.tenantId!,
        req.params.connectionId,
        req.params.tableName,
      );
      res.json({ success: true, data: ddl });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /compare ── Compare two snapshots ──────────────────────────────────
schemaInspectorRouter.post(
  '/compare',
  async (req: Request, res: Response<ApiResponse<SchemaDiff>>, next: NextFunction) => {
    try {
      const { snapshotIdA, snapshotIdB } = req.body;
      const diff = await schemaService.compareSchemas(req.tenantId!, snapshotIdA, snapshotIdB, req.dbClient);
      res.json({ success: true, data: diff });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /snapshot ── Create snapshot ────────────────────────────────────────
schemaInspectorRouter.post(
  '/snapshot',
  async (req: Request, res: Response<ApiResponse<SchemaSnapshot>>, next: NextFunction) => {
    try {
      const { connectionId } = req.body;
      const snapshot = await schemaService.createSnapshot(req.tenantId!, connectionId, req.userId!, req.dbClient);
      res.status(201).json({ success: true, data: snapshot });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /snapshots ── List snapshots ────────────────────────────────────────
schemaInspectorRouter.get(
  '/snapshots',
  async (req: Request, res: Response<ApiResponse<{ items: SchemaSnapshot[]; total: number }>>, next: NextFunction) => {
    try {
      const { connectionId, limit, offset } = req.query;
      const result = await schemaService.listSnapshots(
        req.tenantId!,
        connectionId as string | undefined,
        limit ? parseInt(limit as string, 10) : undefined,
        offset ? parseInt(offset as string, 10) : undefined,
        req.dbClient,
      );
      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /erd/:connectionId ── Generate ERD ──────────────────────────────────
schemaInspectorRouter.get(
  '/erd/:connectionId',
  async (req: Request, res: Response<ApiResponse<{ erd: string }>>, next: NextFunction) => {
    try {
      const erd = await schemaService.generateERD(req.tenantId!, req.params.connectionId);
      res.json({ success: true, data: { erd } });
    } catch (err) {
      next(err);
    }
  },
);
