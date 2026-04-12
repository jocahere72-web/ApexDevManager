# Revision de codigo - ApexDev

Fecha: 2026-04-12

Este documento consolida los problemas encontrados durante la revision estatica del proyecto y propone la mejor solucion para cada uno. No se pudo ejecutar build, typecheck ni tests porque `node` no esta disponible en el PATH de esta sesion (`node not found`).

## Resumen ejecutivo

El proyecto ya muestra correcciones parciales: se eliminaron copias ` 2` dentro de `apps/api`, se corrigio el import roto del router de auth y `apps/api/package.json` agrego varias dependencias que faltaban.

El backend todavia tiene bloqueantes de runtime y seguridad: auth/users usan algoritmos de password incompatibles, conexiones no coinciden con el esquema migrado, RLS no esta activado en rutas protegidas, auditoria escribe a una tabla inexistente, algunos SQL interpolan input de usuario y los tests API siguen sin ejecutarse.

## Estado actual de correcciones

| Area | Estado | Comentario |
| --- | --- | --- |
| Copias ` 2` en `apps/api/src` y migraciones | Corregido en filesystem | Ya no aparecen en `find apps/api -name '* 2*'` excluyendo node_modules. |
| Import auth router | Corregido | `apps/api/src/routes/index.ts` importa desde `../modules/auth/index.js`. |
| Dependencias API faltantes | Parcialmente corregido | API agrego `jsonwebtoken`, `bcrypt`, `bullmq`, `rate-limiter-flexible`, `supertest`, `@apex-dev-manager/shared-types`, etc. |
| Dependencia shared-types en web | Pendiente | `apps/web/package.json` sigue sin declarar `@apex-dev-manager/shared-types`. |
| Tests API | Pendiente | El script sigue apuntando a `src/**/*.test.ts`, pero los tests viven en `apps/api/test`. |
| RLS tenant resolver | Pendiente | `tenantResolver()` existe, pero no se monta en rutas protegidas. |
| Auditoria | Pendiente | Servicios escriben `audit_logs`; migraciones crean `audit_events`. |
| Connections vs migraciones | Pendiente | Servicios usan columnas distintas al esquema real. |

## P0 - Bloqueantes

### 1. Usuarios nuevos no podran autenticarse

Archivo: `apps/api/src/modules/users/users.service.ts`

Problema: `createUser` genera hashes con formato `scrypt:...`, pero el login llama `verifyPassword` desde `apps/api/src/modules/auth/password.service.ts`, que usa `bcrypt.compare`. Cualquier usuario creado por el modulo users queda con un password que auth no puede verificar.

Impacto: usuarios creados por administradores no podran iniciar sesion.

Mejor solucion:

- Eliminar el hashing local con `crypto.scrypt` en `users.service.ts`.
- Reutilizar `hashPassword` desde `apps/api/src/modules/auth/password.service.ts`.
- Mantener un unico servicio de password para create/login/seed/tests.
- Agregar un test de integracion unitario: crear usuario con `usersService.createUser`, luego verificar el hash con `verifyPassword`.

### 2. Connections no coincide con la tabla migrada

Archivos:

- `apps/api/src/modules/connections/connections.service.ts`
- `apps/api/src/modules/connections/health-check.job.ts`
- `apps/api/src/modules/explorer/explorer.service.ts`
- `apps/api/src/modules/editor/editor.service.ts`
- `apps/api/src/modules/schema-inspector/schema.service.ts`
- `apps/api/src/modules/dependency-analyzer/dependency.service.ts`
- `apps/api/src/modules/auto-docs/docs.service.ts`
- `apps/api/migrations/006_create-connections.ts`
- `apps/api/migrations/009_create-connections-extended.ts`

Problema: la migracion base crea `connection_type`, `last_health_check_at`, `ords_url`, `db_host`, `service_name`; la extension 009 agrega `last_check_at`, `encrypted_credentials`, `status`, etc. Los servicios siguen usando `type`, `config`, `last_health_check` y `last_latency_ms` como si fueran columnas canonicas.

Impacto: crear, listar, probar, explorar, inspeccionar esquema y health-check de conexiones fallaran contra la DB real.

Mejor solucion:

- Definir un contrato canonico unico para `connections`.
- Recomendacion: conservar el modelo nuevo de servicios (`config` JSONB + `encrypted_credentials` + `status`), pero migrar la DB para soportarlo de forma explicita.
- Crear una migracion correctiva que renombre o agregue columnas de forma idempotente:
  - `connection_type` -> `type` o cambiar todos los servicios a `connection_type`.
  - `last_health_check` -> `last_check_at` o cambiar todos los servicios a `last_check_at`.
  - agregar `config jsonb` si se mantiene el diseno por config.
