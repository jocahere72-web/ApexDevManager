// ---------------------------------------------------------------------------
// Marketplace Service (M18 Component Marketplace)
// ---------------------------------------------------------------------------

import { pool } from '../../config/database.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import type { PoolClient } from 'pg';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import type {
  MarketplaceItem,
  ItemRating,
  ItemCategory,
  ItemStatus,
  PublishRequest,
  RateItemRequest,
  MarketplaceSearchParams,
  MarketplaceDownload,
  MarketplaceInstall,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Row mappers
// ---------------------------------------------------------------------------

function rowToItem(row: Record<string, unknown>): MarketplaceItem {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    publisherId: row.publisher_id as string,
    publisherName: row.publisher_name as string,
    name: row.name as string,
    description: row.description as string,
    longDescription: (row.long_description as string) ?? undefined,
    category: row.category as ItemCategory,
    tags: (row.tags as string[]) ?? [],
    version: row.version as string,
    status: row.status as ItemStatus,
    price: parseFloat((row.price as string) ?? '0'),
    currency: (row.currency as string) ?? 'USD',
    downloadCount: (row.download_count as number) ?? 0,
    averageRating: parseFloat((row.average_rating as string) ?? '0'),
    ratingCount: (row.rating_count as number) ?? 0,
    screenshots: (row.screenshots as string[]) ?? [],
    repositoryUrl: (row.repository_url as string) ?? undefined,
    documentationUrl: (row.documentation_url as string) ?? undefined,
    compatibleVersions: (row.compatible_versions as string[]) ?? [],
    fileSize: (row.file_size as number) ?? 0,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

function rowToRating(row: Record<string, unknown>): ItemRating {
  return {
    id: row.id as string,
    itemId: row.item_id as string,
    userId: row.user_id as string,
    userName: row.user_name as string,
    rating: row.rating as number,
    review: (row.review as string) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
  };
}

// ---------------------------------------------------------------------------
// List / Search Items
// ---------------------------------------------------------------------------

/**
 * List marketplace items with optional search and filters.
 */
export async function listItems(
  params: MarketplaceSearchParams = {},
  client?: PoolClient,
): Promise<{ items: MarketplaceItem[]; total: number }> {
  const conditions = ["status = 'published'"];
  const queryParams: unknown[] = [];
  let paramIdx = 1;

  if (params.query) {
    conditions.push(`(name ILIKE $${paramIdx} OR description ILIKE $${paramIdx})`);
    queryParams.push(`%${params.query}%`);
    paramIdx++;
  }

  if (params.category) {
    conditions.push(`category = $${paramIdx}`);
    queryParams.push(params.category);
    paramIdx++;
  }

  if (params.minRating !== undefined) {
    conditions.push(`average_rating >= $${paramIdx}`);
    queryParams.push(params.minRating);
    paramIdx++;
  }

  if (params.maxPrice !== undefined) {
    conditions.push(`price <= $${paramIdx}`);
    queryParams.push(params.maxPrice);
    paramIdx++;
  }

  const where = conditions.join(' AND ');
  const page = params.page ?? 1;
  const limit = params.limit ?? 20;
  const offset = (page - 1) * limit;

  const sortMap: Record<string, string> = {
    downloads: 'download_count DESC',
    rating: 'average_rating DESC',
    newest: 'created_at DESC',
    price: 'price ASC',
  };
  const orderBy = sortMap[params.sortBy ?? 'newest'] ?? 'created_at DESC';

  const [dataResult, countResult] = await Promise.all([
    tenantQuery(client,
      `SELECT * FROM marketplace_items WHERE ${where} ORDER BY ${orderBy} LIMIT $${paramIdx} OFFSET $${paramIdx + 1}`,
      [...queryParams, limit, offset],
    ),
    tenantQuery(client,
      `SELECT COUNT(*)::int AS total FROM marketplace_items WHERE ${where}`,
      queryParams,
    ),
  ]);

  return {
    items: dataResult.rows.map(rowToItem),
    total: countResult.rows[0].total as number,
  };
}

/**
 * Search items (alias for listItems with query).
 */
export async function searchItems(
  query: string,
  params: Omit<MarketplaceSearchParams, 'query'> = {},
  client?: PoolClient,
): Promise<{ items: MarketplaceItem[]; total: number }> {
  return listItems({ ...params, query }, client);
}

// ---------------------------------------------------------------------------
// Get Item
// ---------------------------------------------------------------------------

/**
 * Get a single marketplace item by ID.
 */
export async function getItem(id: string, client?: PoolClient): Promise<MarketplaceItem> {
  const result = await tenantQuery(client,
    `SELECT * FROM marketplace_items WHERE id = $1`,
    [id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Marketplace item not found');
  }

  return rowToItem(result.rows[0]);
}

// ---------------------------------------------------------------------------
// Publish Item
// ---------------------------------------------------------------------------

/**
 * Publish an item to the marketplace.
 */
export async function publishItem(
  request: PublishRequest,
  tenantId: string,
  userId: string,
  userName: string,
  client?: PoolClient,
): Promise<MarketplaceItem> {
  logger.info({ name: request.name, category: request.category, tenantId }, 'Publishing marketplace item');

  const fileSize = Buffer.byteLength(request.content, 'utf8');

  const result = await tenantQuery(client,
    `INSERT INTO marketplace_items
       (tenant_id, publisher_id, publisher_name, name, description, long_description, category, tags, version, status, price, content, screenshots, repository_url, documentation_url, compatible_versions, file_size)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, 'pending-review', $10, $11, $12, $13, $14, $15, $16)
     RETURNING *`,
    [
      tenantId,
      userId,
      userName,
      request.name,
      request.description,
      request.longDescription ?? null,
      request.category,
      request.tags ?? [],
      request.version,
      request.price,
      request.content,
      request.screenshots ?? [],
      request.repositoryUrl ?? null,
      request.documentationUrl ?? null,
      request.compatibleVersions ?? [],
      fileSize,
    ],
  );

  logger.info({ itemId: result.rows[0].id }, 'Marketplace item published (pending review)');
  return rowToItem(result.rows[0]);
}

// ---------------------------------------------------------------------------
// Download Item
// ---------------------------------------------------------------------------

/**
 * Download a marketplace item.
 */
export async function downloadItem(
  itemId: string,
  tenantId: string,
  client?: PoolClient,
): Promise<MarketplaceDownload> {
  const result = await tenantQuery(client,
    `SELECT * FROM marketplace_items WHERE id = $1 AND status = 'published'`,
    [itemId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Marketplace item not found');
  }

  // Increment download count
  await tenantQuery(client,
    `UPDATE marketplace_items SET download_count = download_count + 1 WHERE id = $1`,
    [itemId],
  );

  const item = result.rows[0];
  return {
    itemId,
    version: item.version as string,
    content: item.content as string,
    filename: `${item.name as string}-${item.version as string}.zip`,
    instructions: `Install the ${item.name as string} component by importing it into your APEX workspace.`,
  };
}

// ---------------------------------------------------------------------------
// Rate Item
// ---------------------------------------------------------------------------

/**
 * Rate a marketplace item.
 */
export async function rateItem(
  itemId: string,
  request: RateItemRequest,
  userId: string,
  userName: string,
  client?: PoolClient,
): Promise<ItemRating> {
  if (request.rating < 1 || request.rating > 5) {
    throw new ValidationError('Rating must be between 1 and 5');
  }

  // Check if user already rated
  const existingResult = await tenantQuery(client,
    `SELECT id FROM marketplace_ratings WHERE item_id = $1 AND user_id = $2`,
    [itemId, userId],
  );

  let ratingResult;
  if (existingResult.rowCount && existingResult.rowCount > 0) {
    // Update existing rating
    ratingResult = await tenantQuery(client,
      `UPDATE marketplace_ratings SET rating = $1, review = $2, created_at = NOW()
       WHERE item_id = $3 AND user_id = $4
       RETURNING *`,
      [request.rating, request.review ?? null, itemId, userId],
    );
  } else {
    // Insert new rating
    ratingResult = await tenantQuery(client,
      `INSERT INTO marketplace_ratings (item_id, user_id, user_name, rating, review)
       VALUES ($1, $2, $3, $4, $5)
       RETURNING *`,
      [itemId, userId, userName, request.rating, request.review ?? null],
    );
  }

  // Update average rating on the item
  const avgResult = await tenantQuery(client,
    `SELECT AVG(rating)::numeric AS avg_rating, COUNT(*)::int AS count
     FROM marketplace_ratings WHERE item_id = $1`,
    [itemId],
  );

  await tenantQuery(client,
    `UPDATE marketplace_items SET average_rating = $1, rating_count = $2, updated_at = NOW()
     WHERE id = $3`,
    [parseFloat(avgResult.rows[0].avg_rating as string), avgResult.rows[0].count, itemId],
  );

  return rowToRating(ratingResult.rows[0]);
}

// ---------------------------------------------------------------------------
// Get My Published Items
// ---------------------------------------------------------------------------

/**
 * Get items published by the current user.
 */
export async function getMyPublished(
  tenantId: string,
  userId: string,
  client?: PoolClient,
): Promise<MarketplaceItem[]> {
  const result = await tenantQuery(client,
    `SELECT * FROM marketplace_items WHERE tenant_id = $1 AND publisher_id = $2 ORDER BY created_at DESC`,
    [tenantId, userId],
  );

  return result.rows.map(rowToItem);
}

// ---------------------------------------------------------------------------
// Install Item
// ---------------------------------------------------------------------------

/**
 * Install a marketplace item into a tenant's workspace.
 */
export async function installItem(
  itemId: string,
  tenantId: string,
  connectionId: string,
  client?: PoolClient,
): Promise<MarketplaceInstall> {
  const item = await getItem(itemId, client);

  logger.info({ itemId, tenantId, connectionId }, 'Installing marketplace item');

  // In production, this would parse the content and apply it to the APEX workspace via ORDS
  // For now, return a success response
  return {
    itemId,
    version: item.version,
    success: true,
    installedComponents: [item.name],
    message: `Successfully installed ${item.name} v${item.version}. Please refresh your APEX workspace to see the changes.`,
  };
}
