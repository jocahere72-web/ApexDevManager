import { useState, useEffect, useCallback, type CSSProperties } from 'react';
import type {
  MarketplaceItem,
  ItemCategory,
  PublishRequest,
  RateItemRequest,
  MarketplaceSearchParams,
} from '@apex-dev-manager/shared-types';
import * as marketplaceApi from '@/services/marketplace.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  height: '100%',
  overflowY: 'auto',
};

const headerStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  marginBottom: '1.5rem',
};

const searchBarStyle: CSSProperties = {
  display: 'flex',
  gap: '0.5rem',
  marginBottom: '1.5rem',
  flexWrap: 'wrap' as const,
};

const inputStyle: CSSProperties = {
  padding: '0.5rem 0.75rem',
  fontSize: '0.875rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  outline: 'none',
};

const buttonStyle: CSSProperties = {
  padding: '0.5rem 1rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  backgroundColor: '#2563eb',
  color: '#fff',
};

const secondaryButton: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#f3f4f6',
  color: '#374151',
  border: '1px solid #d1d5db',
};

const gridStyle: CSSProperties = {
  display: 'grid',
  gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))',
  gap: '1rem',
};

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1.25rem',
  backgroundColor: '#fff',
  cursor: 'pointer',
  transition: 'box-shadow 0.15s, border-color 0.15s',
};

const categoryBadge: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.5rem',
  borderRadius: '0.25rem',
  fontSize: '0.6875rem',
  fontWeight: 600,
  backgroundColor: '#dbeafe',
  color: '#1e40af',
};

const tagStyle: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.375rem',
  borderRadius: '0.25rem',
  fontSize: '0.625rem',
  backgroundColor: '#f3f4f6',
  color: '#6b7280',
  marginRight: '0.25rem',
};

const starStyle: CSSProperties = {
  color: '#eab308',
  fontSize: '0.875rem',
};

const modalOverlay: CSSProperties = {
  position: 'fixed' as const,
  inset: 0,
  backgroundColor: 'rgba(0, 0, 0, 0.5)',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  zIndex: 1000,
};

const modalContent: CSSProperties = {
  backgroundColor: '#fff',
  borderRadius: '0.75rem',
  padding: '1.5rem',
  maxWidth: 600,
  width: '90%',
  maxHeight: '80vh',
  overflowY: 'auto' as const,
};

