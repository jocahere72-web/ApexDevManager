
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WS_G_RECAUDOS_WEBSERVICE" ("ID_RCDO_WBSRVCE", "ID_USRIO_WBSRVCE", "USER_NAME", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "ID_ORGEN", "CDGO_RCDO_ORGEN", "NMRO_DCMNTO", "VLOR", "FCHA_RCDO_WBSRVCE", "ID_BNCO", "NMBRE_BNCO", "ID_BNCO_CNTA", "NMRO_CNTA", "CDGO_FRMA_PGO", "CDGO_SCURSAL", "FCHA_REGISTRO", "ID_RCDO", "APLCDO", "OBSRVCION_APLCION") AS
  select a.id_rcdo_wbsrvce,
         a.id_usrio_wbsrvce,
         h.user_name,
         a.cdgo_clnte,
         b.nmbre_clnte,
         a.id_impsto,
         c.nmbre_impsto,
         a.id_impsto_sbmpsto,
         d.nmbre_impsto_sbmpsto,
         a.id_sjto_impsto,
         e.idntfccion_sjto,
         a.id_orgen,
         a.cdgo_rcdo_orgen,
         a.nmro_dcmnto,
         a.vlor,
         a.fcha_rcdo_wbsrvce,
         a.id_bnco,
         f.nmbre_bnco,
         a.id_bnco_cnta,
         g.nmro_cnta,
         a.cdgo_frma_pgo,
         a.cdgo_scursal,
         a.fcha_registro,
         a.id_rcdo,
         decode(a.id_rcdo,null,'N','S') aplcdo,
         a.obsrvcion_aplcion
    from ws_g_recaudos_webservice a
    join df_s_clientes b on b.cdgo_clnte = a.cdgo_clnte
    join df_c_impuestos c on c.id_impsto = a.id_impsto
    join df_i_impuestos_subimpuesto d on d.id_impsto_sbmpsto = a.id_impsto_sbmpsto
    join v_si_i_sujetos_impuesto e on e.id_sjto_impsto = a.id_sjto_impsto
    join df_c_bancos f on f.id_bnco = a.id_bnco
    join df_c_bancos_cuenta g on g.id_bnco_cnta = a.id_bnco_cnta
    join ws_g_usuarios_webservice h on h.id_usrio_wbsrvce = a.id_usrio_wbsrvce
;

