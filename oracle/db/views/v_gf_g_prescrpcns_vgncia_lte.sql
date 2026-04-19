
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_PRESCRPCNS_VGNCIA_LTE" ("ID_PRSCRPCION_LTE", "CDGO_CLNTE", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_PRSCRPCION_SJTO_IMPST_LT", "ID_SJTO_IMPSTO", "IDNTFCCION", "PRCSDO", "ID_PRSCRPCION_VGNCIA_LTE", "VGNCIA", "ID_PRDO", "PRDO", "DSCRPCION_PRDO", "ID_PRSCRPCION") AS
  select      c.id_prscrpcion_lte
           ,c.cdgo_clnte
		   ,f.id_impsto
           ,f.cdgo_impsto
           ,f.nmbre_impsto
           ,g.id_impsto_sbmpsto
           ,g.cdgo_impsto_sbmpsto
           ,g.nmbre_impsto_sbmpsto
           ,b.id_prscrpcion_sjto_impst_lt
		   ,b.id_sjto_impsto
           ,i.idntfccion
           ,c.prcsdo
		   ,a.id_prscrpcion_vgncia_lte
           ,a.vgncia
           ,a.id_prdo
           ,e.prdo
           ,e.dscrpcion dscrpcion_prdo
           ,c.id_prscrpcion
from        gf_g_prescrpcns_vgncia_lte      a
inner join  gf_g_prscrpcns_sjt_impst_lt     b   on  b.id_prscrpcion_sjto_impst_lt  =   a.id_prscrpcion_sjto_impst_lt
inner join  gf_g_prescripciones_lte         c   on  c.id_prscrpcion_lte            =   b.id_prscrpcion_lte
inner join  df_s_vigencias                  d   on  d.vgncia                       =   a.vgncia
inner join  df_i_periodos                   e   on  e.id_prdo                      =   a.id_prdo
inner join  df_c_impuestos                  f   on  f.id_impsto                    =   b.id_impsto
inner join  df_i_impuestos_subimpuesto      g   on  g.id_impsto_sbmpsto            =   b.id_impsto_sbmpsto
inner join  si_i_sujetos_impuesto           h   on  h.id_sjto_impsto               =   b.id_sjto_impsto
inner join  si_c_sujetos                    i   on  i.id_sjto                      =   h.id_sjto;

