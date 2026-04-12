// ---------------------------------------------------------------------------
// Test Studio Service (M13 Test Automation)
// ---------------------------------------------------------------------------

import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import { claudeClient } from '../ai-studio/claude.client.js';
import type {
  TestSuite,
  TestCase,
  TestResult,
  TestCoverage,
  GenerateTestsRequest,
  ExecuteTestRequest,
  CreateTestSuiteRequest,
  TestStatus,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Row mappers
// ---------------------------------------------------------------------------

function rowToTestSuite(row: Record<string, unknown>): TestSuite {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    connectionId: row.connection_id as string,
    name: row.name as string,
    description: (row.description as string) ?? undefined,
    appId: (row.app_id as number) ?? undefined,
    pageId: (row.page_id as number) ?? undefined,
    testCases: [],
    totalTests: (row.total_tests as number) ?? 0,
    passedTests: (row.passed_tests as number) ?? 0,
    failedTests: (row.failed_tests as number) ?? 0,
    coveragePercent: parseFloat((row.coverage_percent as string) ?? '0'),
    lastRunAt: row.last_run_at ? (row.last_run_at as Date).toISOString() : undefined,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

function rowToTestCase(row: Record<string, unknown>): TestCase {
  return {
    id: row.id as string,
    suiteId: row.suite_id as string,
    name: row.name as string,
    description: row.description as string,
    type: row.type as TestCase['type'],
    status: row.status as TestStatus,
    componentType: (row.component_type as string) ?? undefined,
    componentName: (row.component_name as string) ?? undefined,
    plsqlBlock: row.plsql_block as string,
    expectedResult: (row.expected_result as string) ?? undefined,
    actualResult: (row.actual_result as string) ?? undefined,
    errorMessage: (row.error_message as string) ?? undefined,
    executionTimeMs: (row.execution_time_ms as number) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

function rowToTestResult(row: Record<string, unknown>): TestResult {
  return {
    id: row.id as string,
    suiteId: row.suite_id as string,
    testCaseId: row.test_case_id as string,
    status: row.status as TestStatus,
    executionTimeMs: row.execution_time_ms as number,
    actualResult: (row.actual_result as string) ?? undefined,
    errorMessage: (row.error_message as string) ?? undefined,
    stackTrace: (row.stack_trace as string) ?? undefined,
    ordsResponse: row.ords_response ? (JSON.parse(row.ords_response as string) as Record<string, unknown>) : undefined,
    executedAt: (row.executed_at as Date).toISOString(),
  };
}

// ---------------------------------------------------------------------------
// Generate Tests (AI-powered)
// ---------------------------------------------------------------------------

/**
 * Analyze a component and generate test cases using AI.
 */
export async function generateTests(
  request: GenerateTestsRequest,
  tenantId: string,
  userId: string,
): Promise<TestCase[]> {
  logger.info({ request, tenantId }, 'Generating tests via AI');

  const prompt = `You are an Oracle APEX testing expert. Analyze the following component and generate comprehensive test cases.

Component Type: ${request.componentType ?? 'unknown'}
Component Name: ${request.componentName ?? 'unknown'}
Source Code:
\`\`\`
${request.componentSource ?? 'No source provided'}
\`\`\`

Generate test cases as a JSON array. Each test case should have:
- name: descriptive test name
- description: what the test validates
- type: one of "unit", "integration", "e2e", "performance", "security"
- plsqlBlock: the PL/SQL anonymous block to execute the test via ORDS
- expectedResult: expected output or behavior

Focus on: boundary conditions, error handling, business logic validation, and security.
Return ONLY the JSON array, no other text.`;

  const response = await claudeClient.chat(
    [{ role: 'user', content: prompt }],
    { systemPrompt: 'You are an Oracle APEX and PL/SQL testing expert. Return only valid JSON.' },
  );

  let generatedCases: Array<{
    name: string;
    description: string;
    type: string;
    plsqlBlock: string;
    expectedResult?: string;
  }>;

  try {
    generatedCases = JSON.parse(response.content);
  } catch {
    logger.error('Failed to parse AI-generated test cases');
    throw new ValidationError('AI returned invalid test case format');
  }

  // Filter by requested test types
  if (request.testTypes?.length) {
    generatedCases = generatedCases.filter((tc) =>
      request.testTypes!.includes(tc.type as TestCase['type']),
    );
  }

  // Create a suite if needed and insert test cases
  let suiteId: string;
  const suiteResult = await pool.query(
    `INSERT INTO test_suites (tenant_id, connection_id, name, app_id, page_id, total_tests)
     VALUES ($1, $2, $3, $4, $5, $6)
     RETURNING id`,
    [
      tenantId,
      request.connectionId,
      `Auto-generated: ${request.componentName ?? 'Component'} Tests`,
      request.appId ?? null,
      request.pageId ?? null,
      generatedCases.length,
    ],
  );
  suiteId = suiteResult.rows[0].id as string;

  const testCases: TestCase[] = [];
  for (const tc of generatedCases) {
    const result = await pool.query(
      `INSERT INTO test_cases (suite_id, tenant_id, name, description, type, component_type, component_name, plsql_block, expected_result, status)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, 'pending')
       RETURNING *`,
      [
        suiteId,
        tenantId,
        tc.name,
        tc.description,
        tc.type,
        request.componentType ?? null,
        request.componentName ?? null,
        tc.plsqlBlock,
        tc.expectedResult ?? null,
      ],
    );
    testCases.push(rowToTestCase(result.rows[0]));
  }

  logger.info({ suiteId, count: testCases.length }, 'Tests generated successfully');
  return testCases;
}

// ---------------------------------------------------------------------------
// Execute Tests
// ---------------------------------------------------------------------------

/**
 * Execute test cases against APEX via ORDS.
 */
export async function executeTest(
  request: ExecuteTestRequest,
  tenantId: string,
): Promise<TestResult[]> {
  logger.info({ request, tenantId }, 'Executing tests');

  // Fetch the test cases
  const caseConditions = ['tc.suite_id = $1', 'tc.tenant_id = $2'];
  const params: unknown[] = [request.suiteId, tenantId];

  if (request.testCaseIds?.length) {
    caseConditions.push(`tc.id = ANY($3)`);
    params.push(request.testCaseIds);
  }

  const casesResult = await pool.query(
    `SELECT * FROM test_cases tc WHERE ${caseConditions.join(' AND ')}`,
    params,
  );

  if (casesResult.rowCount === 0) {
    throw new NotFoundError('No test cases found');
  }

  // Get connection details for ORDS execution
  const connResult = await pool.query(
    `SELECT * FROM connections WHERE id = $1 AND tenant_id = $2`,
    [request.connectionId, tenantId],
  );

  if (connResult.rowCount === 0) {
    throw new NotFoundError('Connection not found');
  }

  const connection = connResult.rows[0];
  const ordsBaseUrl = connection.ords_url as string;

  const results: TestResult[] = [];

  for (const caseRow of casesResult.rows) {
    const testCase = rowToTestCase(caseRow);
    const startTime = Date.now();
    let status: TestStatus = 'pending';
    let actualResult: string | undefined;
    let errorMessage: string | undefined;
    let stackTrace: string | undefined;
    let ordsResponse: Record<string, unknown> | undefined;

    try {
      // Execute the PL/SQL block via ORDS REST endpoint
      const ordsUrl = `${ordsBaseUrl}/_/sql`;
      const resp = await fetch(ordsUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/sql',
          Authorization: `Bearer ${connection.auth_token as string}`,
        },
        body: testCase.plsqlBlock,
      });

      ordsResponse = (await resp.json()) as Record<string, unknown>;

      if (resp.ok) {
        actualResult = JSON.stringify(ordsResponse);
        // Compare with expected result if provided
        if (testCase.expectedResult) {
          const matches =
            actualResult.includes(testCase.expectedResult) ||
            JSON.stringify(ordsResponse).includes(testCase.expectedResult);
          status = matches ? 'passed' : 'failed';
          if (!matches) {
            errorMessage = `Expected "${testCase.expectedResult}" but got "${actualResult}"`;
          }
        } else {
          status = 'passed';
        }
      } else {
        status = 'error';
        errorMessage = `ORDS returned HTTP ${resp.status}`;
        stackTrace = JSON.stringify(ordsResponse);
      }
    } catch (err) {
      status = 'error';
      errorMessage = (err as Error).message;
      stackTrace = (err as Error).stack;
    }

    const executionTimeMs = Date.now() - startTime;

    // Save the result
    const resultRow = await pool.query(
      `INSERT INTO test_results (suite_id, test_case_id, tenant_id, status, execution_time_ms, actual_result, error_message, stack_trace, ords_response, executed_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, NOW())
       RETURNING *`,
      [
        request.suiteId,
        testCase.id,
        tenantId,
        status,
        executionTimeMs,
        actualResult ?? null,
        errorMessage ?? null,
        stackTrace ?? null,
        ordsResponse ? JSON.stringify(ordsResponse) : null,
      ],
    );

    // Update the test case status
    await pool.query(
      `UPDATE test_cases SET status = $1, actual_result = $2, error_message = $3, execution_time_ms = $4, updated_at = NOW()
       WHERE id = $5`,
      [status, actualResult ?? null, errorMessage ?? null, executionTimeMs, testCase.id],
    );

    results.push(rowToTestResult(resultRow.rows[0]));
  }

  // Update suite stats
  const statsResult = await pool.query(
    `SELECT
       COUNT(*)::int AS total,
       COUNT(*) FILTER (WHERE status = 'passed')::int AS passed,
       COUNT(*) FILTER (WHERE status = 'failed' OR status = 'error')::int AS failed
     FROM test_cases WHERE suite_id = $1`,
    [request.suiteId],
  );
  const stats = statsResult.rows[0];

  await pool.query(
    `UPDATE test_suites
     SET total_tests = $1, passed_tests = $2, failed_tests = $3, last_run_at = NOW(), updated_at = NOW()
     WHERE id = $4`,
    [stats.total, stats.passed, stats.failed, request.suiteId],
  );

  logger.info({ suiteId: request.suiteId, total: results.length }, 'Tests executed');
  return results;
}

// ---------------------------------------------------------------------------
// Get Test Results
// ---------------------------------------------------------------------------

/**
 * Get test results for a suite.
 */
export async function getTestResults(
  suiteId: string,
  tenantId: string,
): Promise<TestResult[]> {
  const result = await pool.query(
    `SELECT * FROM test_results WHERE suite_id = $1 AND tenant_id = $2 ORDER BY executed_at DESC`,
    [suiteId, tenantId],
  );
  return result.rows.map(rowToTestResult);
}

// ---------------------------------------------------------------------------
// Get Test Coverage
// ---------------------------------------------------------------------------

/**
 * Get test coverage for a connection/application.
 */
export async function getTestCoverage(
  connectionId: string,
  tenantId: string,
  appId?: number,
): Promise<TestCoverage> {
  // Get all components from the explorer data
  const componentQuery = appId
    ? `SELECT component_type, component_name FROM apex_components WHERE connection_id = $1 AND tenant_id = $2 AND app_id = $3`
    : `SELECT component_type, component_name FROM apex_components WHERE connection_id = $1 AND tenant_id = $2`;
  const componentParams: unknown[] = appId
    ? [connectionId, tenantId, appId]
    : [connectionId, tenantId];

  const componentsResult = await pool.query(componentQuery, componentParams);
  const totalComponents = componentsResult.rowCount ?? 0;

  // Get tested components
  const testedQuery = appId
    ? `SELECT DISTINCT component_type, component_name FROM test_cases tc
       JOIN test_suites ts ON tc.suite_id = ts.id
       WHERE ts.connection_id = $1 AND ts.tenant_id = $2 AND ts.app_id = $3 AND tc.status = 'passed'`
    : `SELECT DISTINCT component_type, component_name FROM test_cases tc
       JOIN test_suites ts ON tc.suite_id = ts.id
       WHERE ts.connection_id = $1 AND ts.tenant_id = $2 AND tc.status = 'passed'`;

  const testedResult = await pool.query(testedQuery, componentParams);
  const testedComponents = testedResult.rowCount ?? 0;

  // Build by-type breakdown
  const byType: Record<string, { total: number; tested: number; percent: number }> = {};
  const testedSet = new Set(
    testedResult.rows.map((r) => `${r.component_type}::${r.component_name}`),
  );

  for (const row of componentsResult.rows) {
    const type = row.component_type as string;
    if (!byType[type]) {
      byType[type] = { total: 0, tested: 0, percent: 0 };
    }
    byType[type].total++;
    if (testedSet.has(`${type}::${row.component_name}`)) {
      byType[type].tested++;
    }
  }

  for (const type of Object.keys(byType)) {
    byType[type].percent =
      byType[type].total > 0 ? Math.round((byType[type].tested / byType[type].total) * 100) : 0;
  }

  // Get untested components
  const untested = componentsResult.rows
    .filter((r) => !testedSet.has(`${r.component_type}::${r.component_name}`))
    .map((r) => ({
      componentType: r.component_type as string,
      componentName: r.component_name as string,
    }));

  return {
    connectionId,
    appId,
    totalComponents,
    testedComponents,
    coveragePercent: totalComponents > 0 ? Math.round((testedComponents / totalComponents) * 100) : 0,
    byType,
    untested,
    generatedAt: new Date().toISOString(),
  };
}

// ---------------------------------------------------------------------------
// Test Suite CRUD
// ---------------------------------------------------------------------------

/**
 * List test suites for a tenant.
 */
export async function listTestSuites(
  tenantId: string,
  connectionId?: string,
): Promise<TestSuite[]> {
  const conditions = ['tenant_id = $1'];
  const params: unknown[] = [tenantId];

  if (connectionId) {
    conditions.push('connection_id = $2');
    params.push(connectionId);
  }

  const result = await pool.query(
    `SELECT * FROM test_suites WHERE ${conditions.join(' AND ')} ORDER BY updated_at DESC`,
    params,
  );

  const suites = result.rows.map(rowToTestSuite);

  // Load test cases for each suite
  for (const suite of suites) {
    const casesResult = await pool.query(
      `SELECT * FROM test_cases WHERE suite_id = $1 ORDER BY created_at`,
      [suite.id],
    );
    suite.testCases = casesResult.rows.map(rowToTestCase);
  }

  return suites;
}

/**
 * Create a new test suite.
 */
export async function createTestSuite(
  request: CreateTestSuiteRequest,
  tenantId: string,
): Promise<TestSuite> {
  const result = await pool.query(
    `INSERT INTO test_suites (tenant_id, connection_id, name, description, app_id, page_id)
     VALUES ($1, $2, $3, $4, $5, $6)
     RETURNING *`,
    [
      tenantId,
      request.connectionId,
      request.name,
      request.description ?? null,
      request.appId ?? null,
      request.pageId ?? null,
    ],
  );

  return rowToTestSuite(result.rows[0]);
}

/**
 * Get a single test suite by ID.
 */
export async function getTestSuite(
  id: string,
  tenantId: string,
): Promise<TestSuite> {
  const result = await pool.query(
    `SELECT * FROM test_suites WHERE id = $1 AND tenant_id = $2`,
    [id, tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Test suite not found');
  }

  const suite = rowToTestSuite(result.rows[0]);

  const casesResult = await pool.query(
    `SELECT * FROM test_cases WHERE suite_id = $1 ORDER BY created_at`,
    [id],
  );
  suite.testCases = casesResult.rows.map(rowToTestCase);

  return suite;
}

/**
 * Delete a test suite.
 */
export async function deleteTestSuite(
  id: string,
  tenantId: string,
): Promise<void> {
  const result = await pool.query(
    `DELETE FROM test_suites WHERE id = $1 AND tenant_id = $2 RETURNING id`,
    [id, tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Test suite not found');
  }

  logger.info({ suiteId: id, tenantId }, 'Test suite deleted');
}
