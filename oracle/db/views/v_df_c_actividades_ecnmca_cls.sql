
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_ACTIVIDADES_ECNMCA_CLS" ("ID_ACTVDAD_ECNMCA_CLS", "CDGO_CLNTE", "CDGO_ACTVDAD_ECNMCA_CLS", "DSCRPCION", "TRFA", "FCHA_DSDE", "FCHA_HSTA", "DSCRPCION_INDCDOR_ECNMCO") AS
  select
  a.id_actvdad_ecnmca_cls,
  a.cdgo_clnte,
  a.cdgo_actvdad_ecnmca_cls,
  a.dscrpcion,
  a.trfa,
  a.fcha_dsde,
  a.fcha_hsta,
  (select it.nmbre_indcdor_tpo
     from df_s_indicadores_tipo it
    where it.cdgo_indcdor_tpo = (select i.cdgo_indcdor_tpo
                                   from df_s_indicadores_economico i
                                  where i.id_indcdor_ecnmco = a.id_indcdor_ecnmco)) dscrpcion_indcdor_ecnmco
from df_c_actividades_ecnmca_cls a;

