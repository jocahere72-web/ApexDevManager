
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_BANCOS_IMPUESTO" ("ID_BNCO_IMPSTO", "CDGO_CLNTE", "ID_BNCO", "NMBRE_BNCO", "ID_IMPSTO", "NMBRE_IMPSTO") AS
  select a.id_bnco_impsto,
       a.cdgo_clnte,
       a.id_bnco,
       b.nmbre_bnco,
       a.id_impsto,
       c.nmbre_impsto
from df_c_bancos_impuesto a
join df_c_bancos b on b.id_bnco = a.id_bnco
join df_c_impuestos c on c.id_impsto = a.id_impsto;

