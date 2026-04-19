
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_RENTAS" ("ID_RNTA", "CDGO_CLNTE", "NMBRE_MNCPIO_CLNTE", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "NMBRE_RZON_SCIAL", "NMRO_RNTA", "FCHA_RGSTRO", "ID_SBMPSTO_ASCDA", "DSCRPCION_ASCDA", "CDGO_ASCDA", "VLOR_BSE_GRVBLE", "TXTO_ASCDA", "INDCDOR_USA_MXTO", "USA_EXTRNJRO", "INDCDOR_USA_EXTRNJRO", "USA_MXTO", "FCHA_EXPDCION", "ID_DCMNTO", "ID_LQDCION", "NMRO_DCMNTO", "FCHA_VNCMNTO", "VLOR_TTAL", "CDGO_MVNT_FNCRO_ESTDO", "ID_USRIO", "ID_ENTDAD", "IDNTFCCION_ENTDAD", "NMBRE_ENTDAD", "CDGO_RNTA_ESTDO", "DSCRPCION_RNTA_ESTDO", "ENTRNO", "DSCRPCION_ENTRNO", "ID_RNTA_ANTRIOR", "VLOR_BSE_GRVBLE_RNTA_ANTRIOR", "TXTO_ASCDA_RNTA_ANTRIOR", "INDCDOR_EXNCION", "DSCRPCION_INDCDOR_EXNCION", "INDCDOR_CNTRTO_GSLNA", "DSCRPCION_INDCDOR_CNTRTO_GSNLA", "INDCDOR_CNTRTO_ESE", "DSCRPCION_INDCDOR_CNTRTO_ESE", "VLOR_CNTRTO_ESE", "ID_USRIO_APRBO", "NMBRE_TRCRO_APRBO", "FCHA_APRBCION", "ID_USRIO_RCHZO", "NMBRE_TRCRO_RCHZO", "FCHA_RCHZO", "OBSRVCION_RCHZO", "INDCDOR_RNTA_PGDA", "DSCRPCION_INDCDOR_RNTA_PGDA", "ID_INSTNCIA_FLJO", "ID_FLJO_TREA", "ID_EXNCION_SLCTUD", "CDGO_EXNCION_ESTDO", "USRIO_RGSTRA_EXNCION", "FCHA_RGSTRO_EXNCION", "ID_USRIO_RSPSTA", "FCHA_RSPSTA_EXNCION", "OBSRVCION_RCHZO_EXNCION", "ID_AJSTE_EXNCION", "ID_DCMNTO_EXNCION", "NMRO_DCMNTO_EXNCION", "INDCDOR_PGO_APLCDO_EXNCION", "INDCDOR_MGRDO", "INDCDOR_INTRFAZ", "ID_SJTO_SCRSAL", "NMBRE_SCRSAL", "VLOR_AUX_LQDCION", "INDCDOR_ACMLA_BSE", "ID_RNTA_CNTRTO_EXTRNO") AS
  select a.id_rnta,
       a.cdgo_clnte,
       c.nmbre_mncpio nmbre_mncpio_clnte,
       a.id_impsto,
       b.cdgo_impsto,
       b.nmbre_impsto,
       a.id_impsto_sbmpsto,
       b.cdgo_impsto_sbmpsto,
       b.nmbre_impsto_sbmpsto,
       a.id_sjto_impsto,
       c.idntfccion_sjto,
       c.idntfccion_sjto_frmtda,
       n.nmbre_rzon_scial,
       a.nmro_rnta,
       a.fcha_rgstro,
       a.id_sbmpsto_ascda,
       d.dscrpcion dscrpcion_ascda,
       d.cdgo_ascda,
       a.vlor_bse_grvble,
       a.txto_ascda,
       a.indcdor_usa_mxto,
       decode(a.indcdor_usa_extrnjro, 'S', 'Sí', 'N', 'No') usa_extrnjro,
       a.indcdor_usa_extrnjro,
       decode(a.indcdor_usa_mxto, 'S', 'Sí', 'N', 'No') usa_mxto,
       a.fcha_expdcion,
       a.id_dcmnto,
       a.id_lqdcion,
       e.nmro_dcmnto,
       a.fcha_vncmnto_dcmnto fcha_vncmnto,
       e.vlor_ttal,
       f.cdgo_mvnt_fncro_estdo,
       a.id_usrio,
       j.id_entdad,
       j.idntfccion idntfccion_entdad,
       j.nmbre_rzon_scial nmbre_entdad,
       a.cdgo_rnta_estdo,
       g.dscrpcion dscrpcion_rnta_estdo,
       a.entrno,
       decode(a.entrno, 'PBLCO', 'PÚBICO', 'PRVDO', 'PRIVADO') dscrpcion_entrno,
       a.id_rnta_antrior,
       o.vlor_bse_grvble vlor_bse_grvble_rnta_antrior,
       o.txto_ascda txto_ascda_rnta_antrior,
       a.indcdor_exncion,
       decode(a.indcdor_exncion, 'S', 'Sí', 'N', 'No') dscrpcion_indcdor_exncion,
       a.indcdor_cntrto_gslna,
       decode(a.indcdor_cntrto_gslna, 'S', 'Sí', 'N', 'No') dscrpcion_indcdor_cntrto_gsnla,
       a.indcdor_cntrto_ese,
       decode(a.indcdor_cntrto_ese, 'S', 'S?', 'N', 'No') dscrpcion_indcdor_cntrto_ese,
       a.vlor_cntrto_ese,
       a.id_usrio_aprbo,
       k.nmbre_trcro nmbre_trcro_aprbo,
       a.fcha_aprbcion,
       a.id_usrio_rchzo,
       l.nmbre_trcro nmbre_trcro_rchzo,
       a.fcha_rchzo,
       a.obsrvcion_rchzo,
       a.indcdor_rnta_pgda,
       decode(a.indcdor_rnta_pgda, 'S', 'Sí', 'N', 'No') dscrpcion_indcdor_rnta_pgda,
       a.id_instncia_fljo,
       a.id_fljo_trea,
       m.id_exncion_slctud,
       m.cdgo_exncion_estdo,
       m.id_usrio_rgstra usrio_rgstra_exncion,
       m.fcha_rgstro fcha_rgstro_exncion,
       m.id_usrio_rspsta,
       m.fcha_rspsta fcha_rspsta_exncion,
       m.obsrvcion_rchzo obsrvcion_rchzo_exncion,
       m.id_ajste id_ajste_exncion,
       m.id_dcmnto id_dcmnto_exncion,
       m.nmro_dcmnto nmro_dcmnto_exncion,
       m.indcdor_pgo_aplcdo indcdor_pgo_aplcdo_exncion,
       a.indcdor_mgrdo indcdor_mgrdo,
       a.indcdor_intrfaz indcdor_intrfaz,
       a.id_sjto_scrsal,
       (select nmbre
          from si_i_sujetos_sucursal s
         where a.id_sjto_scrsal = s.id_sjto_scrsal) nmbre_scrsal,
       a.vlor_aux_lqdcion,
       a.indcdor_acmla_bse,
	   a.id_rnta_cntrto_extrno
  from gi_g_rentas a
  join v_df_i_impuestos_subimpuesto b
    on a.id_impsto_sbmpsto = b.id_impsto_sbmpsto
  join v_si_i_sujetos_impuesto c
    on a.id_sjto_impsto = c.id_sjto_impsto
  left join gi_d_subimpuestos_asociada d
    on a.id_sbmpsto_ascda = d.id_sbmpsto_ascda
  left join re_g_documentos e
    on a.id_dcmnto = e.id_dcmnto
  left join gf_g_movimientos_financiero f
    on a.id_lqdcion = f.id_orgen
  join gi_d_rentas_estado g
    on a.cdgo_rnta_estdo = g.cdgo_rnta_estdo
  join v_sg_g_usuarios h
    on a.id_usrio = h.id_usrio
-- join df_c_funcionarios                     i on h.id_fncnrio     = i.id_fncnrio
  left join df_s_entidades j
    on a.id_entdad = j.id_entdad
  left join v_sg_g_usuarios k
    on a.id_usrio_aprbo = k.id_usrio
  left join v_sg_g_usuarios l
    on a.id_usrio_rchzo = l.id_usrio
  left join v_gf_g_exenciones_solicitud m
    on a.id_rnta = m.id_orgen
   and m.cdgo_exncion_orgen = 'RNT'
  join si_i_personas n
    on a.id_sjto_impsto = n.id_sjto_impsto
  left join gi_g_rentas o
    on a.id_rnta_antrior = o.id_rnta
;

