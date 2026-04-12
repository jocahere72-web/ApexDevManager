import { useSearchParams } from 'react-router-dom';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
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

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Dependency Analyzer"
        title="Impact Graph"
        description="Map dependencies and review downstream impact before changes ship."
      />
      <DependencyGraph connectionId={connectionId} />
    </AppPage>
  );
}
