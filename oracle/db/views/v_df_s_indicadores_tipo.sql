
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_INDICADORES_TIPO" ("CDGO_INDCDOR_TPO", "NMBRE_INDCDOR_TPO") AS
  select cdgo_indcdor_tpo,
       nmbre_indcdor_tpo
  from df_s_indicadores_tipo
order by nmbre_indcdor_tpo;

