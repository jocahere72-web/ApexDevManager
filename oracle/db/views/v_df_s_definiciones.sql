
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_DEFINICIONES" ("CDGO_DFNCION", "DSCRPCION", "FMTO", "VLOR") AS
  select cdgo_dfncion,
       dscrpcion,
	   fmto,
	   vlor
  from df_s_definiciones
order by dscrpcion;

