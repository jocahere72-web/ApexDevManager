
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_METODOS_ASIGNACION" ("CDGO_MTDO_ASGNCION", "DSCRPCION", "EXPLCCION_MTDO", "FNCION") AS
  select cdgo_mtdo_asgncion,
       dscrpcion,
	   explccion_mtdo,
	   fncion
  from df_s_metodos_asignacion
order by dscrpcion;

