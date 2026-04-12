import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { CostDashboard } from './components/CostDashboard';

export function UsageIntelligencePage() {
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Usage Intelligence"
        title="Cost Dashboard"
        description="Track usage, spend, and operational patterns across the platform."
      />
      <CostDashboard />
    </AppPage>
  );
}

export default UsageIntelligencePage;
