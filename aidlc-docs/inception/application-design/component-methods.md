# Component Methods - APEX Dev Manager

## Public API Signatures

This document defines the TypeScript method signatures for each component's public API. These are interface contracts, not implementations.

---

## C01 - API Gateway

```typescript
interface APIGatewayService {
  // Middleware factories
  createRateLimiter(config: RateLimitConfig): RequestHandler;
  createCorsHandler(config: CorsConfig): RequestHandler;
  createAuthMiddleware(): RequestHandler;

  // Route management
  registerRoute(route: RouteDefinition): void;
  removeRoute(routeId: string): void;
  getRouteTable(): RouteDefinition[];

  // Health
  healthCheck(): Promise<HealthStatus>;
  readinessCheck(): Promise<ReadinessStatus>;
}

interface RateLimitConfig {
  windowMs: number;           // Time window in milliseconds
  maxRequests: number;        // Max requests per window
  keyGenerator: 'ip' | 'tenant' | 'user';
  skipList?: string[];        // Paths to skip
}

interface CorsConfig {
  origins: string[];
  methods: string[];
  credentials: boolean;
  maxAge: number;
}

interface RouteDefinition {
  id: string;
  method: 'GET' | 'POST' | 'PUT' | 'DELETE' | 'PATCH';
  path: string;
  targetService: string;
  middleware: string[];
  rateLimit?: RateLimitConfig;
}

interface HealthStatus {
  status: 'healthy' | 'degraded' | 'unhealthy';
  uptime: number;
  activeConnections: number;
  services: Record<string, 'up' | 'down'>;
}
```

---

## C02 - Tenant Resolver

```typescript
interface TenantResolverService {
  resolveTenant(jwt: string): Promise<TenantContext>;
  injectTenantContext(conn: PoolClient, tenantId: string): Promise<void>;
  validateTenantSubscription(tenantId: string): Promise<SubscriptionStatus>;
  getTenantConfig(tenantId: string): Promise<TenantConfig>;
  middleware(): RequestHandler;
}

interface TenantContext {
  tenantId: string;
  tenantName: string;
  subscriptionTier: 'free' | 'professional' | 'enterprise';
  maxUsers: number;
  maxApps: number;
  features: string[];
  region: string;
}

interface SubscriptionStatus {
  active: boolean;
  tier: string;
  expiresAt: Date;
  usageLimits: {
    aiRequestsPerMonth: number;
    aiRequestsUsed: number;
    storageGb: number;
    storageUsedGb: number;
  };
}

interface TenantConfig {
  tenantId: string;
  defaultEnvironmentId: string;
  safetyLevel: 'standard' | 'strict';
  approvalRequired: boolean;
  aiModelPreference: string;
}
```

---

## C03 - Auth Service

```typescript
interface AuthService {
  login(credentials: LoginRequest): Promise<AuthResponse>;
  refreshToken(refreshToken: string): Promise<AuthResponse>;
  logout(sessionId: string): Promise<void>;
  validateToken(token: string): Promise<TokenPayload>;
  checkPermission(userId: string, resource: string, action: string): Promise<boolean>;
  authorize(roles: Role[]): RequestHandler;
  forgotPassword(email: string): Promise<void>;
  resetPassword(token: string, newPassword: string): Promise<void>;
  lockAccount(userId: string, reason: string): Promise<void>;
  unlockAccount(userId: string): Promise<void>;
}

interface LoginRequest {
  email: string;
  password: string;
  tenantId: string;
  mfaCode?: string;
}

interface AuthResponse {
  accessToken: string;
  refreshToken: string;
  expiresIn: number;
  tokenType: 'Bearer';
  user: UserProfile;
}

interface TokenPayload {
  sub: string;              // userId
  tenantId: string;
  roles: Role[];
  permissions: string[];
  iat: number;
  exp: number;
}

type Role =
  | 'admin'
  | 'developer'
  | 'tech_lead'
  | 'release_manager'
  | 'knowledge_editor'
  | 'marketplace_publisher'
  | 'qa_analyst'
  | 'devops_engineer'
  | 'auditor';

interface UserProfile {
  id: string;
  email: string;
  displayName: string;
  roles: Role[];
  tenantId: string;
  lastLogin: Date;
}
```

---

## C04 - Connection Service

```typescript
interface ConnectionService {
  getConnection(tenantId: string, envId: string): Promise<OracleConnection>;
  releaseConnection(conn: OracleConnection): Promise<void>;
  testConnection(config: ConnectionConfig): Promise<TestResult>;
  registerConnection(config: ConnectionConfig): Promise<string>;
  removeConnection(connectionId: string): Promise<void>;
  refreshCredentials(connectionId: string): Promise<void>;
  getPoolStats(connectionId: string): Promise<PoolStats>;
  healthCheck(connectionId: string): Promise<ConnectionHealth>;
}

interface ConnectionConfig {
  name: string;
  type: 'ords' | 'jdbc' | 'mcp';
  host: string;
  port: number;
  serviceName: string;
  schema: string;
  ordsBaseUrl?: string;
  vaultSecretOcid?: string;  // OCI Vault reference
  poolMin: number;
  poolMax: number;
  poolIncrement: number;
  environment: 'dev' | 'test' | 'staging' | 'prod';
}

interface OracleConnection {
  id: string;
  type: 'ords' | 'jdbc' | 'mcp';
  execute<T>(sql: string, binds?: any[]): Promise<T>;
  release(): Promise<void>;
}

interface TestResult {
  success: boolean;
  latencyMs: number;
  serverVersion: string;
  apexVersion?: string;
  error?: string;
}

interface PoolStats {
  connectionsOpen: number;
  connectionsInUse: number;
  connectionsAvailable: number;
  requestsEnqueued: number;
  avgResponseTimeMs: number;
}
```

---

## C05 - Explorer Service

