
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECAUDOS_CONTROL" ("ID_RCDO_CNTROL", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "CDGO_EAN", "ID_BNCO", "CDGO_BNCO", "NMBRE_BNCO", "DSCRPCION_BNCO", "RCDDOR", "DSCRPCION_RCDDOR", "ID_BNCO_CNTA", "NMRO_CNTA", "DSCRPCION_CNTA", "ID_USRIO", "USER_NAME", "NMBRE_TRCRO", "CNTDAD_RCDOS", "VLOR_RCDOS", "ID_PRCSO_CRGA", "FILE_NAME", "FILE_BLOB", "FILE_MIMETYPE", "CDGO_RCDO_ORGEN", "DSCRPCION_ORGEN", "FCHA_CNTROL", "FCHA_RGSTRO", "OBSRVCION") AS
  select a.id_rcdo_cntrol
             , a.cdgo_clnte
             , b.nmbre_clnte
             , a.id_impsto
             , c.nmbre_impsto
             , a.id_impsto_sbmpsto
             , d.nmbre_impsto_sbmpsto
             , d.cdgo_ean
             , a.id_bnco
             , e.cdgo_bnco
             , e.nmbre_bnco
             , e.cdgo_bnco ||  ' - '  || e.nmbre_bnco as dscrpcion_bnco
             , e.rcddor
             , decode( e.rcddor , 'S' , 'Si' , 'No' ) as dscrpcion_rcddor
             , a.id_bnco_cnta
             , f.nmro_cnta
             , f.dscrpcion_cnta
             , a.id_usrio
             , g.user_name
             , g.nmbre_trcro
             , a.cntdad_rcdos
             , a.vlor_rcdos
             , a.id_prcso_crga
             , i.file_name
             , i.file_blob
             , i.file_mimetype
             , a.cdgo_rcdo_orgen
             , j.dscrpcion as dscrpcion_orgen
             , a.fcha_cntrol
             , a.fcha_rgstro
             , a.obsrvcion
          from re_g_recaudos_control a
          join df_s_clientes b
            on a.cdgo_clnte        = b.cdgo_clnte
          join df_c_impuestos c
            on a.id_impsto         = c.id_impsto
          join df_i_impuestos_subimpuesto d
            on a.id_impsto_sbmpsto = d.id_impsto_sbmpsto
          join df_c_bancos e
            on a.id_bnco           = e.id_bnco
          join df_c_bancos_cuenta f
            on a.id_bnco_cnta      = f.id_bnco_cnta
          join v_sg_g_usuarios g
            on a.id_usrio          = g.id_usrio
     left join et_g_procesos_carga i
        	on a.id_prcso_crga     = i.id_prcso_crga
          join re_d_recaudo_origen j
            on a.cdgo_rcdo_orgen   = j.cdgo_rcdo_orgen
;

