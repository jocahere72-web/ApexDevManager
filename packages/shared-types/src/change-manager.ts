// ---------------------------------------------------------------------------
// Change Manager types (M6)
// ---------------------------------------------------------------------------

export type ChangeSetStatus = 'draft' | 'review' | 'approved' | 'applied' | 'rejected';

export interface ChangeSetObject {
  objectType: string;
  objectName: string;
  schema: string;
  action: 'create' | 'alter' | 'drop';
  ddl: string;
  originalDdl?: string;
}

export interface ConflictDetail {
  objectType: string;
  objectName: string;
  field: string;
  localValue: string;
  remoteValue: string;
  severity: 'low' | 'medium' | 'high';
}

export interface ChangeSet {
  id: string;
  tenantId: string;
  connectionId: string;
  name: string;
  description: string | null;
  status: ChangeSetStatus;
  objects: ChangeSetObject[];
  conflictCount: number;
  createdBy: string | null;
  approvedBy: string | null;
  appliedAt: string | null;
  createdAt: string;
  updatedAt: string;
}

// ---------------------------------------------------------------------------
// Schema Inspector types (M7)
// ---------------------------------------------------------------------------

export interface SchemaColumn {
  name: string;
  dataType: string;
  nullable: boolean;
  defaultValue: string | null;
  isPrimaryKey: boolean;
  isForeignKey: boolean;
  referencesTable?: string;
  referencesColumn?: string;
  comments?: string;
}

export interface SchemaIndex {
  name: string;
  columns: string[];
  isUnique: boolean;
  indexType: string;
  tablespace?: string;
}

export interface SchemaTable {
  name: string;
  schema: string;
  columns: SchemaColumn[];
  indexes: SchemaIndex[];
  rowCount?: number;
  comments?: string;
  createdAt?: string;
}

export interface SchemaSnapshot {
  id: string;
  tenantId: string;
  connectionId: string;
  snapshotData: {
    tables: SchemaTable[];
    views: SchemaTable[];
  };
  tablesCount: number;
  viewsCount: number;
  indexesCount: number;
  createdBy: string | null;
  createdAt: string;
}

export interface DDLScript {
  objectType: string;
  objectName: string;
  schema: string;
  ddl: string;
}

export interface SchemaDiff {
  added: SchemaTable[];
  removed: SchemaTable[];
  modified: {
    table: string;
    addedColumns: SchemaColumn[];
    removedColumns: SchemaColumn[];
    modifiedColumns: { column: string; before: SchemaColumn; after: SchemaColumn }[];
    addedIndexes: SchemaIndex[];
    removedIndexes: SchemaIndex[];
  }[];
}
