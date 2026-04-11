import type { CSSProperties } from 'react';
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
// Styles
// ---------------------------------------------------------------------------

const panelStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  height: '100%',
  backgroundColor: '#ffffff',
  borderLeft: '1px solid #e5e7eb',
  overflow: 'hidden',
};

const headerStyle: CSSProperties = {
  padding: '0.75rem 1rem',
  borderBottom: '1px solid #e5e7eb',
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
};

const titleStyle: CSSProperties = {
  fontSize: '0.875rem',
  fontWeight: 600,
  color: '#111827',
  overflow: 'hidden',
  textOverflow: 'ellipsis',
  whiteSpace: 'nowrap',
};

const badgeStyle: CSSProperties = {
  fontSize: '0.625rem',
  fontWeight: 500,
  padding: '2px 8px',
  borderRadius: 9999,
  backgroundColor: '#e5e7eb',
  color: '#374151',
  textTransform: 'capitalize',
  flexShrink: 0,
};

const bodyStyle: CSSProperties = {
  flex: 1,
  overflowY: 'auto',
  padding: '0.75rem 1rem',
};

const sectionLabelStyle: CSSProperties = {
  fontSize: '0.6875rem',
  fontWeight: 600,
  color: '#6b7280',
  textTransform: 'uppercase',
  letterSpacing: '0.05em',
  marginBottom: 6,
  marginTop: 16,
};

const fieldRowStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'flex-start',
  padding: '4px 0',
  fontSize: '0.8125rem',
};

const fieldLabelStyle: CSSProperties = {
  color: '#6b7280',
  flexShrink: 0,
  marginRight: 12,
};

const fieldValueStyle: CSSProperties = {
  color: '#111827',
  textAlign: 'right',
  wordBreak: 'break-word',
};

const buttonStyle: CSSProperties = {
  marginTop: 16,
  padding: '0.375rem 0.75rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  color: '#ffffff',
  backgroundColor: '#3b82f6',
  border: 'none',
  borderRadius: 6,
  cursor: 'pointer',
  width: '100%',
};

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function Field({ label, value }: { label: string; value: string | number | boolean | undefined }) {
  if (value === undefined || value === null) return null;
  return (
    <div style={fieldRowStyle}>
      <span style={fieldLabelStyle}>{label}</span>
      <span style={fieldValueStyle}>{String(value)}</span>
    </div>
  );
}

function MetadataSection({ lastModified, modifiedBy }: { lastModified?: string; modifiedBy?: string }) {
  if (!lastModified && !modifiedBy) return null;
  return (
    <>
      <div style={sectionLabelStyle}>Metadata</div>
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
      <div style={sectionLabelStyle}>Properties</div>
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
      <div style={sectionLabelStyle}>Properties</div>
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
      <div style={sectionLabelStyle}>Properties</div>
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
      <div style={sectionLabelStyle}>Properties</div>
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
      <div style={sectionLabelStyle}>Properties</div>
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
      <div style={sectionLabelStyle}>Properties</div>
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
      <div style={{ ...panelStyle, alignItems: 'center', justifyContent: 'center' }}>
        <p style={{ color: '#9ca3af', fontSize: '0.8125rem' }}>
          Select a component to view its details.
        </p>
      </div>
    );
  }

  const nodeType = selectedNode.nodeType;

  const renderDetail = () => {
    if (!selectedNode.data) {
      return <p style={{ color: '#9ca3af', fontSize: '0.8125rem' }}>No detail data available.</p>;
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
        return <p style={{ color: '#9ca3af', fontSize: '0.8125rem' }}>Unknown component type.</p>;
    }
  };

  return (
    <div style={panelStyle}>
      {/* Header */}
      <div style={headerStyle}>
        <span style={titleStyle}>{selectedNode.label}</span>
        <span style={badgeStyle}>{TYPE_LABELS[nodeType] ?? nodeType}</span>
      </div>

      {/* Body */}
      <div style={bodyStyle}>
        {renderDetail()}

        {/* Open in Editor */}
        {onOpenInEditor && (
          <button style={buttonStyle} onClick={() => onOpenInEditor(selectedNode)}>
            Open in Editor
          </button>
        )}
      </div>
    </div>
  );
}

export default ComponentDetailPanel;
