// ---------------------------------------------------------------------------
// Marketplace Controller (M18 Component Marketplace)
// ---------------------------------------------------------------------------

import { Router, type Request, type Response, type NextFunction } from 'express';
import * as marketplaceService from './marketplace.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse, PaginatedResponse } from '../../types/index.js';
import type {
  MarketplaceItem,
  ItemRating,
  MarketplaceDownload,
  MarketplaceInstall,
} from '@apex-dev-manager/shared-types';

export const marketplaceRouter = Router();

// ---------------------------------------------------------------------------
// GET /items - List / search marketplace items
// ---------------------------------------------------------------------------

marketplaceRouter.get(
  '/items',
  async (req: Request, res: Response<PaginatedResponse<MarketplaceItem>>, next: NextFunction) => {
    try {
      const query = req.query.q as string | undefined;
      const category = req.query.category as string | undefined;
      const minRating = req.query.minRating ? parseFloat(req.query.minRating as string) : undefined;
      const maxPrice = req.query.maxPrice ? parseFloat(req.query.maxPrice as string) : undefined;
      const sortBy = req.query.sortBy as string | undefined;
      const page = req.query.page ? parseInt(req.query.page as string, 10) : 1;
      const limit = req.query.limit ? parseInt(req.query.limit as string, 10) : 20;

      const { items, total } = await marketplaceService.listItems({
        query, category: category as any, minRating, maxPrice, sortBy: sortBy as any, page, limit,
      });

      const totalPages = Math.ceil(total / limit);

      res.json({
        success: true,
        data: items,
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
// GET /items/:id - Get item details
// ---------------------------------------------------------------------------

marketplaceRouter.get(
  '/items/:id',
  async (req: Request, res: Response<ApiResponse<MarketplaceItem>>, next: NextFunction) => {
    try {
      const item = await marketplaceService.getItem(req.params.id);
      res.json({ success: true, data: item });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /publish - Publish an item
// ---------------------------------------------------------------------------

marketplaceRouter.post(
  '/publish',
  async (req: Request, res: Response<ApiResponse<MarketplaceItem>>, next: NextFunction) => {
    try {
      const { name, description, longDescription, category, tags, version, price, content, screenshots, repositoryUrl, documentationUrl, compatibleVersions } = req.body;

      if (!name || !description || !category || !version || !content) {
        throw new ValidationError('name, description, category, version, and content are required');
      }

      const item = await marketplaceService.publishItem(
        { name, description, longDescription, category, tags, version, price: price ?? 0, content, screenshots, repositoryUrl, documentationUrl, compatibleVersions },
        req.tenantId!,
        req.userId!,
        (req as any).userName ?? 'Unknown',
      );

      res.status(201).json({ success: true, data: item });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /items/:id/download - Download an item
// ---------------------------------------------------------------------------

marketplaceRouter.post(
  '/items/:id/download',
  async (req: Request, res: Response<ApiResponse<MarketplaceDownload>>, next: NextFunction) => {
    try {
      const download = await marketplaceService.downloadItem(req.params.id, req.tenantId!);
      res.json({ success: true, data: download });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /items/:id/rate - Rate an item
// ---------------------------------------------------------------------------

marketplaceRouter.post(
  '/items/:id/rate',
  async (req: Request, res: Response<ApiResponse<ItemRating>>, next: NextFunction) => {
    try {
      const { rating, review } = req.body;

      if (rating === undefined) {
        throw new ValidationError('rating is required');
      }

      const result = await marketplaceService.rateItem(
        req.params.id,
        { rating, review },
        req.userId!,
        (req as any).userName ?? 'Unknown',
      );

      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /my-items - Get my published items
// ---------------------------------------------------------------------------

marketplaceRouter.get(
  '/my-items',
  async (req: Request, res: Response<ApiResponse<MarketplaceItem[]>>, next: NextFunction) => {
    try {
      const items = await marketplaceService.getMyPublished(req.tenantId!, req.userId!);
      res.json({ success: true, data: items });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /items/:id/install - Install an item
// ---------------------------------------------------------------------------

marketplaceRouter.post(
  '/items/:id/install',
  async (req: Request, res: Response<ApiResponse<MarketplaceInstall>>, next: NextFunction) => {
    try {
      const { connectionId } = req.body;

      if (!connectionId) {
        throw new ValidationError('connectionId is required');
      }

      const result = await marketplaceService.installItem(req.params.id, req.tenantId!, connectionId);
      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);
