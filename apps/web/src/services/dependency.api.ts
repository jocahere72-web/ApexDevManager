import apiClient from '../lib/api-client';
import type {
  DependencyGraph,
  ImpactAssessment,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Get dependency graph for a specific object
// ---------------------------------------------------------------------------

export async function getDependencyGraph(
  connectionId: string,
  objectType: string,
  objectId: string,
): Promise<DependencyGraph> {
  const { data } = await apiClient.get<{ data: DependencyGraph }>(
    `/dependencies/graph/${connectionId}/${objectType}/${objectId}`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Get impact assessment
// ---------------------------------------------------------------------------

export async function getImpactAssessment(
  connectionId: string,
  objectType: string,
  objectId: string,
): Promise<ImpactAssessment> {
  const { data } = await apiClient.get<{ data: ImpactAssessment }>(
    `/dependencies/impact/${connectionId}/${objectType}/${objectId}`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Full dependency analysis for a connection
// ---------------------------------------------------------------------------

export async function analyzeDependencies(
  connectionId: string,
): Promise<DependencyGraph> {
  const { data } = await apiClient.post<{ data: DependencyGraph }>(
    `/dependencies/analyze/${connectionId}`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Export graph
// ---------------------------------------------------------------------------

export async function exportGraph(
  graph: DependencyGraph,
  format: 'dot' | 'mermaid' = 'mermaid',
): Promise<string> {
  const { data } = await apiClient.post<{ data: { content: string } }>(
    '/dependencies/export',
    { graph, format },
  );
  return data.data.content;
}
