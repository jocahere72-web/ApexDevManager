
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WS_D_USUARIOS_CUENTA_IMPUESTO" ("ID_USRIOS_CNTA_IMPSTO", "CDGO_CLNTE", "ID_USRIO_WBSRVCE", "USER_NAME", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_BNCO_CNTA", "NMBRE_BNCO", "NMRO_CNTA", "CDGO_EAN", "ACTVO") AS
  select a.id_usrios_cnta_impsto,
       d.cdgo_clnte,
       a.id_usrio_wbsrvce,
       d.user_name,
       a.id_impsto,
       e.nmbre_impsto,
       a.id_impsto_sbmpsto,
       c.nmbre_impsto_sbmpsto,
       a.id_bnco_cnta,
       f.nmbre_bnco,
       b.nmro_cnta,
       c.cdgo_ean,
       a.actvo
  from ws_d_usuarios_cuenta_impuesto a
  join df_c_bancos_cuenta b
    on b.id_bnco_cnta = a.id_bnco_cnta
  join df_i_impuestos_subimpuesto c
    on c.id_impsto_sbmpsto = a.id_impsto_sbmpsto
  join ws_g_usuarios_webservice d
    on d.id_usrio_wbsrvce = a.id_usrio_wbsrvce
  join df_c_impuestos e
    on e.id_impsto = a.id_impsto
  join df_c_bancos f on f.id_bnco = b.id_bnco
;