- Actualizar todos los SELECT/INSERT/UPDATE de conexiones en un solo cambio.
- Agregar test de repositorio/servicio para `createConnection`, `listConnections`, `testConnection` y `health-check.job`.

### 3. Build Docker usa contexto incorrecto

Archivos:

- `build_spec.yaml`
- `apps/api/Dockerfile`
- `apps/web/Dockerfile`

Problema: `build_spec.yaml` usa `docker build ... apps/api` y `docker build ... apps/web`, pero los Dockerfiles copian `pnpm-workspace.yaml`, `package.json`, `pnpm-lock.yaml` y `packages/`, que viven en la raiz del monorepo y no estan dentro de esos contextos.

Impacto: las imagenes Docker no se construyen en CI/CD.

Mejor solucion:

- Cambiar el contexto a la raiz del repo:
  - `docker build -f apps/api/Dockerfile -t apex-api:${OCI_BUILD_RUN_ID} .`
  - `docker build -f apps/web/Dockerfile -t apex-web:${OCI_BUILD_RUN_ID} .`
- Mantener los COPY relativos a la raiz.
- Agregar un paso CI que ejecute el build Docker de ambos artefactos.

### 4. Helm Service tiene sintaxis invalida

Archivo: `deploy/helm/apex-api/templates/service.yaml`

Problema: el template usa `{ { ... } }` en vez de `{{ ... }}`.

Impacto: Helm no puede renderizar el Service de API. Revisar tambien el chart web por el mismo patron.

Mejor solucion:

- Corregir todos los delimitadores Helm a `{{ ... }}`.
- Ejecutar `helm template` para API y web.
- Agregar este comando a CI.

### 5. Terraform dev no coincide con el modulo database

Archivos:

- `terraform/environments/dev/main.tf`
- `terraform/modules/database/variables.tf`

Problema: `dev/main.tf` pasa `admin_password`, pero el modulo `database` no declara esa variable; el modulo exige `db_credential_secret_id`.

Impacto: `terraform plan` falla por argumento no soportado y variable requerida sin valor.

Mejor solucion:

- Decidir un contrato unico:
  - Opcion recomendada: crear secretos en el modulo `vault` primero y pasar `module.vault.db_password_secret_id` a `module.database.db_credential_secret_id`.
  - Eliminar `admin_password` del bloque `module "database"`.
- Repetir el ajuste en `prod`.
- Ejecutar `terraform fmt` y `terraform validate`.

## P1 - Seguridad, runtime y contratos

### 6. RLS/tenant resolver no se monta

Archivo: `apps/api/src/routes/index.ts`

Problema: las rutas protegidas montan `authenticate()` pero no `tenantResolver()`. Ademas muchos servicios usan `pool.query()` directo, no `req.dbClient`.

Impacto: las politicas RLS basadas en `current_setting('app.current_tenant')` no se activan de forma confiable.

Mejor solucion:

- Montar `tenantResolver()` despues de `authenticate()` en rutas protegidas.
- Refactorizar servicios con una capa de DB por request o repositorios que reciban `client`.
- Como paso intermedio, crear helper `withTenantDb(req, handler)` y migrar servicios criticos: users, connections, explorer, editor, schema-inspector, dependency-analyzer.
- Agregar test que verifique que una request autenticada ejecuta consultas con `app.current_tenant` seteado.

### 7. Auditoria escribe en tabla inexistente

Archivos:

- `apps/api/src/modules/auth/auth.service.ts`
- `apps/api/src/modules/users/users.service.ts`
- `apps/api/src/modules/connections/connections.service.ts`
- `apps/api/src/modules/usage-intelligence/usage.service.ts`
- `apps/api/migrations/005_create-audit-events.ts`
- `apps/api/migrations/010_extend-audit-events.ts`

Problema: servicios escriben `audit_logs` o leen `audit_log`, pero las migraciones crean `audit_events`.

Impacto: el audit trail no persiste y reportes de uso pueden fallar por tabla inexistente.

Mejor solucion:

- Crear un `audit.service.ts` unico que escriba `audit_events`.
- Mapear campos:
  - `tenant_id`
  - `user_id`
  - `event_type`
  - `action`
  - `entity_type` o `resource_type`
  - `entity_id` o `resource_id`
  - `event_payload`
  - `correlation_id`
- Reemplazar todos los `INSERT INTO audit_logs` y `FROM audit_log`.
- Agregar test de auditoria para auth/users/connections.

### 8. SQL con input de request sin binds

