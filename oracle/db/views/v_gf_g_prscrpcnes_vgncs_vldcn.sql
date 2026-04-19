
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_PRSCRPCNES_VGNCS_VLDCN" ("ID_VGNC_VLDCN", "ID_PRSCRPCION_VGNCIA", "ID_PRSCRPCION_SJTO_IMPSTO", "CDGO_CLNTE", "VGNCIA", "ID_PRDO", "INDCDOR_APRBDO", "APLCDO", "ID_RGLA_NGCIO_CLNTE_FNCION", "ID_FNCION", "INDCDR_CMPLIO", "RSPSTA_PRMTRCA", "FCHA_RSPSTA_PRMTRCA", "ID_USRIO_RSPSTA_PRMTRCA", "INDCDR_CMPLIO_OPCNL", "RSPSTA_OPCNL", "FCHA_RSPSTA_OPCNL", "ID_USRIO_RSPSTA_OPCNL") AS
  select      a.id_vgnc_vldcn,
            b.id_prscrpcion_vgncia,
            b.id_prscrpcion_sjto_impsto,
            c.cdgo_clnte,
            b.vgncia,
            b.id_prdo,
            b.indcdor_aprbdo,
            b.aplcdo,
            a.id_rgla_ngcio_clnte_fncion,
            d.id_fncion,
            a.indcdr_cmplio,
            a.rspsta_prmtrca,
            a.fcha_rspsta_prmtrca,
            a.id_usrio_rspsta_prmtrca,
            a.indcdr_cmplio_opcnl,
            a.rspsta_opcnl,
            a.fcha_rspsta_opcnl,
            a.id_usrio_rspsta_opcnl
from        gf_g_prscrpcnes_vgncs_vldcn a
inner join  gf_g_prscrpcnes_vgncia b   on  b.id_prscrpcion_vgncia          =   a.id_prscrpcion_vgncia
inner join  df_s_clientes               c   on  c.cdgo_clnte                    =   a.cdgo_clnte
inner join  gn_d_rglas_ngcio_clnte_fnc  d   on  d.id_rgla_ngcio_clnte_fncion    =   a.id_rgla_ngcio_clnte_fncion
inner join  sg_g_usuarios               e   on  e.id_usrio                      =   a.id_usrio_rspsta_prmtrca
left  join  sg_g_usuarios               f   on  f.id_usrio                      =   a.id_usrio_rspsta_opcnl;

