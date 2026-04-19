
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_PRSCRPCNS_DCMNTO" ("ID_DCMNTO", "ID_PRSCRPCION", "ID_INSTNCIA_FLJO", "NMRO_PRSCRPCION", "CDGO_RSPSTA", "ID_USRIO_RSPSTA", "FCHA_RSPSTA", "ID_USRIO_AUTRZA_RSPSTA", "FCHA_AUTRZA_RSPSTA", "CDGO_CSAL_ANLCION", "ID_INSTNCIA_FLJO_PDRE", "ID_SLCTUD", "ID_PRSCRPCION_SJTO_IMPSTO", "CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "ID_FLJO_TREA", "ID_ACTO_TPO", "ID_PLNTLLA", "ID_RPRTE", "ID_USRIO_PRYCTO", "ID_USRIO_ATRZO", "ID_ACTO", "ID_ACTO_RQRDO") AS
  select      a.id_dcmnto,
            b.id_prscrpcion,
            b.id_instncia_fljo,
            b.nmro_prscrpcion,
            b.cdgo_rspsta,
            b.id_usrio_rspsta,
            b.fcha_rspsta,
            b.id_usrio_autrza_rspsta,
            b.fcha_autrza_rspsta,
            b.cdgo_csal_anlcion,
            b.id_instncia_fljo_pdre,
            b.id_slctud,
            c.id_prscrpcion_sjto_impsto,
            b.cdgo_clnte,
            c.id_impsto,
            c.id_impsto_sbmpsto,
            c.id_sjto_impsto,
            d.id_fljo_trea,
            e.id_acto_tpo,
            f.id_plntlla,
            g.id_rprte,
            a.id_usrio_prycto,
            a.id_usrio_atrzo,
            j.id_acto,
            a.id_acto_rqrdo
from        gf_g_prscrpcns_dcmnto a
inner join  gf_g_prescripciones         b   on  b.id_prscrpcion             =   a.id_prscrpcion
left  join  gf_g_prscrpcnes_sjto_impsto c   on  c.id_prscrpcion_sjto_impsto =   a.id_prscrpcion_sjto_impsto
inner join  wf_d_flujos_tarea           d   on  d.id_fljo_trea              =   a.id_fljo_trea
inner join  gn_d_actos_tipo             e   on  e.id_acto_tpo               =   a.id_acto_tpo
inner join  gn_d_plantillas             f   on  f.id_plntlla                =   a.id_plntlla
inner join  gn_d_reportes               g   on  g.id_rprte                  =   a.id_rprte
inner join  sg_g_usuarios               h   on  h.id_usrio                  =   a.id_usrio_prycto
left  join  sg_g_usuarios               i   on  i.id_usrio                  =   a.id_usrio_atrzo
left  join  gn_g_actos                  j   on  j.id_acto                   =   a.id_acto
left  join  gn_g_actos                  k   on  k.id_acto                   =   a.id_acto_rqrdo
inner join  df_s_clientes               l   on  l.cdgo_clnte                =   a.cdgo_clnte;

