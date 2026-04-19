
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_EMBARGOS_RESOLUCION" ("ID_EMBRGOS_RSLCION", "ID_EMBRGOS_CRTRA", "CNSCTVO_EMBRGO", "FCHA_RGSTRO_EMBRGO", "ID_ACTO", "NMRO_ACTO", "FCHA_ACTO", "ID_TPOS_EMBRGO", "DSCRPCION_TIPO_EMBARGO", "IDNTFCCION", "VGNCIAS", "CDGO_CLNTE", "CDGO_CRTRA", "ID_ESTDOS_CRTRA", "CDGO_ESTDOS_CRTRA", "DSCRPCION_ESTADO_CRTRA", "ID_INSTNCIA_FLJO", "ID_LTE_MDDA_CTLAR", "ID_FLJO_TREA_ESTDO", "DCMNTO_RSLCION", "ID_FLJO_TREA", "ID_DCMNTO", "ID_FNCNRIO", "CDGO_ESTDO_PRCSO", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_PLNTLLA") AS
  select a.id_embrgos_rslcion,
              a.id_embrgos_crtra,
              a.cnsctvo_embrgo,
              a.fcha_rgstro_embrgo,
              a.id_acto,
              a.nmro_acto,
              a.fcha_acto,
              b.id_tpos_embrgo,
              b.dscrpcion_tipo_embargo,
              b.idntfccion,
              b.vgncias,
              b.cdgo_clnte,
              b.cdgo_crtra,
              b.id_estdos_crtra,
              b.cdgo_estdos_crtra,
              b.dscrpcion_estado_crtra,
              b.id_instncia_fljo,
              a.id_lte_mdda_ctlar,
              a.id_fljo_trea_estdo,
              a.dcmnto_rslcion,
              b.id_fljo_trea,
              c.id_dcmnto,
              a.id_fncnrio,
              a.cdgo_estdo_prcso,
              b.id_impsto,
              b.id_impsto_sbmpsto,
              a.id_plntlla
       from mc_g_embargos_resolucion a
       inner join v_mc_g_embargos_cartera b on a.id_embrgos_crtra = b.id_embrgos_crtra
       left join gn_g_actos c on a.id_acto = c.id_acto
;

