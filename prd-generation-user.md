# User Prompt Template — PRD Builder (M8): Issue → PRD

Template del mensaje de usuario que se envía a Claude junto con el system prompt.
Las variables entre `{llaves}` se inyectan en runtime por el sistema.

---

## Template

```
## Documento de Referencia del Producto

{reference_document}

---

## Issue a Especificar

{issue_content}

---

## Instrucciones

1. Analiza el **Documento de Referencia** para extraer estructura, convenciones, numeración, stack y módulos existentes.
2. Analiza el **Issue** e identifica qué se pide, para quién, en qué módulo(s) vive y qué restricciones tiene.
3. Si el issue es ambiguo o incompleto, genera preguntas de clarificación ANTES del PRD.
4. Genera el PRD del issue siguiendo la estructura y formato de un módulo del documento de referencia, adaptado al scope del issue.
5. Ejecuta la validación de 10 checks y reporta el score.
6. Entrega en Markdown con frontmatter YAML.
```

---

## Variables

| Variable | Descripción | Fuente | Requerida |
|----------|-------------|--------|-----------|
| `{reference_document}` | Contenido del PRD del producto (el documento modelo). Se inyecta el texto completo parseado del archivo. | Archivo subido por el usuario o almacenado por sesión | SÍ |
| `{issue_content}` | Contenido del issue. Puede venir de: texto libre del usuario, issue de Linear/Jira/GitHub copiado, o extraído vía API. Debe incluir título, descripción y cualquier contexto adicional. | Input del usuario o API de issue tracker | SÍ |

---

## Ejemplos de Uso

### Ejemplo 1 — Issue de texto libre

```
## Documento de Referencia del Producto

[contenido del APEX_Dev_Manager_PRD_v5_1.md]

---

## Issue a Especificar

**Título:** Agregar notificaciones en tiempo real cuando un health check falla 3 veces seguidas

**Descripción:**  
Actualmente cuando una conexión Oracle falla el health check, solo se actualiza el 
indicador visual en el Connection Manager. Necesitamos que cuando una conexión falle 
3 health checks consecutivos, se envíe una notificación al developer asignado y al 
tech lead del tenant.

Las notificaciones deben aparecer en un panel dentro de la app y opcionalmente 
enviarse por email. El usuario puede configurar si quiere email o solo in-app.

Esto es importante porque hemos tenido casos donde una conexión estuvo caída 2 horas 
sin que nadie se diera cuenta.

---

## Instrucciones

1. Analiza el Documento de Referencia...
[resto del template]
```

### Ejemplo 2 — Issue desde Linear

```
## Documento de Referencia del Producto

[contenido del APEX_Dev_Manager_PRD_v5_1.md]

---

## Issue a Especificar

**Issue:** ADM-87
**Título:** M4: Permitir al usuario guardar prompts favoritos en AI Studio
**Estado:** Backlog
**Prioridad:** Medium  
**Asignado a:** Sin asignar
**Labels:** enhancement, m4-ai-studio

**Descripción:**  
Como developer, quiero poder guardar prompts que uso frecuentemente en AI Studio 
para no tener que escribirlos cada vez. 

Necesito:
- Guardar un prompt con nombre y descripción
- Organizar por categoría (refactoring, documentation, testing, etc.)
- Quick-insert desde un dropdown en el chat
- Los prompts son por usuario, no compartidos (por ahora)

**Comentarios del equipo:**
- JC: "Verificar si esto debería ir por tenant o por usuario. Empezar por usuario."
- Dev: "Evaluar si almacenamos en PostgreSQL o localStorage. Preferimos PostgreSQL 
  para que persista entre dispositivos."

---

## Instrucciones

1. Analiza el Documento de Referencia...
[resto del template]
```

### Ejemplo 3 — Issue de bug complejo que requiere PRD

```
## Documento de Referencia del Producto

[contenido del APEX_Dev_Manager_PRD_v5_1.md]

---

## Issue a Especificar

**Issue:** ADM-134
**Título:** Los cambios aplicados en APEX no se registran en Change Log cuando la conexión tiene latencia > 3s
**Tipo:** Bug
**Prioridad:** High
**Labels:** bug, m3-code-editor, m6-change-manager

**Descripción:**  
Cuando un developer aplica un cambio via Code Editor (M3) y la conexión ORDS tiene 
latencia alta (>3 segundos), el apply se completa en APEX pero el registro en 
Change Log (M6) falla silenciosamente por timeout del callback.

Resultado: hay cambios en producción que no están trazados.

**Reproducción:**
1. Conectar a instancia con latencia simulada de 4s
2. Editar un proceso PL/SQL en Code Editor
3. Aplicar cambio
4. Verificar Change Log → el registro no aparece

**Expectativa:** El cambio debe quedar registrado siempre, incluso si el callback es 
lento. Si no se puede registrar sincrónicamente, debe haber un mecanismo de retry o 
cola asíncrona.

---

## Instrucciones

1. Analiza el Documento de Referencia...
[resto del template]
```
