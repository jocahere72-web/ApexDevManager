import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { MarketplaceGrid } from './components/MarketplaceGrid';

export function MarketplacePage() {
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('marketplace.eyebrow')}
        title={t('marketplace.title')}
        description={t('marketplace.description')}
      />
      <MarketplaceGrid />
    </AppPage>
  );
}

export default MarketplacePage;
