import { useSearchParams } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import SchemaExplorer from './components/SchemaExplorer';

/**
 * Schema Inspector feature page.
 *
 * Routes:
 *   /schema-inspector          - Schema explorer with optional ?connectionId param
 */
export default function SchemaInspectorPage() {
  const { t } = useTranslation();
  const [searchParams] = useSearchParams();
  const connectionId = searchParams.get('connectionId') ?? undefined;

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('schemaInspector.eyebrow')}
        title={t('schemaInspector.title')}
        description={t('schemaInspector.description')}
      />
      <SchemaExplorer connectionId={connectionId} />
    </AppPage>
  );
}
