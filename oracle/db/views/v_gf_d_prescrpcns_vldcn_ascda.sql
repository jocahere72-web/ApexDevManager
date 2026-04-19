
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_D_PRESCRPCNS_VLDCN_ASCDA" ("CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_VLDCION", "DSCRPCION", "NMBRE_UP", "ID_VLDCN_ASCDS", "RSPSTA_PSTVA", "RSPSTA_NGTVA", "ACTVO") AS
  select      a.cdgo_clnte
           ,a.id_impsto
           ,c.nmbre_impsto
           ,a.id_impsto_sbmpsto
           ,d.nmbre_impsto_sbmpsto
           ,b.id_vldcion
           ,b.dscrpcion
           ,b.nmbre_up
           ,a.id_vldcn_ascds
           ,a.rspsta_pstva
           ,a.rspsta_ngtva
           ,a.actvo
from        gf_d_prescrpcns_vldcn_ascda     a
inner join  gf_d_prescripciones_vldcion     b   on  b.id_vldcion        =   a.id_vldcion
inner join  df_c_impuestos                  c   on  c.id_impsto         =   a.id_impsto
inner join  df_i_impuestos_subimpuesto      d   on  d.id_impsto_sbmpsto =   a.id_impsto_sbmpsto;