Archivos:

- `apps/api/src/modules/dependency-analyzer/dependency.service.ts`
- `apps/api/src/modules/auto-docs/docs.service.ts`
- `apps/api/src/modules/schema-inspector/schema.service.ts`

Problema: valores de route/body como `objectType`, `objectId`, `schema`, `tableName`, `objectName` se interpolan en SQL enviado al backend Oracle/MCP.

Impacto: riesgo de SQL injection hacia Oracle/MCP y errores por identificadores no normalizados.

Mejor solucion:

- Usar binds para valores cuando sea posible.
- Para identificadores y tipos que no acepten bind, validar con allowlist estricta:
  - tipos: `TABLE`, `VIEW`, `PACKAGE`, `PACKAGE BODY`, `PROCEDURE`, `FUNCTION`, etc.
  - identificadores: regex `^[A-Z][A-Z0-9_$#]{0,127}$` despues de uppercase.
- Crear helpers `normalizeOracleIdentifier` y `assertOracleObjectType`.
- Rechazar inputs invalidos con 400 antes de construir SQL.

### 9. SQL injection en usage granularity

Archivos:

- `apps/api/src/modules/usage-intelligence/usage.controller.ts`
- `apps/api/src/modules/usage-intelligence/usage.service.ts`

Problema: `granularity` viene del querystring, se castea como `any` y se inserta en `date_trunc('${granularity}', ...)`.

Impacto: un usuario con rol admin/tech_lead puede inyectar SQL en consultas de uso.

Mejor solucion:

- Validar en controller con Zod o enum: `hour`, `day`, `week`, `month`.
- En servicio, recibir `TimeGranularity` real sin `as any`.
- Usar map cerrado:
  - `hour -> date_trunc('hour', created_at)`
  - `day -> date_trunc('day', created_at)`
  - `week -> date_trunc('week', created_at)`
  - `month -> date_trunc('month', created_at)`
- Nunca interpolar el valor crudo del request.

### 10. MCP pool no aisla por tenant ni connection

Archivo: `apps/api/src/integrations/mcp/mcp-client.ts`

Problema: `poolKey` usa solo `baseUrl:username`.

Impacto: dos tenants o conexiones con el mismo endpoint/usuario pueden reutilizar sesiones MCP entre contextos.

Mejor solucion:

- Extender `MCPConnectionConfig` con `tenantId` y `connectionId`.
- Construir pool key con `tenantId:connectionId:baseUrl:username:schema`.
- Actualizar todos los constructores de `MCPClient`.
- Agregar test que cree dos clientes con mismo baseUrl/user pero distinto tenant/connection y confirme keys/sesiones separadas.

### 11. CORS inseguro con credenciales

Archivo: `apps/api/src/app.ts`

Problema: `origin: process.env.CORS_ORIGIN ?? '*'` y `credentials: true`.

Impacto: configuracion invalida para navegadores y baseline insegura para endpoints autenticados.

Mejor solucion:

- Cambiar a allowlist explicita por ambiente.
- Usar `CORS_ORIGINS` plural consistente con los values Helm.
- En ausencia de allowlist en production, fallar al arrancar.
- Ejemplo: parsear `process.env.CORS_ORIGINS?.split(',')` y resolver por funcion `origin`.

### 12. Login UI no autentica realmente

Archivo: `apps/web/src/pages/LoginPage.tsx`

Problema: el submit solo hace `console.log` y no llama el hook de auth. Ademas el contrato esperado por `useAuth` no coincide con la respuesta del backend.

Impacto: el usuario no inicia sesion aunque el backend funcione.

Mejor solucion:

- Ajustar `useAuth` al contrato real del backend: `{ accessToken, refreshToken, expiresIn, user }` dentro de `data`.
- Conectar `LoginPage` con `useAuth().login`.
- Guardar token con nombre unico y configurar interceptor `Authorization`.
- Agregar prueba de login UI o test de hook.

### 13. Frontend y backend Explorer no comparten rutas ni shape

Archivos:

- `apps/web/src/services/explorer.api.ts`
- `apps/api/src/modules/explorer/explorer.controller.ts`
- `apps/api/src/modules/explorer/explorer.service.ts`
- `packages/shared-types/src/explorer.ts`

Problema: web llama rutas bajo `/connections/:id/...`, pero backend expone `/api/v1/explorer/...`. Ademas el backend devuelve formas y campos distintos a los tipos compartidos esperados por UI.

Impacto: Explorer no funcionara aunque compile.

Mejor solucion:

