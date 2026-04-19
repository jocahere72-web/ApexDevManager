
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_PBLCION_SNCNTR_EXTMPRN" ("ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "VGNCIA", "ID_PRDO", "ID_DCLRCION_VGNCIA_FRMLRIO", "ID_DCLRCION", "ID_DCLRCN_TPO", "CDGO_PRDCDAD", "ID_SJTO_TPO", "TPO_PRSNA", "CDGO_IDNTFCCION_TPO", "ID_ACTVDAD_ECNMCA", "FCHA_MXMA_PRSNTCION", "ANIO_LMTE_DCLRCION") AS
  select    a.id_impsto,
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
            trunc(
                    pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion (p_id_dclrcion_vgncia_frmlrio=>  g.id_dclrcion_vgncia_frmlrio,
                                                                    p_idntfccion                =>  a.idntfccion_sjto,
                                                                    p_id_sjto_tpo               =>  b.id_sjto_tpo)
                 ) fcha_mxma_prsntcion,
            floor(--Valida los anios que deben ser cumplidos para poder aplicar a fiscalización
                    months_between(
                                    trunc(systimestamp),
                                    trunc(
                                            pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion (p_id_dclrcion_vgncia_frmlrio=>  g.id_dclrcion_vgncia_frmlrio,
                                                                                            p_idntfccion                =>  a.idntfccion_sjto,
                                                                                            p_id_sjto_tpo               =>  b.id_sjto_tpo)
                                         )
                                  )
                    / 12
                 ) anio_lmte_dclrcion
from        v_si_i_sujetos_impuesto     a
inner join  si_i_personas               b   on  b.id_sjto_impsto            =   a.id_sjto_impsto
inner join  gi_d_declaraciones_tipo     c   on  c.cdgo_clnte                =   a.cdgo_clnte
                                            and c.id_impsto                 =   a.id_impsto
inner join  df_s_periodicidad           d   on  d.cdgo_prdcdad              =   c.cdgo_prdcdad
inner join  gi_d_dclrcnes_tpos_sjto     e   on  e.id_dclrcn_tpo             =   c.id_dclrcn_tpo
                                            and e.id_sjto_tpo               =   b.id_sjto_tpo
inner join  gi_d_dclrcnes_tpos_vgncias  f   on  f.id_dclrcn_tpo             =   c.id_dclrcn_tpo
inner join  gi_d_dclrcnes_vgncias_frmlr g   on  g.id_dclrcion_tpo_vgncia    =   f.id_dclrcion_tpo_vgncia
inner join  gi_g_declaraciones          h   on  h.id_dclrcion_vgncia_frmlrio=   g.id_dclrcion_vgncia_frmlrio
                                            and h.id_sjto_impsto            =   a.id_sjto_impsto
where h.cdgo_dclrcion_estdo in ('PRS', 'APL')

and       trunc(h.fcha_prsntcion) >   trunc(--Valida que la fecha de presentacion sea mayor a la fecha limite
                                                pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion (p_id_dclrcion_vgncia_frmlrio	=>  g.id_dclrcion_vgncia_frmlrio,
                                                                                                p_idntfccion					=>  a.idntfccion_sjto,
                                                                                                p_id_sjto_tpo					=>  b.id_sjto_tpo)
                                             )
and         exists(--Valida que el item de sancion sea igual cero
                    select  1
                    from    v_gi_g_dclrcnes_hmlgcnes    i
                    where   i.id_dclrcion               =   h.id_dclrcion
                    and     i.cdgo_hmlgcion             =   'FIS'
                    and     i.cdgo_prpdad               =   'VASA'
                    and     to_number(i.vlor)           =   0
                  )
and g.actvo = 'S';

