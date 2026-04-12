import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import { CreateClientSchema, UpdateClientSchema, ListClientsSchema } from './clients.validation.js';
import * as clientsService from './clients.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse, PaginatedResponse } from '../../types/index.js';
import type { ClientRow } from './clients.service.js';

export const clientsRouter = Router();

// ── POST / — Create client ──────────────────────────────────────────────────
clientsRouter.post(
  '/',
  authorize(['admin', 'tech_lead']),
  async (req: Request, res: Response<ApiResponse<ClientRow>>, next: NextFunction) => {
    try {
      const parsed = CreateClientSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid client data', parsed.error.flatten().fieldErrors);
      }

      const client = await clientsService.createClient(
        req.tenantId!,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.status(201).json({ success: true, data: client });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET / — List clients ────────────────────────────────────────────────────
clientsRouter.get(
  '/',
  async (req: Request, res: Response<PaginatedResponse<ClientRow>>, next: NextFunction) => {
    try {
      const parsed = ListClientsSchema.safeParse(req.query);
      if (!parsed.success) {
        throw new ValidationError('Invalid query parameters', parsed.error.flatten().fieldErrors);
      }

      const { clients, total } = await clientsService.listClients(
        req.tenantId!,
        parsed.data,
        req.dbClient,
      );
      const { page, limit } = parsed.data;
      const totalPages = Math.ceil(total / limit);

      res.json({
        success: true,
        data: clients,
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

// ── GET /:id — Get client by ID ─────────────────────────────────────────────
clientsRouter.get(
  '/:id',
  async (req: Request, res: Response<ApiResponse<ClientRow>>, next: NextFunction) => {
    try {
      const client = await clientsService.getClientById(
        req.tenantId!,
        req.params.id,
        req.dbClient,
      );

      res.json({ success: true, data: client });
    } catch (err) {
      next(err);
    }
  },
);

// ── PATCH /:id — Update client ──────────────────────────────────────────────
clientsRouter.patch(
  '/:id',
  authorize(['admin', 'tech_lead']),
  async (req: Request, res: Response<ApiResponse<ClientRow>>, next: NextFunction) => {
    try {
      const parsed = UpdateClientSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid update data', parsed.error.flatten().fieldErrors);
      }

      const client = await clientsService.updateClient(
        req.tenantId!,
        req.params.id,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: client });
    } catch (err) {
      next(err);
    }
  },
);

// ── DELETE /:id — Soft delete client ────────────────────────────────────────
clientsRouter.delete(
  '/:id',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse>, next: NextFunction) => {
    try {
      await clientsService.deleteClient(
        req.tenantId!,
        req.params.id,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: { message: 'Client deleted successfully' } });
    } catch (err) {
      next(err);
    }
  },
);