- Definir contrato unico en `packages/shared-types/src/explorer.ts`.
- Ajustar backend para devolver exactamente `ApplicationTree`, `SearchResult`, `SyncStatus` del paquete compartido.
- Ajustar cliente web a rutas reales o cambiar backend para montar alias compatibles.
- Agregar contract tests o OpenAPI minimo para Explorer.

### 14. Explorer UI sigue incompleto

Archivo: `apps/web/src/features/explorer/index.tsx`

Problema: usa conexiones hardcodeadas y `handleExpandNode` solo marca loading; no carga paginas/componentes ni actualiza children.

Impacto: la experiencia no navega realmente el arbol APEX.

Mejor solucion:

- Consumir conexiones reales desde el modulo de connections.
- En expansion, llamar hooks/queries para pages/components.
- Normalizar nodos con ids estables.
- Agregar estados loaded/error por nodo.

### 15. Health check offline apunta a ruta incorrecta

Archivo: `apps/web/src/features/explorer/hooks/useOfflineMode.ts`

Problema: usa `HEAD /api/v1/health`, pero la API define health en raiz (`/health`, `/ready`) y no se confirmo soporte HEAD.

Impacto: frontend puede marcar backend offline aunque este disponible.

Mejor solucion:

- Cambiar a `GET /health` o exponer `HEAD /api/v1/health`.
- Usar `apiClient` para respetar base URL.
- Agregar test de hook con mock de health.

### 16. Tests de auth middleware no ejercitan el codigo real

Archivo: `apps/api/test/modules/auth/auth.middleware.test.ts`

Problema: el test define implementaciones de referencia dentro del propio archivo en vez de importar `auth.middleware.ts`.

Impacto: puede pasar aunque el middleware real tenga bugs.

Mejor solucion:

- Importar `authenticate`, `authorize`, `optionalAuth` reales.
- Mockear solo dependencias externas si hace falta.
- Cubrir token ausente, token invalido, token valido, roles correctos e incorrectos.

### 17. Script de tests API no ejecuta tests existentes

Archivo: `apps/api/package.json`

Problema: `test` apunta a `src/**/*.test.ts`, pero los tests estan en `apps/api/test`.

Impacto: suite backend puede dar una senal falsa.

Mejor solucion:

- Cambiar a `mocha --require tsx 'test/**/*.test.ts' --timeout 10000`.
- Opcional: agregar `src/**/*.test.ts` si se permiten tests colocados junto al codigo.
- Ejecutar `turbo run test --filter=@apex-dev/api`.

### 18. Root test:web apunta a workspace inexistente

Archivo: `package.json`

Problema: `test:web` usa `--filter=@apex-dev/web`, pero el package web se llama `@apex-dev-manager/web`.

Impacto: el comando no selecciona el workspace web correcto.

Mejor solucion:

- Cambiar a `turbo run test --filter=@apex-dev-manager/web`.
- Considerar estandarizar nombres de paquetes en el monorepo.

### 19. Web no declara shared-types

Archivo: `apps/web/package.json`

Problema: muchos servicios y componentes importan `@apex-dev-manager/shared-types`, pero web no lo declara.

Impacto: instalacion limpia puede fallar por resolucion de paquete.

Mejor solucion:

- Agregar `"@apex-dev-manager/shared-types": "workspace:^"` a `apps/web/package.json`.
- Ejecutar install para actualizar lockfile.
- Ejecutar typecheck web.

### 20. Seed script incompatible con schema

Archivo: `apps/api/src/db/seed.ts`

Problema: inserta usuarios con `name`, `role`, `status`, `ON CONFLICT (email)` y conexiones con `type`, `host`, `database_name`, que no coinciden con el esquema migrado.

Impacto: seed falla contra DB real o deja datos incompatibles.

Mejor solucion:

- Actualizar seed al esquema actual:
  - usuarios: `display_name`, `roles`, `is_active`, constraint por `(tenant_id, email)`.
  - conexiones: usar contrato canonico final definido en el fix de connections.
- Reutilizar `hashPassword` de auth.
- Agregar test de seed sobre DB migrada.

### 21. `__dirname` en ESM/NodeNext

Archivo: `apps/api/src/db/seed.ts`

Problema: usa `__dirname` aunque el proyecto esta en NodeNext/ESM. Si no existe polyfill en runtime, falla.

Impacto: seed puede fallar antes de leer los JSON.

Mejor solucion:

- Usar `fileURLToPath(import.meta.url)` y `dirname`.
- O resolver paths desde `process.cwd()` de forma documentada.

### 22. Token service permite JWT_SECRET vacio

Archivo: `apps/api/src/modules/auth/token.service.ts`

