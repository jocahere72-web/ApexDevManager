# Versionamiento Oracle APEX + BD

Sistema de control de versiones para las aplicaciones APEX y objetos de base de datos de Taxation Smart.

## Estructura

```
oracle/
├── apex/           # Exports APEX en formato split (1 archivo por pagina/componente)
│   ├── f50000/     # GENESYS
│   ├── f70000/     # Tributo
│   ├── f71000/     # Gestion Financiera
│   └── ...         # 22 apps en total
├── db/             # Objetos de BD (1 archivo por objeto)
│   ├── packages/   # .pks (spec) + .pkb (body)
│   ├── procedures/
│   ├── functions/
│   ├── views/
│   ├── tables/     # DDL referencial
│   ├── triggers/
│   ├── types/
│   ├── sequences/
│   ├── indexes/
│   └── grants/
└── scripts/        # Scripts de exportacion (este directorio)
```

## Flujo de trabajo diario

### 1. Crear branch para tu requerimiento

```bash
git checkout main && git pull
git checkout -b req/IT_CP_F_06_XXXXXXX-descripcion-corta
```

### 2. Trabajar normalmente

Trabaja en APEX Builder y la BD como siempre. No cambia nada en tu forma de desarrollar.

### 3. Exportar los objetos que modificaste

```bash
# Exportar un package que modificaste
./oracle/scripts/export-db-object.sh PACKAGE pkg_fi_fiscalizacion

# Exportar una vista
./oracle/scripts/export-db-object.sh VIEW v_fi_cobro_detalle

# Exportar una tabla (DDL referencial)
./oracle/scripts/export-db-object.sh TABLE prescripciones

# Exportar la app APEX donde hiciste cambios
./oracle/scripts/export-apex-app.sh 74000
```

### 4. Revisar que cambio

```bash
git diff oracle/
```

Verifica que solo aparezcan los archivos que tu modificaste.

### 5. Generar scripts de deploy

```bash
./oracle/scripts/generate-deploy.sh IT_CP_F_06_XXXXXXX
```

Esto crea automaticamente `deploy/IT_CP_F_06_XXXXXXX/` con:
- Scripts numerados en `produccion/`
- Archivo de rollback
- Changelog

### 6. Completar los TODO en los scripts de deploy

Revisa los archivos generados en `deploy/IT_CP_F_06_XXXXXXX/produccion/`.
Los DDL y APEX requieren que escribas los cambios especificos.

### 7. Commit y PR

```bash
git add oracle/ deploy/IT_CP_F_06_XXXXXXX/
git commit -m "req(IT_CP_F_06_XXXXXXX): descripcion del cambio"
git push -u origin req/IT_CP_F_06_XXXXXXX-descripcion-corta
gh pr create --title "IT_CP_F_06_XXXXXXX: Titulo del requerimiento"
```

### 8. Revision y merge

Tu lider revisa el PR, ve exactamente que cambio en la BD y en APEX, y aprueba.

## Scripts disponibles

| Script | Uso |
|--------|-----|
| `export-db-object.sh` | Exportar 1 objeto de BD |
| `export-db-all.sh` | Exportar todo el esquema (solo baseline) |
| `export-apex-app.sh` | Exportar 1 app APEX completa (split) |
| `export-apex-all.sh` | Exportar las 22 apps (solo baseline) |
| `generate-deploy.sh` | Generar carpeta deploy desde git diff |

## Tipos de objetos soportados

```
PACKAGE    -> oracle/db/packages/   (.pks + .pkb)
PROCEDURE  -> oracle/db/procedures/ (.sql)
FUNCTION   -> oracle/db/functions/  (.sql)
VIEW       -> oracle/db/views/      (.sql)
TRIGGER    -> oracle/db/triggers/   (.sql)
TABLE      -> oracle/db/tables/     (.sql)
SEQUENCE   -> oracle/db/sequences/  (.sql)
TYPE       -> oracle/db/types/      (.sql)
INDEX      -> oracle/db/indexes/    (.sql)
SYNONYM    -> oracle/db/synonyms/   (.sql)
```

## Resolucion de conflictos

Si dos ingenieros modificaron el mismo objeto y git muestra conflicto:

1. Comunicarse con el otro ingeniero
2. Verificar que la BD de desarrollo tiene ambos cambios
3. Re-exportar el objeto desde la BD:
   ```bash
   ./oracle/scripts/export-db-object.sh PACKAGE pkg_conflictivo
   ```
4. El archivo re-exportado tiene ambos cambios integrados
5. Resolver el conflicto en git con ese archivo
6. Continuar el merge/rebase

## Nota: App 330000 (Infoanalitica)

Esta app pertenece al esquema `TAX_ANALYTICS`. Para exportarla:

```bash
./oracle/scripts/export-apex-app.sh 330000 "tax_analytics/PASSWORD@99.0.4.235:1521/GENESYS01"
```
