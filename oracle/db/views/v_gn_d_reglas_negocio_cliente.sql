
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_D_REGLAS_NEGOCIO_CLIENTE" ("ID_RGLA_NGCIO_CLNTE", "CDGO_CLNTE", "ID_PRCSO", "NMBRE_PRCSO", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_RGLA_NGCIO", "NMBRE_RGLA", "INDCDOR_EDTA_RGLA", "DSCRP_RGLA_NGCIO_CLNTE", "FCHA_INCIO", "FCHA_FIN") AS
  select  a.id_rgla_ngcio_clnte,
     a.cdgo_clnte,
   r.id_prcso,
   p.nmbre nmbre_prcso,
     a.id_impsto,
     i.nmbre_impsto,
     a.id_impsto_sbmpsto,
     i.nmbre_impsto_sbmpsto,
     a.id_rgla_ngcio,
     r.nmbre nmbre_rgla,
     decode (a.indcdor_edta_rgla,'S','SI','NO') as indcdor_edta_rgla,
     a.dscrpcion dscrp_rgla_ngcio_clnte,
     a.fcha_incio,
     a.fcha_fin
  from gn_d_reglas_negocio_cliente    a
  left join v_df_i_impuestos_subimpuesto   i  on i.id_impsto_sbmpsto = a.id_impsto_sbmpsto
  join gn_d_reglas_negocio            r  on r.id_rgla_ngcio   = a.id_rgla_ngcio
  join df_s_procesos          p  on r.id_prcso       = p.id_prcso;

