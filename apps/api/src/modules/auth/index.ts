/**
 * Auth module barrel export.
 */
export { router } from './auth.controller.js';
export { authenticate, authorize, optionalAuth } from './auth.middleware.js';
export type {
  Role,
  JwtPayload,
  RefreshTokenRecord,
  LockoutStatus,
  AuthUser,
  TokenPair,
  UserProfile,
  LoginResult,
} from './auth.types.js';
export { ROLES } from './auth.types.js';
