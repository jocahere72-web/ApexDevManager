
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_INDICADORES_ECONOMICO" ("ID_INDCDOR_ECNMCO", "CDGO_INDCDOR_TPO", "NMBRE_INDCDOR_TPO", "FCHA_DSDE", "FCHA_HSTA", "VLOR") AS
  select a.id_indcdor_ecnmco,
       a.cdgo_indcdor_tpo,
       b.nmbre_indcdor_tpo,
       a.fcha_dsde,
	   a.fcha_hsta,
	   a.vlor
  from df_s_indicadores_economico a
  join df_s_indicadores_tipo b
    on a.cdgo_indcdor_tpo = b.cdgo_indcdor_tpo
order by cdgo_indcdor_tpo;

