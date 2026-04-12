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