```typescript
interface ExplorerService {
  listWorkspaces(tenantId: string, envId: string): Promise<ApexWorkspace[]>;
  listApplications(workspaceId: string): Promise<ApexApplication[]>;
  listPages(appId: number): Promise<ApexPage[]>;
  listComponents(pageId: number): Promise<ApexComponent[]>;
  getApplicationTree(appId: number): Promise<ApplicationTree>;
  searchObjects(query: SearchQuery): Promise<SearchResult[]>;
  invalidateCache(appId: number): Promise<void>;
  getComponentDetails(componentType: string, componentId: number): Promise<ComponentDetail>;
  getSharedComponents(appId: number): Promise<SharedComponent[]>;
}

interface ApexWorkspace {
  workspaceId: number;
  workspaceName: string;
  schema: string;
  applicationCount: number;
}

interface ApexApplication {
  applicationId: number;
  applicationName: string;
  alias: string;
  version: string;
  pageCount: number;
  lastUpdated: Date;
  lastUpdatedBy: string;
}

interface ApexPage {
  pageId: number;
  pageName: string;
  pageMode: string;
  pageTemplate: string;
  pageGroup: string;
  regionCount: number;
  itemCount: number;
  lastUpdated: Date;
}

interface ApplicationTree {
  application: ApexApplication;
  pages: (ApexPage & { components: ApexComponent[] })[];
  sharedComponents: SharedComponent[];
}

interface SearchQuery {
  term: string;
  objectTypes?: string[];
  appId?: number;
  maxResults?: number;
}

interface SearchResult {
  objectType: string;
  objectId: number;
  objectName: string;
  parentName: string;
  matchContext: string;
  relevanceScore: number;
}
```

---

## C06 - Editor Service

```typescript
interface EditorService {
  createSession(request: SessionRequest): Promise<EditorSession>;
  saveSession(sessionId: string, content: string): Promise<SaveResult>;
  closeSession(sessionId: string): Promise<void>;
  getComponentSource(type: ComponentType, id: number): Promise<ComponentSource>;
  validateSyntax(content: string, language: 'plsql' | 'javascript'): Promise<ValidationResult>;
  checkLock(componentId: number): Promise<LockStatus>;
  getActiveSessions(appId: number): Promise<EditorSession[]>;
}

interface SessionRequest {
  componentType: ComponentType;
  componentId: number;
  userId: string;
  mode: 'edit' | 'view';
}

interface EditorSession {
  sessionId: string;
  componentType: ComponentType;
  componentId: number;
  userId: string;
  lockedAt: Date;
  expiresAt: Date;
  mode: 'edit' | 'view';
}

type ComponentType =
  | 'plsql_package'
  | 'plsql_trigger'
  | 'plsql_view'
  | 'page_process'
  | 'dynamic_action'
  | 'computation'
  | 'validation'
  | 'lov';

interface ComponentSource {
  componentId: number;
  componentType: ComponentType;
  name: string;
  source: string;
  language: 'plsql' | 'javascript' | 'sql';
  lastModified: Date;
  lastModifiedBy: string;
}

interface SaveResult {
  success: boolean;
  changeId: string;
  warnings: string[];
  compilationErrors?: CompilationError[];
}

interface ValidationResult {
  valid: boolean;
  errors: { line: number; column: number; message: string; severity: 'error' | 'warning' }[];
}

interface LockStatus {
  locked: boolean;
  lockedBy?: string;
  lockedAt?: Date;
  expiresAt?: Date;
}
```

---

## C07 - AI Orchestration Service

```typescript
interface AIOrchestrationService {
  generate(request: AIGenerateRequest): Promise<AIGenerateResponse>;
  analyze(request: AIAnalyzeRequest): Promise<AIAnalysisResult>;
  explain(request: AIExplainRequest): Promise<AIExplanation>;
  buildContext(request: AIRequest): Promise<ContextWindow>;
  routeToModel(request: AIRequest, context: ContextWindow): ModelSelection;
  streamResponse(request: AIGenerateRequest): AsyncIterable<StreamChunk>;
}

interface AIGenerateRequest {
  type: 'code' | 'page' | 'test' | 'documentation' | 'prd';
  prompt: string;
  targetComponent?: { type: ComponentType; id?: number };
  appContext: { appId: number; workspaceId: number };
  preferences?: {
    model?: string;
    temperature?: number;
    maxTokens?: number;
    codingStandards?: string;
  };
}

interface AIGenerateResponse {
  requestId: string;
  artifacts: GeneratedArtifact[];
  explanation: string;
  tokensUsed: { input: number; output: number };
  model: string;
  confidence: number;
  safetyCheck: SafetyCheckResult;
}

interface GeneratedArtifact {
  id: string;
  type: ComponentType | 'page_definition' | 'test_case' | 'documentation';
  name: string;
  content: string;
  language: string;
  diff?: string;          // Diff against existing if applicable
  riskLevel: RiskLevel;
}

interface ContextWindow {
  schemaMetadata: SchemaObject[];
  apexDictionary: ApexDictionaryEntry[];
  knowledgeRules: Rule[];
  existingCode?: string;
  relatedComponents: ComponentReference[];
  totalTokens: number;
}

interface ModelSelection {
  model: string;
  reason: string;
  estimatedCost: number;
  estimatedLatencyMs: number;
}

interface StreamChunk {
  type: 'text' | 'code' | 'metadata' | 'done';
  content: string;
  index: number;
}

type RiskLevel = 'low' | 'medium' | 'high' | 'critical';
```

---

## C08 - Safety Engine

