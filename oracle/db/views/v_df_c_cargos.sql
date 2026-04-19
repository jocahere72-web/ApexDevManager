
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_CARGOS" ("ID_CRGO", "CDGO_CLNTE", "NMBRE_CRGO") AS
  select
  a.id_crgo,
  a.cdgo_clnte,
  a.nmbre_crgo
from df_c_cargos a;

