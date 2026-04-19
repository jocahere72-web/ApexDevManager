
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_LOTES_MDDA_CTLAR" ("CDGO_CLNTE", "ID_LTE_MDDA_CTLAR", "NMRO_CNSCTVO", "FCHA_LTE", "TPO_LTE", "ID_FNCNRIO", "NMBRE_TRCRO", "OBSRVCION_LTE", "CNTDAD_DSMBRGO_LOTE", "DSMBRGO_TPO", "DSCRPCION_MDDA_CTLAR_TPO", "JSON", "NMRO_RGSTRO_PRCSAR", "CDGO_ESTDO_LTE", "DSCRPCION_ESTDO_LTE") AS
  SELECT
        a.cdgo_clnte,
        a.id_lte_mdda_ctlar,
        a.nmro_cnsctvo,
        a.fcha_lte,
        a.tpo_lte,
        a.id_fncnrio,
        b.nmbre_trcro,
        a.obsrvcion_lte,
        a.cntdad_dsmbrgo_lote,
        a.dsmbrgo_tpo,
        d.dscrpcion   dscrpcion_mdda_ctlar_tpo,
        a.json,
        a.nmro_rgstro_prcsar,
        a.cdgo_estdo_lte,
        c.dscrpcion   dscrpcion_estdo_lte
    FROM
        mc_g_lotes_mdda_ctlar   a
        JOIN v_sg_g_usuarios         b ON b.id_fncnrio = a.id_fncnrio
        JOIN mc_d_estados_lote       c ON a.cdgo_estdo_lte = c.cdgo_estdo_lte
        JOIN mc_d_tipos_mdda_ctlar   d ON a.dsmbrgo_tpo = d.id_tpos_mdda_ctlar;