const categories: ItemCategory[] = ['template', 'plugin', 'theme', 'component', 'workflow', 'integration', 'utility'];

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function MarketplaceGrid() {
  const [items, setItems] = useState<MarketplaceItem[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Search/filter state
  const [query, setQuery] = useState('');
  const [category, setCategory] = useState<ItemCategory | ''>('');
  const [sortBy, setSortBy] = useState<'newest' | 'downloads' | 'rating' | 'price'>('newest');
  const [minRating, setMinRating] = useState<number | undefined>(undefined);

  // Modal state
  const [selectedItem, setSelectedItem] = useState<MarketplaceItem | null>(null);
  const [showPublishForm, setShowPublishForm] = useState(false);

  // Publish form state
  const [pubName, setPubName] = useState('');
  const [pubDescription, setPubDescription] = useState('');
  const [pubCategory, setPubCategory] = useState<ItemCategory>('component');
  const [pubVersion, setPubVersion] = useState('1.0.0');
  const [pubContent, setPubContent] = useState('');
  const [pubPrice, setPubPrice] = useState(0);

  // Rating state
  const [ratingValue, setRatingValue] = useState(5);
  const [ratingReview, setRatingReview] = useState('');

  useEffect(() => {
    loadItems();
  }, [category, sortBy, minRating]);

  const loadItems = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const params: MarketplaceSearchParams = {
        query: query || undefined,
        category: category || undefined,
        sortBy,
        minRating,
        limit: 50,
      };
      const { items: data, total: t } = await marketplaceApi.listItems(params);
      setItems(data);
      setTotal(t);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setLoading(false);
    }
  }, [query, category, sortBy, minRating]);

  const handleSearch = useCallback(() => {
    loadItems();
  }, [loadItems]);

  const handlePublish = useCallback(async () => {
    if (!pubName || !pubDescription || !pubContent) return;
    setError(null);
    try {
      await marketplaceApi.publishItem({
        name: pubName,
        description: pubDescription,
        category: pubCategory,
        version: pubVersion,
        price: pubPrice,
        content: pubContent,
      });
      setShowPublishForm(false);
      setPubName('');
      setPubDescription('');
      setPubContent('');
      await loadItems();
    } catch (err) {
      setError((err as Error).message);
    }
  }, [pubName, pubDescription, pubCategory, pubVersion, pubPrice, pubContent, loadItems]);

  const handleDownload = useCallback(async (itemId: string) => {
    try {
      const download = await marketplaceApi.downloadItem(itemId);
      const blob = new Blob([download.content], { type: 'application/octet-stream' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = download.filename;
      a.click();
      URL.revokeObjectURL(url);
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  const handleRate = useCallback(async (itemId: string) => {
    try {
      await marketplaceApi.rateItem(itemId, { rating: ratingValue, review: ratingReview || undefined });
      setRatingReview('');
      await loadItems();
    } catch (err) {
      setError((err as Error).message);
    }
  }, [ratingValue, ratingReview, loadItems]);

  const handleInstall = useCallback(async (itemId: string) => {
    try {
      const result = await marketplaceApi.installItem(itemId, 'default');
      alert(result.message);
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  const renderStars = (rating: number) => {
    const stars: JSX.Element[] = [];
    for (let i = 1; i <= 5; i++) {
      stars.push(
        <span key={i} style={{ ...starStyle, opacity: i <= Math.round(rating) ? 1 : 0.3 }}>
          &#9733;
        </span>,
      );
    }
    return stars;
  };

  return (
    <div style={containerStyle}>
      {/* Header */}
      <div style={headerStyle}>
        <h2 style={{ fontSize: '1.25rem', fontWeight: 600, color: '#111827' }}>Marketplace</h2>
        <button type="button" style={buttonStyle} onClick={() => setShowPublishForm(!showPublishForm)}>
          {showPublishForm ? 'Cancel' : 'Publish Item'}
        </button>
      </div>

      {error && (
        <div style={{ padding: '0.75rem', backgroundColor: '#fef2f2', border: '1px solid #fecaca', borderRadius: '0.375rem', color: '#991b1b', marginBottom: '1rem', fontSize: '0.875rem' }}>
          {error}
        </div>
      )}

      {/* Search & Filters */}
      <div style={searchBarStyle}>
        <input
          type="text"
          style={{ ...inputStyle, flex: 1, minWidth: 200 }}
          placeholder="Search marketplace..."
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          onKeyDown={(e) => e.key === 'Enter' && handleSearch()}
        />
        <select style={{ ...inputStyle, minWidth: 140 }} value={category} onChange={(e) => setCategory(e.target.value as ItemCategory | '')}>
          <option value="">All Categories</option>
          {categories.map((c) => (
            <option key={c} value={c}>{c}</option>
          ))}
        </select>
        <select style={{ ...inputStyle, minWidth: 120 }} value={sortBy} onChange={(e) => setSortBy(e.target.value as any)}>
          <option value="newest">Newest</option>
          <option value="downloads">Most Downloaded</option>
          <option value="rating">Highest Rated</option>
          <option value="price">Lowest Price</option>
        </select>
        <button type="button" style={buttonStyle} onClick={handleSearch}>Search</button>
      </div>

      {/* Publish form */}
      {showPublishForm && (
        <div style={{ ...cardStyle, marginBottom: '1.5rem', border: '1px solid #2563eb', padding: '1.25rem' }}>
          <div style={{ fontWeight: 600, marginBottom: '0.75rem' }}>Publish to Marketplace</div>
          <input type="text" style={{ ...inputStyle, width: '100%' }} placeholder="Item name *" value={pubName} onChange={(e) => setPubName(e.target.value)} />
          <textarea style={{ ...inputStyle, minHeight: 80, width: '100%', resize: 'vertical' as const }} placeholder="Description *" value={pubDescription} onChange={(e) => setPubDescription(e.target.value)} />
          <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '0.5rem' }}>
            <select style={{ ...inputStyle, flex: 1 }} value={pubCategory} onChange={(e) => setPubCategory(e.target.value as ItemCategory)}>
              {categories.map((c) => <option key={c} value={c}>{c}</option>)}
            </select>
            <input type="text" style={{ ...inputStyle, width: 100 }} placeholder="Version" value={pubVersion} onChange={(e) => setPubVersion(e.target.value)} />
            <input type="number" style={{ ...inputStyle, width: 100 }} placeholder="Price" value={pubPrice} onChange={(e) => setPubPrice(Number(e.target.value))} min={0} step={0.01} />
          </div>
          <textarea style={{ ...inputStyle, minHeight: 100, width: '100%', resize: 'vertical' as const, fontFamily: 'monospace', fontSize: '0.8125rem' }} placeholder="Content (code/config) *" value={pubContent} onChange={(e) => setPubContent(e.target.value)} />
          <button type="button" style={buttonStyle} onClick={handlePublish} disabled={!pubName || !pubDescription || !pubContent}>Publish</button>
        </div>
      )}

      {/* Results count */}
      <div style={{ fontSize: '0.8125rem', color: '#6b7280', marginBottom: '0.75rem' }}>
        {total} items found
      </div>

      {/* Item grid */}
      {loading ? (
        <div style={{ textAlign: 'center', padding: '3rem', color: '#6b7280' }}>Loading marketplace...</div>
      ) : (
        <div style={gridStyle}>
          {items.map((item) => (
            <div key={item.id} style={cardStyle} onClick={() => setSelectedItem(item)}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '0.5rem' }}>
                <div style={{ fontWeight: 600, fontSize: '0.9375rem' }}>{item.name}</div>
                <span style={categoryBadge}>{item.category}</span>
              </div>
              <div style={{ fontSize: '0.8125rem', color: '#6b7280', marginBottom: '0.75rem', lineHeight: 1.4, display: '-webkit-box', WebkitLineClamp: 2, WebkitBoxOrient: 'vertical', overflow: 'hidden' }}>
                {item.description}
              </div>
              <div style={{ display: 'flex', gap: '0.25rem', marginBottom: '0.5rem', flexWrap: 'wrap' }}>
                {item.tags.slice(0, 4).map((tag) => <span key={tag} style={tagStyle}>{tag}</span>)}
              </div>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', fontSize: '0.8125rem' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.25rem' }}>
                  {renderStars(item.averageRating)}
                  <span style={{ color: '#6b7280', marginLeft: '0.25rem' }}>({item.ratingCount})</span>
                </div>
                <div style={{ display: 'flex', gap: '0.75rem', color: '#6b7280' }}>
                  <span>{item.downloadCount.toLocaleString()} downloads</span>
                  <span style={{ fontWeight: 600, color: item.price === 0 ? '#22c55e' : '#111827' }}>
                    {item.price === 0 ? 'Free' : `$${item.price.toFixed(2)}`}
                  </span>
                </div>
              </div>
              <div style={{ fontSize: '0.6875rem', color: '#9ca3af', marginTop: '0.375rem' }}>
                by {item.publisherName} | v{item.version}
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Item detail modal */}
      {selectedItem && (
        <div style={modalOverlay} onClick={() => setSelectedItem(null)}>
          <div style={modalContent} onClick={(e) => e.stopPropagation()}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1rem' }}>
              <div>
                <h3 style={{ fontSize: '1.25rem', fontWeight: 600, marginBottom: '0.25rem' }}>{selectedItem.name}</h3>
                <div style={{ fontSize: '0.8125rem', color: '#6b7280' }}>by {selectedItem.publisherName} | v{selectedItem.version}</div>
              </div>
              <button type="button" style={{ border: 'none', background: 'none', fontSize: '1.25rem', cursor: 'pointer', color: '#6b7280' }} onClick={() => setSelectedItem(null)}>
                &#10005;
              </button>
            </div>

            <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '1rem' }}>
              <span style={categoryBadge}>{selectedItem.category}</span>
              <span style={{ ...categoryBadge, backgroundColor: '#f3f4f6', color: '#374151' }}>{selectedItem.downloadCount.toLocaleString()} downloads</span>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.125rem' }}>
                {renderStars(selectedItem.averageRating)}
              </div>
            </div>

            <p style={{ fontSize: '0.875rem', color: '#374151', marginBottom: '1rem', lineHeight: 1.6 }}>
              {selectedItem.longDescription || selectedItem.description}
            </p>

            <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '1rem' }}>
              <button type="button" style={buttonStyle} onClick={() => handleDownload(selectedItem.id)}>Download</button>
              <button type="button" style={{ ...buttonStyle, backgroundColor: '#22c55e' }} onClick={() => handleInstall(selectedItem.id)}>Install</button>
            </div>

            {/* Rating */}
            <div style={{ borderTop: '1px solid #e5e7eb', paddingTop: '1rem' }}>
              <div style={{ fontWeight: 600, marginBottom: '0.5rem' }}>Rate this item</div>
              <div style={{ display: 'flex', gap: '0.5rem', alignItems: 'center', marginBottom: '0.5rem' }}>
                {[1, 2, 3, 4, 5].map((v) => (
                  <button key={v} type="button" style={{ ...starStyle, border: 'none', background: 'none', cursor: 'pointer', fontSize: '1.25rem', opacity: v <= ratingValue ? 1 : 0.3 }} onClick={() => setRatingValue(v)}>
                    &#9733;
                  </button>
                ))}
              </div>
              <textarea style={{ ...inputStyle, width: '100%', minHeight: 60 }} placeholder="Write a review (optional)" value={ratingReview} onChange={(e) => setRatingReview(e.target.value)} />
              <button type="button" style={secondaryButton} onClick={() => handleRate(selectedItem.id)}>Submit Rating</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default MarketplaceGrid;
