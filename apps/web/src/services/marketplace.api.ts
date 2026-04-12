import apiClient from '../lib/api-client';
import type {
  MarketplaceItem,
  ItemRating,
  MarketplaceDownload,
  MarketplaceInstall,
  PublishRequest,
  RateItemRequest,
  MarketplaceSearchParams,
} from '@apex-dev-manager/shared-types';

const BASE = '/marketplace';

/**
 * List/search marketplace items.
 */
export async function listItems(params: MarketplaceSearchParams = {}): Promise<{ items: MarketplaceItem[]; total: number }> {
  const searchParams = new URLSearchParams();
  if (params.query) searchParams.set('q', params.query);
  if (params.category) searchParams.set('category', params.category);
  if (params.minRating !== undefined) searchParams.set('minRating', String(params.minRating));
  if (params.maxPrice !== undefined) searchParams.set('maxPrice', String(params.maxPrice));
  if (params.sortBy) searchParams.set('sortBy', params.sortBy);
  if (params.page) searchParams.set('page', String(params.page));
  if (params.limit) searchParams.set('limit', String(params.limit));

  const query = searchParams.toString() ? `?${searchParams}` : '';
  const { data } = await apiClient.get<{ data: MarketplaceItem[]; pagination: { totalItems: number } }>(`${BASE}/items${query}`);
  return { items: data.data, total: data.pagination.totalItems };
}

/**
 * Get item details.
 */
export async function getItem(id: string): Promise<MarketplaceItem> {
  const { data } = await apiClient.get<{ data: MarketplaceItem }>(`${BASE}/items/${id}`);
  return data.data;
}

/**
 * Publish an item.
 */
export async function publishItem(request: PublishRequest): Promise<MarketplaceItem> {
  const { data } = await apiClient.post<{ data: MarketplaceItem }>(`${BASE}/publish`, request);
  return data.data;
}

/**
 * Download an item.
 */
export async function downloadItem(id: string): Promise<MarketplaceDownload> {
  const { data } = await apiClient.post<{ data: MarketplaceDownload }>(`${BASE}/items/${id}/download`);
  return data.data;
}

/**
 * Rate an item.
 */
export async function rateItem(id: string, request: RateItemRequest): Promise<ItemRating> {
  const { data } = await apiClient.post<{ data: ItemRating }>(`${BASE}/items/${id}/rate`, request);
  return data.data;
}

/**
 * Get my published items.
 */
export async function getMyItems(): Promise<MarketplaceItem[]> {
  const { data } = await apiClient.get<{ data: MarketplaceItem[] }>(`${BASE}/my-items`);
  return data.data;
}

/**
 * Install an item.
 */
export async function installItem(id: string, connectionId: string): Promise<MarketplaceInstall> {
  const { data } = await apiClient.post<{ data: MarketplaceInstall }>(`${BASE}/items/${id}/install`, { connectionId });
  return data.data;
}
