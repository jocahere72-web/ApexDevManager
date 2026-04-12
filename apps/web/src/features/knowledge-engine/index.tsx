import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { KnowledgeSearch } from './components/KnowledgeSearch';

export function KnowledgeEnginePage() {
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('knowledge.eyebrow')}
        title={t('knowledge.title')}
        description={t('knowledge.description')}
      />
      <KnowledgeSearch />
    </AppPage>
  );
}

export default KnowledgeEnginePage;
