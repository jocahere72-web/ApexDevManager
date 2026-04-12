// ---------------------------------------------------------------------------
// Knowledge Engine shared types (M14 Knowledge & Learning)
// ---------------------------------------------------------------------------

/**
 * Category of knowledge content.
 */
export type KnowledgeCategory =
  | 'apex-component'
  | 'plsql'
  | 'ords'
  | 'security'
  | 'performance'
  | 'best-practice'
  | 'tutorial'
  | 'reference';

/**
 * A knowledge article stored in the knowledge base.
 */
export interface KnowledgeArticle {
  id: string;
  title: string;
  content: string;
  category: KnowledgeCategory;
  tags: string[];
  sourceUrl?: string;
  version?: string;
  embeddingId?: string;
  relevanceScore?: number;
  createdAt: string;
  updatedAt: string;
}

/**
 * Result from a knowledge search query.
 */
export interface SearchResult {
  article: KnowledgeArticle;
  score: number;
  snippet: string;
  highlights: string[];
}

/**
 * Contextual help for a specific component type.
 */
export interface ContextualHelp {
  componentType: string;
  summary: string;
  bestPractices: string[];
  commonIssues: string[];
  relatedArticles: KnowledgeArticle[];
  exampleCode?: string;
}

/**
 * A learning resource within a learning path.
 */
export interface LearningResource {
  id: string;
  title: string;
  description: string;
  type: 'article' | 'tutorial' | 'video' | 'exercise';
  durationMinutes: number;
  url?: string;
  articleId?: string;
  completed?: boolean;
  order: number;
}

/**
 * A structured learning path for a role or topic.
 */
export interface LearningPath {
  id: string;
  title: string;
  description: string;
  role: string;
  level: 'beginner' | 'intermediate' | 'advanced';
  resources: LearningResource[];
  totalDurationMinutes: number;
  completedCount: number;
  totalCount: number;
  progressPercent: number;
}

/**
 * Request to search the knowledge base.
 */
export interface KnowledgeSearchRequest {
  query: string;
  category?: KnowledgeCategory;
  tags?: string[];
  limit?: number;
}

/**
 * Request to ingest a document into the knowledge base.
 */
export interface IngestDocRequest {
  title: string;
  content: string;
  category: KnowledgeCategory;
  tags?: string[];
  sourceUrl?: string;
  version?: string;
}
