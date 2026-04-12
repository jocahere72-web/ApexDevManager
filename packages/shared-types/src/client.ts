export interface Client {
  id: string;
  tenantId: string;
  name: string;
  code: string;
  description?: string;
  connectionId?: string;
  appId?: number;
  contactName?: string;
  contactEmail?: string;
  isActive: boolean;
  createdBy?: string;
  createdAt: string;
  updatedAt: string;
}

export interface CreateClientRequest {
  name: string;
  code: string;
  description?: string;
  connectionId?: string;
  appId?: number;
  contactName?: string;
  contactEmail?: string;
}

export interface UpdateClientRequest {
  name?: string;
  description?: string;
  connectionId?: string | null;
  appId?: number | null;
  contactName?: string | null;
  contactEmail?: string | null;
}
