
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_ESTRATOS" ("CDGO_ESTRTO", "DSCRPCION_ESTRTO") AS
  select cdgo_estrto,
       dscrpcion_estrto
  from df_s_estratos
order by dscrpcion_estrto;

