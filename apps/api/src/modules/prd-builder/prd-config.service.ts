import { tenantQuery } from '../../lib/tenant-db.js';
import type { PoolClient } from 'pg';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

export interface PRDConfig {
  id: string;
  tenantId: string;
  name: string;
  exampleDocument: string;
  generationPrompt: string;
  extractionPrompt: string | null;
  validationPrompt: string | null;
  isDefault: boolean;
  createdBy: string | null;
  createdAt: string;
  updatedAt: string;
}

export interface CreateConfigInput {
  name: string;
  exampleDocument: string;
  generationPrompt: string;
  extractionPrompt?: string | null;
  validationPrompt?: string | null;
}

export interface UpdateConfigInput {
  name?: string;
  exampleDocument?: string;
  generationPrompt?: string;
  extractionPrompt?: string | null;
  validationPrompt?: string | null;
}

// ---------------------------------------------------------------------------
// Row mapper
// ---------------------------------------------------------------------------

function rowToConfig(row: Record<string, unknown>): PRDConfig {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    name: row.name as string,
    exampleDocument: row.example_document as string,
    generationPrompt: row.generation_prompt as string,
    extractionPrompt: (row.extraction_prompt as string) ?? null,
    validationPrompt: (row.validation_prompt as string) ?? null,
    isDefault: row.is_default as boolean,
    createdBy: (row.created_by as string) ?? null,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

// ---------------------------------------------------------------------------
// CRUD
// ---------------------------------------------------------------------------

/**
 * Create a new PRD config. If it is the first config for the tenant,
 * it is automatically set as the default.
 */
export async function createConfig(
  tenantId: string,
  data: CreateConfigInput,
  actorId: string | null,
  client?: PoolClient,
): Promise<PRDConfig> {
  // Check if any config already exists for this tenant
  const existing = await tenantQuery(client,
    'SELECT COUNT(*)::int AS cnt FROM prd_configs WHERE tenant_id = $1',
    [tenantId],
  );
  const isFirst = (existing.rows[0].cnt as number) === 0;

  const result = await tenantQuery(client,
    `INSERT INTO prd_configs (tenant_id, name, example_document, generation_prompt, extraction_prompt, validation_prompt, is_default, created_by)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
     RETURNING *`,
    [
      tenantId,
      data.name,
      data.exampleDocument,
      data.generationPrompt,
      data.extractionPrompt ?? null,
      data.validationPrompt ?? null,
      isFirst, // first config becomes the default
      actorId,
    ],
  );

  logger.info({ configId: result.rows[0].id, tenantId, isDefault: isFirst }, 'PRD config created');
  return rowToConfig(result.rows[0]);
}

/**
 * List all PRD configs for a tenant.
 */
export async function listConfigs(
  tenantId: string,
  client?: PoolClient,
): Promise<PRDConfig[]> {
  const result = await tenantQuery(client,
    `SELECT * FROM prd_configs WHERE tenant_id = $1 ORDER BY is_default DESC, name ASC`,
    [tenantId],
  );
  return result.rows.map(rowToConfig);
}

/**
 * Get a single PRD config by id.
 */
export async function getConfig(
  tenantId: string,
  id: string,
  client?: PoolClient,
): Promise<PRDConfig> {
  const result = await tenantQuery(client,
    `SELECT * FROM prd_configs WHERE id = $1 AND tenant_id = $2`,
    [id, tenantId],
  );
  if (result.rowCount === 0) {
    throw new NotFoundError('PRD config not found');
  }
  return rowToConfig(result.rows[0]);
}

/**
 * Get the default PRD config for a tenant.
 */
export async function getDefaultConfig(
  tenantId: string,
  client?: PoolClient,
): Promise<PRDConfig | null> {
  const result = await tenantQuery(client,
    `SELECT * FROM prd_configs WHERE tenant_id = $1 AND is_default = TRUE LIMIT 1`,
    [tenantId],
  );
  if (result.rowCount === 0) {
    return null;
  }
  return rowToConfig(result.rows[0]);
}

/**
 * Update an existing PRD config.
 */
export async function updateConfig(
  tenantId: string,
  id: string,
  data: UpdateConfigInput,
  _actorId: string | null,
  client?: PoolClient,
): Promise<PRDConfig> {
  // Verify it exists
  const existing = await tenantQuery(client,
    `SELECT * FROM prd_configs WHERE id = $1 AND tenant_id = $2`,
    [id, tenantId],
  );
  if (existing.rowCount === 0) {
    throw new NotFoundError('PRD config not found');
  }

  const setClauses: string[] = [];
  const params: unknown[] = [];
  let idx = 1;

  if (data.name !== undefined) {
    setClauses.push(`name = $${idx++}`);
    params.push(data.name);
  }
  if (data.exampleDocument !== undefined) {
    setClauses.push(`example_document = $${idx++}`);
    params.push(data.exampleDocument);
  }
  if (data.generationPrompt !== undefined) {
    setClauses.push(`generation_prompt = $${idx++}`);
    params.push(data.generationPrompt);
  }
  if (data.extractionPrompt !== undefined) {
    setClauses.push(`extraction_prompt = $${idx++}`);
    params.push(data.extractionPrompt);
  }
  if (data.validationPrompt !== undefined) {
    setClauses.push(`validation_prompt = $${idx++}`);
    params.push(data.validationPrompt);
  }

  if (setClauses.length === 0) {
    return rowToConfig(existing.rows[0]);
  }

  setClauses.push(`updated_at = NOW()`);

  const result = await tenantQuery(client,
    `UPDATE prd_configs SET ${setClauses.join(', ')} WHERE id = $${idx} AND tenant_id = $${idx + 1} RETURNING *`,
    [...params, id, tenantId],
  );

  logger.info({ configId: id, tenantId }, 'PRD config updated');
  return rowToConfig(result.rows[0]);
}

/**
 * Delete a PRD config. Cannot delete the default config.
 */
export async function deleteConfig(
  tenantId: string,
  id: string,
  _actorId: string | null,
  client?: PoolClient,
): Promise<void> {
  const existing = await tenantQuery(client,
    `SELECT * FROM prd_configs WHERE id = $1 AND tenant_id = $2`,
    [id, tenantId],
  );
  if (existing.rowCount === 0) {
    throw new NotFoundError('PRD config not found');
  }

  if (existing.rows[0].is_default) {
    throw new ValidationError('Cannot delete the default PRD config. Set another config as default first.');
  }

  await tenantQuery(client,
    `DELETE FROM prd_configs WHERE id = $1 AND tenant_id = $2`,
    [id, tenantId],
  );

  logger.info({ configId: id, tenantId }, 'PRD config deleted');
}

/**
 * Set a config as the default. Clears the previous default first.
 */
export async function setDefault(
  tenantId: string,
  id: string,
  _actorId: string | null,
  client?: PoolClient,
): Promise<PRDConfig> {
  // Verify config exists
  const existing = await tenantQuery(client,
    `SELECT * FROM prd_configs WHERE id = $1 AND tenant_id = $2`,
    [id, tenantId],
  );
  if (existing.rowCount === 0) {
    throw new NotFoundError('PRD config not found');
  }

  // Clear all defaults for this tenant
  await tenantQuery(client,
    `UPDATE prd_configs SET is_default = FALSE, updated_at = NOW() WHERE tenant_id = $1 AND is_default = TRUE`,
    [tenantId],
  );

  // Set the new default
  const result = await tenantQuery(client,
    `UPDATE prd_configs SET is_default = TRUE, updated_at = NOW() WHERE id = $1 AND tenant_id = $2 RETURNING *`,
    [id, tenantId],
  );

  logger.info({ configId: id, tenantId }, 'PRD config set as default');
  return rowToConfig(result.rows[0]);
}

// ---------------------------------------------------------------------------
// Seed defaults
// ---------------------------------------------------------------------------

const DEFAULT_EXAMPLE_DOCUMENT = `# PRD: Modulo de Gestión de Clientes - APEX Dev Manager

## 1. Contexto y Alcance
Este módulo permite gestionar la información de clientes dentro de la plataforma APEX Dev Manager. Incluye la creación, consulta, edición y eliminación lógica de registros de clientes, así como la asociación con proyectos y sesiones de trabajo.

**Alcance**: Gestión CRUD completa de clientes con integración al sistema de facturación y reportes.

## 2. Actores y Roles
- **Administrador**: Acceso completo a todas las operaciones CRUD y configuración del módulo.
- **Gestor de Proyecto**: Puede consultar y asociar clientes a proyectos, pero no eliminar registros.
- **Usuario Final**: Solo consulta de información de clientes asignados a sus proyectos.

## 3. Flujos de Proceso
1. El administrador accede al módulo de clientes desde el menú principal.
2. Se muestra la lista de clientes con filtros por nombre, estado y fecha.
3. El usuario puede crear un nuevo cliente completando el formulario con datos obligatorios.
4. Al guardar, el sistema valida los datos y crea el registro en la base de datos.
5. Se genera una notificación de confirmación.

## 4. Requisitos Funcionales
- **RF-01**: El sistema debe permitir crear nuevos clientes con nombre, RUC/NIT, dirección, teléfono y correo.
- **RF-02**: El sistema debe validar que el RUC/NIT sea único por tenant.
- **RF-03**: El sistema debe permitir la búsqueda de clientes por nombre, RUC/NIT o estado.
- **RF-04**: El sistema debe soportar eliminación lógica (soft delete) de clientes.
- **RF-05**: El sistema debe registrar auditoría de todas las operaciones CRUD.

## 5. Requisitos No Funcionales
- **RNF-01**: Las consultas de lista deben responder en menos de 500ms para hasta 10,000 registros.
- **RNF-02**: Los datos de clientes deben estar aislados por tenant (multi-tenancy).
- **RNF-03**: Todas las operaciones de escritura deben ejecutarse dentro de una transacción.

## 6. Modelo de Datos
Tabla principal: \`clients\`
| Columna | Tipo | Descripción |
|---------|------|-------------|
| id | UUID | Identificador único |
| tenant_id | UUID | FK a tenants |
| name | VARCHAR(200) | Nombre del cliente |
| tax_id | VARCHAR(50) | RUC/NIT |
| status | VARCHAR(20) | activo/inactivo |
| created_at | TIMESTAMPTZ | Fecha de creación |

## 7. Páginas APEX
- **Página de Lista**: Interactive Report con filtros, búsqueda y acciones en línea.
- **Página de Detalle**: Formulario con regiones para datos generales, contactos y proyectos asociados.
- **Página de Dashboard**: Cards con métricas de clientes por estado y tendencia mensual.

## 8. Reglas de Negocio
- **BR-01**: Un cliente no puede ser eliminado si tiene proyectos activos asociados (prioridad: must).
- **BR-02**: El RUC/NIT debe ser único dentro del mismo tenant (prioridad: must).
- **BR-03**: Al desactivar un cliente, se debe notificar a los gestores de proyecto asignados (prioridad: should).

## 9. Integraciones
- Integración con el módulo de facturación para asociar clientes a facturas.
- API REST para consulta de clientes desde aplicaciones externas.
- Webhooks para notificar cambios de estado a sistemas suscritos.

## 10. Preguntas Abiertas
- Ninguna pregunta abierta en esta versión.`;

const DEFAULT_GENERATION_PROMPT = `You are a technical writer creating a PRD section for an Oracle APEX / Genesys application.
Write professional, clear, detailed content for the specified section in Spanish.
Use the extraction data provided for context and requirements.
Output ONLY the section content as formatted markdown (no title heading, just the body content).`;

const DEFAULT_EXTRACTION_PROMPT = `You are a PRD requirements extraction specialist for Oracle APEX and Genesys applications. Analyze the provided source documents and extract structured requirements data for the APEX/GENESYS domain.
Return a JSON object with this exact structure:
{
  "actors": [{"name": "string", "role": "string", "description": "string"}],
  "flows": [{"name": "string", "steps": ["string array"], "triggerEvent": "string"}],
  "businessRules": [{"id": "BR-01", "description": "string", "priority": "must|should|could"}],
  "apexPages": [{"name": "string", "type": "form|report|dashboard|wizard", "description": "string", "components": ["string array"]}],
  "genesysTables": [{"name": "string", "description": "string", "columns": ["string array"]}],
  "constraints": ["string array of constraints"],
  "assumptions": ["string array of assumptions"],
  "rawNotes": "any additional notes"
}
Respond ONLY with the JSON object, no markdown fences or extra text.`;

/**
 * Seed a default PRD config for a tenant if none exists.
 * Called during tenant provisioning or on-demand.
 */
export async function seedDefaults(
  tenantId: string,
  actorId: string | null,
  client?: PoolClient,
): Promise<PRDConfig | null> {
  const existing = await tenantQuery(client,
    'SELECT COUNT(*)::int AS cnt FROM prd_configs WHERE tenant_id = $1',
    [tenantId],
  );

  if ((existing.rows[0].cnt as number) > 0) {
    logger.debug({ tenantId }, 'PRD config already exists, skipping seed');
    return null;
  }

  return createConfig(
    tenantId,
    {
      name: 'PRD Estándar APEX',
      exampleDocument: DEFAULT_EXAMPLE_DOCUMENT,
      generationPrompt: DEFAULT_GENERATION_PROMPT,
      extractionPrompt: DEFAULT_EXTRACTION_PROMPT,
      validationPrompt: null,
    },
    actorId,
    client,
  );
}
