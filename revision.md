# Revision actual de errores

Fecha: 2026-04-12

Este archivo lista los errores que siguen abiertos en la revision actual del proyecto y la mejor solucion recomendada para cada uno. No se ejecutaron tests ni typecheck porque `node` no esta disponible en el PATH de esta sesion.

## 1. CORS sigue permitiendo configuracion insegura con credenciales

Severidad: P1

Archivos:

- `apps/api/src/app.ts`
- `deploy/helm/apex-api/values-dev.yaml`

Problema:

`app.ts` ya cambio de `CORS_ORIGIN` a `CORS_ORIGINS` y deja `origin: false` si no hay allowlist. Eso mejora el caso sin variable. Sin embargo, `deploy/helm/apex-api/values-dev.yaml` todavia define `CORS_ORIGINS: '*'`, y la API mantiene `credentials: true`. Si ese value llega al runtime, el servidor puede responder con `Access-Control-Allow-Origin: *` junto con credenciales, una combinacion invalida para navegadores e insegura para endpoints autenticados.

Mejor solucion:

- No permitir `*` cuando `credentials: true`.
- Parsear `CORS_ORIGINS` y rechazar `*` al arrancar si `credentials` esta activo.
- Usar una allowlist explicita tambien en dev, por ejemplo `http://localhost:3000,http://127.0.0.1:3000`.
- Agregar un test de configuracion CORS para verificar que `*` no se acepta con credenciales.

## 2. `tenantResolver` no protege las queries reales

Severidad: P1

Archivos:

- `apps/api/src/routes/index.ts`
- `apps/api/src/middleware/tenant-resolver.ts`
- Servicios bajo `apps/api/src/modules/**`

Problema:

`tenantResolver()` ya esta montado despues de `authenticate()`, y eso es un avance. Pero el middleware setea `app.current_tenant` sobre `req.dbClient`, mientras la mayoria de servicios siguen usando `pool.query()` directo. Esas queries no usan el cliente con la variable de sesion, asi que las politicas RLS basadas en `current_setting('app.current_tenant')` no se aplican de forma confiable.

Mejor solucion:

- Cambiar los controladores para pasar `req.dbClient` a los servicios o repositorios.
- Crear una abstraccion `TenantDb` que encapsule el cliente por request.
- Migrar primero modulos sensibles: users, connections, explorer, editor, schema-inspector, dependency-analyzer, docs, dashboards y usage.
- Agregar tests que verifiquen que una request autenticada consulta usando el mismo client al que se aplico `SET LOCAL app.current_tenant`.

## 3. Reportes siguen leyendo `audit_log` inexistente

Severidad: P1

Archivos:

- `apps/api/src/modules/usage-intelligence/usage.service.ts`
- `apps/api/src/modules/dashboards/dashboard.service.ts`
- `apps/api/migrations/005_create-audit-events.ts`
- `apps/api/migrations/010_extend-audit-events.ts`

Problema:

Auth, users y connections ya escriben en `audit_events`, pero usage-intelligence y dashboards siguen leyendo `audit_log`. Las migraciones crean `audit_events`, no `audit_log`. Si no existe una vista de compatibilidad, estas consultas fallan en runtime.

Mejor solucion:

- Reemplazar `audit_log` por `audit_events` en usage-intelligence y dashboards.
- Ajustar los nombres de columnas:
  - `action_type` debe mapearse desde `event_type` o `action`.
  - `description`/`details` debe salir de `event_payload`.
  - `user_id`, `tenant_id`, `created_at` ya existen.
- Si se necesita compatibilidad temporal, crear una vista `audit_log` que lea desde `audit_events`, pero la solucion recomendada es unificar todo en `audit_events`.
- Agregar tests de consultas de dashboard/usage sobre una DB migrada.

## 4. Modulos consumidores siguen usando el schema viejo de `connections`

Severidad: P1

Archivos:

- `apps/api/src/modules/explorer/explorer.service.ts`
- `apps/api/src/modules/editor/editor.service.ts`
- `apps/api/src/modules/schema-inspector/schema.service.ts`
- `apps/api/src/modules/dependency-analyzer/dependency.service.ts`
- `apps/api/src/modules/auto-docs/docs.service.ts`

