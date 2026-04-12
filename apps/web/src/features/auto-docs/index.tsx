import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import DocsGenerator from './components/DocsGenerator';

/**
 * Auto Docs feature page.
 *
 * Routes:
 *   /auto-docs - Documentation generator with preview and export
 */
export default function AutoDocsPage() {
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Documentation"
        title="Auto Docs"
        description="Generate and review documentation from APEX metadata and project context."
      />
      <DocsGenerator />
    </AppPage>
  );
}
