
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_BANCOS" ("ID_BNCO", "CDGO_CLNTE", "NMBRE_BNCO", "RCDDOR", "ORDN") AS
  select
  a.id_bnco,
  a.cdgo_clnte,
  a.nmbre_bnco,
  a.rcddor,
  a.ordn
from df_c_bancos a;

