import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import DocsGenerator from './components/DocsGenerator';

/**
 * Auto Docs feature page.
 *
 * Routes:
 *   /auto-docs - Documentation generator with preview and export
 */
export default function AutoDocsPage() {
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('autoDocs.eyebrow')}
        title={t('autoDocs.title')}
        description={t('autoDocs.description')}
      />
      <DocsGenerator />
    </AppPage>
  );
}
