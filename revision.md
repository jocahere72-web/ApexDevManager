# Revision actual de errores

Fecha: 2026-04-12

Esta revision revalida los hallazgos anteriores contra el estado actual del codigo. No se ejecutaron tests ni typecheck porque `node` no esta disponible en el PATH de esta sesion.

## Estado de hallazgos anteriores

Corregidos o mitigados:

- CORS ya no muestra `CORS_ORIGINS: '*'` en `deploy/helm/apex-api/values-dev.yaml`, y `apps/api/src/app.ts` filtra `*` fuera de la allowlist efectiva.
- El script de test de API ya apunta a `test/**/*.test.ts`.
- `users.service.ts` ya usa `hashPassword()` compartido y no genera hashes `scrypt` incompatibles con login.
- `users.service.ts`, `connections.service.ts` y `usage.service.ts` ya escriben/leen `audit_events` en vez de `audit_logs`/`audit_log`.
- `usage-intelligence` ya valida `granularity` antes de llamar al servicio y el servicio usa `GRANULARITY_MAP`.
- `schema-inspector.getTable()` ya evita pasar schema vacio a `assertOracleIdentifier`.
- La clave de pool MCP ya incluye `tenantId` y `connectionId`.
- `connections.service.ts` ya fue alineado a `connection_type`, `last_check_at`, `last_latency_ms` y `last_error`.

## 1. Consumidores de `connections` siguen usando columnas inexistentes

Severidad: P1

Archivos:

- `apps/api/src/modules/explorer/explorer.service.ts`
- `apps/api/src/modules/editor/editor.service.ts`
- `apps/api/src/modules/schema-inspector/schema.service.ts`
- `apps/api/src/modules/dependency-analyzer/dependency.service.ts`
- `apps/api/src/modules/auto-docs/docs.service.ts`

Problema:

Aunque `connections.service.ts` ya fue corregido, varios modulos siguen consultando:

```sql
SELECT id, tenant_id, type, config, encrypted_credentials
FROM connections
```

Las migraciones canonicas crean `connection_type`, `ords_url`, `db_host`, `service_name`, `schema_name`, `workspace_name` y `encrypted_credentials`; no crean `type` ni `config`.

Impacto:

Explorer, editor, schema-inspector, dependency-analyzer y auto-docs pueden fallar al resolver una conexion aunque el CRUD principal de conexiones funcione.

Mejor solucion:

- Crear un helper/repositorio compartido para conexiones, por ejemplo `apps/api/src/modules/connections/connections.repository.ts`.
- Centralizar ahi el query con columnas reales y un mapper de compatibilidad:
  - `connection_type` -> `type`
  - `ords_url` -> `config.ordsBaseUrl`
  - `db_host` -> `config.host`
  - `service_name` -> `config.serviceName`
  - `schema_name` -> `config.schema`
  - `workspace_name` -> `config.workspaceName`
- Reemplazar las consultas duplicadas de los consumidores por ese helper.
- Agregar tests de cada consumidor usando una DB migrada o un mock estricto de columnas reales.

## 2. Dashboard usa nombres viejos para health de conexiones

Severidad: P1

Archivo:

- `apps/api/src/modules/dashboards/dashboard.service.ts`

Problema:

`getDashboardData()` consulta `last_tested_at`, `response_time_ms` y `error_message` desde `connections`, pero las migraciones y el servicio actual usan `last_check_at`, `last_latency_ms` y `last_error`.

Impacto:

El dashboard puede fallar en runtime con `column does not exist` al cargar la seccion de salud de conexiones.

Mejor solucion:

- Cambiar el SELECT a `status, last_check_at, last_latency_ms, last_error`.
- Mapear esos campos al contrato `ConnectionHealth`:
  - `last_check_at` -> `lastCheckedAt` / `lastCheckAt`
  - `last_latency_ms` -> `responseTimeMs` / `lastLatencyMs`
  - `last_error` -> `errorMessage`
- Agregar un test de `getDashboardData()` contra el esquema migrado.

## 3. RLS sigue aplicado solo parcialmente

Severidad: P1

Archivos:

- `apps/api/src/lib/tenant-db.ts`
- `apps/api/src/modules/usage-intelligence/usage.service.ts`
- `apps/api/src/modules/dashboards/dashboard.service.ts`
- Otros servicios bajo `apps/api/src/modules/**`

Problema:

`tenantResolver()` ya existe y algunos controladores ya pasan `req.dbClient` a `users` y `connections`. Sin embargo, `usage-intelligence` y `dashboards` todavia usan `pool.query()` directo, igual que otros modulos. Esas queries no garantizan usar el cliente donde se seteo `app.current_tenant`, por lo que el aislamiento RLS puede quedar incompleto o fallar segun la politica de cada tabla.

Impacto:

El sistema puede comportarse distinto por modulo: unas rutas usan el contexto tenant del request y otras saltan a queries directas del pool.

Mejor solucion:

- Estandarizar todos los servicios tenant-scoped para recibir `PoolClient` o una abstraccion `TenantDb`.
- Evitar el fallback silencioso a `pool.query()` en rutas protegidas; si el modulo requiere tenant, debe fallar cuando no haya client tenant-scoped.
- Migrar primero dashboards, usage, explorer, editor, schema-inspector, dependency-analyzer y auto-docs.
- Agregar tests que verifiquen que los servicios tenant-scoped llaman al cliente del request.

## 4. Validacion ejecutable pendiente

Severidad: P2

Problema:

No se pudo ejecutar typecheck ni test porque el entorno no encuentra `node`.

Comandos pendientes:

```bash
pnpm --filter @apex-dev/api typecheck
pnpm --filter @apex-dev/api test
```

Motivo observado:

```text
node not found
```

Mejor solucion:

- Ejecutar la validacion en un shell con Node 20+ disponible.
- Cerrar esta revision solo despues de typecheck y tests backend.
