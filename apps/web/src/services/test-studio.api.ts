import apiClient from '../lib/api-client';
import type {
  TestSuite,
  TestCase,
  TestResult,
  TestCoverage,
  GenerateTestsRequest,
  ExecuteTestRequest,
  CreateTestSuiteRequest,
} from '@apex-dev-manager/shared-types';

const BASE = '/test-studio';

/**
 * Generate tests via AI for a component.
 */
export async function generateTests(request: GenerateTestsRequest): Promise<TestCase[]> {
  const { data } = await apiClient.post<{ data: TestCase[] }>(`${BASE}/generate`, request);
  return data.data;
}

/**
 * Execute test cases against APEX via ORDS.
 */
export async function executeTests(request: ExecuteTestRequest): Promise<TestResult[]> {
  const { data } = await apiClient.post<{ data: TestResult[] }>(`${BASE}/execute`, request);
  return data.data;
}

/**
 * Get test results for a suite.
 */
export async function getTestResults(suiteId: string): Promise<TestResult[]> {
  const { data } = await apiClient.get<{ data: TestResult[] }>(`${BASE}/results/${suiteId}`);
  return data.data;
}

/**
 * Get test coverage for a connection.
 */
export async function getTestCoverage(connectionId: string, appId?: number): Promise<TestCoverage> {
  const params = new URLSearchParams({ connectionId });
  if (appId !== undefined) params.set('appId', String(appId));
  const { data } = await apiClient.get<{ data: TestCoverage }>(`${BASE}/coverage?${params}`);
  return data.data;
}

/**
 * List test suites.
 */
export async function listTestSuites(connectionId?: string): Promise<TestSuite[]> {
  const params = connectionId ? `?connectionId=${connectionId}` : '';
  const { data } = await apiClient.get<{ data: TestSuite[] }>(`${BASE}/suites${params}`);
  return data.data;
}

/**
 * Create a test suite.
 */
export async function createTestSuite(request: CreateTestSuiteRequest): Promise<TestSuite> {
  const { data } = await apiClient.post<{ data: TestSuite }>(`${BASE}/suites`, request);
  return data.data;
}

/**
 * Get a test suite by ID.
 */
export async function getTestSuite(id: string): Promise<TestSuite> {
  const { data } = await apiClient.get<{ data: TestSuite }>(`${BASE}/suites/${id}`);
  return data.data;
}

/**
 * Delete a test suite.
 */
export async function deleteTestSuite(id: string): Promise<void> {
  await apiClient.delete(`${BASE}/suites/${id}`);
}