Problema: `JWT_SECRET` cae a `''` si no existe env var, y el servicio puede intentar firmar/verificar con secreto vacio.

Impacto: fallo de runtime o configuracion insegura.

Mejor solucion:

- Usar el config central validado por Zod.
- Fallar al arrancar si no hay `JWT_SECRET` o par RS256 valido.
- Agregar test de configuracion faltante.

### 23. Dependencias y scripts de deploy desalineados

Archivo: `deploy/scripts/pre-deploy.sh`

Problema: usa `pnpm --filter @apex/api db:migrate`, pero el package real es `@apex-dev/api` y el script es `migrate`.

Impacto: pre-deploy falla antes de desplegar.

Mejor solucion:

- Cambiar a `pnpm --filter @apex-dev/api migrate up` o adaptar script del package.
- Verificar puerto/API_URL con Helm values.
- Agregar smoke test del script.

### 24. Supply chain y hardening web incompletos

Archivos:

- `apps/api/Dockerfile`
- `apps/web/Dockerfile`
- `apps/web/nginx.conf`
- `deploy/helm/apex-api/values-*.yaml`
- `deploy/helm/apex-web/values-*.yaml`

Problema: Dockerfiles usan `pnpm@latest` y tags no fijados; NGINX no presenta CSP/HSTS claro; algunos values usan `latest`.

Impacto: builds no reproducibles y baseline de seguridad incompleta.

Mejor solucion:

- Fijar `pnpm@9.1.0`.
- Fijar imagenes por version/digest donde sea viable.
- Agregar headers CSP y HSTS en NGINX para entornos TLS.
- Reemplazar `latest` por tags inmutables.

### 25. Config Helm API no mapea values esperados

Archivos:

- `deploy/helm/apex-api/templates/configmap.yaml`
- `deploy/helm/apex-api/templates/secret.yaml`
- `deploy/helm/apex-api/templates/deployment.yaml`
- `deploy/helm/apex-api/values-*.yaml`

Problema: los templates leen estructuras distintas a algunas usadas por values (`config` vs `env`, probes, secretos), y hay secret placeholders vacios.

Impacto: pods pueden arrancar sin env requeridas o no aplicar overrides.

Mejor solucion:

- Unificar schema de values.
- Evitar secretos vacios en templates.
- Usar External Secrets o CSI driver de forma real.
- Validar con `helm template` por ambiente.

### 26. Copias duplicadas ` 2` en repo

Estado actual: corregido para `apps/api`, `packages/shared-types/src` y migraciones. Siguen apareciendo copias dentro de `node_modules/.bin`, que no son fuente de app y deberian tratarse como artefactos locales.

Mejor solucion:

- Mantener eliminadas las copias ` 2` del codigo fuente.
- Agregar regla de limpieza o pre-commit que falle si aparecen `* 2.ts`, `* 2.yaml`, directorios `* 2` fuera de `node_modules`.
- Revisar por que el entorno genero esas copias para evitar recurrencia.

## Orden recomendado de correccion

1. Arreglar `users.service` para usar bcrypt desde `auth/password.service.ts`.
2. Definir y aplicar contrato canonico de `connections` entre migraciones y servicios.
3. Cambiar auditoria a `audit_events` con un servicio central.
4. Montar `tenantResolver()` y migrar servicios criticos a `req.dbClient` o repositorios tenant-aware.
5. Cerrar SQL injection en dependency-analyzer, auto-docs, schema-inspector y usage-intelligence.
6. Corregir scripts de tests y ejecutar suite real.
7. Corregir CORS y configuracion env.
8. Alinear contratos API/web para auth, explorer y connections.
9. Corregir Docker, Helm, deploy scripts y Terraform.
10. Agregar contract tests y smoke tests de CI/CD.

## Comandos de verificacion propuestos

Cuando `node` este disponible:

```bash
pnpm install --frozen-lockfile
pnpm --filter @apex-dev/api typecheck
pnpm --filter @apex-dev/api test
pnpm --filter @apex-dev-manager/web typecheck
pnpm --filter @apex-dev-manager/web test
pnpm build
docker build -f apps/api/Dockerfile -t apex-api:test .
docker build -f apps/web/Dockerfile -t apex-web:test .
helm template apex-api deploy/helm/apex-api -f deploy/helm/apex-api/values-dev.yaml
helm template apex-web deploy/helm/apex-web -f deploy/helm/apex-web/values-dev.yaml
terraform -chdir=terraform/environments/dev validate
```

## Nota de validacion

Esta revision se baso en analisis estatico. La validacion ejecutable quedo bloqueada porque `node` no esta disponible en el PATH de la sesion actual.
