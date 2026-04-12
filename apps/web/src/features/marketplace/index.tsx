import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { MarketplaceGrid } from './components/MarketplaceGrid';

export function MarketplacePage() {
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Marketplace"
        title="Templates and Extensions"
        description="Browse reusable accelerators for APEX delivery."
      />
      <MarketplaceGrid />
    </AppPage>
  );
}

export default MarketplacePage;
