
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_PRDOS_OMSO" ("CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "VGNCIA", "ID_PRDO", "ID_DCLRCION_VGNCIA_FRMLRIO", "ID_DCLRCION", "ID_DCLRCN_TPO", "CDGO_PRDCDAD", "ID_SJTO_TPO", "TPO_PRSNA", "CDGO_IDNTFCCION_TPO", "ID_ACTVDAD_ECNMCA", "FCHA_INCIO_ACTVDDES", "FCHA_LMTE", "FCHA_MXMA_PRSNTCION", "ANIO_LMTE_DCLRCION") AS
  select x."CDGO_CLNTE",
       x."ID_IMPSTO",
       x."ID_IMPSTO_SBMPSTO",
       x."ID_SJTO_IMPSTO",
       x."IDNTFCCION_SJTO",
       x."VGNCIA",
       x."ID_PRDO",
       x."ID_DCLRCION_VGNCIA_FRMLRIO",
       x."ID_DCLRCION",
       x."ID_DCLRCN_TPO",
       x."CDGO_PRDCDAD",
       x."ID_SJTO_TPO",
       x."TPO_PRSNA",
       x."CDGO_IDNTFCCION_TPO",
       x."ID_ACTVDAD_ECNMCA",
       x."FCHA_INCIO_ACTVDDES",
       x."FCHA_LMTE",
       trunc(x.fcha_lmte) as fcha_mxma_prsntcion,
       round(months_between(trunc(systimestamp), trunc(x.fcha_lmte)) / 12,2) as anio_lmte_dclrcion
  from (select a.cdgo_clnte,
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
               b.fcha_incio_actvddes,
               pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => g.id_dclrcion_vgncia_frmlrio,
                                                              p_idntfccion                 => a.idntfccion_sjto,
                                                              p_id_sjto_tpo                => b.id_sjto_tpo) as fcha_lmte
          from v_si_i_sujetos_impuesto a
         inner join si_i_personas b
            on b.id_sjto_impsto = a.id_sjto_impsto
         inner join gi_d_declaraciones_tipo c
            on c.cdgo_clnte = a.cdgo_clnte
           and c.id_impsto = a.id_impsto
         inner join df_s_periodicidad d
            on d.cdgo_prdcdad = c.cdgo_prdcdad
         inner join gi_d_dclrcnes_tpos_sjto e
            on e.id_dclrcn_tpo = c.id_dclrcn_tpo
           and e.id_sjto_tpo = b.id_sjto_tpo
         inner join gi_d_dclrcnes_tpos_vgncias f
            on f.id_dclrcn_tpo = c.id_dclrcn_tpo
         inner join gi_d_dclrcnes_vgncias_frmlr g
            on g.id_dclrcion_tpo_vgncia = f.id_dclrcion_tpo_vgncia
          left join gi_g_declaraciones h
            on h.id_dclrcion_vgncia_frmlrio = g.id_dclrcion_vgncia_frmlrio
           and h.id_sjto_impsto = a.id_sjto_impsto
           and h.cdgo_dclrcion_estdo in ('RLA', 'PRS', 'APL', 'FRM')
         where h.id_dclrcion is null
           and a.cdgo_sjto_estdo = 'A'
           and g.actvo = 'S') x
 where trunc(x.fcha_lmte) < trunc(systimestamp)
   and trunc(x.fcha_lmte) > trunc(x.fcha_incio_actvddes)
;

