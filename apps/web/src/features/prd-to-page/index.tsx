import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { PageGenerator } from './components/PageGenerator';

// ---------------------------------------------------------------------------
// PRDToPagePage
// ---------------------------------------------------------------------------

export function PRDToPagePage() {
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="PRD to Page"
        title="Page Generator"
        description="Turn approved requirements into APEX page structure and implementation notes."
      />
      <PageGenerator />
    </AppPage>
  );
}

export default PRDToPagePage;
