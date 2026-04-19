
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_CONSECUTIVOS" ("ID_CNSCTVO", "CDGO_CLNTE", "CDGO_CNSCTVO", "VLOR", "DSCRPCION") AS
  select
  a.id_cnsctvo,
  a.cdgo_clnte,
  a.cdgo_cnsctvo,
  a.vlor,
  a.dscrpcion
from df_c_consecutivos a;

