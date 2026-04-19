
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_PBL_SNCN_SNCN_MAL_LQDDA" ("ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "VGNCIA", "ID_PRDO", "ID_DCLRCION_VGNCIA_FRMLRIO", "ID_DCLRCION", "ID_DCLRCN_TPO", "CDGO_PRDCDAD", "ID_SJTO_TPO", "TPO_PRSNA", "CDGO_IDNTFCCION_TPO", "ID_ACTVDAD_ECNMCA", "FCHA_MXMA_PRSNTCION", "ANIO_LMTE_DCLRCION") AS
  SELECT
    a.id_impsto,
    c.id_impsto_sbmpsto,
    a.id_sjto_impsto,
    a.idntfccion_sjto,
    f.vgncia,
    f.id_prdo,
    g.id_dclrcion_vgncia_frmlrio,
    h.id_dclrcion,
    c.id_dclrcn_tpo,
    d.cdgo_prdcdad,
    e.id_sjto_tpo,
    b.tpo_prsna,
    b.cdgo_idntfccion_tpo,
    b.id_actvdad_ecnmca,
    trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(
        p_id_dclrcion_vgncia_frmlrio   => g.id_dclrcion_vgncia_frmlrio,
        p_idntfccion                   => a.idntfccion_sjto,
        p_id_sjto_tpo                  => b.id_sjto_tpo)) fcha_mxma_prsntcion,
    floor(months_between(trunc(systimestamp),
                         trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(
                                p_id_dclrcion_vgncia_frmlrio   => g.id_dclrcion_vgncia_frmlrio,
                                p_idntfccion                   => a.idntfccion_sjto,
                                p_id_sjto_tpo                  => b.id_sjto_tpo))
          ) / 12) anio_lmte_dclrcion/*,
    (select       to_number(i.vlor) as vlor
    from        gi_g_declaraciones_detalle  i
    inner join  gi_d_hmlgcnes_prpddes_items j   on  i.id_frmlrio_rgion_atrbto   =   j.id_frmlrio_rgion_atrbto
                                                and i.fla                       =   j.fla
    inner join  gi_d_hmlgcnes_prpdad        k   on  j.id_hmlgcion_prpdad        =   k.id_hmlgcion_prpdad
    inner join  gi_d_homologaciones         l   on  l.id_hmlgcion               =   k.id_hmlgcion
    where l.cdgo_hmlgcion = 'FIS'
    and k.cdgo_prpdad = 'CSAN'
    and i.id_dclrcion = h.id_dclrcion ) clclo_sncion,

    (select       to_number(i.vlor) as vlor
    from        gi_g_declaraciones_detalle  i
    inner join  gi_d_hmlgcnes_prpddes_items j   on  i.id_frmlrio_rgion_atrbto   =   j.id_frmlrio_rgion_atrbto
                                                and i.fla                       =   j.fla
    inner join  gi_d_hmlgcnes_prpdad        k   on  j.id_hmlgcion_prpdad        =   k.id_hmlgcion_prpdad
    inner join  gi_d_homologaciones         l   on  l.id_hmlgcion               =   k.id_hmlgcion
    where l.cdgo_hmlgcion = 'FIS'
    and k.cdgo_prpdad = 'VASA'
    and i.id_dclrcion = h.id_dclrcion ) vlor_sncion*/
FROM v_si_i_sujetos_impuesto a
INNER JOIN si_i_personas b ON b.id_sjto_impsto = a.id_sjto_impsto
INNER JOIN gi_d_declaraciones_tipo c ON c.cdgo_clnte = a.cdgo_clnte
                                    AND c.id_impsto  = a.id_impsto
INNER JOIN df_s_periodicidad d ON d.cdgo_prdcdad = c.cdgo_prdcdad
INNER JOIN gi_d_dclrcnes_tpos_sjto e ON e.id_dclrcn_tpo = c.id_dclrcn_tpo
                                    AND e.id_sjto_tpo = b.id_sjto_tpo
INNER JOIN gi_d_dclrcnes_tpos_vgncias f ON f.id_dclrcn_tpo = c.id_dclrcn_tpo
INNER JOIN gi_d_dclrcnes_vgncias_frmlr g ON g.id_dclrcion_tpo_vgncia = f.id_dclrcion_tpo_vgncia
INNER JOIN gi_g_declaraciones h ON h.id_dclrcion_vgncia_frmlrio = g.id_dclrcion_vgncia_frmlrio
                               AND h.id_sjto_impsto = a.id_sjto_impsto
WHERE h.cdgo_dclrcion_estdo IN ('PRS','APL')
  --Valida que la fecha de presentacion sea mayor a la fecha limite
  AND trunc(h.fcha_prsntcion) > trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(
                                        p_id_dclrcion_vgncia_frmlrio   => g.id_dclrcion_vgncia_frmlrio,
                                        p_idntfccion                   => a.idntfccion_sjto,
                                        p_id_sjto_tpo                  => b.id_sjto_tpo))
  AND (select       to_number(i.vlor) as vlor
        from        gi_g_declaraciones_detalle  i
        inner join  gi_d_hmlgcnes_prpddes_items j   on  i.id_frmlrio_rgion_atrbto   =   j.id_frmlrio_rgion_atrbto
                                                    and i.fla                       =   j.fla
        inner join  gi_d_hmlgcnes_prpdad        k   on  j.id_hmlgcion_prpdad        =   k.id_hmlgcion_prpdad
        inner join  gi_d_homologaciones         l   on  l.id_hmlgcion               =   k.id_hmlgcion
        where l.cdgo_hmlgcion = 'FIS'
        and k.cdgo_prpdad = 'VASA'
        and i.id_dclrcion = h.id_dclrcion ) < (select       to_number(i.vlor) as vlor
                                                from        gi_g_declaraciones_detalle  i
                                                inner join  gi_d_hmlgcnes_prpddes_items j   on  i.id_frmlrio_rgion_atrbto   =   j.id_frmlrio_rgion_atrbto
                                                                                            and i.fla                       =   j.fla
                                                inner join  gi_d_hmlgcnes_prpdad        k   on  j.id_hmlgcion_prpdad        =   k.id_hmlgcion_prpdad
                                                inner join  gi_d_homologaciones         l   on  l.id_hmlgcion               =   k.id_hmlgcion
                                                where l.cdgo_hmlgcion = 'FIS'
                                                and k.cdgo_prpdad = 'CSAN'
                                                and i.id_dclrcion = h.id_dclrcion )
    AND g.actvo = 'S'
    --AND f.vgncia = 2019
    --AND f.id_prdo = 328
    --AND d.cdgo_prdcdad = 'ANU';

