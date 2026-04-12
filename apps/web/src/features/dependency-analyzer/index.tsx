import { useSearchParams } from 'react-router-dom';
import DependencyGraph from './components/DependencyGraph';

/**
 * Dependency Analyzer feature page.
 *
 * Routes:
 *   /dependencies - Interactive dependency graph with impact assessment
 */
export default function DependencyAnalyzerPage() {
  const [searchParams] = useSearchParams();
  const connectionId = searchParams.get('connectionId') ?? undefined;

  return <DependencyGraph connectionId={connectionId} />;
}
