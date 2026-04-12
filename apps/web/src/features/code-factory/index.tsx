import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { CodeFactoryWorkspace } from './components/CodeFactoryWorkspace';

export function CodeFactoryPage() {
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Code Factory"
        title="Generation Workspace"
        description="Create, inspect, and refine implementation outputs."
      />
      <CodeFactoryWorkspace />
    </AppPage>
  );
}

export default CodeFactoryPage;
