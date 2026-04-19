
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_PREDIOS_USO_SUELO" ("ID_PRDIO_USO_SLO", "CDGO_CLNTE", "CDGO_PRDIO_USO_SLO", "DSCRPCION") AS
  select
  a.id_prdio_uso_slo,
  a.cdgo_clnte,
  a.cdgo_prdio_uso_slo,
  a.dscrpcion
from df_c_predios_uso_suelo a;

