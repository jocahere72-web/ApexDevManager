// ---------------------------------------------------------------------------
// Test Studio shared types (M13 Test Automation)
// ---------------------------------------------------------------------------

/**
 * Status of a test execution.
 */
export type TestStatus = 'pending' | 'running' | 'passed' | 'failed' | 'error' | 'skipped';

/**
 * Type of test generated.
 */
export type TestType = 'unit' | 'integration' | 'e2e' | 'performance' | 'security';

/**
 * A single test case within a test suite.
 */
export interface TestCase {
  id: string;
  suiteId: string;
  name: string;
  description: string;
  type: TestType;
  status: TestStatus;
  componentType?: string;
  componentName?: string;
  plsqlBlock: string;
  expectedResult?: string;
  actualResult?: string;
  errorMessage?: string;
  executionTimeMs?: number;
  createdAt: string;
  updatedAt: string;
}

/**
 * A collection of test cases.
 */
export interface TestSuite {
  id: string;
  tenantId: string;
  connectionId: string;
  name: string;
  description?: string;
  appId?: number;
  pageId?: number;
  testCases: TestCase[];
  totalTests: number;
  passedTests: number;
  failedTests: number;
  coveragePercent: number;
  lastRunAt?: string;
  createdAt: string;
  updatedAt: string;
}

/**
 * Result of a test execution run.
 */
export interface TestResult {
  id: string;
  suiteId: string;
  testCaseId: string;
  status: TestStatus;
  executionTimeMs: number;
  actualResult?: string;
  errorMessage?: string;
  stackTrace?: string;
  ordsResponse?: Record<string, unknown>;
  executedAt: string;
}

/**
 * Coverage report for a component or application.
 */
export interface TestCoverage {
  connectionId: string;
  appId?: number;
  totalComponents: number;
  testedComponents: number;
  coveragePercent: number;
  byType: Record<string, { total: number; tested: number; percent: number }>;
  untested: Array<{ componentType: string; componentName: string }>;
  generatedAt: string;
}

/**
 * Request to generate tests for a component.
 */
export interface GenerateTestsRequest {
  connectionId: string;
  appId?: number;
  pageId?: number;
  componentType?: string;
  componentName?: string;
  componentSource?: string;
  testTypes?: TestType[];
}

/**
 * Request to execute tests.
 */
export interface ExecuteTestRequest {
  suiteId: string;
  testCaseIds?: string[];
  connectionId: string;
}

/**
 * Request to create a test suite.
 */
export interface CreateTestSuiteRequest {
  connectionId: string;
  name: string;
  description?: string;
  appId?: number;
  pageId?: number;
}
