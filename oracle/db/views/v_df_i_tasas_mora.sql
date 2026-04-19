
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_TASAS_MORA" ("ID_TSA_MRA", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "FCHA_DSDE", "FCHA_HSTA", "VLOR_TSA", "TSA_DRIA") AS
  select
  a.id_tsa_mra,
  a.cdgo_clnte,
  a.id_impsto,
  (select m.nmbre_impsto from df_c_impuestos m where m.id_impsto = a.id_impsto) nmbre_impsto,
  a.fcha_dsde,
  a.fcha_hsta,
  a.vlor_tsa,
  a.tsa_dria
from df_i_tasas_mora a;

