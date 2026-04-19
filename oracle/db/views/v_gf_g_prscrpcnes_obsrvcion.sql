
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_PRSCRPCNES_OBSRVCION" ("ID_OBSRVCION", "ID_PRSCRPCION", "ID_INSTNCIA_FLJO", "ASNTO_OBSRVCION", "OBSRVCION", "ID_FLJO_TREA", "ID_TREA", "ID_USRIO", "FCHA_OBSRVCION", "FCHA_ULTMA_ACTLZCION", "INDCDOR_CNFRMDO", "CDGO_CLNTE") AS
  select      a.id_obsrvcion,
            a.id_prscrpcion,
            b.id_instncia_fljo,
            a.asnto_obsrvcion,
            a.obsrvcion,
            a.id_fljo_trea,
            c.id_trea,
            a.id_usrio,
            a.fcha_obsrvcion,
            a.fcha_ultma_actlzcion,
            a.indcdor_cnfrmdo,
            a.cdgo_clnte
from        gf_g_prscrpcnes_obsrvcion  a
inner join  gf_g_prescripciones             b   on  b.id_prscrpcion =   a.id_prscrpcion
inner join  wf_d_flujos_tarea               c   on  c.id_fljo_trea  =   a.id_fljo_trea
inner join  sg_g_usuarios                   d   on  d.id_usrio      =   a.id_usrio;

