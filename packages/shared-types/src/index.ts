// Core types (U1 foundation - kept for backward compat)
export * from './common.js';
export * from './api-response.js';
export * from './environment.js';
export * from './audit.js';

// Auth & Users (U2 - supersedes U1 user.ts and tenant.ts)
export * from './auth.js';
export { type Tenant, TenantPlan, TenantStatus, type TenantSettings } from './tenant.js';
export * from './errors.js';

// Connections (U2 - supersedes U1 connection.ts)
export * from './connections.js';

// Explorer (U3)
export * from './explorer.js';

// Editor (U4)
export * from './editor.js';

// AI (U5)
export * from './ai.js';

// PRD (U6)
export * from './prd.js';

// Change Manager & Schema (U7)
export * from './change-manager.js';

// Release & Governance (U8)
export * from './release.js';
export * from './governance.js';

// Dependencies & Docs (U9)
export * from './dependency.js';
export * from './docs.js';

// Testing & Knowledge (U10)
export * from './test-studio.js';
export * from './knowledge.js';

// Usage & Dashboard (U11)
export * from './usage.js';
export * from './dashboard.js';

// Factory & Marketplace (U12)
export * from './factory.js';
export * from './marketplace.js';

// Clients & Issues (U14)
export * from './client.js';
export * from './issue.js';

// LLM Providers
export * from './llm-provider.js';

// SaaS (U13)
export * from './saas.js';
