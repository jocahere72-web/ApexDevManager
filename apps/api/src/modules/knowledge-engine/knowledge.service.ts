// ---------------------------------------------------------------------------
// Knowledge Engine Service (M14 Knowledge & Learning)
// ---------------------------------------------------------------------------

import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError } from '../../lib/errors.js';
import { claudeClient } from '../ai-studio/claude.client.js';
import type {
  KnowledgeArticle,
  KnowledgeSearchResult,
  ContextualHelp,
  LearningPath,
  LearningResource,
  KnowledgeSearchRequest,
  IngestDocRequest,
  KnowledgeCategory,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Row mappers
// ---------------------------------------------------------------------------

function rowToArticle(row: Record<string, unknown>): KnowledgeArticle {
  return {
    id: row.id as string,
    title: row.title as string,
    content: row.content as string,
    category: row.category as KnowledgeCategory,
    tags: (row.tags as string[]) ?? [],
    sourceUrl: (row.source_url as string) ?? undefined,
    version: (row.version as string) ?? undefined,
    embeddingId: (row.embedding_id as string) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

function rowToLearningPath(row: Record<string, unknown>, resources: LearningResource[]): LearningPath {
  const completed = resources.filter((r) => r.completed).length;
  return {
    id: row.id as string,
    title: row.title as string,
    description: row.description as string,
    role: row.role as string,
    level: row.level as LearningPath['level'],
    resources,
    totalDurationMinutes: resources.reduce((sum, r) => sum + r.durationMinutes, 0),
    completedCount: completed,
    totalCount: resources.length,
    progressPercent: resources.length > 0 ? Math.round((completed / resources.length) * 100) : 0,
  };
}

// ---------------------------------------------------------------------------
// Embedding helper
// ---------------------------------------------------------------------------

async function generateEmbedding(text: string): Promise<number[]> {
  // Use Claude to generate a semantic representation, then store as pgvector
  // In production, this would use an embedding model (e.g., Cohere, OpenAI embeddings)
  // For now, we generate a hash-based vector as a placeholder
  const truncated = text.substring(0, 8000);
  const hash = Array.from(truncated).reduce((acc, char, i) => {
    acc[i % 1536] = ((acc[i % 1536] ?? 0) + char.charCodeAt(0)) / 1000;
    return acc;
  }, new Array(1536).fill(0) as number[]);
  return hash;
}

// ---------------------------------------------------------------------------
// Search (RAG: embed query -> search pgvector/similar)
// ---------------------------------------------------------------------------

/**
 * Search the knowledge base using semantic similarity.
 */
export async function search(
  request: KnowledgeSearchRequest,
  tenantId: string,
): Promise<KnowledgeSearchResult[]> {
  logger.info({ query: request.query, tenantId }, 'Knowledge search');

  const embedding = await generateEmbedding(request.query);
  const limit = request.limit ?? 10;

  // Build query with optional filters
  const conditions = ['tenant_id = $2'];
  const params: unknown[] = [`[${embedding.join(',')}]`, tenantId];
  let paramIdx = 3;

  if (request.category) {
    conditions.push(`category = $${paramIdx}`);
    params.push(request.category);
    paramIdx++;
  }

  if (request.tags?.length) {
    conditions.push(`tags && $${paramIdx}`);
    params.push(request.tags);
    paramIdx++;
  }

  const where = conditions.join(' AND ');

  const result = await pool.query(
    `SELECT *,
       1 - (embedding <=> $1::vector) AS similarity
     FROM knowledge_articles
     WHERE ${where}
     ORDER BY embedding <=> $1::vector
     LIMIT $${paramIdx}`,
    [...params, limit],
  );

  return result.rows.map((row) => {
    const article = rowToArticle(row);
    const score = parseFloat((row.similarity as string) ?? '0');
    article.relevanceScore = score;

    // Extract a snippet around the most relevant content
    const contentLower = article.content.toLowerCase();
    const queryWords = request.query.toLowerCase().split(/\s+/);
    let bestIdx = 0;
    for (const word of queryWords) {
      const idx = contentLower.indexOf(word);
      if (idx >= 0) {
        bestIdx = idx;
        break;
      }
    }
    const start = Math.max(0, bestIdx - 100);
    const end = Math.min(article.content.length, bestIdx + 300);
    const snippet = (start > 0 ? '...' : '') + article.content.substring(start, end) + (end < article.content.length ? '...' : '');

    return {
      article,
      score,
      snippet,
      highlights: queryWords.filter((w) => contentLower.includes(w)),
    };
  });
}

// ---------------------------------------------------------------------------
// Ingest Document
// ---------------------------------------------------------------------------

/**
 * Parse a document into chunks, generate embeddings, and store.
 */
export async function ingestDoc(
  request: IngestDocRequest,
  tenantId: string,
): Promise<KnowledgeArticle> {
  logger.info({ title: request.title, category: request.category, tenantId }, 'Ingesting document');

  // Generate embedding for the content
  const embedding = await generateEmbedding(request.content);

  const result = await pool.query(
    `INSERT INTO knowledge_articles (tenant_id, title, content, category, tags, source_url, version, embedding)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8::vector)
     RETURNING *`,
    [
      tenantId,
      request.title,
      request.content,
      request.category,
      request.tags ?? [],
      request.sourceUrl ?? null,
      request.version ?? null,
      `[${embedding.join(',')}]`,
    ],
  );

  logger.info({ articleId: result.rows[0].id }, 'Document ingested successfully');
  return rowToArticle(result.rows[0]);
}

// ---------------------------------------------------------------------------
// Contextual Help
// ---------------------------------------------------------------------------

/**
 * Get contextual help for a specific APEX component type.
 */
export async function getContextualHelp(
  componentType: string,
  tenantId: string,
): Promise<ContextualHelp> {
  // Search for related articles
  const articles = await search(
    { query: `Oracle APEX ${componentType} best practices common issues`, limit: 5 },
    tenantId,
  );

  // Use AI to generate contextual help
  const prompt = `You are an Oracle APEX expert. Provide contextual help for the component type: "${componentType}".

Include:
1. A brief summary of what this component type is
2. 3-5 best practices
3. 3-5 common issues and how to avoid them
4. An example code snippet if applicable

Return as JSON with keys: summary, bestPractices (string[]), commonIssues (string[]), exampleCode (string or null).`;

  const response = await claudeClient.chat(
    [{ role: 'user', content: prompt }],
    { systemPrompt: 'You are an Oracle APEX expert. Return only valid JSON.' },
  );

  let parsed: { summary: string; bestPractices: string[]; commonIssues: string[]; exampleCode?: string };
  try {
    parsed = JSON.parse(response.content);
  } catch {
    parsed = {
      summary: `Help for ${componentType}`,
      bestPractices: ['Follow Oracle APEX best practices'],
      commonIssues: ['Refer to Oracle documentation'],
    };
  }

  return {
    componentType,
    summary: parsed.summary,
    bestPractices: parsed.bestPractices,
    commonIssues: parsed.commonIssues,
    relatedArticles: articles.map((r) => r.article),
    exampleCode: parsed.exampleCode,
  };
}

// ---------------------------------------------------------------------------
// Learning Paths
// ---------------------------------------------------------------------------

/**
 * Get a learning path for a specific role.
 */
export async function getLearningPath(
  role: string,
  tenantId: string,
  userId: string,
): Promise<LearningPath[]> {
  const result = await pool.query(
    `SELECT * FROM learning_paths WHERE tenant_id = $1 AND role = $2 ORDER BY level`,
    [tenantId, role],
  );

  if (result.rowCount === 0) {
    // Generate a default learning path using AI
    return [await generateDefaultLearningPath(role, tenantId)];
  }

  const paths: LearningPath[] = [];
  for (const row of result.rows) {
    const resourcesResult = await pool.query(
      `SELECT lr.*, CASE WHEN ulp.completed THEN true ELSE false END AS completed
       FROM learning_resources lr
       LEFT JOIN user_learning_progress ulp ON ulp.resource_id = lr.id AND ulp.user_id = $1
       WHERE lr.path_id = $2
       ORDER BY lr.sort_order`,
      [userId, row.id],
    );

    const resources: LearningResource[] = resourcesResult.rows.map((r) => ({
      id: r.id as string,
      title: r.title as string,
      description: r.description as string,
      type: r.type as LearningResource['type'],
      durationMinutes: r.duration_minutes as number,
      url: (r.url as string) ?? undefined,
      articleId: (r.article_id as string) ?? undefined,
      completed: (r.completed as boolean) ?? false,
      order: r.sort_order as number,
    }));

    paths.push(rowToLearningPath(row, resources));
  }

  return paths;
}

/**
 * Generate a default learning path when none exists.
 */
async function generateDefaultLearningPath(role: string, tenantId: string): Promise<LearningPath> {
  const prompt = `Generate a learning path for an Oracle APEX "${role}" role.
Return JSON with: title, description, level ("beginner"|"intermediate"|"advanced"), resources (array of {title, description, type ("article"|"tutorial"|"video"|"exercise"), durationMinutes, order}).
Include 5-8 resources.`;

  const response = await claudeClient.chat(
    [{ role: 'user', content: prompt }],
    { systemPrompt: 'Return only valid JSON.' },
  );

  let parsed: {
    title: string;
    description: string;
    level: string;
    resources: Array<{ title: string; description: string; type: string; durationMinutes: number; order: number }>;
  };

  try {
    parsed = JSON.parse(response.content);
  } catch {
    parsed = {
      title: `${role} Learning Path`,
      description: `Default learning path for ${role}`,
      level: 'beginner',
      resources: [
        { title: 'Getting Started with Oracle APEX', description: 'Introduction to APEX development', type: 'article', durationMinutes: 30, order: 1 },
      ],
    };
  }

  const resources: LearningResource[] = parsed.resources.map((r, i) => ({
    id: `generated-${i}`,
    title: r.title,
    description: r.description,
    type: r.type as LearningResource['type'],
    durationMinutes: r.durationMinutes,
    completed: false,
    order: r.order,
  }));

  return {
    id: 'generated',
    title: parsed.title,
    description: parsed.description,
    role,
    level: parsed.level as LearningPath['level'],
    resources,
    totalDurationMinutes: resources.reduce((sum, r) => sum + r.durationMinutes, 0),
    completedCount: 0,
    totalCount: resources.length,
    progressPercent: 0,
  };
}
