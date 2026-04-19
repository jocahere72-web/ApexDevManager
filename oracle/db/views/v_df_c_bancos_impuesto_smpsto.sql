
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_BANCOS_IMPUESTO_SMPSTO" ("ID_BNCO_IMPSTO_SBMPSTO", "CDGO_CLNTE", "ID_BNCO", "NMBRE_BNCO", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO") AS
  select a.id_bnco_impsto_sbmpsto,
       a.cdgo_clnte,
       a.id_bnco,
       b.nmbre_bnco,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       c.nmbre_impsto_sbmpsto
from df_c_bancos_impuesto_smpsto a
join df_c_bancos b on b.id_bnco = a.id_bnco
join df_i_impuestos_subimpuesto c on c.id_impsto_sbmpsto = a.id_impsto_sbmpsto;