```typescript
interface SafetyEngine {
  sanitizeInput(input: AIInput): Promise<SanitizedInput>;
  validateOutput(output: AIOutput): Promise<SafetyValidationResult>;
  classifyRisk(change: ProposedChange): Promise<RiskClassification>;
  requireApproval(change: ProposedChange, risk: RiskClassification): Promise<ApprovalGate>;
  resolveApproval(gateId: string, decision: ApprovalDecision): Promise<void>;
  listRules(): Promise<SafetyRule[]>;
  createRule(rule: SafetyRuleInput): Promise<SafetyRule>;
  updateRule(ruleId: string, updates: Partial<SafetyRuleInput>): Promise<SafetyRule>;
}

interface AIInput {
  prompt: string;
  context: Record<string, unknown>;
  sourceUserId: string;
  tenantId: string;
}

interface SanitizedInput {
  sanitized: boolean;
  cleanPrompt: string;
  removedPatterns: string[];
  warnings: string[];
}

interface AIOutput {
  requestId: string;
  artifacts: GeneratedArtifact[];
  rawResponse: string;
}

interface SafetyValidationResult {
  valid: boolean;
  findings: SafetyFinding[];
  overallRisk: RiskLevel;
  blockers: SafetyFinding[];
}

interface SafetyFinding {
  ruleId: string;
  severity: 'info' | 'warning' | 'error' | 'critical';
  message: string;
  location?: { file: string; line: number };
  remediation?: string;
}

interface RiskClassification {
  level: RiskLevel;
  factors: { factor: string; weight: number; description: string }[];
  score: number;                  // 0-100
  requiresApproval: boolean;
  approverRoles: Role[];
}

interface ProposedChange {
  componentType: ComponentType;
  componentId?: number;
  operation: 'create' | 'update' | 'delete';
  content: string;
  diff?: string;
  environment: string;
}

interface ApprovalGate {
  gateId: string;
  status: 'pending' | 'approved' | 'rejected';
  requiredApprovers: Role[];
  createdAt: Date;
  expiresAt: Date;
}

type ApprovalDecision = { approved: boolean; approvedBy: string; reason?: string };

interface SafetyRule {
  id: string;
  name: string;
  description: string;
  pattern: string;             // Regex or rule expression
  severity: 'info' | 'warning' | 'error' | 'critical';
  action: 'flag' | 'block' | 'require_approval';
  enabled: boolean;
}
```

---

## C09 - Knowledge Engine

```typescript
interface KnowledgeEngine {
  listRules(filters?: RuleFilter): Promise<Rule[]>;
  getRule(ruleId: string): Promise<Rule>;
  createRule(rule: RuleInput): Promise<Rule>;
  updateRule(ruleId: string, updates: Partial<RuleInput>): Promise<Rule>;
  deleteRule(ruleId: string): Promise<void>;
  getRelevantRules(context: DomainContext): Promise<Rule[]>;
  enrichContext(context: ContextWindow, rules: Rule[]): ContextWindow;
  importRules(source: RuleImportSource): Promise<ImportResult>;
  exportRules(format: 'json' | 'yaml'): Promise<string>;
}

interface Rule {
  id: string;
  name: string;
  domain: RuleDomain;
  category: string;
  description: string;
  content: string;             // The actual rule/best practice text
  priority: number;            // 1-10, higher = more important
  tags: string[];
  applicableVersions: string[];  // APEX versions
  createdBy: string;
  updatedAt: Date;
  enabled: boolean;
}

type RuleDomain =
  | 'plsql'
  | 'apex_pages'
  | 'apex_security'
  | 'performance'
  | 'naming_conventions'
  | 'error_handling'
  | 'accessibility'
  | 'data_modeling';

interface RuleFilter {
  domain?: RuleDomain;
  category?: string;
  tags?: string[];
  enabled?: boolean;
  search?: string;
}

interface DomainContext {
  componentType: ComponentType;
  apexVersion: string;
  operation: string;
  tags: string[];
}

interface RuleImportSource {
  type: 'file' | 'url' | 'marketplace';
  source: string;
  overwriteExisting: boolean;
}

interface ImportResult {
  imported: number;
  skipped: number;
  errors: { rule: string; error: string }[];
}
```

---

## C10 - Change Tracker

```typescript
interface ChangeTracker {
  recordChange(change: ChangeRecordInput): Promise<string>;
  getChangeHistory(componentId: number, options?: HistoryOptions): Promise<ChangeRecord[]>;
  getDiff(changeId: string): Promise<UnifiedDiff>;
  rollback(changeId: string, userId: string): Promise<RollbackResult>;
  getSnapshot(componentId: number, timestamp: Date): Promise<ComponentSnapshot>;
  getChangeReport(filters: ReportFilter): Promise<ChangeReport>;
  compareSnapshots(snapshotA: string, snapshotB: string): Promise<UnifiedDiff>;
}

interface ChangeRecordInput {
  componentType: ComponentType;
  componentId: number;
  appId: number;
  operation: 'create' | 'update' | 'delete';
  beforeContent: string | null;
  afterContent: string;
  userId: string;
  source: 'manual' | 'ai_generated' | 'import' | 'rollback';
  metadata?: Record<string, unknown>;
}

interface ChangeRecord {
  changeId: string;
  componentType: ComponentType;
  componentId: number;
  operation: string;
  userId: string;
  timestamp: Date;
  source: string;
  riskLevel: RiskLevel;
  summary: string;
}

interface UnifiedDiff {
  changeId: string;
  beforeContent: string;
  afterContent: string;
  hunks: DiffHunk[];
  stats: { additions: number; deletions: number; modifications: number };
}

interface DiffHunk {
  oldStart: number;
  oldLines: number;
  newStart: number;
  newLines: number;
  content: string;
}

interface ComponentSnapshot {
  snapshotId: string;
  componentId: number;
  content: string;
  timestamp: Date;
  changeId: string;
}

interface RollbackResult {
  success: boolean;
  newChangeId: string;
  restoredToChangeId: string;
  warnings: string[];
}

interface HistoryOptions {
  limit?: number;
  offset?: number;
  fromDate?: Date;
  toDate?: Date;
  source?: string;
}

interface ReportFilter {
  appId?: number;
  userId?: string;
  fromDate?: Date;
  toDate?: Date;
  operation?: string;
  riskLevel?: RiskLevel;
}

interface ChangeReport {
  totalChanges: number;
  byOperation: Record<string, number>;
  byRisk: Record<RiskLevel, number>;
  byUser: Record<string, number>;
  changes: ChangeRecord[];
}
```

---

## C11 - Release Engine

