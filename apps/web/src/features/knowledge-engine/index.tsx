import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { KnowledgeSearch } from './components/KnowledgeSearch';

export function KnowledgeEnginePage() {
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Knowledge"
        title="Knowledge Engine"
        description="Search project knowledge, guidance, and implementation references."
      />
      <KnowledgeSearch />
    </AppPage>
  );
}

export default KnowledgeEnginePage;