Problema:

`connections.service.ts` ya fue alineado a columnas como `connection_type`, `ords_url`, `db_host`, `service_name` y `last_check_at`. Pero otros servicios todavia consultan `SELECT id, tenant_id, type, config, encrypted_credentials FROM connections`. Esas columnas (`type`, `config`) no existen en el esquema migrado que se esta usando como canonico.

Impacto:

Explorer, editor, schema-inspector, dependency-analyzer y auto-docs pueden fallar al resolver una conexion, aunque el modulo connections principal ya funcione.

Mejor solucion:

- Crear un helper/repositorio compartido, por ejemplo `connections.repository.ts`, con `getConnectionForTenant(tenantId, connectionId)`.
- Ese helper debe mapear una sola vez:
  - `connection_type` -> `type`
  - `ords_url` -> `config.ordsBaseUrl`
  - `db_host` -> `config.host`
  - `service_name` -> `config.serviceName`
  - `encrypted_credentials`
- Reemplazar en todos los consumidores las consultas manuales por ese helper.
- Agregar un test de cada consumidor para asegurar que usa columnas reales.

## 5. Pool MCP aun mezcla tenants/conexiones

Severidad: P1

Archivo:

- `apps/api/src/integrations/mcp/mcp-client.ts`

Problema:

La clave del pool MCP sigue siendo `baseUrl:username`. Dos tenants o dos conexiones distintas con el mismo endpoint y usuario pueden reutilizar la misma sesion MCP.

Impacto:

Riesgo de fuga de contexto entre tenants/conexiones y comportamiento dificil de depurar cuando cambian schema o permisos.

Mejor solucion:

- Extender `MCPConnectionConfig` con `tenantId` y `connectionId`.
- Cambiar `poolKey` a un valor como `tenantId:connectionId:baseUrl:username:schema`.
- Actualizar todos los lugares donde se construye `new MCPClient(...)`.
- Agregar test que cree dos clientes con el mismo `baseUrl` y `username`, pero distinto `tenantId` o `connectionId`, y confirme que no comparten entrada de pool.

## 6. Table detail falla con schema vacio

Severidad: P1

Archivo:

- `apps/api/src/modules/schema-inspector/schema.service.ts`

Problema:

`getTable()` llama `getTableColumns(tenantId, connectionId, '', tableName)` y `getTableIndexes(tenantId, connectionId, '', tableName)`. Los helpers nuevos `assertOracleIdentifier()` rechazan strings vacios, asi que la ruta de detalle de tabla puede fallar incluso con `tableName` valido.

Mejor solucion:

- Resolver el schema desde la conexion o desde `SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')`.
- Cambiar la firma de `getTable()` para aceptar schema opcional y, si no viene, omitir el filtro `owner = ...` o usar el schema actual.
- Evitar pasar `''` a `assertOracleIdentifier`.
- Agregar test para `GET /tables/:connectionId/:tableName` sin schema explicito.

## 7. Usage granularity esta mitigado, pero el controller conserva `as any`

Severidad: P2

Archivos:

- `apps/api/src/modules/usage-intelligence/usage.controller.ts`
- `apps/api/src/modules/usage-intelligence/usage.service.ts`

Problema:

El servicio ya usa `GRANULARITY_MAP`, lo cual mitiga la inyeccion directa. Pero el controller aun castea `granularity as any`; la validacion real queda delegada al servicio y el error sera generico.

Mejor solucion:

- Validar `granularity` en el controller con Zod o enum antes de llamar al servicio.
- Retirar `as any`.
- Devolver 400 con `ValidationError` cuando el valor no sea `hour`, `day`, `week` o `month`.

## Validacion pendiente

No se pudo ejecutar:

```bash
pnpm --filter @apex-dev/api typecheck
pnpm --filter @apex-dev/api test
pnpm --filter @apex-dev-manager/web typecheck
```

Motivo:

```text
node not found
```

Cuando `node` este disponible, esos comandos deben ejecutarse antes de cerrar la revision.