```typescript
interface ReleaseEngine {
  createRelease(input: ReleaseInput): Promise<Release>;
  promoteRelease(releaseId: string, targetEnv: Environment): Promise<PromotionResult>;
  createHotfix(releaseId: string, changes: string[]): Promise<Release>;
  getReleaseStatus(releaseId: string): Promise<ReleaseStatus>;
  approveGate(releaseId: string, gate: string, decision: ApprovalDecision): Promise<void>;
  rollbackRelease(releaseId: string): Promise<RollbackResult>;
  listReleases(filters?: ReleaseFilter): Promise<Release[]>;
  getReleaseNotes(releaseId: string): Promise<ReleaseNotes>;
}

interface ReleaseInput {
  name: string;
  version: string;
  appId: number;
  changeIds: string[];
  targetEnvironment: Environment;
  description: string;
  scheduledAt?: Date;
}

type Environment = 'dev' | 'test' | 'staging' | 'prod';

interface Release {
  id: string;
  name: string;
  version: string;
  appId: number;
  status: ReleaseStatus;
  currentEnvironment: Environment;
  changeIds: string[];
  createdBy: string;
  createdAt: Date;
  pipeline: PipelineStage[];
}

interface ReleaseStatus {
  phase: 'draft' | 'in_progress' | 'awaiting_approval' | 'deployed' | 'rolled_back' | 'failed';
  currentStage: string;
  progress: number;            // 0-100
  blockers: string[];
}

interface PipelineStage {
  name: string;
  environment: Environment;
  status: 'pending' | 'in_progress' | 'passed' | 'failed' | 'skipped';
  approvalRequired: boolean;
  approvedBy?: string;
  startedAt?: Date;
  completedAt?: Date;
  testResults?: { passed: number; failed: number; skipped: number };
}

interface PromotionResult {
  success: boolean;
  fromEnv: Environment;
  toEnv: Environment;
  appliedChanges: number;
  warnings: string[];
  testResultsSummary?: { passed: number; failed: number };
}

interface ReleaseNotes {
  version: string;
  date: Date;
  features: string[];
  bugFixes: string[];
  breakingChanges: string[];
  knownIssues: string[];
}
```

---

## C12 - Test Runner

```typescript
interface TestRunner {
  runTestSuite(request: TestRunRequest): Promise<TestRun>;
  getTestResults(runId: string): Promise<TestRunResult>;
  createTestCase(testCase: TestCaseInput): Promise<TestCase>;
  updateTestCase(testId: string, updates: Partial<TestCaseInput>): Promise<TestCase>;
  getCoverage(appId: number): Promise<CoverageReport>;
  checkQualityGates(runId: string): Promise<QualityGateResult>;
  listTestSuites(appId: number): Promise<TestSuite[]>;
  deleteTestCase(testId: string): Promise<void>;
}

interface TestRunRequest {
  suiteId?: string;
  testIds?: string[];
  appId: number;
  environmentId: string;
  tags?: string[];
  parallel?: boolean;
}

interface TestRun {
  runId: string;
  status: 'queued' | 'running' | 'completed' | 'failed' | 'cancelled';
  startedAt: Date;
  estimatedDuration: number;
}

interface TestRunResult {
  runId: string;
  status: string;
  duration: number;
  totalTests: number;
  passed: number;
  failed: number;
  errored: number;
  skipped: number;
  testResults: TestCaseResult[];
  coveragePercentage: number;
}

interface TestCaseResult {
  testId: string;
  testName: string;
  status: 'passed' | 'failed' | 'errored' | 'skipped';
  duration: number;
  errorMessage?: string;
  stackTrace?: string;
  assertions: { expected: string; actual: string; passed: boolean }[];
}

interface TestCaseInput {
  name: string;
  suiteId: string;
  appId: number;
  type: 'unit' | 'integration' | 'e2e';
  code: string;               // utPLSQL test package code
  tags: string[];
  expectedDuration?: number;
}

interface TestCase {
  id: string;
  name: string;
  suiteId: string;
  type: string;
  code: string;
  tags: string[];
  lastRunStatus?: string;
  lastRunAt?: Date;
}

interface CoverageReport {
  appId: number;
  overallPercentage: number;
  byPackage: { name: string; percentage: number; lines: number; covered: number }[];
  uncoveredLines: { package: string; lines: number[] }[];
}

interface QualityGateResult {
  passed: boolean;
  gates: {
    name: string;
    threshold: number;
    actual: number;
    passed: boolean;
    metric: string;
  }[];
}

interface TestSuite {
  id: string;
  name: string;
  appId: number;
  testCount: number;
  lastRunAt?: Date;
  lastRunStatus?: string;
  tags: string[];
}
```

---

## C13 - Impact Analyzer

```typescript
interface ImpactAnalyzer {
  analyzeImpact(request: ImpactRequest): Promise<ImpactReport>;
  getDependencyGraph(componentId: number): Promise<DependencyGraph>;
  getRegressionPlan(changeId: string): Promise<RegressionPlan>;
  buildDependencyGraph(appId: number): Promise<DependencyGraph>;
  calculateImpactRadius(componentId: number, changeType: string): Promise<ImpactReport>;
  getAffectedComponents(componentId: number): Promise<AffectedComponent[]>;
}

interface ImpactRequest {
  componentType: ComponentType;
  componentId: number;
  changeType: 'modify' | 'delete' | 'rename';
  changeDescription?: string;
}

interface ImpactReport {
  requestId: string;
  sourceComponent: ComponentReference;
  impactRadius: number;         // Number of affected components
  riskLevel: RiskLevel;
  affectedComponents: AffectedComponent[];
  suggestedTests: string[];
  breakingChanges: BreakingChange[];
  visualizationMermaid: string;
}

interface DependencyGraph {
  nodes: GraphNode[];
  edges: GraphEdge[];
  rootId: number;
  depth: number;
}

interface GraphNode {
  id: number;
  name: string;
  type: ComponentType;
  level: number;
}

interface GraphEdge {
  sourceId: number;
  targetId: number;
  dependencyType: 'calls' | 'references' | 'inherits' | 'uses_data' | 'triggers';
  weight: number;
}

interface AffectedComponent {
  componentId: number;
  componentName: string;
  componentType: ComponentType;
  impactType: 'direct' | 'transitive';
  dependencyPath: string[];
  riskLevel: RiskLevel;
}

interface BreakingChange {
  component: ComponentReference;
  reason: string;
  severity: 'warning' | 'error';
  suggestedFix?: string;
}

interface RegressionPlan {
  changeId: string;
  testSuites: string[];
  estimatedDuration: number;
  priority: 'low' | 'medium' | 'high';
  manualTestCases: string[];
}

interface ComponentReference {
  id: number;
  name: string;
  type: ComponentType;
}
```

---

## C14 - Documentation Generator

