
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_BANCOS_CUENTA" ("ID_BNCO_CNTA", "ID_BNCO", "NMBRE_BNCO", "NMRO_CNTA") AS
  select
  a.id_bnco_cnta,
  a.id_bnco,
  b.nmbre_bnco,
  a.nmro_cnta
from df_c_bancos_cuenta a
 join df_c_bancos       b on a.id_bnco = b.id_bnco;

