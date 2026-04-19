
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_ENTIDADES" ("ID_ENTDAD", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "IDNTFCCION", "NMBRE_ENTDAD") AS
  select
  a.id_entdad,
  a.cdgo_clnte,
  a.id_impsto,
  b.nmbre_impsto,
  a.idntfccion,
  a.nmbre_entdad
from df_i_entidades a
join df_c_impuestos b on a.id_impsto = b.id_impsto;

