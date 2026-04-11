// Re-export shared types from the monorepo shared-types package.
// Uncomment the line below once @apex-dev-manager/shared-types is available.
// export * from '@apex-dev-manager/shared-types';

// Placeholder type exports until shared-types package is set up
export interface ApiResponse<T> {
  data: T;
  message?: string;
  success: boolean;
}

export interface PaginatedResponse<T> {
  data: T[];
  total: number;
  page: number;
  pageSize: number;
  totalPages: number;
}

export interface ApiError {
  message: string;
  statusCode: number;
  error?: string;
}