```typescript
interface DocumentationGenerator {
  generateAppDocumentation(appId: number): Promise<DocumentationBundle>;
  generateDiagram(request: DiagramRequest): Promise<MermaidDiagram>;
  getModuleManual(appId: number): Promise<ModuleManual>;
  exportDocumentation(appId: number, format: ExportFormat): Promise<Buffer>;
  generateERD(appId: number): Promise<MermaidDiagram>;
  generateFlowDiagram(processId: number): Promise<MermaidDiagram>;
  generateApiDocumentation(appId: number): Promise<ApiDocumentation>;
}

interface DocumentationBundle {
  appId: number;
  generatedAt: Date;
  sections: DocumentSection[];
  diagrams: MermaidDiagram[];
  tableOfContents: TOCEntry[];
}

interface DocumentSection {
  id: string;
  title: string;
  content: string;           // Markdown content
  level: number;
  children: DocumentSection[];
}

interface DiagramRequest {
  type: 'erd' | 'flow' | 'sequence' | 'component' | 'state';
  scopeType: 'app' | 'page' | 'process' | 'package';
  scopeId: number;
  options?: { theme?: string; direction?: 'TB' | 'LR' };
}

interface MermaidDiagram {
  id: string;
  type: string;
  title: string;
  mermaidCode: string;
  description: string;
}

interface ModuleManual {
  appId: number;
  appName: string;
  version: string;
  chapters: DocumentSection[];
  appendices: DocumentSection[];
}

type ExportFormat = 'markdown' | 'html' | 'pdf';

interface ApiDocumentation {
  appId: number;
  endpoints: ApiEndpoint[];
  schemas: SchemaDefinition[];
}

interface ApiEndpoint {
  method: string;
  path: string;
  description: string;
  parameters: ParameterDoc[];
  requestBody?: SchemaDefinition;
  responses: Record<string, SchemaDefinition>;
}
```

---

## C15 - PRD Processor

```typescript
interface PRDProcessor {
  ingestDocument(file: Buffer, filename: string, mimeType: string): Promise<IngestResult>;
  generatePRD(input: PRDInput): Promise<PRDocument>;
  validatePRD(prdId: string): Promise<PRDValidationResult>;
  getPRD(prdId: string): Promise<PRDocument>;
  extractRequirements(prdId: string): Promise<Requirement[]>;
  transformToStructured(raw: RawDocument): Promise<StructuredPRD>;
  listPRDs(appId: number): Promise<PRDSummary[]>;
}

interface IngestResult {
  documentId: string;
  parsedSections: number;
  extractedRequirements: number;
  warnings: string[];
}

interface PRDInput {
  title: string;
  appId: number;
  description: string;
  features: FeatureSpec[];
  constraints?: string[];
  assumptions?: string[];
}

interface PRDocument {
  id: string;
  title: string;
  version: string;
  status: 'draft' | 'review' | 'approved' | 'archived';
  sections: PRDSection[];
  requirements: Requirement[];
  createdAt: Date;
  updatedAt: Date;
}

interface PRDSection {
  id: string;
  title: string;
  content: string;
  order: number;
}

interface Requirement {
  id: string;
  type: 'functional' | 'non_functional' | 'constraint';
  priority: 'must' | 'should' | 'could' | 'wont';
  description: string;
  acceptanceCriteria: string[];
  traceability: string[];
}

interface FeatureSpec {
  name: string;
  description: string;
  userStory?: string;
  mockupUrl?: string;
  priority: 'must' | 'should' | 'could';
}

interface PRDValidationResult {
  valid: boolean;
  completenessScore: number;    // 0-100
  issues: { field: string; message: string; severity: 'error' | 'warning' }[];
}

interface StructuredPRD {
  title: string;
  overview: string;
  features: FeatureSpec[];
  requirements: Requirement[];
  wireframes: string[];
}

interface RawDocument {
  content: string;
  format: 'markdown' | 'docx' | 'pdf' | 'text';
}
```

---

## C16 - Page Generator

```typescript
interface PageGenerator {
  generatePage(request: PageGenRequest): Promise<PageGenResult>;
  previewPage(request: PageGenRequest): Promise<PagePreview>;
  applyPage(previewId: string): Promise<ApplyResult>;
  checkCollisions(appId: number, pageIds: number[]): Promise<CollisionReport>;
  resolveCollisions(appId: number, pageIds: number[]): Promise<CollisionResolution>;
  listTemplates(): Promise<PageTemplate[]>;
}

interface PageGenRequest {
  prdId?: string;
  specification?: PageSpecification;
  appId: number;
  templateId?: string;
  generationMode: 'ai' | 'template' | 'hybrid';
}

interface PageSpecification {
  pageName: string;
  pageType: 'form' | 'report' | 'chart' | 'dashboard' | 'master_detail' | 'calendar' | 'tree' | 'map';
  dataSource: string;         // Table or view name
  columns?: ColumnSpec[];
  regions?: RegionSpec[];
  processes?: ProcessSpec[];
  buttons?: ButtonSpec[];
}

interface PageGenResult {
  previewId: string;
  pageId: number;
  pageDefinition: APEXPageDefinition;
  generatedComponents: number;
  warnings: string[];
  collisions: CollisionReport;
}

interface APEXPageDefinition {
  pageId: number;
  pageName: string;
  pageMode: string;
  regions: APEXRegion[];
  items: APEXItem[];
  buttons: APEXButton[];
  processes: APEXProcess[];
  dynamicActions: APEXDynamicAction[];
  computations: APEXComputation[];
  validations: APEXValidation[];
}

interface PagePreview {
  previewId: string;
  html: string;                // Rendered preview
  definition: APEXPageDefinition;
  diff?: string;               // Diff if modifying existing page
  estimatedRisk: RiskLevel;
}

interface ApplyResult {
  success: boolean;
  pageId: number;
  appliedComponents: number;
  changeIds: string[];
  errors: string[];
}

interface CollisionReport {
  hasCollisions: boolean;
  collisions: { pageId: number; existingPageName: string; conflictType: string }[];
}

interface CollisionResolution {
  originalPageIds: number[];
  resolvedPageIds: number[];
  strategy: 'renumber' | 'replace' | 'merge';
}

interface PageTemplate {
  id: string;
  name: string;
  description: string;
  pageType: string;
  thumbnail?: string;
  applicableVersions: string[];
}
```

