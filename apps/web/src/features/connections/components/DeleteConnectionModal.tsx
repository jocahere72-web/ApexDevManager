import { type CSSProperties, useCallback, useEffect } from 'react';

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

interface DeleteConnectionModalProps {
  connectionName: string;
  open: boolean;
  onClose: () => void;
  onConfirm: () => void;
  isDeleting?: boolean;
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function DeleteConnectionModal({
  connectionName,
  open,
  onClose,
  onConfirm,
  isDeleting = false,
}: DeleteConnectionModalProps) {
  // Close on Escape key
  const handleKeyDown = useCallback(
    (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose();
    },
    [onClose],
  );

  useEffect(() => {
    if (!open) return;
    document.addEventListener('keydown', handleKeyDown);
    return () => document.removeEventListener('keydown', handleKeyDown);
  }, [open, handleKeyDown]);

  if (!open) return null;

  const overlayStyle: CSSProperties = {
    position: 'fixed',
    inset: 0,
    backgroundColor: 'rgba(0,0,0,0.5)',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    zIndex: 100,
  };

  const dialogStyle: CSSProperties = {
    backgroundColor: '#ffffff',
    borderRadius: '0.5rem',
    padding: '1.5rem',
    width: '100%',
    maxWidth: '28rem',
    boxShadow: '0 20px 25px -5px rgba(0,0,0,0.1)',
  };

  const titleStyle: CSSProperties = {
    fontSize: '1.125rem',
    fontWeight: 600,
    margin: '0 0 0.75rem',
    color: '#111827',
  };

  const bodyStyle: CSSProperties = {
    fontSize: '0.875rem',
    color: '#4b5563',
    lineHeight: 1.6,
    marginBottom: '1.25rem',
  };

  const noteStyle: CSSProperties = {
    fontSize: '0.8125rem',
    color: '#6b7280',
    backgroundColor: '#f9fafb',
    padding: '0.625rem 0.75rem',
    borderRadius: '0.375rem',
    marginTop: '0.75rem',
  };

  const footerStyle: CSSProperties = {
    display: 'flex',
    justifyContent: 'flex-end',
    gap: '0.75rem',
  };

  const cancelBtnStyle: CSSProperties = {
    padding: '0.5rem 1rem',
    fontSize: '0.875rem',
    fontWeight: 500,
    border: '1px solid #d1d5db',
    borderRadius: '0.375rem',
    backgroundColor: '#ffffff',
    color: '#374151',
    cursor: 'pointer',
  };

  const deleteBtnStyle: CSSProperties = {
    padding: '0.5rem 1rem',
    fontSize: '0.875rem',
    fontWeight: 500,
    border: 'none',
    borderRadius: '0.375rem',
    backgroundColor: '#dc2626',
    color: '#ffffff',
    cursor: isDeleting ? 'not-allowed' : 'pointer',
    opacity: isDeleting ? 0.6 : 1,
  };

  return (
    <div style={overlayStyle} onClick={onClose} role="presentation">
      <div
        style={dialogStyle}
        onClick={(e) => e.stopPropagation()}
        role="dialog"
        aria-modal="true"
        aria-labelledby="delete-modal-title"
      >
        <h2 id="delete-modal-title" style={titleStyle}>
          Delete Connection
        </h2>

        <div style={bodyStyle}>
          <p style={{ margin: 0 }}>
            Are you sure you want to delete{' '}
            <strong>{connectionName}</strong>?
          </p>
          <div style={noteStyle}>
            This performs a soft-delete. The connection will be marked as inactive and can
            be restored by an administrator within 30 days.
          </div>
        </div>

        <div style={footerStyle}>
          <button
            type="button"
            style={cancelBtnStyle}
            onClick={onClose}
            disabled={isDeleting}
          >
            Cancel
          </button>
          <button
            type="button"
            style={deleteBtnStyle}
            onClick={onConfirm}
            disabled={isDeleting}
          >
            {isDeleting ? 'Deleting...' : 'Delete'}
          </button>
        </div>
      </div>
    </div>
  );
}
