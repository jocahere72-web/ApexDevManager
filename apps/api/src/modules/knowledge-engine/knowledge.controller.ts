// ---------------------------------------------------------------------------
// Knowledge Engine Controller (M14 Knowledge & Learning)
// ---------------------------------------------------------------------------

import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import * as knowledgeService from './knowledge.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type {
  KnowledgeArticle,
  SearchResult,
  ContextualHelp,
  LearningPath,
} from '@apex-dev-manager/shared-types';

export const knowledgeRouter = Router();

// ---------------------------------------------------------------------------
// GET /search - Search knowledge base
// ---------------------------------------------------------------------------

knowledgeRouter.get(
  '/search',
  async (req: Request, res: Response<ApiResponse<SearchResult[]>>, next: NextFunction) => {
    try {
      const query = req.query.q as string;
      if (!query) {
        throw new ValidationError('Query parameter "q" is required');
      }

      const category = req.query.category as string | undefined;
      const tags = req.query.tags ? (req.query.tags as string).split(',') : undefined;
      const limit = req.query.limit ? parseInt(req.query.limit as string, 10) : undefined;

      const results = await knowledgeService.search(
        { query, category: category as any, tags, limit },
        req.tenantId!,
      );

      res.json({ success: true, data: results });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /ingest - Ingest a document
// ---------------------------------------------------------------------------

knowledgeRouter.post(
  '/ingest',
  authorize(['admin', 'tech_lead']),
  async (req: Request, res: Response<ApiResponse<KnowledgeArticle>>, next: NextFunction) => {
    try {
      const { title, content, category, tags, sourceUrl, version } = req.body;

      if (!title || !content || !category) {
        throw new ValidationError('title, content, and category are required');
      }

      const article = await knowledgeService.ingestDoc(
        { title, content, category, tags, sourceUrl, version },
        req.tenantId!,
      );

      res.status(201).json({ success: true, data: article });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /help/:componentType - Get contextual help
// ---------------------------------------------------------------------------

knowledgeRouter.get(
  '/help/:componentType',
  async (req: Request, res: Response<ApiResponse<ContextualHelp>>, next: NextFunction) => {
    try {
      const help = await knowledgeService.getContextualHelp(
        req.params.componentType,
        req.tenantId!,
      );
      res.json({ success: true, data: help });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /learning-path - Get learning paths for a role
// ---------------------------------------------------------------------------

knowledgeRouter.get(
  '/learning-path',
  async (req: Request, res: Response<ApiResponse<LearningPath[]>>, next: NextFunction) => {
    try {
      const role = req.query.role as string;
      if (!role) {
        throw new ValidationError('Query parameter "role" is required');
      }

      const paths = await knowledgeService.getLearningPath(role, req.tenantId!, req.userId!);
      res.json({ success: true, data: paths });
    } catch (err) {
      next(err);
    }
  },
);
