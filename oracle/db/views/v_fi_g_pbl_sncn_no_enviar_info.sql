
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_PBL_SNCN_NO_ENVIAR_INFO" ("ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "VGNCIA", "ID_PRDO", "ID_DCLRCION_VGNCIA_FRMLRIO", "ID_DCLRCN_TPO", "CDGO_PRDCDAD", "ID_SJTO_TPO", "TPO_PRSNA", "CDGO_IDNTFCCION_TPO", "ID_ACTVDAD_ECNMCA", "FCHA_MXMA_PRSNTCION", "ANIO_LMTE_DCLRCION") AS
  SELECT a.id_impsto,
       c.id_impsto_sbmpsto,
       a.id_sjto_impsto,
       a.idntfccion_sjto,
       f.vgncia,
       f.id_prdo,
       g.id_dclrcion_vgncia_frmlrio,
       --h.id_dclrcion,
       c.id_dclrcn_tpo,
       d.cdgo_prdcdad,
       e.id_sjto_tpo,
       b.tpo_prsna,
       b.cdgo_idntfccion_tpo,
       b.id_actvdad_ecnmca,
       trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => g.id_dclrcion_vgncia_frmlrio,
                                                            p_idntfccion                 => a.idntfccion_sjto,
                                                            p_id_sjto_tpo                => b.id_sjto_tpo)) fcha_mxma_prsntcion,
       floor(months_between(trunc(systimestamp),
                            trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => g.id_dclrcion_vgncia_frmlrio,
                                                                                 p_idntfccion                 => a.idntfccion_sjto,
                                                                                 p_id_sjto_tpo                => b.id_sjto_tpo))) / 12) anio_lmte_dclrcion
  FROM v_si_i_sujetos_impuesto a
  JOIN si_i_personas b
    ON b.id_sjto_impsto = a.id_sjto_impsto
  JOIN gi_d_declaraciones_tipo c
    ON c.cdgo_clnte = a.cdgo_clnte
   AND c.id_impsto = a.id_impsto
  JOIN df_s_periodicidad d
    ON d.cdgo_prdcdad = c.cdgo_prdcdad
  JOIN gi_d_dclrcnes_tpos_sjto e
    ON e.id_dclrcn_tpo = c.id_dclrcn_tpo
   AND e.id_sjto_tpo = b.id_sjto_tpo
  JOIN gi_d_dclrcnes_tpos_vgncias f
    ON f.id_dclrcn_tpo = c.id_dclrcn_tpo
  JOIN gi_d_dclrcnes_vgncias_frmlr g
    ON g.id_dclrcion_tpo_vgncia = f.id_dclrcion_tpo_vgncia
/*JOIN gi_g_declaraciones h ON h.id_dclrcion_vgncia_frmlrio = g.id_dclrcion_vgncia_frmlrio
AND h.id_sjto_impsto = a.id_sjto_impsto*/
 WHERE not exists (select i.id_sjto_impsto
          from v_gi_g_informacion_exogena i
         where a.id_sjto_impsto = i.id_sjto_impsto
              --and h.vgncia         = i.vgncia)
           and f.vgncia = i.vgncia)
    OR exists (select i.id_sjto_impsto
          from v_fi_g_candidatos i
          join fi_g_fiscalizacion_expdnte j
            on j.id_cnddto = i.id_cnddto
          join fi_g_fsclzcion_expdnte_acto k
            on k.id_fsclzcion_expdnte = j.id_fsclzcion_expdnte
          join gn_d_actos_tipo l
            on l.id_acto_tpo = k.id_acto_tpo
         where a.id_sjto_impsto = i.id_sjto_impsto
           and l.cdgo_acto_tpo in ('ROO', 'RE')
           and k.id_slctud_rqrmnto is null)
;

