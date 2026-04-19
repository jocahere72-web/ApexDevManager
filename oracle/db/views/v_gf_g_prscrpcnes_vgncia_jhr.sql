
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_PRSCRPCNES_VGNCIA_JHR" ("ID_PRSCRPCION_VGNCIA", "ID_PRSCRPCION_SJTO_IMPSTO", "ID_PRSCRPCION", "ID_SLCTUD", "ID_INSTNCIA_FLJO", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "ID_SJTO", "IDNTFCCION", "VGNCIA", "ID_PRDO", "PRDO", "DSCRPCION_PRDO", "INDCDOR_APRBDO", "APLCDO", "CDGO_RSPSTA", "DSCRPCION_RSPSTA") AS
  select      a.id_prscrpcion_vgncia,
                b.id_prscrpcion_sjto_impsto,
                c.id_prscrpcion,
                c.id_slctud,
                c.id_instncia_fljo,
                c.cdgo_clnte,
                d.id_impsto,
                d.nmbre_impsto,
                e.id_impsto_sbmpsto,
                e.nmbre_impsto_sbmpsto,
                (select f.id_sjto_impsto from  si_i_sujetos_impuesto f
                 where  f.id_sjto_impsto=   b.id_sjto_impsto) id_sjto_impsto,
                (select g.id_sjto  from si_c_sujetos g , si_i_sujetos_impuesto f
                 where  f.id_sjto_impsto=   b.id_sjto_impsto and
                  g.id_sjto =   f.id_sjto) id_sjto,
                (select g.idntfccion from si_c_sujetos g , si_i_sujetos_impuesto f
                 where  f.id_sjto_impsto=   b.id_sjto_impsto and
                  g.id_sjto =   f.id_sjto) idntfccion,
                a.vgncia,
                h.id_prdo,
                h.prdo,
                h.dscrpcion dscrpcion_prdo,
                a.indcdor_aprbdo,
                a.aplcdo,
                c.cdgo_rspsta,
                i.dscrpcion dscrpcion_rspsta
    from        gf_g_prscrpcnes_vgncia      a
    inner join  gf_g_prscrpcnes_sjto_impsto b   on  a.cdgo_clnte                =   b.cdgo_clnte
                                               and  a.id_prscrpcion_sjto_impsto =   b.id_prscrpcion_sjto_impsto
    inner join  gf_g_prescripciones         c   on  c.id_prscrpcion             =   b.id_prscrpcion
    inner join  df_c_impuestos              d   on  d.id_impsto                 =   b.id_impsto
    inner join  df_i_impuestos_subimpuesto  e   on  e.id_impsto_sbmpsto         =   b.id_impsto_sbmpsto


    inner join  df_i_periodos               h   on  h.id_prdo                   =   a.id_prdo
    left  join  gf_d_prscrpcnes_rspsta      i   on  i.cdgo_rspsta               =   c.cdgo_rspsta
;

