
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_PBLCION_INXCTOS" ("ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "VGNCIA", "PRDO", "ID_PRDO", "ID_DCLRCION_VGNCIA_FRMLRIO", "ID_DCLRCION", "ID_DCLRCN_TPO", "CDGO_PRDCDAD", "ID_SJTO_TPO", "TPO_PRSNA", "CDGO_IDNTFCCION_TPO", "ID_ACTVDAD_ECNMCA", "FCHA_MXMA_PRSNTCION", "ANIO_LMTE_DCLRCION") AS
  SELECT
        a.id_impsto,
        c.id_impsto_sbmpsto,
        a.id_sjto_impsto,
        a.idntfccion_sjto,
        f.vgncia,
        i.prdo,
        f.id_prdo,
        g.id_dclrcion_vgncia_frmlrio,
        h.id_dclrcion,
        c.id_dclrcn_tpo,
        d.cdgo_prdcdad,
        e.id_sjto_tpo,
        b.tpo_prsna,
        b.cdgo_idntfccion_tpo,
        b.id_actvdad_ecnmca,
        trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => g.id_dclrcion_vgncia_frmlrio, p_idntfccion => a.idntfccion_sjto
        , p_id_sjto_tpo => b.id_sjto_tpo)) fcha_mxma_prsntcion,
        floor( --Valida los anios que deben ser cumplidos para poder aplicar a fiscalización
        months_between(trunc(systimestamp),
                             trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => g.id_dclrcion_vgncia_frmlrio
                             , p_idntfccion => a.idntfccion_sjto, p_id_sjto_tpo => b.id_sjto_tpo))) / 12) anio_lmte_dclrcion
    FROM
        v_si_i_sujetos_impuesto     a
        LEFT JOIN si_i_personas               b ON b.id_sjto_impsto = a.id_sjto_impsto
      --and b.fcha_incio_actvddes           <= '31/12/16 12:00:00,000000000 AM'
                                     AND b.id_sjto_tpo IS NOT NULL
        LEFT JOIN gi_d_declaraciones_tipo     c ON c.cdgo_clnte = a.cdgo_clnte
                                               AND c.id_impsto = a.id_impsto
        INNER JOIN df_s_periodicidad           d ON d.cdgo_prdcdad = c.cdgo_prdcdad
        LEFT JOIN gi_d_dclrcnes_tpos_sjto     e ON e.id_dclrcn_tpo = c.id_dclrcn_tpo
                                               AND e.id_sjto_tpo = b.id_sjto_tpo
        INNER JOIN gi_d_dclrcnes_tpos_vgncias  f ON f.id_dclrcn_tpo = c.id_dclrcn_tpo
        LEFT JOIN gi_d_dclrcnes_vgncias_frmlr g ON g.id_dclrcion_tpo_vgncia = f.id_dclrcion_tpo_vgncia
                                                   AND g.actvo = 'S'
        LEFT JOIN gi_g_declaraciones          h ON h.id_dclrcion_vgncia_frmlrio = g.id_dclrcion_vgncia_frmlrio
                                          AND h.id_sjto_impsto = a.id_sjto_impsto
                                          AND h.cdgo_dclrcion_estdo IN ( 'RLA', 'PRS', 'APL', 'FRM' )
                                          AND h.id_cnddto_vgncia IS NULL
        JOIN df_i_periodos               i ON i.id_prdo = f.id_prdo
                                AND i.vgncia = f.vgncia
                                AND i.id_impsto = a.id_impsto
                                AND i.id_impsto_sbmpsto = c.id_impsto_sbmpsto
    WHERE
        h.id_dclrcion IS NOT NULL --Valida que SI haya declarado
      --and h.id_dclrcion_crrccion is null --Valida que NO tengo declaración por corrección
        AND a.cdgo_sjto_estdo = 'A'
        AND g.actvo = 'S';

