
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_OBRAS" ("ID_OBRA", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_PRDO", "VGNCIA", "DSCRPCION", "DSCRPCION_OBRA", "VLOR_TTAL", "FCHA_RGSTRO", "ID_MTDO_DSTRBCION", "NMBRE_MTDO_DSTRBCION", "DSCRPCION_MTDO_DSTRBCION", "UNDAD_PRGRMA") AS
  select a.id_obra
     , a.cdgo_clnte
     , b.nmbre_clnte
     , a.id_impsto
     , c.nmbre_impsto
     , a.id_impsto_sbmpsto
     , d.nmbre_impsto_sbmpsto
     , a.id_prdo
     , e.vgncia
     , e.dscrpcion
     , a.dscrpcion as dscrpcion_obra
     , a.vlor_ttal
     , a.fcha_rgstro
     , a.id_mtdo_dstrbcion
     , f.nmbre as nmbre_mtdo_dstrbcion
     , f.dscrpcion as dscrpcion_mtdo_dstrbcion
     , f.undad_prgrma
  from gi_g_obras a
  join df_s_clientes b
    on a.cdgo_clnte = b.cdgo_clnte
  join df_c_impuestos c
    on a.id_impsto  = c.id_impsto
  join df_i_impuestos_subimpuesto d
    on a.id_impsto_sbmpsto = d.id_impsto_sbmpsto
  join df_i_periodos e
    on a.id_prdo    = e.id_prdo
  join df_s_metodos_distribucion f
    on a.id_mtdo_dstrbcion = f.id_mtdo_dstrbcion;

