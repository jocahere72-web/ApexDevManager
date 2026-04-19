
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_PBLCION_OMSOS_LQDDOS" ("CDGO_IMPSTO", "ID_IMPSTO", "CDGO_IMPSTO_SBMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "NMBRE_RZON_SCIAL", "NMBRE_ENTDAD", "VGNCIA", "ID_PRDO", "CDGO_PRDCDAD", "CDGO_IMPSTO_ACTO", "NMBRE_IMPSTO_ACTO", "BSE_GRVBLE", "FCHA_RGSTRO", "TXTO_ASCDA", "NMRO_RNTA") AS
  SELECT
        d.cdgo_impsto,
        d.id_impsto,
        e.cdgo_impsto_sbmpsto,
        e.id_impsto_sbmpsto,
        b.id_sjto_impsto,
        a.idntfccion_sjto,
        a.nmbre_rzon_scial,
        a.nmbre_entdad,
        c.vgncia,
        c.id_prdo,
        c.cdgo_prdcdad,
        f.cdgo_impsto_acto,
        f.nmbre_impsto_acto,
        c.bse_grvble,
        a.fcha_rgstro,
        a.txto_ascda,
        a.nmro_rnta
    FROM
             v_gi_g_rentas a
        JOIN v_si_i_sujetos_impuesto    b ON a.id_sjto_impsto = b.id_sjto_impsto
        JOIN v_gi_g_liquidaciones       c ON a.id_lqdcion = c.id_lqdcion
        JOIN df_c_impuestos             d ON c.id_impsto = d.id_impsto
        JOIN df_i_impuestos_subimpuesto e ON c.id_impsto_sbmpsto = e.id_impsto_sbmpsto
        JOIN v_gi_g_rentas_acto         f ON a.id_rnta = f.id_rnta
    WHERE
            a.indcdor_rnta_pgda = 'N'
        AND a.cdgo_rnta_estdo = 'LQD'
        AND a.nmbre_entdad IS NOT NULL;

