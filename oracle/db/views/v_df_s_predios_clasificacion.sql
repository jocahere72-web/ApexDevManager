
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_PREDIOS_CLASIFICACION" ("CDGO_PRDIO_CLSFCCION", "DSCRPCION_PRDIO_CLSFCCION") AS
  select cdgo_prdio_clsfccion,
       dscrpcion_prdio_clsfccion
  from df_s_predios_clasificacion
order by dscrpcion_prdio_clsfccion;

