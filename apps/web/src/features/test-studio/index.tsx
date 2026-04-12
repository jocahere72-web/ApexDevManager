import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { TestSuiteManager } from './components/TestSuiteManager';

export function TestStudioPage() {
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Quality"
        title="Test Studio"
        description="Manage test suites and execution readiness."
      />
      <TestSuiteManager />
    </AppPage>
  );
}

export default TestStudioPage;
