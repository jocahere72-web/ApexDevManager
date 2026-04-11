---
title: "APEX Dev Manager — Product Requirements Document v5.1"
version: "5.1"
status: "DRAFT"
date: "Abril 2026"
author: "José Carlos Herrera — Co-founder & Commercial Manager, I&T"
confidential: true
---

# APEX DEV MANAGER
## Product Requirements Document — Edición Completa Corregida
### Plataforma AI-Native Enterprise de Desarrollo, Gobierno y Operación Oracle APEX

| Campo | Valor |
| --- | --- |
| Versión | v5.1 — Edición Completa Corregida (M0–M18) |
| Estado | DRAFT — Para revisión interna |
| Fecha | Abril 2026 |
| Autor | José Carlos Herrera — Co-founder & Commercial Manager |
| Empresa | Informática y Tributos S.A.S. (I&T) · Barranquilla, Colombia |
| Producto destino | APEX Dev Manager — Uso interno I&T + SaaS para sector público LATAM |
| Plataforma base | Oracle APEX 22.x/23.x/24.x sobre OCI · Oracle DB 19c/21c/23ai |
| IA integrada | Claude API (Anthropic) + MCP Oracle APEX |
| Módulos | M0–M18 (19 módulos) |


# Tabla de Contenidos

1. [Resumen Ejecutivo](#1-resumen-ejecutivo)
2. [Contexto de Negocio y Usuarios](#2-contexto-de-negocio-y-usuarios)
3. [Alcance del Producto](#3-alcance-del-producto--vista-general-de-módulos)
4. [Especificación Módulos Base (M0–M7)](#4-especificación-de-módulos-base-m0m7)
5. [Especificación Módulos Enterprise (M8–M14)](#5-especificación-de-módulos-enterprise-m8m14)
6. [Especificación Módulos SaaS y Escala (M15–M18)](#6-especificación-de-módulos-saas-y-escala-m15m18)
7. [Arquitectura Técnica](#7-arquitectura-técnica)
8. [Requerimientos No Funcionales](#8-requerimientos-no-funcionales)
9. [Roadmap de Desarrollo](#9-roadmap-de-desarrollo)
10. [Modelo de Negocio](#10-modelo-de-negocio)
11. [Análisis de Riesgos](#11-análisis-de-riesgos)
12. [Mapa de Integración y Eventos](#12-mapa-de-integración-y-eventos-del-sistema)
13. [Definición de Done y Criterios de Aceptación](#13-definición-de-done-y-criterios-de-aceptación)
14. [Glosario](#14-glosario)
15. [Control de Versiones](#15-control-de-versiones)


# 1. Resumen Ejecutivo


## 1.1 Visión del Producto

APEX Dev Manager es una plataforma web AI-native que centraliza el diseño, desarrollo, mantenimiento, testing, gobierno de cambios, releases, observabilidad, documentación y control de costos de ecosistemas Oracle APEX desplegados en OCI. Permite al equipo de I&T gestionar múltiples instancias de clientes del sector público colombiano desde una sola interfaz, con Claude AI integrado para acelerar el ciclo de desarrollo completo.


## 1.2 El Problema

El equipo de I&T gestiona más de 25 implementaciones de Oracle APEX en OCI para municipios y entidades del sector público colombiano. El modelo actual presenta fricciones críticas:

- Cada desarrollador opera de forma aislada en su instancia APEX, sin visibilidad cruzada de cambios.
- El mantenimiento del esquema GENESYS (1,008+ tablas, 20 módulos) es intensivo en tiempo y conocimiento tribal.
- No existe historial centralizado de cambios por cliente, aumentando el riesgo operacional.
- La generación de nuevas páginas APEX requiere contexto profundo del modelo de datos y del negocio tributario que tarda semanas en transferirse.
- Los ciclos de aprobación, pruebas y despliegue no están unificados en una sola plataforma.
- No existe capa formal de gobierno de IA, seguridad de prompts, control de riesgos ni analítica de costo por tenant.


## 1.3 La Solución — Tres Pilares

| Pilar | Capacidad | Impacto |
| --- | --- | --- |
| Conexión Multi-tenant | Gestión centralizada de ORDS, JDBC, ambientes y secretos por cliente. | Visibilidad total del portafolio y menor riesgo operativo. |
| IA con Contexto Real | Claude con grounding sobre esquema APEX, GENESYS y reglas tributarias colombianas. | Meta aspiracional: 70% reducción en tiempo de desarrollo. OKR comprometido: ↓ 60% en 12 meses. |
| Gobierno Completo | Testing, aprobación, releases, auditoría, rollback y analítica de costos. | Plataforma usable en operación real, auditable y comercializable. |


## 1.4 Métricas de Éxito (OKRs)

| Objetivo | Key Result | Meta |
| --- | --- | --- |
| Velocidad de desarrollo | Tiempo promedio de implementación de feature nueva | ↓ 60% |
| Calidad del código | Bugs reportados por clientes en producción (mensual) | ↓ 40% |
| Onboarding | Tiempo para que un dev nuevo sea productivo en GENESYS | ↓ 50% |
| Gobierno de cambios | % de cambios trazables con diff, aprobación y rollback | 100% |
| Eficiencia económica | Costo IA por feature controlado por tenant y plan | Dentro del plan SaaS |
| Adopción SaaS | Clientes externos pagando por el producto | 5 en 12 meses |


# 2. Contexto de Negocio y Usuarios


## 2.1 Contexto Organizacional

I&T lleva más de 25 años implementando soluciones tecnológicas para el sector público colombiano. Taxation Smart, basado en Oracle APEX sobre el esquema GENESYS, opera en múltiples municipios y gobernaciones. La complejidad del esquema y la profundidad del conocimiento tributario colombiano son una barrera de entrada que APEX Dev Manager convierte en ventaja competitiva diferencial.


## 2.2 Usuarios Primarios

| Perfil | Rol | Pain Points Actuales |
| --- | --- | --- |
| Developer Senior I&T | Líder técnico por cliente | Pierde horas cambiando de contexto entre instancias APEX de diferentes clientes. |
| Developer Junior I&T | Implementación de features | Alta curva de aprendizaje del esquema GENESYS; depende del senior para entender el modelo. |
| Tech Lead / Arquitecto | Revisión y aprobación de cambios | Falta de visibilidad centralizada del estado de cada instancia APEX en producción. |
| DevOps / Release Manager | Promoción de cambios entre ambientes | Ausencia de pipeline formal de despliegue y trazabilidad integral. |
| Consultor externo / Cliente SaaS | Mantenimiento propio del sistema | Dependencia total de I&T para cualquier cambio y poca estandarización. |


## 2.3 Stakeholders

- José Carlos Herrera (Product Owner / Co-founder I&T) — define roadmap y prioridades.
- Equipo técnico I&T (4–6 developers) — usuarios primarios en fase interna.
- Directivos municipales y secretarías de hacienda — beneficiarios indirectos.
- Anthropic — proveedor de IA (Claude API).
- Oracle — proveedor de infraestructura (OCI, APEX, ORDS).
- Equipos de soporte, seguridad, QA y operación — actores relevantes para producto completo.


# 3. Alcance del Producto — Vista General de Módulos

| ID | Nombre | Descripción | Fase |
| --- | --- | --- | --- |
| M0 | Authentication & Session Management | JWT con refresh tokens (Fase 1–2). SSO/SAML/OCI IAM (Fase 3). Gestión de usuarios y matriz de permisos por rol. | Fase 1 — S1 |
| M1 | Connection Manager | Gestión centralizada de conexiones ORDS/JDBC, secretos y estado de salud por cliente. | Fase 1 — S1 |
| M2 | Application Explorer | Árbol navegable de la estructura APEX desde vistas del diccionario de datos. Soporte offline. | Fase 1 — S2 |
| M3 | Code Editor Studio | Editor Monaco con PL/SQL, SQL, JS. Diff view, apply controlado, editor_sessions persistidas. | Fase 1 — S3 |
| M4 | AI Studio | Chat Claude con contexto real del componente, quick actions y botón Aplicar en APEX. | Fase 1 — S4 |
| M5 | PRD-to-Page Generator | Genera páginas APEX completas desde PRD o wireframe. Manejo de colisión de números de página. | Fase 2 |
| M6 | Change Manager | Historial centralizado con diff visual, estado, rollback y modelo canónico change_log. | Fase 2 |
| M7 | Schema Inspector | Explorador del esquema GENESYS con tablas, columnas, constraints y documentación auto. | Fase 2 |
| M8 | PRD Builder | Transforma texto libre, Word, PDF e imágenes en PRDs estructurados, validados y exportables. | Fase 2 — S5 |
| M9 | Release & Deployment Manager | Pipeline DEV → QA → STAGING → PROD. Hotfix Track. Aprobación configurable. Rollback por release. | Fase 2 |
| M10 | AI Governance & Safety Engine | Sanitización de prompts, validación de salidas, clasificación de riesgo y approval gates. | Fase 2 |
| M11 | Dependency & Impact Analyzer | Grafo de dependencias e impacto de cambios antes de aplicar en componentes APEX. | Fase 2 |
| M12 | Auto Documentation Studio | Documentación técnica/funcional viva por componente, página y release. Diagramas Mermaid. | Fase 2 |
| M13 | Test Automation Studio | Generación y ejecución de pruebas unitarias PL/SQL, integración, regresión, smoke y seguridad. | Fase 2 |
| M14 | GENESYS Knowledge Engine | Enriquecimiento de contexto IA con reglas tributarias. Workflow de aprobación de reglas. | Fase 2 |
| M15 | Usage & Cost Intelligence | Consumo de tokens, costo por tenant/feature/plan, alertas y margen bruto por plan SaaS. | Fase 3 |
| M16 | Full Code Generation Factory | Generación de reportes, LOVs, DAs, paquetes PL/SQL, APIs ORDS, jobs y scripts de migración. | Fase 3 |
| M17 | Product Intelligence Dashboard | Productividad, calidad, performance IA, actividad por cliente y salud del portafolio. | Fase 3 |
| M18 | Accelerators Marketplace | Templates pre-construidos por dominio: predial, ICA, tesorería, nómina, PQR, cartera. | Fase 3 |


# 4. Especificación de Módulos Base (M0–M7)


## M0 — Authentication & Session Management

Gestiona la autenticación de usuarios de la plataforma APEX Dev Manager en todas las fases. Fase 1–2 usa JWT con refresh tokens. Fase 3 integra SSO/SAML/OCI IAM para clientes enterprise externos.


### Estrategia de autenticación por fase

| Fase | Mecanismo | Descripción |
| --- | --- | --- |
| Fase 1–2 | JWT + Refresh Token | Access token (15 min) + Refresh token (7 días, rotación automática). Almacenado en httpOnly cookie. |
| Fase 3 | SSO / SAML / OCI IAM | Integración con proveedores de identidad externos. Soporte SAML 2.0 y OIDC. |


### Requerimientos Funcionales — M0

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-00 | Autenticar usuarios con email + contraseña y emitir access token JWT (15 min) + refresh token httpOnly cookie (7 días). | MUST | S1 |
| RF-01b | El refresh token debe rotarse en cada uso. Un refresh token usado más de una vez invalida toda la familia de tokens del usuario. | MUST | S1 |
| RF-02b | Cierre de sesión que invalide el refresh token activo en servidor. | MUST | S1 |
| RF-03b | Validar el access token JWT en cada request. Token inválido o expirado retorna HTTP 401. | MUST | S1 |
| RF-04b | Bloqueo de cuenta tras 5 intentos fallidos de login (bloqueo de 15 minutos). Retorna HTTP 423. | MUST | S1 |
| RF-05b | Solo el rol admin puede crear y desactivar cuentas. No existe auto-registro en Fase 1–2. | MUST | S1 |
| RF-06b | En Fase 3, soportar SAML 2.0 y OIDC para SSO con proveedores externos configurados por tenant. | SHOULD | Fase 3 |


### API Endpoints — M0

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/auth/login | POST | Autentica usuario. Body: { email, password }. Retorna: { access_token, user }. Setea refresh_token en httpOnly cookie. |
| POST /api/auth/refresh | POST | Renueva access token usando refresh token de cookie. Rota el refresh token. |
| POST /api/auth/logout | POST | Invalida el refresh token activo. Limpia la cookie. |
| GET /api/auth/me | GET | Retorna el perfil del usuario autenticado con rol, tenant y permisos efectivos. |
| POST /api/users | POST | Crea usuario (solo rol admin). Body: { email, name, role, tenant_id }. |
| PATCH /api/users/:id | PATCH | Actualiza usuario. Admin puede cambiar role; el propio usuario puede cambiar name y password. |
| DELETE /api/users/:id | DELETE | Desactiva usuario (soft delete). Solo admin. No elimina datos de auditoría. |


### Modelo de datos — M0

| Tabla | Campos principales |
| --- | --- |
| users | id, email, name, role (admin|developer|tech_lead|release_manager|knowledge_editor|marketplace_publisher), tenant_id, password_hash, failed_attempts, locked_until, is_active, last_login, created_at |
| refresh_tokens | id, user_id, token_hash, family_id (detección de reutilización), expires_at, is_revoked, created_at, used_at |


### Matriz de permisos por rol (operaciones críticas)

| Operación | admin | tech_lead | developer | release_mgr | knowledge_ed. | marketplace_pub. |
| --- | --- | --- | --- | --- | --- | --- |
| Crear/editar conexiones Oracle | ✓ | ✓ | ✗ | ✗ | ✗ | ✗ |
| Aplicar cambio en APEX (BAJO/MEDIO) | ✓ | ✓ | ✓ | ✗ | ✗ | ✗ |
| Aprobar cambio ALTO | ✓ | ✓ | ✗ | ✗ | ✗ | ✗ |
| Aprobar/rechazar release PROD | ✓ | ✓ | ✗ | ✓ | ✗ | ✗ |
| Acceder audit log M10 | ✓ | ✓ | ✗ | ✗ | ✗ | ✗ |
| Crear/actualizar reglas Knowledge (M14) | ✓ | ✓ | ✗ | ✗ | ✓ | ✗ |
| Ver margen bruto por plan (M15) | ✓ (global) | ✗ | ✗ | ✗ | ✗ | ✗ |
| Publicar acelerador (M18) | ✓ | ✗ | ✗ | ✗ | ✗ | ✓ |


### Criterios de aceptación — M0

1. Dado usuario con credenciales válidas, cuando hace POST /api/auth/login, entonces recibe access_token JWT válido por 15 minutos y refresh_token en httpOnly cookie válida por 7 días.
2. Dado un refresh token ya utilizado, cuando se intenta usar nuevamente, entonces el sistema revoca toda la familia de tokens del usuario y retorna HTTP 401.
3. Dado un usuario con 5 intentos fallidos de login, cuando intenta el sexto, entonces recibe HTTP 423 con tiempo de desbloqueo y el sistema registra el evento en audit_events.


## M1 — Connection Manager (Gestor de Conexiones)

Módulo central que gestiona credenciales, secretos, conectividad, ambientes y estado de conexión de cada instancia OCI de cliente. Es el punto de entrada obligatorio para cualquier operación sobre instancias Oracle.


### Funcionalidades principales

- Registro de conexiones ORDS REST: URL base, workspace, schema, usuario y contraseña.
- Registro de conexiones JDBC/SQL*Net: host, puerto, service name, usuario y wallet opcional.
- Health check automático cada 5 minutos con indicador visual (Conectado / Inactivo / Error).
- Test de conectividad manual antes de guardar una nueva conexión.
- Encriptación AES-256 de credenciales almacenadas. Nunca se exponen en el frontend ni en logs.
- Integración con OCI Vault para referencia segura de secretos por tenant.
- Soft delete en eliminación de conexiones (campo deleted_at): preserva integridad del change_log.


### Requerimientos Funcionales — M1

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-01 | Registrar conexión ORDS con: nombre, URL base, workspace, schema, usuario y contraseña. | MUST | S1 |
| RF-02 | Registrar conexión JDBC con: nombre, host, puerto, service name, usuario y contraseña o wallet. | MUST | S1 |
| RF-03 | Las contraseñas deben almacenarse cifradas (AES-256) y nunca exponerse en el frontend ni en logs. | MUST | S1 |
| RF-04 | Health check automático cada 5 minutos mostrando estado (Conectado / Inactivo / Error). | MUST | S1 |
| RF-05 | Test de conexión manual antes de guardar una nueva conexión. | MUST | S1 |
| RF-06 | Etiquetar conexiones por región, tipo de entidad o grupo. | SHOULD | S2 |
| RF-07 | Soportar múltiples workspaces por instancia OCI. | SHOULD | S2 |
| RF-08 | La eliminación de conexiones es soft delete (campo deleted_at). Los registros de change_log asociados se conservan para auditoría. | MUST | S1 |


### API Endpoints — M1

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/connections | POST | Registra nueva conexión. Body: { tenant_id, name, type, ords_url?, host?, port?, service_name?, workspace, schema, db_user, db_password }. Encripta credenciales antes de persistir. |
| GET /api/connections | GET | Lista conexiones del tenant. Filtros: ?type=&status=&tag=. Nunca retorna db_password. |
| GET /api/connections/:id | GET | Detalle de una conexión. Excluye credenciales sensibles. |
| PATCH /api/connections/:id | PATCH | Actualiza conexión. Toda modificación de credenciales genera registro en audit_events. |
| DELETE /api/connections/:id | DELETE | Soft delete (setea deleted_at). Requiere confirmación si tiene change_log activo. Retorna 409 si hay releases en curso. |
| POST /api/connections/:id/test | POST | Test de conectividad manual. Retorna { success, latency_ms, error? }. |
| GET /api/connections/:id/health | GET | Retorna el estado actual del health check más reciente. |



## M2 — Application Explorer (Explorador de Aplicaciones)

Árbol navegable que expone la estructura real de las aplicaciones APEX desde las vistas del diccionario de datos Oracle. Soporta modo offline con caché del último estado sincronizado.


### Requerimientos Funcionales — M2

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-10 | Listar aplicaciones vía APEX_APPLICATIONS para una conexión activa. | MUST | S2 |
| RF-11 | Listar páginas por aplicación vía APEX_APPLICATION_PAGES. | MUST | S2 |
| RF-12 | Mostrar componentes de cada página: regiones, items, procesos, validaciones, DAs. | MUST | S2 |
| RF-13 | Búsqueda global por nombre, ID o tipo de componente. | MUST | S2 |
| RF-14 | Filtrar por estado, tipo de página y fecha de modificación. | SHOULD | S2 |
| RF-15 | Mostrar indicador de sincronización con el Change Log por componente. | SHOULD | S3 |
| RF-15b | Cuando una conexión está offline, mostrar el último árbol sincronizado en modo solo lectura con marca de tiempo y banner de advertencia. El botón Editar en Code Editor debe estar deshabilitado. | MUST | S2 |


### API Endpoints — M2

| Endpoint | Método | Descripción |
| --- | --- | --- |
| GET /api/explorer/:connectionId/apps | GET | Lista aplicaciones APEX de la conexión. |
| GET /api/explorer/:connectionId/apps/:appId/pages | GET | Lista páginas de una aplicación. |
| GET /api/explorer/:connectionId/apps/:appId/pages/:pageId/components | GET | Retorna todos los componentes de una página. |
| GET /api/explorer/:connectionId/search | GET | Búsqueda global. Param: ?q=&component_type=. |
| POST /api/explorer/:connectionId/sync | POST | Sincroniza el árbol con las vistas APEX actualizadas. |



## M3 — Code Editor Studio (Editor de Código)

Editor avanzado basado en Monaco con soporte completo para PL/SQL, SQL, JavaScript, HTML y CSS. Integrado con MCP para autocompletado contextual, Change Manager para auditoría y editor_sessions para persistencia de estado.


### Requerimientos Funcionales — M3

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-16 | Monaco Editor con syntax highlighting para PL/SQL, SQL, JavaScript, HTML y CSS. | MUST | S3 |
| RF-17 | Autocompletado de tablas y columnas del esquema activo usando MCP. | MUST | S3 |
| RF-18 | Diff view entre versión actual y versión anterior del componente. | MUST | S3 |
| RF-19 | Apply de cambio via ORDS con registro automático en Change Log. | MUST | S3 |
| RF-20 | Formateo automático de código SQL/PL/SQL. | SHOULD | S3 |
| RF-21 | Análisis de impacto (M11) integrado antes de apply en cambios MEDIO+. Activo desde S8 cuando M11 esté disponible. En S3–S7 muestra advertencia genérica. | SHOULD | S8 (stub S3) |
| RF-21b | Cuando una conexión está offline, el editor muestra el último estado en modo solo lectura. El botón Apply debe estar deshabilitado. | MUST | S3 |
| RF-21c | Persistir el estado de sesión del editor (tab activo, componente abierto, borradores no guardados) para restaurarlo al recargar. | SHOULD | S4 |


### API Endpoints — M3

| Endpoint | Método | Descripción |
| --- | --- | --- |
| GET /api/editor/:connectionId/component | GET | Retorna el código fuente del componente. Params: ?app_id=&page_id=&component_type=&component_name=. |
| PUT /api/editor/:connectionId/component | PUT | Actualiza el código via ORDS. Registra en Change Log. Retorna 503 si la conexión está offline. |
| POST /api/editor/format | POST | Formatea código SQL/PL/SQL. Body: { code, language }. |
| POST /api/editor/diff | POST | Genera diff entre dos versiones. Body: { code_before, code_after }. |
| GET /api/editor/sessions/:userId | GET | Retorna el estado de sesión persistido del editor. |
| PUT /api/editor/sessions/:userId | PUT | Guarda estado de sesión. Body: { connection_id, app_id, page_id, active_tab, component_draft }. |


### Modelo de datos — M3

| Tabla | Campos principales |
| --- | --- |
| editor_sessions | id, tenant_id, user_id (FK→users), connection_id (FK→connections), app_id, page_id, active_tab, component_draft JSONB, last_active_at, updated_at |



## M4 — AI Studio (Asistente Claude)

Panel de chat con Claude AI que recibe automáticamente el contexto del componente activo, el esquema GENESYS y las reglas del dominio tributario. Toda salida pasa por el Safety Engine M10 antes de poder aplicarse.


### Funcionalidades principales

- Chat contextual: Claude recibe el código actual, tipo de página y contexto de esquema automáticamente.
- Quick actions predefinidas: Explicar, Refactorizar, Detectar Bugs, Documentar, Optimizar, Analizar Seguridad.
- Botón "Aplicar en APEX" sujeto a M10 Safety Engine.
- Historial de conversación por sesión y por página APEX.
- Modo Batch: aplicar la misma transformación a múltiples páginas.
- Enriquecimiento automático de contexto via M14 GENESYS Knowledge Engine.


### Requerimientos Funcionales — M4

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-22 | Claude debe recibir automáticamente el código del componente activo, tipo de página y contexto de esquema en cada mensaje. | MUST | S4 |
| RF-23 | Quick actions predefinidas: Explicar, Refactorizar, Bugs, Documentar, Optimizar, Seguridad. | MUST | S4 |
| RF-24 | Bloques de código en la respuesta con botón Copiar y botón Aplicar en APEX. | MUST | S4 |
| RF-25 | "Aplicar en APEX" debe actualizar el componente en ORDS y registrar en Change Log. | MUST | S4 |
| RF-26 | Historial de conversación por página entre sesiones. | SHOULD | S4 |
| RF-27 | Claude debe generar código respetando las convenciones del CLAUDE.md del proyecto. | MUST | S4 |
| RF-28 | Modo Batch para aplicar instrucción a múltiples páginas. | COULD | S5 |


### API Endpoints — M4

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/ai-studio/chat | POST | Envía mensaje al asistente. Body: { session_id, connection_id, app_id, page_id, component_context, message }. Streaming SSE. |
| GET /api/ai-studio/sessions/:id/history | GET | Retorna historial de conversación de una sesión. |
| POST /api/ai-studio/apply | POST | Aplica código generado al componente activo. Body: { session_id, code, component_ref }. Pasa por M10. |
| POST /api/ai-studio/quick-action | POST | Ejecuta una quick action predefinida. Body: { action_type, component_context, connection_id }. |
| POST /api/ai-studio/batch | POST | Crea job de batch transformation. Body: { instruction, page_ids[], connection_id, app_id }. |



## M5 — PRD-to-Page Generator

Genera páginas APEX completas desde documentos de requisitos o imágenes de wireframe. Incluye manejo de colisión de números de página y validación de conexión activa antes de generar.


### Requerimientos Funcionales — M5

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-30 | Aceptar input de texto PRD estructurado y generar definición de página APEX. | MUST | Fase 2 |
| RF-31 | Aceptar input de imagen (PNG/JPG, max 5MB) e identificar componentes visuales. | MUST | Fase 2 |
| RF-32 | Preview del resultado con estructura de página antes de aplicar. | MUST | Fase 2 |
| RF-33 | Generación respetando convenciones GENESYS y CLAUDE.md del proyecto. | MUST | Fase 2 |
| RF-34 | Recibir PRD aprobado desde M8 y disparar generación automáticamente. | MUST | Fase 2 |
| RF-35 | Si target_page_number ya existe, alertar al usuario y ofrecer: Sobreescribir (con confirmación + Change Log con code_before), Número nuevo automático, o Cancelar. | MUST | Fase 2 |
| RF-36 | Validar que la conexión destino esté activa (estado Conectado) antes de iniciar la generación. | MUST | Fase 2 |


### API Endpoints — M5

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/prd-to-page/generate | POST | Genera página APEX desde PRD o imagen. Body multipart: { connection_id, app_id, prd_text?, image_file?, prd_id? }. Streaming SSE. |
| GET /api/prd-to-page/previews/:jobId | GET | Retorna preview de la página generada con estructura completa. |
| POST /api/prd-to-page/apply/:jobId | POST | Aplica la página generada. Body: { target_page_number?, collision_strategy? (overwrite|new_number|cancel), approved_by }. |



## M6 — Change Manager (Gestor de Cambios)

Historial centralizado y auditable de todas las modificaciones. Es la fuente de verdad para rollback y auditoría. La tabla `change_log` es la tabla canónica de este módulo.


### Requerimientos Funcionales — M6

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-40 | Registrar cada operación de escritura con: actor, timestamp, componente, diff y estado. | MUST | Fase 2 |
| RF-41 | Diff visual entre código antes y después del cambio. | MUST | Fase 2 |
| RF-42 | Rollback de cambio individual con restauración del código anterior via ORDS. | MUST | Fase 2 |
| RF-43 | Filtros por conexión, developer, fechas y tipo de operación. | MUST | Fase 2 |
| RF-44 | Exportación del historial en CSV o JSON. | SHOULD | Fase 2 |
| RF-45b | Toda modificación de credenciales de conexión debe generar registro en audit_events, independientemente del rol del actor. | MUST | S1 |


### Modelo de datos — M6 (tabla canónica change_log)

| Tabla | Campos principales |
| --- | --- |
| change_log | id, connection_id (FK→connections, no cascade delete), app_id, page_id, component_type, component_name, code_before, code_after, applied_by (FK→users), applied_at, status (applied|rolled_back|failed), release_id (FK→releases, nullable), rollback_of_id (FK self-ref→change_log.id, nullable) |


### API Endpoints — M6

| Endpoint | Método | Descripción |
| --- | --- | --- |
| GET /api/changes | GET | Lista cambios. Filtros: ?connection_id=&applied_by=&date_from=&date_to=&status=&page=. Respuesta paginada cursor-based. |
| GET /api/changes/:id | GET | Detalle de un cambio con diff completo. |
| POST /api/changes/:id/rollback | POST | Ejecuta rollback. Body: { rolled_back_by, reason }. Requiere confirmación. |
| GET /api/changes/export | GET | Exporta historial. Params: ?format=csv|json&filters. |



## M7 — Schema Inspector (Inspector de Esquema)

Explorador del modelo de datos del schema GENESYS con capacidades de análisis y documentación automática via Claude.


### Requerimientos Funcionales — M7

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-45 | Listar tablas del schema con columnas, tipos y constraints via ALL_COLUMNS / USER_TABLES. | MUST | Fase 2 |
| RF-46 | Visualizar relaciones FK entre tablas. | SHOULD | Fase 2 |
| RF-47 | Búsqueda de tablas por nombre o columna. | MUST | Fase 2 |
| RF-48 | Generación de documentación de tabla via Claude con descripción funcional. | MUST | Fase 2 |
| RF-49 | Estadísticas de uso de tablas en páginas APEX. | SHOULD | Fase 3 |


### API Endpoints — M7

| Endpoint | Método | Descripción |
| --- | --- | --- |
| GET /api/schema/:connectionId/tables | GET | Lista tablas del schema. Params: ?search=&page=. |
| GET /api/schema/:connectionId/tables/:tableName | GET | Detalle de tabla con columnas, tipos, constraints y FKs. |
| POST /api/schema/:connectionId/tables/:tableName/document | POST | Genera documentación de la tabla via Claude. Guarda en M12. |
| GET /api/schema/:connectionId/tables/:tableName/usage | GET | Retorna páginas APEX que referencian la tabla. |



# 5. Especificación de Módulos Enterprise (M8–M14)


## M8 — PRD Builder (Constructor Inteligente de PRD)

Transforma insumos desestructurados (texto libre, Word, PDF, imágenes) en PRDs estructurados, validados y listos para alimentar M5.


### Flujo de trabajo — 5 etapas

| # | Etapa | Acción del sistema | Acción del usuario |
| --- | --- | --- | --- |
| 1 | Ingesta | Acepta .docx, .doc, .pdf, .png, .jpg, .webp y texto libre. Hasta 10 archivos, 25 MB c/u. | Arrastra archivos o escribe descripción en el área de ingesta. |
| 2 | Extracción IA | Claude identifica actores, flujos, reglas de negocio, páginas APEX implícitas y tablas GENESYS relevantes. | Espera procesamiento con barra de progreso en streaming. |
| 3 | Generación Draft | Genera PRD con 10 secciones: contexto, actores, flujos, RF, RNF, modelo de datos, páginas APEX, reglas de negocio, integraciones, preguntas abiertas. | Recibe el draft en el panel de revisión. |
| 4 | Validación y Preguntas | Checklist con criterios bloqueantes y advertencias. Preguntas agrupadas por sección. | Responde preguntas. Sistema revalida y muestra delta de mejora. |
| 5 | Exportación | PRD final con score. Exporta a .md con frontmatter YAML o envía a M5. | Aprueba, edita secciones o envía a M5 con un clic. |


### Requerimientos Funcionales — M8

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-50 | Aceptar ingesta de texto libre, .docx, .doc, .pdf e imágenes en la misma sesión (hasta 10 archivos, 25 MB c/u). | MUST | S5 |
| RF-51 | Generación del PRD draft en menos de 60 segundos para insumos de hasta 5,000 palabras con streaming. | MUST | S5 |
| RF-52 | PRD generado con 10 secciones obligatorias. | MUST | S5 |
| RF-53 | Checklist separado en bloqueantes (impiden exportación) y advertencias (permiten con aviso). | MUST | S5 |
| RF-54 | Preguntas generadas por Claude agrupadas por sección para cada criterio fallido. | MUST | S5 |
| RF-55 | Revalidación solo de criterios afectados tras cada respuesta del usuario. | MUST | S5 |
| RF-56 | Editor de sección directamente en pantalla con revalidación parcial automática. | MUST | S5 |
| RF-57 | Exportación .md con frontmatter YAML: app_id, tablas GENESYS, score y advertencias. | MUST | S6 |
| RF-58 | Botón "Enviar a M5" habilitado solo cuando no existan bloqueantes sin resolver. | MUST | S6 |
| RF-59 | Trazabilidad fuente-sección: cada sección indica de qué archivo/fragmento proviene. | SHOULD | S6 |


### API Endpoints — M8

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/prd-builder/sessions | POST | Crea sesión. Body: { tenant_id, created_by }. Retorna session_id. |
| POST /api/prd-builder/sessions/:id/ingest | POST | Sube archivos o texto. Multipart. Retorna source_ids. |
| POST /api/prd-builder/sessions/:id/generate | POST | Genera PRD draft. Streaming SSE. |
| GET /api/prd-builder/sessions/:id/prd | GET | Retorna PRD completo con secciones, score y checklist. |
| PATCH /api/prd-builder/sessions/:id/sections/:sectionId | PATCH | Edita sección. Dispara revalidación parcial. |
| POST /api/prd-builder/sessions/:id/validate | POST | Ciclo de validación completo. |
| POST /api/prd-builder/sessions/:id/questions/:qId/answer | POST | Responde pregunta de refinamiento. |
| POST /api/prd-builder/sessions/:id/export | POST | Exporta a .md. Retorna URL de descarga. |
| POST /api/prd-builder/sessions/:id/send-to-m5 | POST | Envía PRD aprobado a M5. |


### Modelo de datos — M8

| Tabla | Campos principales |
| --- | --- |
| prd_sessions | id, tenant_id, created_by, status (draft|validating|approved|sent_to_m5), validation_score, created_at, updated_at |
| prd_sources | id, session_id, source_type (text|docx|pdf|image), file_name, file_size_bytes, extracted_text, created_at |
| prd_sections | id, session_id, section_key, content_md, status (pending|ok|warning|blocked), updated_at |
| prd_validation_results | id, session_id, criterion_key, criterion_type (blocker|warning), section_key, status (open|resolved), question_text, answer_text, resolved_at |



## M9 — Release & Deployment Manager

Gestiona el ciclo completo de un cambio desde desarrollo hasta producción. Incluye Hotfix Track para emergencias que requieren despliegue directo a PROD.


### Pipeline de ambientes

| Ambiente | DEV | QA | STAGING | PROD |
| --- | --- | --- | --- | --- |
| Propósito | Sandbox libre | Tests automatizados | UAT y validación | Producción cliente |
| Quién despliega | Developer (auto) | CI/CD trigger | Tech Lead (manual) | Release Mgr + doble aprobación |
| Tests requeridos | Unitarios básicos | Unitarios + integración + smoke | Smoke + regresión + seguridad | Smoke + signoff UAT |
| Rollback | Manual inmediato | Auto si falla pipeline | Manual con aprobación | Emergencia: auto + notificación |


### Flujo Hotfix Track

| Paso | Descripción |
| --- | --- |
| 1. Crear hotfix release | Developer crea release con flag is_hotfix=true. El sistema advierte que se omitirán los ambientes intermedios. |
| 2. Doble aprobación | Requiere aprobación de Tech Lead Y Product Owner. Timeout de 2 horas. |
| 3. Deploy directo a PROD | El sistema despliega directamente tras doble aprobación. Registra HOTFIX_DEPLOYED. |
| 4. Smoke tests post-deploy | Si los smoke tests de PROD fallan, rollback automático sin intervención humana. |
| 5. Reporte obligatorio | Dentro de las 24 horas, el Release Manager debe documentar la causa raíz en hotfix_reason. |


### Requerimientos Funcionales — M9

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-68 | Gestionar ambientes DEV, QA, STAGING y PROD con pipelines configurables por tenant. | MUST | Fase 2 |
| RF-69 | Snapshot completo del código de cada componente por release para rollback exacto. | MUST | Fase 2 |
| RF-70 | Release notes automáticas por Claude al crear un release, editables por el Release Manager. | MUST | Fase 2 |
| RF-71 | Flujo de aprobación configurable: 0, 1 o 2 aprobadores según el ambiente destino. | MUST | Fase 2 |
| RF-72 | Rollback que restaura todos los componentes del release al snapshot y registra en Change Log. | MUST | Fase 2 |
| RF-73 | Evento DEPLOYMENT_FAILED y notificación si cualquier step del pipeline falla. | MUST | Fase 2 |
| RF-74 | Estado de releases en tiempo real via WebSocket o SSE. | SHOULD | Fase 2 |
| RF-75b | Hotfix Track: omite QA y STAGING con doble aprobación obligatoria y rollback automático si smoke tests de PROD fallan. | MUST | Fase 2 |


### API Endpoints — M9

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/releases | POST | Crea release. Body: { tenant_id, version, source_env, target_env, change_ids[], is_hotfix? }. |
| GET /api/releases | GET | Lista releases paginada cursor-based. Filtros: ?tenant_id=&status=&env=. |
| GET /api/releases/:id | GET | Detalle con cambios, pipeline steps, aprobaciones y release notes. |
| POST /api/releases/:id/promote | POST | Inicia promoción. Body: { approved_by, override_failed_tests?, override_reason? }. Pre-conditions validadas. Retorna 422 si no se cumplen. |
| POST /api/releases/:id/approve | POST | Aprueba el release. Body: { approver_id, comments }. |
| POST /api/releases/:id/reject | POST | Rechaza el release. Body: { rejector_id, reason }. |
| POST /api/releases/:id/rollback | POST | Ejecuta rollback completo del release. |
| GET /api/releases/:id/notes | GET | Retorna release notes editables. |
| PATCH /api/releases/:id/notes | PATCH | Actualiza release notes. |


### Modelo de datos — M9

| Tabla | Campos principales |
| --- | --- |
| releases | id, tenant_id, release_version, source_env, target_env, status (draft|in_pipeline|pending_approval|approved|deployed|rolled_back|failed), created_by, approved_by, deployed_at, rollback_point_id, is_hotfix (bool), hotfix_reason (text, requerido en 24h si is_hotfix=true) |
| release_changes | id, release_id, change_log_id, component_type, component_name, app_id, page_id, code_snapshot |
| pipeline_steps | id, release_id, step_name, step_type, status (pending|running|passed|failed|skipped), started_at, completed_at, logs_ref |
| approvals | id, release_id, approver_id, approval_type (first|second), status (pending|approved|rejected), comments, decided_at |
| release_notes | id, release_id, content_md, generated_by_ai, last_edited_by, last_edited_at |



## M10 — AI Governance & Safety Engine

Capa transversal que intercepta todas las interacciones con Claude API. Opera como middleware obligatorio en el AI Orchestration Layer. En Fase 1 (S1–S4) aplica un stub de sanitización básica; los approval gates completos se activan en Fase 2 (S7).


### Clasificación de riesgo de cambios

| Nivel | Criterios | Acción del sistema |
| --- | --- | --- |
| BAJO | Cambios en queries de lectura, ajustes UI, renombrado de items, textos de validación. | Aplicación directa. Log en Change Log. |
| MEDIO | Procesos PL/SQL que afectan una sola tabla. Validaciones de negocio. Nuevas páginas. | Confirmación del developer. Log con diff. |
| ALTO | Paquetes compartidos. DML sobre tablas maestras. DAs con efectos en cadena. Autenticación. | Bloqueado hasta aprobación del Tech Lead. |
| CRÍTICO | DROP, TRUNCATE, GRANT, REVOKE, ALTER TABLE. Esquemas de autorización. Procesos tributarios. | Bloqueado hasta aprobación doble. Alerta al Product Owner. |


### Requerimientos Funcionales — M10

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-80 | Interceptar el 100% de los prompts enviados a Claude. En Fase 1 (S4): stub con sanitización básica de input. Completo en S7. | MUST | S4 (stub) / S7 (completo) |
| RF-81 | Detectar patrones de prompt injection en documentos externos antes de incluirlos en el contexto. | MUST | Fase 2 |
| RF-82 | Output Validator rechaza código con DROP, TRUNCATE, GRANT o REVOKE sin doble aprobación. | MUST | Fase 2 |
| RF-83 | Risk Classifier asigna nivel de riesgo en menos de 500ms. | MUST | Fase 2 |
| RF-84 | Cambios ALTO y CRÍTICO bloqueados hasta aprobación del actor autorizado. Sin bypass posible desde ningún rol. | MUST | Fase 2 |
| RF-85 | Audit log inmutable: ningún usuario (incluido admin) puede eliminar o modificar registros de interacciones IA. Admin puede leer. | MUST | Fase 2 |
| RF-86 | Administradores de tenant pueden configurar reglas de safety personalizadas adicionales. | SHOULD | Fase 3 |


### API Endpoints — M10

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/ai-governance/validate-input | POST | Sanitiza input antes de Claude. Retorna: { safe, issues[], sanitized_prompt }. |
| POST /api/ai-governance/validate-output | POST | Valida salida de Claude. Retorna: { valid, risk_level, issues[] }. |
| POST /api/ai-governance/classify-risk | POST | Clasifica riesgo. Retorna: { risk_level, reasons[], confidence_score }. |
| GET /api/ai-governance/audit-log | GET | Log de interacciones IA (solo lectura). Filtros: ?tenant_id=&risk_level=&date_from=&date_to=. |
| POST /api/ai-governance/approvals | POST | Crea solicitud de aprobación para cambio ALTO/CRÍTICO. |
| PATCH /api/ai-governance/approvals/:id | PATCH | Aprueba o rechaza. Body: { decision, approver_id, comments }. |


### Modelo de datos — M10

| Tabla | Campos principales |
| --- | --- |
| ai_interactions | id, tenant_id, user_id, session_id (FK→ai_sessions), prompt_hash, sanitized_prompt, raw_response, validated_output, risk_level, confidence_score, injection_detected (bool), created_at |
| governance_approvals | id, tenant_id, interaction_id, change_id, risk_level, status (pending|approved|rejected|expired), requested_by, first_approver_id, second_approver_id, decided_at, comments |
| safety_rules | id, tenant_id, rule_type (injection_pattern|output_pattern|risk_trigger), rule_value, action (block|warn|log), is_global (bool), created_at |



## M11 — Dependency & Impact Analyzer

Analiza dependencias entre componentes APEX y presenta un grafo de impacto antes de aplicar cualquier cambio.


### Tipos de dependencias analizadas

| Tipo | Ejemplo | Impacto potencial |
| --- | --- | --- |
| Page → Shared Component | Página usa LOV compartida o región de navegación. | Cambio en LOV afecta todas las páginas que la referencian. |
| Process → Package | Proceso llama a PKG_TRIBUTOS.fn_calcular_ica. | Cambio en firma del paquete rompe el proceso. |
| Dynamic Action → Item | DA escucha cambio en P_CODIGO_MUNICIPIO. | Renombrar el item rompe la DA silenciosamente. |
| Report → Table/View | Región reporte query sobre V_RECAUDO_MENSUAL. | Cambio en vista rompe el reporte. |
| Page → Authorization | Página referencia esquema ROL_TESORERO. | Cambio en esquema afecta acceso a la página. |


### Requerimientos Funcionales — M11

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-90 | Calcular grafo de dependencias de primer y segundo nivel para cualquier componente APEX. | MUST | Fase 2 |
| RF-91 | Análisis de impacto en menos de 3 segundos para componentes con hasta 50 dependencias. | MUST | Fase 2 |
| RF-92 | Sincronización del grafo con vistas del diccionario APEX al menos cada hora o bajo demanda. | MUST | Fase 2 |
| RF-93 | Bloquear apply de cambios ALTO/CRÍTICO si el análisis de impacto no fue revisado. | MUST | Fase 2 |
| RF-94 | Generar plan de regresión sugerido basado en el grafo de impacto. | SHOULD | Fase 2 |


### API Endpoints — M11

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/impact/analyze | POST | Analiza impacto de un cambio. Body: { connection_id, app_id, component_type, component_name, code_after }. |
| GET /api/impact/graph/:componentId | GET | Grafo de dependencias en JSON (nodes[], edges[]). Param: ?depth=2. |
| GET /api/impact/affected/:componentId | GET | Lista componentes afectados con tipo, página, app_id y profundidad. |
| POST /api/impact/regression-plan | POST | Plan de regresión sugerido. Body: { component_ids[] }. |
| POST /api/impact/sync/:connectionId | POST | Sincroniza grafo desde diccionario APEX. |



## M12 — Auto Documentation Studio

Genera y mantiene documentación técnica y funcional viva. Cada cambio aprobado dispara actualización automática de la documentación relevante.


### Tipos de documentación generada

| Tipo | Contenido generado |
| --- | --- |
| Documentación técnica de componente | Descripción del proceso PL/SQL, parámetros, tablas afectadas, advertencias y ejemplos. |
| Documentación funcional de página | Propósito, flujo de usuario, campos requeridos, reglas de validación, roles y mensajes de error. |
| Release Notes | Resumen del release, features nuevas, bugs corregidos, cambios de esquema e instrucciones de migración. |
| Manual de módulo | Documentación consolidada de todas las páginas de un módulo con tabla de permisos por rol. |
| Diagrama de flujo Mermaid | Generado desde código PL/SQL y DAs para procesos con más de 3 pasos de decisión. |


### Requerimientos Funcionales — M12

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-100 | Generar documentación técnica automáticamente para cada cambio aprobado aplicado. | MUST | Fase 2 |
| RF-101 | Incluir diagrama Mermaid para procesos PL/SQL con más de 3 pasos de decisión. | SHOULD | Fase 2 |
| RF-102 | Documentos editables por el developer con historial de versiones. | MUST | Fase 2 |
| RF-103 | Exportar manual completo de módulo a .docx con portada y tabla de contenidos. | SHOULD | Fase 3 |


### API Endpoints — M12

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/docs/generate/component | POST | Genera doc técnica para un componente. |
| POST /api/docs/generate/page | POST | Genera doc funcional de una página APEX completa. |
| POST /api/docs/generate/release-notes/:releaseId | POST | Genera release notes del release especificado. |
| GET /api/docs/:componentId | GET | Retorna documentación vigente en markdown. |
| PATCH /api/docs/:docId | PATCH | Actualiza documento manualmente. |
| GET /api/docs/export/:moduleId | GET | Exporta manual de módulo. Param: ?format=md|docx. |



## M13 — Test Automation Studio

Define, genera, ejecuta y reporta pruebas automatizadas para aplicaciones APEX. Claude genera los casos de prueba desde el código y los PRDs.


### Tipos de prueba soportados

| Tipo | Descripción | Cómo se generan |
| --- | --- | --- |
| Unitario PL/SQL | Prueba de paquetes y funciones con utPLSQL. | Claude analiza la firma y cuerpo del paquete y genera suites utPLSQL. |
| Integración APEX | Verifica que procesos de página interactúan correctamente con la BD via ORDS REST. | Claude analiza el flujo de página y genera scripts de prueba. |
| Regresión | Ejecuta el conjunto completo de tests aprobados para detectar regresiones. | Selección automática basada en grafo de impacto de M11. |
| Smoke | Conjunto mínimo que valida que la aplicación arranca y sus flujos críticos funcionan. | Definidos por el Tech Lead. Obligatorios en cada release. |
| Seguridad | Verifica autenticación, autorización, SQL injection y XSS. | Claude genera casos de ataque desde las validaciones del componente. |


### Requerimientos Funcionales — M13

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-110 | Generar casos de prueba utPLSQL para paquetes PL/SQL desde el análisis del código. | MUST | Fase 2 |
| RF-111 | Smoke tests ejecutados automáticamente como parte del pipeline de release. | MUST | Fase 2 |
| RF-112 | Bloquear aprobación de PROD si existen test runs fallidos sin justificación del Tech Lead. | MUST | Fase 2 |
| RF-113 | Seleccionar tests de regresión automáticamente usando el grafo de impacto de M11. | SHOULD | Fase 2 |
| RF-114 | Reportes de test run exportables a .md para historial del release. | SHOULD | Fase 2 |


### API Endpoints — M13

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/tests/generate | POST | Genera casos de prueba. Body: { component_id, test_types[], prd_id? }. Streaming SSE. |
| POST /api/tests/runs | POST | Crea y ejecuta test run. Body: { suite_id, environment, triggered_by }. |
| GET /api/tests/runs/:id | GET | Estado y resultados del test run con logs. |
| GET /api/tests/suites | GET | Lista suites por tenant. Filtros: ?app_id=&type=. |
| PUT /api/tests/suites/:id/smoke | PUT | Designa suite como smoke test obligatorio. |
| GET /api/tests/report/:runId | GET | Reporte completo exportable. |


### Modelo de datos — M13

| Tabla | Campos principales |
| --- | --- |
| test_suites | id, tenant_id, app_id, suite_name, test_type, is_smoke_test, environment, generated_by_ai, created_at |
| test_cases | id, suite_id, case_name, description, test_script, expected_result, component_id, created_at |
| test_runs | id, suite_id, release_id, environment, status (running|passed|failed|aborted), triggered_by, started_at, completed_at, pass_count, fail_count, skip_count |
| test_results | id, run_id, case_id, status (pass|fail|skip|error), actual_result, error_message, duration_ms, executed_at |



## M14 — GENESYS Knowledge Engine

Enriquece el contexto de Claude con conocimiento profundo del dominio tributario colombiano. Incluye workflow de aprobación de reglas y campo normative_source para trazabilidad legal.


### Dominios de conocimiento

| Dominio | Conocimiento incluido | Tablas GENESYS clave |
| --- | --- | --- |
| Impuesto Predial | Cálculo de avalúo catastral, tarifas por estrato y uso, exenciones, vigencias, liquidación. | PREDIAL, PREDIO, PROPIETARIO, TARIFA_PREDIAL |
| ICA y Retenciones | Declaraciones bimestrales/anuales, CIIU, tarifas por actividad, retenciones ICA, sanciones. | ICA_DECLARACION, ACTIVIDAD_ECONOMICA, TARIFA_ICA |
| Tesorería y Recaudo | Acuerdos de pago, intereses de mora, descuentos, cajas, conciliación bancaria. | ACUERDO_PAGO, RECIBO, CAJA, MOVIMIENTO |
| Cartera y Cobro Coactivo | Cartera vencida, mandamientos de pago, embargos, prescripción. | CARTERA, COBRO_COACTIVO, EMBARGO, DEUDOR |
| Nómina Municipal | Liquidación de nómina, libranzas, embargos judiciales, parafiscales, PILA. | NOMINA, EMPLEADO, NOVEDAD, DESCUENTO |


### Requerimientos Funcionales — M14

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-120 | Enriquecer automáticamente el contexto de toda petición al AI Studio con reglas y tablas GENESYS del dominio inferido. | MUST | Fase 2 |
| RF-121 | Clasificación de dominio con precisión > 85% en: predial, ICA, tesorería, cartera y nómina. | MUST | Fase 2 |
| RF-122 | Knowledge editors pueden agregar y actualizar reglas sin intervención del equipo de desarrollo. | MUST | Fase 2 |
| RF-123 | Versionar las reglas de conocimiento y consultar versión activa en fecha específica. | SHOULD | Fase 3 |
| RF-124 | Toda nueva regla pasa por workflow: propuesta (knowledge_editor) → revisión → aprobación (tech_lead o admin). Las reglas pendientes no se inyectan en el contexto de Claude. | MUST | Fase 2 |
| RF-125 | Cada regla debe tener campo normative_source (URL o referencia legal). SLA: normas nuevas publicadas en el motor en máx. 5 días hábiles. | MUST | Fase 2 |


### API Endpoints — M14

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/knowledge/enrich-context | POST | Enriquece contexto IA. Body: { prompt, component_context, app_id }. Retorna enriched_context. |
| GET /api/knowledge/domains | GET | Lista dominios con reglas y tablas asociadas. |
| GET /api/knowledge/rules/:domain | GET | Reglas del dominio. Param: ?active_only=true. |
| POST /api/knowledge/rules | POST | Crea regla. Body: { domain, rule_text, normative_source, tables_refs[], created_by }. |
| PUT /api/knowledge/rules/:id | PUT | Actualiza regla. Requiere rol knowledge_editor. |
| POST /api/knowledge/classify-intent | POST | Clasifica dominio tributario de un prompt. |
| POST /api/knowledge/rules/:id/approve | POST | Aprueba regla pendiente. Solo tech_lead o admin. |
| POST /api/knowledge/rules/:id/deprecate | POST | Depreca una regla activa. Body: { deprecated_by, reason }. |


### Modelo de datos — M14

| Tabla | Campos principales |
| --- | --- |
| knowledge_domains | id, domain_name, description, is_active, created_at |
| knowledge_rules | id, domain_id, rule_title, rule_text, normative_source (URL o referencia legal, ej. Decreto 1625/2016 Art.42), genesys_tables[], status (draft|pending_approval|active|deprecated), version, created_by (FK→users), approved_by (FK→users, nullable), created_at, updated_at |
| knowledge_table_maps | id, domain_id, table_name, relevance_score, key_columns[], relationship_notes, created_at |



# 6. Especificación de Módulos SaaS y Escala (M15–M18)


## M15 — Usage & Cost Intelligence

Mide, consolida y visualiza consumo de tokens Claude API, costos OCI y costos por tenant/feature/plan. Alimenta dashboards ejecutivos, modelo de pricing y alertas de umbral.


### Métricas clave medidas

| Métrica | Descripción |
| --- | --- |
| Tokens por sesión | Input + output tokens por llamada a Claude API. Clasificado por módulo y tipo de acción. |
| Costo Claude API / tenant / mes | Tokens × tarifa vigente. Comparado contra cuota del plan SaaS. |
| Costo OCI / tenant | Containers, PostgreSQL, Redis y tráfico atribuible al tenant. |
| Costo por feature | Tokens totales y costo desde primer prompt hasta Apply en APEX. |
| Margen bruto por plan | Precio del plan − (Claude API + OCI). Indica si cada plan es rentable. |
| Tasa de aceptación IA | % de sugerencias Claude que el developer aplica vs. ignora. |


### Requerimientos Funcionales — M15

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-130 | Registrar tokens y costo por cada llamada Claude API, asociado a tenant, usuario y módulo. | MUST | Fase 3 |
| RF-131 | Dashboard con costo acumulado del mes vs. cuota del plan y proyección al cierre. | MUST | Fase 3 |
| RF-132 | Evento COST_THRESHOLD_EXCEEDED y notificación por email al superar umbral configurado. | MUST | Fase 3 |
| RF-133 | Admins globales ven margen bruto por plan con datos reales de costos vs. ingresos. | SHOULD | Fase 3 |


### API Endpoints — M15

| Endpoint | Método | Descripción |
| --- | --- | --- |
| GET /api/costs/summary | GET | Resumen de costos del tenant. Params: ?month=YYYY-MM. |
| GET /api/costs/by-module | GET | Breakdown por módulo. Params: ?tenant_id=&period=. |
| GET /api/costs/by-user | GET | Tokens y costo por usuario. Solo para admins de tenant. |
| GET /api/costs/margin/:planId | GET | Margen bruto del plan. Solo para admins globales. |
| POST /api/costs/alerts | POST | Crea alerta de umbral. Body: { tenant_id, threshold_usd, period, notify_emails[] }. |
| GET /api/costs/feature-cost/:changeId | GET | Costo total de producir un cambio específico. |


### Modelo de datos — M15

| Tabla | Campos principales |
| --- | --- |
| token_usage | id, tenant_id, user_id, session_id, module_id, action_type, input_tokens, output_tokens, model_name, cost_usd, created_at |
| cost_budgets | id, tenant_id, plan_id, budget_usd_monthly, alert_threshold_pct, current_spend_usd, period_start, period_end |
| cost_alerts | id, tenant_id, threshold_usd, period, triggered_at, notify_emails[], is_active |



## M16 — Full Code Generation Factory

Extiende las capacidades de M5 a todos los artefactos de una aplicación APEX.


### Artefactos generables

| Artefacto | Descripción | Input requerido |
| --- | --- | --- |
| Página APEX completa | Regiones, items, procesos, validaciones y DAs (via M5). | PRD o wireframe. |
| Reporte / Región clásica | Query SQL, columnas, agrupaciones, formato y paginación. | Descripción funcional + tablas GENESYS. |
| Lista de Valores (LOV) | Query estática o dinámica con display y return value. | Tabla fuente y criterio de filtro. |
| Dynamic Action | Evento, condición, acciones True/False con JS o AJAX. | Comportamiento en lenguaje natural. |
| Paquete PL/SQL | Especificación e implementación con comentarios utPLSQL. | Firmas de funciones y reglas del dominio. |
| API REST (ORDS Module) | Módulo ORDS con handlers GET/POST/PUT/DELETE y OpenAPI. | Recurso a exponer y operaciones requeridas. |
| Job de base de datos | DBMS_SCHEDULER con PL/SQL body, frecuencia y manejo de errores. | Tarea a automatizar y periodicidad. |
| Script de migración | ALTER TABLE, CREATE INDEX, INSERT maestros con rollback script. | Cambio de esquema requerido. |


### Requerimientos Funcionales — M16

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-140 | Soportar generación de 8 tipos de artefactos APEX. | MUST | Fase 3 |
| RF-141 | Todo artefacto generado pasa por Safety Engine M10 antes de aplicar. | MUST | Fase 3 |
| RF-142 | Preview del artefacto con diff visual antes de aplicar. | MUST | Fase 3 |
| RF-143 | Paquetes PL/SQL generados con comentarios utPLSQL para facilitar M13. | SHOULD | Fase 3 |


### API Endpoints — M16

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/factory/generate | POST | Genera artefacto. Body: { artifact_type, description, connection_id, app_id, context }. Streaming SSE. |
| GET /api/factory/templates | GET | Lista plantillas por tipo, incluyendo templates de M18. |
| POST /api/factory/preview | POST | Preview sin aplicar. Retorna artifact_id temporal. |
| POST /api/factory/apply/:artifactId | POST | Aplica artefacto via ORDS. Requiere paso por M10. |
| GET /api/factory/history | GET | Historial de artefactos generados. Filtros: ?artifact_type=&app_id=. |



## M17 — Product Intelligence Dashboard

Dashboard ejecutivo y operativo que consolida métricas de productividad, salud del portafolio, calidad del código y performance del asistente IA.


### Paneles del dashboard

| Panel | Métricas e indicadores |
| --- | --- |
| Productividad del equipo | Features por developer/semana, tiempo promedio de implementación, % de tiempo ahorrado vs. baseline. |
| Calidad del código | Bugs en producción por mes/cliente, rollback rate por release, releases rechazados, cobertura de tests. |
| Performance de IA | Tasa de aceptación de sugerencias Claude, tokens promedio por acción, distribución de acciones, TTFT. |
| Actividad por cliente | Conexiones activas, cambios este mes, último release, estado del pipeline, alertas de costo. |
| Salud del portafolio | Mapa de calor por cliente, % con documentación actualizada, componentes sin tests asignados. |


### Requerimientos Funcionales — M17

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-150 | Dashboard de productividad con tiempo promedio de implementación vs. meta OKR -60%. | MUST | Fase 3 |
| RF-151 | Panel de actividad por cliente actualizado con máx. 5 minutos de lag. | SHOULD | Fase 3 |
| RF-152 | Dashboards exportables a PDF para reportes ejecutivos mensuales. | SHOULD | Fase 3 |


### API Endpoints — M17

| Endpoint | Método | Descripción |
| --- | --- | --- |
| GET /api/dashboard/productivity | GET | Métricas de productividad. Params: ?period=30d&user_ids[]=. |
| GET /api/dashboard/quality | GET | Métricas de calidad por tenant. Params: ?tenant_id=&period=. |
| GET /api/dashboard/ai-performance | GET | Performance del asistente IA: aceptación, latencia, tokens. |
| GET /api/dashboard/portfolio | GET | Salud del portafolio completo. Solo para admin/product_owner. |
| GET /api/dashboard/client/:tenantId | GET | Ficha de actividad de un cliente con métricas de 30/90 días. |



## M18 — Accelerators Marketplace

Repositorio de templates y módulos pre-construidos por dominio de negocio que los developers instalan en sus instancias APEX con un clic.


### Catálogo de aceleradores

| Acelerador | Contenido | Dominio GENESYS |
| --- | --- | --- |
| Kit Predial Municipal | 5 páginas APEX: liquidación, consulta, pagos en línea, paz y salvo, estadísticas. PL/SQL completo. | PREDIAL, PROPIETARIO, TARIFA_PREDIAL |
| Kit ICA y Retenciones | Declaración bimestral/anual, historial, retenciones ICA, generación de recibos. | ICA_DECLARACION, ACTIVIDAD_ECONOMICA |
| Dashboard de Recaudo | KPIs de recaudo mensual, comparativo histórico, alertas de metas. | RECIBO, MOVIMIENTO, CAJA |
| Módulo PQRS Ciudadano | Radicación, seguimiento, respuesta y cierre con notificaciones automáticas. | PQRS, CIUDADANO, TRAMITE |
| Kit Cobro Coactivo | Mandamientos de pago, embargos, acuerdos, liquidación de intereses y costas. | CARTERA, COBRO_COACTIVO, EMBARGO |
| Nómina Express | Liquidación básica, descuentos de ley, interfaz PILA y comprobantes. | NOMINA, EMPLEADO, NOVEDAD |


### Requerimientos Funcionales — M18

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-160 | Marketplace con filtros por dominio, versión APEX compatible y búsqueda de texto libre. | MUST | Fase 3 |
| RF-161 | Instalación que aplica pages, packages y migrations con rollback automático si falla. | MUST | Fase 3 |
| RF-162 | Validar compatibilidad APEX y tablas GENESYS requeridas antes de instalar. | MUST | Fase 3 |
| RF-163 | Tenants con rol publisher pueden publicar aceleradores propios, sujetos a revisión de I&T. | SHOULD | Fase 3 |


### API Endpoints — M18

| Endpoint | Método | Descripción |
| --- | --- | --- |
| GET /api/marketplace/accelerators | GET | Lista aceleradores. Filtros: ?domain=&apex_version=&search=. |
| GET /api/marketplace/accelerators/:id | GET | Detalle: manifest, contenido, compatibilidad y reseñas. |
| POST /api/marketplace/install | POST | Instala acelerador. Body: { accelerator_id, connection_id, app_id, install_options }. |
| GET /api/marketplace/installs | GET | Instalaciones del tenant con estado y versión. |
| POST /api/marketplace/publish | POST | Publica acelerador. Requiere rol marketplace_publisher. Multipart. |
| POST /api/marketplace/accelerators/:id/review | POST | Agrega reseña. Body: { rating (1-5), comment }. |


### Modelo de datos — M18

| Tabla | Campos principales |
| --- | --- |
| accelerators | id, name, version, author_tenant_id, domain, description, manifest_json, apex_min_version, genesys_tables[], status (draft|published|deprecated), downloads_count, rating_avg, created_at |
| accelerator_installs | id, accelerator_id, tenant_id, connection_id, app_id, installed_version, status (installing|installed|failed|uninstalled), installed_by, installed_at |
| accelerator_reviews | id, accelerator_id, tenant_id, reviewer_id, rating, comment, created_at |



# 7. Arquitectura Técnica


## 7.1 Stack Tecnológico

| Capa | Tecnología | Justificación |
| --- | --- | --- |
| Frontend | React 18 + Vite + TypeScript | SPA moderna con componentes reutilizables y Monaco Editor integrado. |
| Editor | Monaco Editor (VS Code engine) | Syntax highlighting PL/SQL/SQL/JS, autocompletado y diff view. |
| Backend | Node.js + Express + TypeScript | API stateless, fácil escala horizontal, ecosistema maduro. |
| IA | Claude API (Anthropic) | Modelo de mayor capacidad de razonamiento de código y dominio. |
| Oracle Integration | MCP Oracle APEX + node-oracledb | MCP para lectura de metadatos; ORDS para operaciones controladas. |
| Control Plane DB | PostgreSQL 16 | Persistencia de metadatos, change log, releases y audit trail. |
| Colas asíncronas | Redis + Bull | Trabajos de generación IA, test runs y notificaciones. |
| Infraestructura | OCI Container Instances u OKE | Misma plataforma que los clientes APEX. Latencia baja. |
| Secretos | OCI Vault | Gestión segura de credenciales Oracle por tenant. |
| Observabilidad | OCI Logging + Monitoring | Trazabilidad, alertas y métricas de plataforma. |


## 7.2 Arquitectura Lógica por Capas

- **Experience Layer**: SPA React + Monaco Editor + Dashboards.
- **Application Services Layer**: API Gateway, Tenant Resolver, módulos M0–M18.
- **AI Orchestration Layer**: Context Builder, Schema Grounding, M10 Safety Engine, Claude API.
- **Oracle Integration Layer**: MCP Connector, ORDS REST, node-oracledb fallback.
- **Data & Persistence Layer**: PostgreSQL (control plane), Redis (colas y caché).
- **Observability Layer**: OCI Logging, Monitoring, alertas y Cost Intelligence M15.


## 7.3 Flujo de Datos Principal

`User Request → UI → API Gateway → Tenant Resolver → AI Orchestrator / Integration Router → MCP / ORDS / node-oracledb → M10 Validation Engine → M11 Impact Analyzer → Approval Workflow → Deploy → M6 Audit / M12 Docs / M15 Metrics`


## 7.4 Modelo de Datos — Control Plane (PostgreSQL)

| Tabla | Campos principales |
| --- | --- |
| tenants | id, tenant_name, tenant_type, plan_id, status, created_at, updated_at |
| environments | id, tenant_id, environment_name (dev|qa|staging|prod), apex_workspace, db_connection_id, status |
| connections | id, tenant_id, connection_type (ords|jdbc), ords_url, db_host, service_name, secret_ref (OCI Vault), health_status, last_check_at, deleted_at (nullable — soft delete) |
| applications | id, tenant_id, apex_app_id, application_name, version_tag, last_sync_at |
| change_log | id, connection_id (FK, no cascade delete), app_id, page_id, component_type, component_name, code_before, code_after, applied_by (FK→users), applied_at, status (applied|rolled_back|failed), release_id (FK→releases, nullable), rollback_of_id (FK self-ref, nullable) |
| releases | id, tenant_id, release_version, source_env, target_env, status, created_by, approved_by, deployed_at, rollback_point_id, is_hotfix (bool), hotfix_reason |
| ai_sessions | id, tenant_id, user_id (FK→users), connection_id (FK→connections), app_id, page_id, prompt_text, response_text, confidence_score, risk_level, created_at. Relación 1:N con ai_interactions (M10) via session_id. |
| audit_events | id, tenant_id, event_type, entity_type, entity_id, actor, event_payload JSONB, created_at |
| users | id, email, name, role (admin|developer|tech_lead|release_manager|knowledge_editor|marketplace_publisher), tenant_id, password_hash, failed_attempts, locked_until, is_active, last_login, created_at |
| refresh_tokens | id, user_id, token_hash, family_id, expires_at, is_revoked, created_at, used_at |
| editor_sessions | id, tenant_id, user_id, connection_id, app_id, page_id, active_tab, component_draft JSONB, last_active_at, updated_at |


## 7.5 Seguridad Arquitectónica

- RBAC con 6 roles: admin, developer, tech_lead, release_manager, knowledge_editor, marketplace_publisher.
- Tenant scoped authorization: cada tenant solo accede a sus propios datos y conexiones.
- Environment scoped privileges: PROD requiere roles superiores.
- Credenciales Oracle en OCI Vault. Nunca en variables de entorno ni en BD directamente.
- TLS 1.3 en tránsito. AES-256 en reposo para credenciales sensibles.
- Subredes privadas OCI para el tráfico hacia Oracle DB.
- SSO / SAML / OCI IAM contemplado para Fase 3.


### 7.5.1 Estrategia de Aislamiento Multi-tenant

| Nivel | Implementación |
| --- | --- |
| Base de datos | Row-Level Security (RLS) en PostgreSQL para todas las tablas con tenant_id. Las políticas validan que el tenant_id del JWT coincida con el registro accedido. |
| API / Middleware | Middleware Tenant Resolver extrae tenant_id del JWT e inyecta en el contexto de BD. Todos los queries incluyen `WHERE tenant_id = :current_tenant` via ORM interceptor. |
| Pruebas de aislamiento | Cross-tenant isolation test es criterio de aceptación obligatorio: HTTP 403 o vacío al acceder a recursos de otro tenant desde cualquier endpoint. |



# 8. Requerimientos No Funcionales

| Categoría | Requerimiento | Métrica |
| --- | --- | --- |
| Rendimiento | Carga inicial del árbol de aplicaciones (50+ páginas). | < 3s p95 |
| Rendimiento | Primer token en respuesta de Claude (streaming TTFT). | < 2s TTFT |
| Rendimiento | Análisis de impacto M11 para hasta 50 dependencias. | < 3s |
| Rendimiento | Clasificación de riesgo M10 por cambio. | < 500ms |
| Seguridad | Credenciales cifradas en reposo y en tránsito. | AES-256 + TLS 1.3 |
| Seguridad | Cambios críticos sin doble aprobación bloqueados al 100%. | 100% |
| Seguridad | Aislamiento cross-tenant: acceso a recursos de otro tenant retorna HTTP 403 o vacío. | 100% (test obligatorio) |
| Disponibilidad | Uptime mensual de la plataforma en OCI. | 99.5% SLA |
| Disponibilidad | RTO (Recovery Time Objective) ante fallo de plataforma. Change Log no puede perderse. | < 4 horas |
| Disponibilidad | RPO (Recovery Point Objective). Backup horario de PostgreSQL. | < 1 hora |
| Escalabilidad | Conexiones Oracle activas simultáneas en Fase 1. | 20+ |
| Usabilidad | Developer familiar con APEX opera el editor sin entrenamiento formal. | SUS > 75 |
| Auditoría | Toda operación de escritura en Oracle registrada con diff y actor. | 100% |
| Compatibilidad | Soporte para versiones de Oracle APEX y DB. | APEX 22/23/24.x · DB 19c/21c/23ai |
| Gobierno IA | Toda salida IA pasa por validación de seguridad y aprobación cuando aplique. | 100% |
| APIs | Todos los endpoints de listado implementan paginación cursor-based: { data, next_cursor, total_count }. | 100% de endpoints de listado |
| APIs | Rate limiting en endpoints no-IA por tenant. | 1,000 req/min por tenant |



# 9. Roadmap de Desarrollo


## 9.1 Fases del Producto

| Fase | Nombre | Duración ref. | Entregables clave |
| --- | --- | --- | --- |
| Fase 0 | Fundación | 3 semanas | Setup OCI, repositorio, arquitectura base, MCP Oracle conectado, CLAUDE.md, lineamientos de seguridad. |
| Fase 1 | MVP Interno | 8 semanas | M0 + M1 + M2 + M3 + M4 operativos en proyectos reales. Equipo I&T lo usa diariamente. |
| Fase 2 | Plataforma Completa | 10 semanas | M5–M14 completos. Producto gobernable, auditable y con gobierno de IA. |
| Fase 3 | SaaS Enterprise | 8 semanas | M15–M18. Multi-tenancy comercial, billing, OCI IAM/SSO, onboarding de primeros 5 clientes externos. |


## 9.2 Sprints — Vista Detallada

| Sprint | Semanas | Módulos | Objetivos |
| --- | --- | --- | --- |
| S1 | 1–2 | M0 + M1 backend | Autenticación JWT completa (M0), backend API base, PostgreSQL, conexiones ORDS/JDBC, health checks, cifrado AES-256. |
| S2 | 3–4 | M1 UI + M2 | Frontend React, Connection Manager UI con soft delete, Application Explorer con modo offline. |
| S3 | 5–6 | M3 | Monaco Editor, tabs de componentes, lectura de PL/SQL via MCP, editor_sessions. |
| S4 | 7–8 | M4 | Claude API integrado, contexto automático, quick actions, streaming, botón Aplicar en APEX, safety stub M10. |
| S5 | 9–10 | M5 + M8 | PRD Builder con ingesta multiformato, validación iterativa, exportación .md, PRD-to-Page con manejo de colisión. |
| S6 | 11–12 | M6 + M7 | Change Manager canónico con release_id y rollback_of_id, Schema Inspector con documentación automática. |
| S7 | 13–14 | M9 + M10 | Release Manager completo con Hotfix Track, AI Governance & Safety Engine completo. |
| S8 | 15–16 | M11 + M12 | Dependency & Impact Analyzer, Auto Documentation Studio con diagramas Mermaid. |
| S9 | 17–18 | M13 + M14 | Test Automation Studio con utPLSQL, GENESYS Knowledge Engine con workflow de aprobación de reglas. |
| S10 | 19–20 | M15 + M17 | Cost Intelligence dashboard, Product Intelligence Dashboard, alertas de costo. |
| S11 | 21–22 | M16 + M18 | Full Code Generation Factory con 8 artefactos, Accelerators Marketplace con 6 aceleradores base. |
| S12 | 23–24 | SaaS readiness | Multi-tenancy comercial completo, billing, OCI IAM/SSO, onboarding de primeros 5 clientes externos. |



# 10. Modelo de Negocio


## 10.1 Estrategia Go-To-Market

| Etapa | Estrategia | Horizonte |
| --- | --- | --- |
| 1. Dogfooding | I&T usa la herramienta en todos sus proyectos de clientes. Se miden métricas de productividad y se itera con feedback real. | Meses 1–5 |
| 2. Early Access | 3–5 empresas de consultoría Oracle en Colombia y LATAM como beta testers con precio especial. | Meses 6–9 |
| 3. SaaS Launch | Lanzamiento público. Posicionamiento: "El IDE para APEX que tiene IA con contexto de negocio público colombiano". Canal: congresos de tesorería y tributación municipal. | Mes 10+ |


## 10.2 Modelo de Precios (Fase SaaS)

| Plan | Precio / mes | Conexiones Oracle | IA (tokens/mes) | Usuarios | Trial |
| --- | --- | --- | --- | --- | --- |
| Starter | USD 199 | 3 | 1M tokens | 2 devs | 30 días |
| Professional | USD 499 | 15 | 5M tokens | 10 devs | 30 días |
| Enterprise | Custom | Ilimitadas | Ilimitados | Ilimitados | POC 60 días |

> **Nota:** Precios en USD. Para clientes colombianos aplica IVA del 19% sobre el valor del plan. El equivalente en COP se calcula según TRM vigente a la fecha de facturación. Los planes no incluyen los costos de infraestructura OCI del cliente.


## 10.3 Unidad Económica Objetivo

El producto debe medir ingresos y costos por tenant: Claude API, OCI compute, almacenamiento PostgreSQL, soporte, ejecución de pruebas y margen bruto por plan. M15 Cost Intelligence provee esta visibilidad en tiempo real.


## 10.4 Proceso de Onboarding SaaS (Fase 3)

| Paso | Actividad | Tiempo objetivo |
| --- | --- | --- |
| 1. Provisioning | Creación de tenant asistida por I&T. El admin crea la cuenta y envía credenciales al cliente. | < 4 horas desde solicitud |
| 2. Primera conexión Oracle | El developer configura su primera conexión ORDS o JDBC con soporte de I&T. | < 2 horas (día 1) |
| 3. Primera aplicación explorada | El developer navega el árbol de su primera aplicación APEX en M2. | < 30 min (día 1) |
| 4. Primera sugerencia IA aplicada | El developer usa AI Studio para refactorizar un componente real y aplica la sugerencia en DEV. | < 48 horas (día 1–2) |
| 5. Check-in de éxito | I&T hace seguimiento al día 7 para medir satisfacción e identificar bloqueos. | Día 7 |



# 11. Análisis de Riesgos

| Riesgo | Probabilidad | Impacto | Mitigación |
| --- | --- | --- | --- |
| MCP Oracle APEX no expone todos los endpoints necesarios. | Media | Alto | Fallback con queries directas via node-oracledb a vistas APEX_APPLICATION_*. |
| ORDS no habilitado en instancias de algunos clientes. | Media | Alto | Usar modo JDBC para clientes sin ORDS. Documentar proceso de habilitación. |
| Cambios aplicados via IA rompen lógica de negocio en producción. | Baja | Crítico | Gate de confirmación obligatorio, M10 Safety Engine, M13 smoke tests y staging previo a PROD. |
| Costos de Claude API escalan con uso intensivo. | Alta | Medio | Rate limiting por usuario, caching de respuestas y M15 Cost Intelligence con alertas. |
| Prompt injection desde documentos o PRDs externos. | Media | Alto | M10 Input Sanitizer con patrones conocidos y heurísticas semánticas. |
| Resistencia del equipo a adoptar la herramienta. | Baja | Medio | Involucrar 2 developers senior en diseño desde Fase 0. Mostrar quick wins en primera semana. |
| Oracle cambia la API de ORDS entre versiones. | Baja | Medio | Capa de abstracción versionada en el backend. Tests de integración por versión APEX. |



# 12. Mapa de Integración y Eventos del Sistema


## 12.1 Integraciones entre Módulos

| Módulo origen | Integra con |
| --- | --- |
| M4 AI Studio | → M10 AI Governance (toda salida) · → M11 Impact Analyzer (antes de apply) · → M14 GENESYS Knowledge (enriquecimiento) · → M12 Auto Docs (genera doc al aplicar) · → M15 Cost Intelligence (registra tokens) |
| M8 PRD Builder | → M5 PRD-to-Page (envío de PRD aprobado) · → M10 (sanitización de inputs) · → M14 GENESYS Knowledge (contexto de dominio) |
| M9 Release Manager | → M13 Test Automation (smoke tests por release) · → M10 (gate de aprobación) · → M12 Auto Docs (release notes) · → M6 Change Manager (snapshots) |
| M10 AI Governance | → TODOS los módulos que invocan Claude API (M4, M5, M8, M12, M13, M14, M16) — capa obligatoria |
| M11 Dependency Analyzer | → M3 Code Editor (impacto antes de apply) · → M4 AI Studio (contexto de dependencias) · → M13 Test Automation (selección de regresión) |
| M14 GENESYS Knowledge | → M4 AI Studio · → M8 PRD Builder · → M16 Code Generation Factory — enriquecimiento de contexto |
| M15 Cost Intelligence | → M4, M8, M12, M13, M14, M16 (registro de tokens) · → M17 Dashboard (métricas de costo) |
| M18 Marketplace | → M16 Code Generation Factory (templates base) · → M13 Test Automation (smoke tests del acelerador) · → M12 Auto Docs (docs incluidas) |


## 12.2 Eventos Asíncronos del Sistema

| Evento | Emitido por / Consumido por |
| --- | --- |
| PRD_DRAFT_GENERATED | M8 emite cuando Claude completa el draft. M5 puede suscribirse para iniciar generación. |
| PRD_APPROVED | M8 emite al aprobar PRD. M5 inicia generación de páginas APEX. |
| CONNECTION_HEALTH_CHANGED | M1 emite al cambiar el estado de salud. M17 Dashboard actualiza el indicador del cliente. |
| CHANGE_APPLIED | M3/M4 emiten al aplicar un cambio. M6 registra. M12 genera documentación. M15 registra costo. |
| RELEASE_CREATED | M9 emite al crear release. M13 inicia smoke tests automáticamente. |
| RELEASE_APPROVED | M9 emite tras aprobación. Dispara despliegue en el ambiente destino. |
| DEPLOYMENT_FAILED | M9 emite si el pipeline falla. M17 incrementa contador de fallos. Notificación al equipo. |
| ROLLBACK_EXECUTED | M9 emite tras rollback. M6 registra. M17 incrementa rollback_rate del cliente. |
| HOTFIX_DEPLOYED | M9 emite tras deploy de hotfix exitoso. Registra en audit_events con tipo hotfix. |
| HOTFIX_ROLLED_BACK | M9 emite cuando smoke tests de PROD fallan tras hotfix. Rollback automático ejecutado. |
| INJECTION_DETECTED | M10 emite al detectar prompt injection. M17 incrementa contador de seguridad. |
| HIGH_RISK_CHANGE_BLOCKED | M10 emite al bloquear cambio ALTO/CRÍTICO. Notificación al Tech Lead para revisión. |
| COST_THRESHOLD_EXCEEDED | M15 emite al superar umbral. Email al admin del tenant en menos de 5 minutos. |
| AI_SUGGESTION_GENERATED | M4 emite con cada respuesta Claude. M15 registra tokens. M10 valida la salida. |
| ACCELERATOR_INSTALLED | M18 emite tras instalación exitosa. M12 genera documentación del acelerador instalado. |



# 13. Definición de Done y Criterios de Aceptación


## 13.1 DoD por Feature (todos los módulos)

- Código revisado por al menos 1 peer developer.
- Tests unitarios con cobertura > 70% en lógica de negocio del backend.
- Test de integración con instancia APEX de prueba ejecutado exitosamente.
- Documentación técnica actualizada (M12 Auto Docs o README del módulo).
- Cambio registrado en Change Log y asociado a release si aplica.
- No introduce regresiones en módulos existentes (smoke tests verdes).
- Análisis de impacto M11 revisado para cambios de riesgo MEDIO o superior.


## 13.2 Criterios de Aceptación por Módulo

Los criterios siguen el formato `[MÓDULO]-CA[N]`. Todos usan la estructura **Given / When / Then**.


### Autenticación (M0)

**M0-CA1.** Dado usuario con credenciales válidas, cuando hace login, entonces recibe access_token JWT (15 min) y refresh_token en httpOnly cookie (7 días).

**M0-CA2.** Dado refresh token ya utilizado, cuando se reutiliza, entonces el sistema revoca toda la familia de tokens y retorna HTTP 401.

**M0-CA3.** Dado usuario con 5 intentos fallidos, cuando intenta el sexto, entonces recibe HTTP 423 con tiempo de desbloqueo.



### AI Studio (M4)

**M4-CA1.** Dado código PL/SQL en el editor, cuando el usuario presiona "Refactorizar", entonces Claude responde con código mejorado y justificación en menos de 30 segundos.

**M4-CA2.** Dado que el usuario presiona "Aplicar en APEX", cuando el código se aplica, entonces el Change Log registra el cambio con diff y estado "Aplicado".

**M4-CA3.** Dado que la aplicación de código falla, entonces el sistema muestra el error y no registra el cambio como "Aplicado".

**M4-CA4.** Dado que el usuario ejecuta rollback desde Change Log, entonces el código anterior se restaura y queda trazabilidad del evento.



### PRD-to-Page (M5)

**M5-CA1.** Dado un PRD de 100+ palabras, cuando se genera la página, entonces produce al menos 1 región, items de formulario identificados y proceso de guardado.

**M5-CA2.** Dado que target_page_number ya existe, cuando el usuario intenta aplicar, entonces el sistema muestra la página existente y ofrece tres opciones: Sobreescribir, Número nuevo, o Cancelar.



### PRD Builder (M8)

**M8-CA1.** Dado texto de 100+ palabras, cuando se genera el draft, entonces produce PRD con 10 secciones en menos de 60 segundos.

**M8-CA2.** Dado PRD con bloqueantes sin resolver, cuando el usuario intenta exportar, entonces el sistema bloquea y muestra los criterios pendientes.

**M8-CA3.** Dado respuesta a pregunta de refinamiento, cuando el sistema revalida, entonces el score sube y el criterio afectado cambia de estado.

**M8-CA4.** Dado PRD aprobado, cuando se envía a M5, entonces M5 crea automáticamente un job de generación de página APEX.



### Release Manager (M9)

**M9-CA1.** Dado un conjunto de cambios en DEV, cuando se crea el release, entonces se genera snapshot de todos los componentes y se inicia el pipeline de QA.

**M9-CA2.** Dado un release con smoke tests fallidos, cuando el Release Manager intenta aprobar para PROD, entonces el sistema bloquea y muestra el reporte de fallos.

**M9-CA3.** Dado release desplegado en PROD, cuando se ejecuta rollback, entonces todos los componentes vuelven al snapshot en menos de 5 minutos.

**M9-CA4.** Dado un hotfix aprobado por Tech Lead y Product Owner con smoke tests de PROD fallidos post-deploy, entonces el sistema ejecuta rollback automático y emite HOTFIX_ROLLED_BACK.



### AI Governance (M10)

**M10-CA1.** Dado documento con prompt injection embebido, cuando el Input Sanitizer lo procesa, entonces detecta el patrón, lo neutraliza y registra el intento en el audit log.

**M10-CA2.** Dado código con DROP TABLE en la salida de Claude, entonces Safety Engine clasifica como CRÍTICO y bloquea la aplicación hasta doble aprobación.

**M10-CA3.** Dado un admin que intenta eliminar un registro del audit log, entonces el sistema retorna HTTP 403 y no modifica ningún registro.



### Seguridad Multi-tenant

**SEC-CA1.** Dado usuario autenticado del tenant A, cuando intenta acceder a cualquier recurso del tenant B, entonces el sistema retorna HTTP 403 o respuesta vacía. Este test debe ejecutarse contra todos los endpoints de listado y detalle.



### Marketplace (M18)

**M18-CA1.** Dado Kit Predial Municipal instalado en instancia con GENESYS completo, entonces las 5 páginas se crean correctamente, los paquetes PL/SQL compilan sin errores y los smoke tests pasan.

**M18-CA2.** Dado acelerador con tablas GENESYS faltantes, cuando se intenta instalar, entonces el sistema detecta las dependencias faltantes, informa al developer con la lista exacta de tablas requeridas y cancela la instalación antes de aplicar cualquier cambio.



# 14. Glosario

| Término | Definición |
| --- | --- |
| APEX | Oracle Application Express — framework low-code de Oracle para construir aplicaciones web sobre Oracle Database. |
| ORDS | Oracle REST Data Services — servidor que expone Oracle Database y APEX vía APIs REST. |
| MCP | Model Context Protocol — estándar de Anthropic para conectar modelos IA con herramientas externas (BD, APIs, etc.). |
| GENESYS | Schema principal de Oracle Database que aloja Taxation Smart de I&T. Contiene 1,008+ tablas y 20 módulos. |
| OCI | Oracle Cloud Infrastructure — plataforma cloud de Oracle donde están alojadas las instancias APEX de los clientes de I&T. |
| Claude API | API de Anthropic para acceso al modelo de IA Claude para procesamiento de lenguaje natural y código. |
| Change Log | Registro auditable de todos los cambios aplicados con diff y capacidad de rollback. Tabla canónica del módulo M6. |
| PRD-to-Page | Capacidad de generar páginas Oracle APEX completas a partir de un documento de requisitos o imagen de wireframe. |
| Tenant | Empresa o entidad cliente que usa APEX Dev Manager con aislamiento lógico y operativo completo. |
| HITL | Human-in-the-Loop — patrón de diseño donde un humano aprueba las acciones de la IA antes de aplicarlas. |
| utPLSQL | Framework de pruebas unitarias para PL/SQL, análogo a JUnit para Java. Estándar de facto para testing PL/SQL. |
| Rollback | Operación que restaura el estado anterior de un componente o release completo desde un snapshot almacenado. |
| Snapshot | Copia completa del código fuente de todos los componentes incluidos en un release en el momento de su creación. |
| Smoke Test | Conjunto mínimo de pruebas que valida que la aplicación arranca y sus flujos críticos funcionan correctamente. Obligatorio antes de promover a STAGING y PROD. |
| RBAC | Role-Based Access Control — modelo de control de acceso donde los permisos se asignan a roles. Los 6 roles del sistema son: admin, developer, tech_lead, release_manager, knowledge_editor, marketplace_publisher. |
| SSE | Server-Sent Events — mecanismo HTTP que permite al servidor enviar datos al cliente de forma unidireccional y continua. Usado para streaming de respuestas de Claude y actualizaciones de estado en tiempo real. |
| Pipeline (Release) | Secuencia automatizada de pasos para promover un release entre ambientes: DEV → QA → STAGING → PROD. Cada paso incluye tests, validaciones y puntos de aprobación configurables. |
| Soft Delete | Estrategia de eliminación lógica que marca un registro como eliminado (campo deleted_at) sin borrarlo físicamente. Preserva la integridad referencial del historial de auditoría. |
| WAF | Web Application Firewall — componente de seguridad de red que filtra el tráfico HTTP. En APEX Dev Manager protege la SPA React antes de que las peticiones lleguen al API Gateway. |
| Knowledge Editor | Rol especializado con permisos para crear y proponer reglas en el GENESYS Knowledge Engine (M14). Las reglas propuestas requieren aprobación de tech_lead o admin. |
| Hotfix | Release de emergencia que omite los ambientes intermedios (QA, STAGING) y se despliega directamente en PROD. Requiere doble aprobación y smoke tests post-deploy automáticos. |
| Mermaid | Lenguaje de marcado para generar diagramas de flujo, secuencia y estado desde texto. Usado por M12 para generar diagramas de procesos PL/SQL directamente desde el código. |
| RLS | Row-Level Security — característica de PostgreSQL que aplica políticas de acceso a nivel de fila. Garantiza que cada tenant solo pueda leer y escribir sus propios registros. |
| RTO / RPO | Recovery Time Objective (tiempo máximo para restaurar el servicio) y Recovery Point Objective (máxima pérdida de datos aceptable). En APEX Dev Manager: RTO < 4 horas, RPO < 1 hora. |



# 15. Control de Versiones

| Versión | Cambios |
| --- | --- |
| v1.0 | Versión inicial. M1–M7 definidos. |
| v2.0 | Agrega M8 PRD Builder con especificación detallada. Amplía arquitectura técnica. |
| v3.0 | Evoluciona a plataforma enterprise. Introduce M8–M18 en descripción de módulo. Arquitectura de 6 capas. |
| v4.0 | Especificación detallada de M8–M18: user stories, flujos, wireframes, API endpoints, modelo de datos, RFs y criterios de aceptación. |
| v5.0 | Edición Completa: unifica M1–M18 en un solo documento con el mismo nivel de detalle en todos los módulos. |
| v5.1 | Edición Corregida: agrega M0 Authentication, matriz de permisos por rol, estrategia RLS multi-tenant, soft delete en conexiones, RF-35/RF-36 (M5), Hotfix Track M9, RF-124/RF-125 (M14), RTO/RPO, paginación cursor-based, IVA colombiano, trial period, proceso de onboarding SaaS, editor_sessions (M3), glosario ampliado a 25 términos, criterios de aceptación unificados por módulo y alineación OKR 70%/60%. |


---
*Confidencial — Informática y Tributos S.A.S. (I&T) © 2026*
*Próxima revisión: al finalizar Sprint 2 de Fase 1.*