---

## C17 - Code Factory

```typescript
interface CodeFactory {
  generate(request: CodeGenRequest): Promise<CodeGenResult>;
  preview(request: CodeGenRequest): Promise<CodePreview>;
  apply(previewId: string): Promise<CodeApplyResult>;
  batchGenerate(requests: CodeGenRequest[]): Promise<CodeGenResult[]>;
  getHistory(filters?: CodeGenFilter): Promise<CodeGenHistoryEntry[]>;
  listTemplates(artifactType?: ArtifactType): Promise<CodeTemplate[]>;
}

type ArtifactType =
  | 'plsql_package'
  | 'plsql_trigger'
  | 'plsql_view'
  | 'page_process'
  | 'dynamic_action'
  | 'computation'
  | 'validation'
  | 'lov';

interface CodeGenRequest {
  artifactType: ArtifactType;
  name: string;
  specification: string;
  appId: number;
  templateId?: string;
  targetSchema?: string;
  options?: {
    includeErrorHandling: boolean;
    includeLogging: boolean;
    includeComments: boolean;
    codingStandard?: string;
  };
}

interface CodeGenResult {
  previewId: string;
  artifacts: GeneratedCodeArtifact[];
  totalLinesGenerated: number;
  tokensUsed: { input: number; output: number };
  safetyCheck: SafetyCheckResult;
}

interface GeneratedCodeArtifact {
  id: string;
  artifactType: ArtifactType;
  name: string;
  code: string;
  language: 'plsql' | 'javascript' | 'sql';
  lineCount: number;
  dependencies: string[];
}

interface CodePreview {
  previewId: string;
  artifacts: GeneratedCodeArtifact[];
  diffs: { artifactId: string; diff: string }[];
  riskLevel: RiskLevel;
  validationResult: ValidationResult;
  expiresAt: Date;
}

interface CodeApplyResult {
  success: boolean;
  appliedArtifacts: number;
  changeIds: string[];
  compilationResults: { artifact: string; success: boolean; errors?: string[] }[];
}

interface CodeGenFilter {
  appId?: number;
  artifactType?: ArtifactType;
  fromDate?: Date;
  toDate?: Date;
  userId?: string;
}

interface CodeGenHistoryEntry {
  id: string;
  artifactType: ArtifactType;
  name: string;
  generatedAt: Date;
  generatedBy: string;
  applied: boolean;
  tokensUsed: number;
}

interface CodeTemplate {
  id: string;
  name: string;
  artifactType: ArtifactType;
  description: string;
  skeleton: string;
  variables: { name: string; type: string; description: string }[];
}

interface SafetyCheckResult {
  passed: boolean;
  findings: SafetyFinding[];
  riskLevel: RiskLevel;
}
```

---

## C18 - Cost Tracker

```typescript
interface CostTracker {
  recordUsage(usage: TokenUsageInput): Promise<void>;
  getCostSummary(tenantId: string, period?: DateRange): Promise<CostSummary>;
  getBudgetStatus(tenantId: string): Promise<BudgetStatus>;
  configureBudgetAlert(config: BudgetAlertConfig): Promise<void>;
  checkBudget(tenantId: string): Promise<BudgetCheckResult>;
  getCostAnalytics(tenantId: string, options?: AnalyticsOptions): Promise<CostAnalytics>;
}

interface TokenUsageInput {
  requestId: string;
  tenantId: string;
  userId: string;
  model: string;
  inputTokens: number;
  outputTokens: number;
  operation: string;
  componentType?: ComponentType;
}

interface CostSummary {
  tenantId: string;
  period: DateRange;
  totalCost: number;
  totalInputTokens: number;
  totalOutputTokens: number;
  totalRequests: number;
  byModel: { model: string; cost: number; requests: number }[];
  byUser: { userId: string; cost: number; requests: number }[];
  byOperation: { operation: string; cost: number; requests: number }[];
}

interface BudgetStatus {
  tenantId: string;
  monthlyBudget: number;
  spent: number;
  remaining: number;
  percentUsed: number;
  projectedMonthEnd: number;
  alertThresholds: { percentage: number; triggered: boolean }[];
}

interface BudgetCheckResult {
  allowed: boolean;
  remainingBudget: number;
  estimatedCost: number;
  warning?: string;
}

interface BudgetAlertConfig {
  tenantId: string;
  thresholds: number[];         // Percentages: [50, 75, 90, 100]
  notifyRoles: Role[];
  channels: ('in_app' | 'email' | 'webhook')[];
}

interface CostAnalytics {
  dailyTrend: { date: string; cost: number; requests: number }[];
  topConsumers: { userId: string; cost: number }[];
  modelDistribution: { model: string; percentage: number }[];
  costPerOperation: { operation: string; avgCost: number }[];
}

interface DateRange {
  from: Date;
  to: Date;
}

interface AnalyticsOptions {
  granularity: 'hourly' | 'daily' | 'weekly' | 'monthly';
  period?: DateRange;
  groupBy?: string;
}
```

---

## C19 - Dashboard Aggregator

```typescript
interface DashboardAggregator {
  getKPIs(tenantId: string): Promise<KPIDashboard>;
  getMetrics(category: MetricCategory, tenantId: string): Promise<MetricSet>;
  subscribeFeed(tenantId: string): AsyncIterable<MetricUpdate>;
  defineCustomMetric(definition: CustomMetricDef): Promise<string>;
  getReport(type: ReportType, tenantId: string, period: DateRange): Promise<Report>;
  listCustomMetrics(tenantId: string): Promise<CustomMetricDef[]>;
}

interface KPIDashboard {
  codeQuality: { score: number; trend: 'up' | 'down' | 'stable'; details: string };
  releaseVelocity: { releasesPerMonth: number; avgCycleTimeDays: number; trend: string };
  aiUsage: { requestsToday: number; successRate: number; avgLatencyMs: number };
  testCoverage: { percentage: number; trend: string; passingRate: number };
  changeVolume: { changesThisWeek: number; riskBreakdown: Record<RiskLevel, number> };
  costEfficiency: { costPerRequest: number; budgetUtilization: number };
}

type MetricCategory =
  | 'code_quality'
  | 'release'
  | 'ai_usage'
  | 'testing'
  | 'changes'
  | 'costs'
  | 'performance'
  | 'security';

interface MetricSet {
  category: MetricCategory;
  metrics: Metric[];
  collectedAt: Date;
}

interface Metric {
  name: string;
  value: number;
  unit: string;
  trend: number;               // Percentage change
  sparkline: number[];         // Last 30 data points
}

interface MetricUpdate {
  category: MetricCategory;
  metricName: string;
  value: number;
  timestamp: Date;
}

interface CustomMetricDef {
  id: string;
  name: string;
  formula: string;
  sourceMetrics: string[];
  unit: string;
  refreshInterval: number;
}

type ReportType = 'executive_summary' | 'development_activity' | 'quality_report' | 'cost_report' | 'security_report';

interface Report {
  type: ReportType;
  period: DateRange;
  sections: { title: string; content: string; charts: MermaidDiagram[] }[];
  generatedAt: Date;
}
```

