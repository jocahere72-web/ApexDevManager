# Revision actual de errores

Fecha: 2026-04-12

Ultima actualizacion: 2026-04-12T04:08:25Z

Esta revision revalida los hallazgos reportados contra el estado actual del backend. No se ejecutaron tests ni typecheck porque `node` no esta disponible en el PATH de esta sesion.

## Estado de hallazgos anteriores

Corregidos o mitigados en la revision actual:

- Los consumidores principales ya no hacen `SELECT id, tenant_id, type, config, encrypted_credentials FROM connections`; ahora usan `getConnectionForTenant()`.
- `dashboard.service.ts` ya consulta `last_check_at`, `last_latency_ms` y `last_error` en lugar de `last_tested_at`, `response_time_ms` y `error_message`.
- `usage-intelligence` y `dashboards` ya cambiaron las consultas revisadas de `pool.query()` a `tenantQuery(client, ...)`, y sus controladores pasan `req.dbClient`.
- El script de test de API ya apunta a `test/**/*.test.ts`.
- `users.service.ts` ya usa `hashPassword()` compartido.
- `usage-intelligence` ya valida `granularity` y usa `GRANULARITY_MAP`.
- La clave de pool MCP ya incluye `tenantId` y `connectionId`.
- `@apex-dev-manager/shared-types` ya esta declarado en `apps/api/package.json` y `apps/web/package.json` como `workspace:^`.

## 1. Repositorio de conexiones se llama sin `req.dbClient`

Severidad: P1

Archivos:

- `apps/api/src/modules/connections/connections.repository.ts`
- `apps/api/src/modules/explorer/explorer.service.ts`
- `apps/api/src/modules/editor/editor.service.ts`
- `apps/api/src/modules/schema-inspector/schema.service.ts`
- `apps/api/src/modules/dependency-analyzer/dependency.service.ts`
- `apps/api/src/modules/auto-docs/docs.service.ts`

Problema:

`getConnectionForTenant()` acepta un `PoolClient` opcional y usa `tenantQuery(client, ...)`, pero los consumidores MCP/Oracle lo llaman sin pasar el cliente tenant-scoped. Por ejemplo:

```ts
const conn = await getConnectionForTenant(tenantId, connectionId);
```

Esto hace que `tenantQuery()` caiga al fallback de `pool.query()`. Aunque el query filtra `tenant_id = $1`, no usa el mismo cliente donde `tenantResolver()` aplico `app.current_tenant`.

Impacto:

La migracion elimino columnas inexistentes, pero RLS sigue incompleto en la resolucion de conexiones para Explorer, Editor, Schema Inspector, Dependency Analyzer y Auto Docs. En una DB con RLS activo, esas rutas pueden comportarse distinto a users/connections/dashboard/usage, o fallar si la politica depende de `current_setting('app.current_tenant')`.

Mejor solucion:

- Cambiar `getConnectionDetails()` en esos servicios para aceptar `client?: PoolClient`.
- Propagar `client` desde las funciones exportadas hasta `getConnectionForTenant(tenantId, connectionId, client)`.
- Pasar `req.dbClient` desde los controladores que todavia no lo hacen, como Explorer, Dependency Analyzer y Auto Docs.
- Considerar que `tenantQuery()` no haga fallback silencioso a `pool.query()` en modulos tenant-scoped.
- Agregar tests que verifiquen que la resolucion de conexiones usa el client del request.

## 2. Explorer convierte `workspaceName` a `WORKSPACE_ID`

Severidad: P1

Archivos:

- `apps/api/src/modules/connections/connections.repository.ts`
- `apps/api/src/modules/explorer/explorer.service.ts`
- `apps/api/src/integrations/mcp/mcp-apex-adapter.ts`
- `apps/api/src/integrations/mcp/ords-fallback.ts`

Problema:

El repositorio mapea `workspace_name` a `config.workspaceName`, pero Explorer calcula:

```ts
return Number(conn.config.workspaceName ?? 0);
```

Luego pasa ese valor como `workspaceId` a consultas que filtran `WORKSPACE_ID`. Si `workspace_name` contiene un nombre real de workspace, `Number('MI_WORKSPACE')` produce `NaN`, y las consultas a `APEX_APPLICATIONS` no encontraran aplicaciones.

Impacto:

Explorer puede quedar vacio o fallar para conexiones validas, especialmente en el listado de aplicaciones y rutas que dependen de `listApplications()`.

Mejor solucion:

- Persistir o resolver un `workspace_id` numerico real, no derivarlo desde `workspace_name`.
- Extender el modelo de conexiones con `workspace_id` si el producto necesita filtrar por ID.
- Si solo se tiene nombre, cambiar las consultas de Explorer/ORDS/MCP para filtrar por `WORKSPACE = :workspace_name` o resolver primero el ID desde Oracle/APEX.
- Validar el valor antes de consultar: si no hay ID numerico, responder 400/422 con un error de configuracion claro.

## 3. Validacion ejecutable pendiente

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
