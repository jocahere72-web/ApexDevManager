
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_FUNCIONARIOS_BITACORA" ("ID_FNCNRIO_BTCRA", "ID_FNCNRIO", "NMBRE_TRCRO", "FCHA_RGSTRO", "ESTDO", "OBSRVCION") AS
  select
  a.id_fncnrio_btcra,
  a.id_fncnrio,
  b.nmbre_trcro,
  a.fcha_rgstro,
  a.estdo,
  a.obsrvcion
from df_c_funcionarios_bitacora a
join v_df_c_funcionarios          b on a.id_fncnrio = b.id_fncnrio;

