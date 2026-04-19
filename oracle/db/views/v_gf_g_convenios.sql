
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CONVENIOS" ("ID_CNVNIO", "ID_SLCTUD", "CDGO_CLNTE", "ID_INSTNCIA_FLJO_HJO", "ID_INSTNCIA_FLJO_PDRE", "ID_SJTO_IMPSTO", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "NMBRE_SLCTNTE", "CDGO_IDNTFCCION_TPO_SLCTNTE", "NMRO_IDNTFCCION_SLCTNTE", "DRCCION_NTFCCION", "ID_PAIS_NTFCCION", "NMBRE_PAIS_NTFCCION", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO_NTFCCION", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO_NTFCCION", "EMAIL", "TLFNO", "CLLAR", "CDGO_RSPNSBLE_TPO", "DSCRPCION_RSPNSBLE_TPO", "DRCCION", "ID_CNVNIO_TPO", "DSCRPCION_CNVNIO_TPO", "CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO", "FCHA_LMTE_ELBRCION", "NMRO_MXMO_CTAS", "FCHA_MXMA_CTAS", "ID_DCRTO", "DSCRPCION_DCRTO_CNVNIO", "NMRO_CNVNIO", "CDGO_CNVNIO_ESTDO", "DSCRPCION_CNVNIO_ESTDO", "FCHA_SLCTUD", "FCHA_PRMRA_CTA", "NMRO_CTA", "CDGO_PRDCDAD_CTA", "DSCRPCION_PRDCDAD_CTA", "TTAL_CNVNIO", "VLOR_CTA_INCIAL", "FCHA_LMTE_CTA_INCIAL", "ID_DCMNTO_CTA_INCIAL", "FCHA_SLCTUD_RSPSTA", "MTVO_RCHZO_SLCTUD", "FCHA_ELBRCION_CNVNIO", "FCHA_RVCTORIA", "OBSRVCION", "FCHA_RDCDO", "NMBRE_RDCDOR", "IDNTFCCION_RDCDOR", "NMRO_RDCDO", "NMRO_RDCDO_DSPLAY", "ID_ACTO", "CDGO_ACTO_ORGEN", "DSCRPCION_ACTO_ORGEN", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "INDCDOR_NTFCDO", "FCHA_ACTO", "FCHA_APRBCION", "ID_USRIO_APRBCION", "FCHA_RCHZO", "ID_USRIO_RCHZO", "FCHA_APLCCION", "ID_USRIO_APLCCION", "IDNTFCCION_ANTRIOR", "ID_RDCDOR", "INDCDOR_INSLVNCIA", "INDCDOR_CLCLA_INTRES", "FCHA_CNGLA_INTRES", "FCHA_RSLCION", "NMRO_RSLCION") AS
  select a.id_cnvnio,
       a.id_slctud,
       a.cdgo_clnte,
       a.id_instncia_fljo_hjo,
       a.id_instncia_fljo_pdre,
       a.id_sjto_impsto,
       b.id_impsto,
       b.nmbre_impsto,
       h.id_impsto_sbmpsto,
       h.nmbre_impsto_sbmpsto,
       b.id_sjto,
       b.idntfccion_sjto,
       b.idntfccion_sjto_frmtda,
       c.nmbre_slctnte,
       c.cdgo_idntfccion_tpo     cdgo_idntfccion_tpo_slctnte,
       c.idntfccion              nmro_idntfccion_slctnte,
       c.drccion_ntfccion,
       c.id_pais_ntfccion,
       c.nmbre_pais_ntfccion,
       c.id_dprtmnto_ntfccion,
       c.nmbre_dprtmnto_ntfccion,
       c.id_mncpio_ntfccion,
       c.nmbre_mncpio_ntfccion,
       c.email,
       c.tlfno,
       c.cllar,
       c.cdgo_rspnsble_tpo,
       c.dscrpcion_rspnsble_tpo,
       b.drccion,
       a.id_cnvnio_tpo,
       d.dscrpcion               dscrpcion_cnvnio_tpo,
       d.cdgo_sjto_tpo,
       d.dscrpcion_sjto_tpo,
       d.fcha_lmte_elbrcion,
       d.nmro_mxmo_ctas,
       d.fcha_mxma_ctas,
       d.id_dcrto,
       d.dscrpcion_dcrto_cnvnio,
       a.nmro_cnvnio,
       a.cdgo_cnvnio_estdo,
       e.dscrpcion               dscrpcion_cnvnio_estdo,
       a.fcha_slctud,
       a.fcha_prmra_cta,
       a.nmro_cta,
       a.cdgo_prdcdad_cta,
       f.dscrpcion               dscrpcion_prdcdad_cta,
       a.ttal_cnvnio,
       a.vlor_cta_incial,
       a.fcha_lmte_cta_incial,
       a.id_dcmnto_cta_incial,
       a.fcha_slctud_rspsta,
       a.mtvo_rchzo_slctud,
       a.fcha_elbrcion_cnvnio,
       a.fcha_rvctoria,
       a.obsrvcion,
       h.fcha_rdcdo,
       h.nmbre_rdcdor            nmbre_rdcdor,
       h.idntfccion_rdcdor,
       h.nmro_rdcdo,
       h.nmro_rdcdo_dsplay,
       a.id_acto,
       g.cdgo_acto_orgen,
       g.dscrpcion_acto_orgen,
       g.nmro_acto,
       g.nmro_acto_dsplay,
       g.indcdor_ntfcdo,
       g.fcha                    fcha_acto,
       a.fcha_aprbcion,
       a.id_usrio_aprbcion,
       a.fcha_rchzo,
       a.id_usrio_rchzo,
       a.fcha_aplccion,
       a.id_usrio_aplccion,
       b.idntfccion_antrior,
       h.id_rdcdor,
       a.indcdor_inslvncia,
       a.indcdor_clcla_intres,
       a.fcha_cngla_intres,
       a.fcha_rslcion,
       a.nmro_rslcion
  from gf_g_convenios a
  join v_si_i_sujetos_impuesto b
    on a.id_sjto_impsto = b.id_sjto_impsto
  join v_pq_g_solicitudes h
    on a.id_instncia_fljo_hjo = h.id_instncia_fljo_gnrdo
  join v_pq_g_solicitantes c
    on h.id_slctud = c.id_slctud
  join v_gf_d_convenios_tipo d
    on a.id_cnvnio_tpo = d.id_cnvnio_tpo
  join gf_d_convenios_estado e
    on a.cdgo_cnvnio_estdo = e.cdgo_cnvnio_estdo
  join df_s_periodicidad f
    on a.cdgo_prdcdad_cta = f.cdgo_prdcdad
  left join v_gn_g_actos g
    on a.id_acto = g.id_acto
;

