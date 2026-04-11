import { v4 as uuidv4 } from 'uuid';

/* -------------------------------------------------------------------------- */
/*  Type definitions for test data                                            */
/* -------------------------------------------------------------------------- */

export interface TestTenant {
  id: string;
  name: string;
  slug: string;
  status: 'active' | 'inactive' | 'suspended';
  createdAt: Date;
  updatedAt: Date;
}

export interface TestUser {
  id: string;
  tenantId: string;
  email: string;
  firstName: string;
  lastName: string;
  role: 'admin' | 'manager' | 'developer' | 'viewer';
  status: 'active' | 'inactive';
  createdAt: Date;
  updatedAt: Date;
}

export interface TestConnection {
  id: string;
  tenantId: string;
  name: string;
  provider: 'github' | 'gitlab' | 'bitbucket' | 'azure-devops';
  status: 'connected' | 'disconnected' | 'error';
  baseUrl: string;
  createdAt: Date;
  updatedAt: Date;
}

/* -------------------------------------------------------------------------- */
/*  Factory functions                                                         */
/* -------------------------------------------------------------------------- */

/**
 * Create a test tenant with realistic defaults.
 * Any property can be overridden via the `overrides` parameter.
 */
export function createTestTenant(overrides: Partial<TestTenant> = {}): TestTenant {
  const now = new Date();
  return {
    id: uuidv4(),
    name: 'Acme Corporation',
    slug: `acme-corp-${uuidv4().slice(0, 8)}`,
    status: 'active',
    createdAt: now,
    updatedAt: now,
    ...overrides,
  };
}

/**
 * Create a test user with realistic defaults.
 * Any property can be overridden via the `overrides` parameter.
 */
export function createTestUser(overrides: Partial<TestUser> = {}): TestUser {
  const now = new Date();
  const uniqueId = uuidv4().slice(0, 8);
  return {
    id: uuidv4(),
    tenantId: uuidv4(),
    email: `developer-${uniqueId}@example.com`,
    firstName: 'Jane',
    lastName: 'Doe',
    role: 'developer',
    status: 'active',
    createdAt: now,
    updatedAt: now,
    ...overrides,
  };
}

/**
 * Create a test connection with realistic defaults.
 * Any property can be overridden via the `overrides` parameter.
 */
export function createTestConnection(overrides: Partial<TestConnection> = {}): TestConnection {
  const now = new Date();
  return {
    id: uuidv4(),
    tenantId: uuidv4(),
    name: 'Primary GitHub',
    provider: 'github',
    status: 'connected',
    baseUrl: 'https://api.github.com',
    createdAt: now,
    updatedAt: now,
    ...overrides,
  };
}
