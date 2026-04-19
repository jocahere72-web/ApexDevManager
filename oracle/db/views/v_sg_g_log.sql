
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_LOG" ("ID_LOG", "FCHA_LOG", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "NMBRE_UP", "TXTO_LOG") AS
  select
  a.id_log,
  a.fcha_log,
  a.cdgo_clnte,
  b.nmbre_clnte,
  a.id_impsto,
  c.nmbre_impsto,
  a.nmbre_up,
  a.txto_log
from sg_g_log       a
left join df_s_clientes  b on a.cdgo_clnte = b.cdgo_clnte
left join df_c_impuestos c on a.id_impsto  = c.id_impsto;

