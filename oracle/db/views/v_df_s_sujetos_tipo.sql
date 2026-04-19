
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_SUJETOS_TIPO" ("CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO") AS
  select cdgo_sjto_tpo,
       dscrpcion_sjto_tpo
  from df_s_sujetos_tipo
order by dscrpcion_sjto_tpo;

