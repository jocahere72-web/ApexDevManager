// ---------------------------------------------------------------------------
// Marketplace shared types (M18 Component Marketplace)
// ---------------------------------------------------------------------------

/**
 * Category of marketplace items.
 */
export type ItemCategory =
  | 'template'
  | 'plugin'
  | 'theme'
  | 'component'
  | 'workflow'
  | 'integration'
  | 'utility';

/**
 * Status of a marketplace item.
 */
export type ItemStatus = 'draft' | 'pending-review' | 'published' | 'rejected' | 'archived';

/**
 * A marketplace item listing.
 */
export interface MarketplaceItem {
  id: string;
  tenantId: string;
  publisherId: string;
  publisherName: string;
  name: string;
  description: string;
  longDescription?: string;
  category: ItemCategory;
  tags: string[];
  version: string;
  status: ItemStatus;
  price: number;
  currency: string;
  downloadCount: number;
  averageRating: number;
  ratingCount: number;
  screenshots: string[];
  repositoryUrl?: string;
  documentationUrl?: string;
  compatibleVersions: string[];
  fileSize: number;
  createdAt: string;
  updatedAt: string;
}

/**
 * A rating/review for a marketplace item.
 */
export interface ItemRating {
  id: string;
  itemId: string;
  userId: string;
  userName: string;
  rating: number;
  review?: string;
  createdAt: string;
}

/**
 * Request to publish an item to the marketplace.
 */
export interface PublishRequest {
  name: string;
  description: string;
  longDescription?: string;
  category: ItemCategory;
  tags?: string[];
  version: string;
  price: number;
  content: string;
  screenshots?: string[];
  repositoryUrl?: string;
  documentationUrl?: string;
  compatibleVersions?: string[];
}

/**
 * Request to rate a marketplace item.
 */
export interface RateItemRequest {
  rating: number;
  review?: string;
}

/**
 * Marketplace search/filter parameters.
 */
export interface MarketplaceSearchParams {
  query?: string;
  category?: ItemCategory;
  minRating?: number;
  maxPrice?: number;
  sortBy?: 'downloads' | 'rating' | 'newest' | 'price';
  page?: number;
  limit?: number;
}

/**
 * Download result.
 */
export interface MarketplaceDownload {
  itemId: string;
  version: string;
  content: string;
  filename: string;
  instructions?: string;
}

/**
 * Install result.
 */
export interface MarketplaceInstall {
  itemId: string;
  version: string;
  success: boolean;
  installedComponents: string[];
  message: string;
}
