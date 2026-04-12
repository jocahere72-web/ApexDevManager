import { useSearchParams } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
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
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('dependencies.eyebrow')}
        title={t('dependencies.title')}
        description={t('dependencies.description')}
      />
      <DependencyGraph connectionId={connectionId} />
    </AppPage>
  );
}