---

## C20 - Marketplace Service

```typescript
interface MarketplaceService {
  getCatalog(filters?: CatalogFilter): Promise<CatalogEntry[]>;
  getAccelerator(acceleratorId: string): Promise<AcceleratorDetail>;
  installAccelerator(acceleratorId: string, targetAppId: number): Promise<InstallResult>;
  uninstallAccelerator(acceleratorId: string, appId: number): Promise<UninstallResult>;
  publishAccelerator(submission: AcceleratorSubmission): Promise<PublishResult>;
  checkCompatibility(acceleratorId: string, apexVersion: string): Promise<CompatibilityResult>;
  getReviews(acceleratorId: string): Promise<Review[]>;
  submitReview(acceleratorId: string, review: ReviewInput): Promise<Review>;
}

interface CatalogFilter {
  category?: string;
  search?: string;
  apexVersion?: string;
  rating?: number;
  type?: 'template' | 'plugin' | 'rule_pack' | 'theme' | 'component';
  sortBy?: 'popularity' | 'rating' | 'date' | 'name';
}

interface CatalogEntry {
  id: string;
  name: string;
  description: string;
  category: string;
  type: string;
  version: string;
  rating: number;
  downloads: number;
  publisher: string;
  thumbnail: string;
  tags: string[];
}

interface AcceleratorDetail extends CatalogEntry {
  longDescription: string;
  screenshots: string[];
  dependencies: string[];
  compatibility: string[];
  installSize: number;
  changelog: { version: string; changes: string[] }[];
}

interface AcceleratorSubmission {
  name: string;
  description: string;
  category: string;
  type: string;
  version: string;
  package: Buffer;
  readme: string;
  compatibility: string[];
}

interface InstallResult {
  success: boolean;
  installedComponents: number;
  warnings: string[];
  rollbackId: string;         // For uninstall
}

interface UninstallResult {
  success: boolean;
  removedComponents: number;
  warnings: string[];
}

interface CompatibilityResult {
  compatible: boolean;
  issues: { severity: string; message: string }[];
  requiredVersion: string;
  currentVersion: string;
}

interface PublishResult {
  success: boolean;
  acceleratorId: string;
  status: 'pending_review' | 'published' | 'rejected';
  reviewFeedback?: string;
}

interface Review {
  id: string;
  userId: string;
  rating: number;
  comment: string;
  createdAt: Date;
}

interface ReviewInput {
  rating: number;
  comment: string;
}
```

---

## C21 - Notification Service

```typescript
interface NotificationService {
  send(notification: NotificationInput): Promise<string>;
  listNotifications(userId: string, options?: ListOptions): Promise<Notification[]>;
  markAsRead(notificationId: string): Promise<void>;
  markAllAsRead(userId: string): Promise<void>;
  updatePreferences(userId: string, prefs: NotificationPreferences): Promise<void>;
  getPreferences(userId: string): Promise<NotificationPreferences>;
  registerWebhook(config: WebhookConfig): Promise<string>;
  removeWebhook(webhookId: string): Promise<void>;
  listTemplates(): Promise<NotificationTemplate[]>;
}

interface NotificationInput {
  recipientId: string;
  type: NotificationType;
  channel: NotificationChannel[];
  title: string;
  body: string;
  data?: Record<string, unknown>;
  priority: 'low' | 'normal' | 'high' | 'urgent';
  templateId?: string;
  templateVars?: Record<string, string>;
}

type NotificationType =
  | 'release_approval'
  | 'test_failure'
  | 'budget_alert'
  | 'safety_alert'
  | 'change_notification'
  | 'system_alert'
  | 'marketplace_update';

type NotificationChannel = 'in_app' | 'email' | 'webhook';

interface Notification {
  id: string;
  type: NotificationType;
  title: string;
  body: string;
  read: boolean;
  createdAt: Date;
  data?: Record<string, unknown>;
}

interface NotificationPreferences {
  channels: Record<NotificationType, NotificationChannel[]>;
  quietHours?: { start: string; end: string; timezone: string };
  digestMode?: 'immediate' | 'hourly' | 'daily';
}

interface WebhookConfig {
  url: string;
  events: NotificationType[];
  secret: string;
  headers?: Record<string, string>;
}

interface NotificationTemplate {
  id: string;
  name: string;
  type: NotificationType;
  subject: string;
  bodyTemplate: string;
  variables: string[];
}

interface ListOptions {
  read?: boolean;
  type?: NotificationType;
  limit?: number;
  offset?: number;
  fromDate?: Date;
}
```

---

## C22 - MCP Connector

