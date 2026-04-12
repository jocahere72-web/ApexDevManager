import type {
  TreeNode as TreeNodeData,
  ApexApplication,
  ApexPage,
  ApexRegion,
  ApexItem,
  ApexProcess,
  ApexDynamicAction,
  TreeNodeType,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function Field({ label, value }: { label: string; value: string | number | boolean | undefined }) {
  if (value === undefined || value === null) return null;
  return (
    <div className="detail-field-row">
      <span className="detail-field-label">{label}</span>
      <span className="detail-field-value">{String(value)}</span>
    </div>
  );
}

function MetadataSection({ lastModified, modifiedBy }: { lastModified?: string; modifiedBy?: string }) {
  if (!lastModified && !modifiedBy) return null;
  return (
    <>
      <div className="detail-section-label">Metadata</div>
      <Field label="Last Modified" value={lastModified} />
      <Field label="Modified By" value={modifiedBy} />
    </>
  );
}

const TYPE_LABELS: Record<TreeNodeType, string> = {
  workspace: 'Workspace',
  application: 'Application',
  page: 'Page',
  region: 'Region',
  item: 'Item',
  process: 'Process',
  dynamic_action: 'Dynamic Action',
};

// ---------------------------------------------------------------------------
// Per-type detail renderers
// ---------------------------------------------------------------------------

function ApplicationDetail({ data }: { data: ApexApplication }) {
  return (
    <>
      <div className="detail-section-label">Properties</div>
      <Field label="Application ID" value={data.applicationId} />
      <Field label="Name" value={data.name} />
      <Field label="Alias" value={data.alias} />
      <Field label="Version" value={data.version} />
      <Field label="Pages" value={data.pagesCount} />
      <MetadataSection lastModified={data.lastModified} modifiedBy={data.modifiedBy} />
    </>
  );
}

function PageDetail({ data }: { data: ApexPage }) {
  return (
    <>
      <div className="detail-section-label">Properties</div>
      <Field label="Page Number" value={data.pageNumber} />
      <Field label="Page Mode" value={data.pageMode} />
      <Field label="Template" value={data.templateName} />
      <Field label="Page Group" value={data.pageGroup} />
      <Field label="Title" value={data.title} />
      <Field label="Regions" value={data.regionsCount} />
      <MetadataSection lastModified={data.lastModified} modifiedBy={data.modifiedBy} />
    </>
  );
}

function RegionDetail({ data }: { data: ApexRegion }) {
  return (
    <>
      <div className="detail-section-label">Properties</div>
      <Field label="Type" value={data.regionType} />
      <Field label="Source" value={data.source} />
      <Field label="Position" value={data.displayPosition} />
      <Field label="Sequence" value={data.displaySequence} />
      <MetadataSection lastModified={data.lastModified} modifiedBy={data.modifiedBy} />
    </>
  );
}

function ItemDetail({ data }: { data: ApexItem }) {
  return (
    <>
      <div className="detail-section-label">Properties</div>
      <Field label="Type" value={data.itemType} />
      <Field label="Label" value={data.label} />
      <Field label="Name" value={data.name} />
      <Field label="Required" value={data.isRequired ? 'Yes' : 'No'} />
      <Field label="Sequence" value={data.displaySequence} />
      <MetadataSection lastModified={data.lastModified} modifiedBy={data.modifiedBy} />
    </>
  );
}

function ProcessDetail({ data }: { data: ApexProcess }) {
  return (
    <>
      <div className="detail-section-label">Properties</div>
      <Field label="Type" value={data.processType} />
      <Field label="Execution Point" value={data.executionPoint} />
      <Field label="Condition" value={data.conditionType} />
      <MetadataSection lastModified={data.lastModified} modifiedBy={data.modifiedBy} />
    </>
  );
}

function DynamicActionDetail({ data }: { data: ApexDynamicAction }) {
  return (
    <>
      <div className="detail-section-label">Properties</div>
      <Field label="Event" value={data.event} />
      <Field label="Triggering Element" value={data.triggeringElement} />
      <Field label="Condition" value={data.conditionType} />
      <Field label="Actions" value={data.actionCount} />
      <MetadataSection lastModified={data.lastModified} modifiedBy={data.modifiedBy} />
    </>
  );
}

// ---------------------------------------------------------------------------
// ComponentDetailPanel
// ---------------------------------------------------------------------------

export interface ComponentDetailPanelProps {
  selectedNode: TreeNodeData | null;
  onOpenInEditor?: (node: TreeNodeData) => void;
}

export function ComponentDetailPanel({ selectedNode, onOpenInEditor }: ComponentDetailPanelProps) {
  if (!selectedNode) {
    return (
      <div className="detail-panel detail-panel-empty">
        <p className="explorer-placeholder-text">
          Select a component to view its details.
        </p>
      </div>
    );
  }

  const nodeType = selectedNode.nodeType;

  const renderDetail = () => {
    if (!selectedNode.data) {
      return <p className="explorer-placeholder-text">No detail data available.</p>;
    }

    switch (nodeType) {
      case 'application':
        return <ApplicationDetail data={selectedNode.data as ApexApplication} />;
      case 'page':
        return <PageDetail data={selectedNode.data as ApexPage} />;
      case 'region':
        return <RegionDetail data={selectedNode.data as ApexRegion} />;
      case 'item':
        return <ItemDetail data={selectedNode.data as ApexItem} />;
      case 'process':
        return <ProcessDetail data={selectedNode.data as ApexProcess} />;
      case 'dynamic_action':
        return <DynamicActionDetail data={selectedNode.data as ApexDynamicAction} />;
      default:
        return <p className="explorer-placeholder-text">Unknown component type.</p>;
    }
  };

  return (
    <div className="detail-panel">
      {/* Header */}
      <div className="detail-panel-header">
        <span className="detail-panel-title">{selectedNode.label}</span>
        <span className="app-status-pill">{TYPE_LABELS[nodeType] ?? nodeType}</span>
      </div>

      {/* Body */}
      <div className="detail-panel-body">
        {renderDetail()}

        {/* Open in Editor */}
        {onOpenInEditor && (
          <button
            className="app-button app-button-primary detail-open-editor-btn"
            onClick={() => onOpenInEditor(selectedNode)}
          >
            Open in Editor
          </button>
        )}
      </div>
    </div>
  );
}

export default ComponentDetailPanel;
