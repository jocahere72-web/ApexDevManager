
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_DESEMBARGOS_RESOLUCION" ("ID_DSMBRGOS_RSLCION", "ID_TPOS_MDDA_CTLAR", "CDGO_TPOS_MDDA_CTLAR", "DSCRPCION_TPO_MDDA_CTLAR", "ID_LTE_MDDA_CTLAR", "ID_CSLES_DSMBRGO", "CDGO_CSAL", "DSCRPCION_CSAL", "ID_ACTO", "NMRO_ACTO", "FCHA_ACTO", "CDGO_CLNTE", "OBSERVACION", "DCMNTO_DSMBRGO", "FCHA_RGSTRO_DSMBRGO", "ID_INSTNCIA_FLJO", "ID_ESTDOS_CRTRA", "CDGO_ESTDOS_CRTRA", "ID_FLJO_TREA", "ID_FLJO_TREA_ESTDO", "IDNTFCCION", "ID_FNCNRIO", "ACTIVO", "ID_PLNTLLA") AS
  SELECT
        a.id_dsmbrgos_rslcion,
        a.id_tpos_mdda_ctlar,
        c.cdgo_tpos_mdda_ctlar,
        c.dscrpcion AS dscrpcion_tpo_mdda_ctlar,
        a.id_lte_mdda_ctlar,
        a.id_csles_dsmbrgo,
        b.cdgo_csal,
        b.dscrpcion_csal,
        a.id_acto,
        a.nmro_acto,
        a.fcha_acto,
        a.cdgo_clnte,
        a.observacion,
        a.dcmnto_dsmbrgo,
        a.fcha_rgstro_dsmbrgo,
        e.id_instncia_fljo,
        f.id_estdos_crtra,
        f.cdgo_estdos_crtra,
        f.id_fljo_trea,
        a.id_fljo_trea_estdo,
        e.idntfccion,
        a.id_fncnrio,
        a.activo,
        a.id_plntlla
    FROM
        mc_g_desembargos_resolucion   a
        JOIN mc_g_desembargos_cartera      d ON d.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion
        JOIN v_mc_g_embargos_cartera       e ON e.id_embrgos_crtra = d.id_embrgos_crtra
        JOIN mc_d_estados_cartera          f ON f.id_estdos_crtra = e.id_estdos_crtra
        JOIN mc_d_causales_desembargo      b ON b.id_csles_dsmbrgo = a.id_csles_dsmbrgo
        JOIN mc_d_tipos_mdda_ctlar         c ON c.id_tpos_mdda_ctlar = a.id_tpos_mdda_ctlar
;

