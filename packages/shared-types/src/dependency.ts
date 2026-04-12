// ---------------------------------------------------------------------------
// Dependency Analyzer types (M11)
// ---------------------------------------------------------------------------

export interface DependencyNode {
  id: string;
  name: string;
  objectType: string;
  schema: string;
  status?: 'valid' | 'invalid' | 'unknown';
}

export interface DependencyEdge {
  sourceId: string;
  targetId: string;
  dependencyType: 'references' | 'calls' | 'inherits' | 'uses' | 'contains';
  weight?: number;
}

export interface DependencyGraph {
  nodes: DependencyNode[];
  edges: DependencyEdge[];
  rootNodeId?: string;
  metadata?: {
    totalNodes: number;
    totalEdges: number;
    analyzedAt: string;
  };
}

export interface ImpactAssessment {
  targetObject: DependencyNode;
  directDependents: DependencyNode[];
  transitiveDependents: DependencyNode[];
  impactLevel: 'low' | 'medium' | 'high' | 'critical';
  summary: string;
  breakingChanges: {
    dependent: DependencyNode;
    reason: string;
  }[];
}

// ---------------------------------------------------------------------------
// PRD Impact Analysis types
// ---------------------------------------------------------------------------

export interface PRDImpactRequest {
  issueId: string;
  connectionId: string;
  // Optional user-provided context for precision
  applicationId?: number;
  pageIds?: number[];
  affectedTables?: string[];
  affectedObjects?: string[];
  notes?: string;
}

export interface PRDImpactAnalysis {
  issueCode: string;
  issueTitle: string;
  prdTitle: string;
  connectionName: string;
  userContext: {
    applicationName?: string;
    pageNames?: string[];
    tables?: string[];
    objects?: string[];
    notes?: string;
  };
  summary: {
    totalAffectedPages: number;
    totalAffectedTables: number;
    totalNewPages: number;
    totalNewTables: number;
    riskLevel: 'low' | 'medium' | 'high' | 'critical';
    riskScore: number;
  };
  functionalImpact: {
    newPages: Array<{ name: string; type: string; description: string }>;
    modifiedPages: Array<{ pageId: number; pageName: string; reason: string; affectedRegions: string[] }>;
    affectedFlows: Array<{ flowName: string; impact: string }>;
  };
  databaseImpact: {
    newTables: Array<{ name: string; description: string; columns: string[] }>;
    modifiedTables: Array<{ name: string; reason: string; changes: string[] }>;
    affectedIndexes: string[];
    affectedTriggers: string[];
  };
  dependencies: Array<{ sourceType: string; sourceName: string; targetType: string; targetName: string; impact: string }>;
  recommendations: string[];
  analyzedAt: string;
}