```typescript
interface MCPConnector {
  invoke<T>(tool: string, params: Record<string, unknown>): Promise<MCPResult<T>>;
  listTools(): Promise<MCPToolDefinition[]>;
  createSession(config: MCPSessionConfig): Promise<MCPSession>;
  closeSession(sessionId: string): Promise<void>;
  healthCheck(): Promise<MCPHealth>;
  getToolSchema(toolName: string): Promise<MCPToolSchema>;
}

interface MCPSessionConfig {
  connectionId: string;
  tenantId: string;
  timeout?: number;
  retryPolicy?: RetryPolicy;
}

interface MCPSession {
  sessionId: string;
  status: 'active' | 'idle' | 'closed';
  createdAt: Date;
  lastUsed: Date;
  connectionId: string;
}

interface MCPResult<T = unknown> {
  success: boolean;
  data: T;
  executionTimeMs: number;
  toolName: string;
  warnings?: string[];
  error?: MCPError;
}

interface MCPToolDefinition {
  name: string;
  description: string;
  inputSchema: Record<string, unknown>;
  outputSchema: Record<string, unknown>;
  category: string;
}

interface MCPToolSchema {
  name: string;
  parameters: { name: string; type: string; required: boolean; description: string }[];
  returns: { type: string; description: string };
}

interface MCPHealth {
  status: 'healthy' | 'degraded' | 'unhealthy';
  serverVersion: string;
  toolCount: number;
  activeSessionCount: number;
  avgResponseTimeMs: number;
}

interface MCPError {
  code: string;
  message: string;
  details?: Record<string, unknown>;
}

interface RetryPolicy {
  maxRetries: number;
  backoffMs: number;
  backoffMultiplier: number;
  retryableErrors: string[];
}
```

---

## C23 - ORDS Client

```typescript
interface ORDSClient {
  execute(method: HttpMethod, path: string, body?: unknown): Promise<ORDSResponse>;
  post(module: string, template: string, body: unknown): Promise<ORDSResponse>;
  put(module: string, template: string, body: unknown): Promise<ORDSResponse>;
  delete(module: string, template: string, params?: Record<string, string>): Promise<ORDSResponse>;
  get(module: string, template: string, params?: Record<string, string>): Promise<ORDSResponse>;
  batch(operations: ORDSOperation[]): Promise<ORDSBatchResult>;
  getModules(): Promise<ORDSModule[]>;
}

type HttpMethod = 'GET' | 'POST' | 'PUT' | 'DELETE' | 'PATCH';

interface ORDSResponse<T = unknown> {
  statusCode: number;
  data: T;
  headers: Record<string, string>;
  executionTimeMs: number;
}

interface ORDSOperation {
  id: string;
  method: HttpMethod;
  module: string;
  template: string;
  body?: unknown;
  params?: Record<string, string>;
}

interface ORDSBatchResult {
  totalOperations: number;
  successful: number;
  failed: number;
  results: { operationId: string; success: boolean; response?: ORDSResponse; error?: string }[];
}

interface ORDSModule {
  name: string;
  basePath: string;
  templates: ORDSTemplate[];
  status: 'published' | 'unpublished';
}

interface ORDSTemplate {
  uri: string;
  method: HttpMethod;
  description: string;
  parameters: { name: string; type: string; in: 'query' | 'path' | 'body' }[];
}
```

---

## C24 - DB Direct Client

```typescript
interface DBDirectClient {
  execute<T>(sql: string, binds?: BindParameter[]): Promise<QueryResult<T>>;
  executeMany(sql: string, bindsArray: BindParameter[][]): Promise<BatchResult>;
  callProcedure(name: string, params: ProcedureParam[]): Promise<ProcedureResult>;
  executePlSqlBlock(block: string, binds?: BindParameter[]): Promise<PlSqlResult>;
  getConnection(): Promise<DirectConnection>;
  releaseConnection(conn: DirectConnection): Promise<void>;
}

interface BindParameter {
  name: string;
  value: unknown;
  type?: OracleType;
  direction?: 'in' | 'out' | 'inout';
  maxSize?: number;
}

type OracleType = 'string' | 'number' | 'date' | 'clob' | 'blob' | 'cursor';

interface QueryResult<T = Record<string, unknown>> {
  rows: T[];
  metaData: ColumnMetadata[];
  rowsAffected: number;
  executionTimeMs: number;
}

interface ColumnMetadata {
  name: string;
  dbType: string;
  nullable: boolean;
  precision?: number;
  scale?: number;
}

interface BatchResult {
  rowsAffected: number;
  batchErrors: { index: number; error: string }[];
  executionTimeMs: number;
}

interface ProcedureParam {
  name: string;
  value: unknown;
  type: OracleType;
  direction: 'in' | 'out' | 'inout';
  maxSize?: number;
}

interface ProcedureResult {
  outBinds: Record<string, unknown>;
  executionTimeMs: number;
  implicitResults?: QueryResult[];
}

interface PlSqlResult {
  outBinds: Record<string, unknown>;
  dbmsOutput: string[];
  executionTimeMs: number;
}

interface DirectConnection {
  id: string;
  execute<T>(sql: string, binds?: BindParameter[]): Promise<QueryResult<T>>;
  commit(): Promise<void>;
  rollback(): Promise<void>;
  release(): Promise<void>;
}
```

---

## C25 - Event Bus

```typescript
interface EventBus {
  publish(topic: string, event: DomainEvent): Promise<void>;
  subscribe(topic: string, handler: EventHandler): Subscription;
  unsubscribe(subscriptionId: string): void;
  replay(topic: string, fromTimestamp: Date): AsyncIterable<DomainEvent>;
  getDeadLetterQueue(topic?: string): Promise<DeadLetterEntry[]>;
  retryDeadLetter(entryId: string): Promise<void>;
  healthCheck(): Promise<EventBusHealth>;
  getTopicStats(topic: string): Promise<TopicStats>;
}

interface DomainEvent {
  eventId: string;
  eventType: string;
  topic: string;
  tenantId: string;
  payload: Record<string, unknown>;
  metadata: {
    timestamp: Date;
    source: string;
    correlationId: string;
    userId?: string;
    version: number;
  };
}

type EventHandler = (event: DomainEvent) => Promise<void>;

interface Subscription {
  id: string;
  topic: string;
  status: 'active' | 'paused';
  pause(): void;
  resume(): void;
  cancel(): void;
}

interface DeadLetterEntry {
  id: string;
  event: DomainEvent;
  error: string;
  failedAt: Date;
  retryCount: number;
  lastRetryAt?: Date;
}

interface EventBusHealth {
  status: 'healthy' | 'degraded' | 'unhealthy';
  redisConnected: boolean;
  activeSubscriptions: number;
  pendingMessages: number;
  deadLetterCount: number;
}

interface TopicStats {
  topic: string;
  messageCount: number;
  subscriberCount: number;
  avgProcessingTimeMs: number;
  deadLetterCount: number;
  lastMessageAt?: Date;
}
```
