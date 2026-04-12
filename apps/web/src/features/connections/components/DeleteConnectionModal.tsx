import { useCallback, useEffect } from 'react';

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

  return (
    <div className="app-modal-backdrop" onClick={onClose} role="presentation">
      <div
        className="app-modal"
        onClick={(e) => e.stopPropagation()}
        role="dialog"
        aria-modal="true"
        aria-labelledby="delete-modal-title"
      >
        <h2 id="delete-modal-title" className="app-card-title conn-modal-title">
          Delete Connection
        </h2>

        <div className="conn-modal-body">
          <p className="conn-modal-text">
            Are you sure you want to delete{' '}
            <strong>{connectionName}</strong>?
          </p>
          <div className="app-alert conn-modal-alert">
            This performs a soft-delete. The connection will be marked as inactive and can
            be restored by an administrator within 30 days.
          </div>
        </div>

        <div className="app-toolbar conn-modal-actions">
          <button
            type="button"
            className="app-button"
            onClick={onClose}
            disabled={isDeleting}
          >
            Cancel
          </button>
          <button
            type="button"
            className={`app-button conn-button-danger${isDeleting ? ' conn-button-disabled' : ''}`}
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
