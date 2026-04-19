
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_SERVICIO" ("CDGO_VHCLO_SRVCIO", "DSCRPCION_VHCLO_SRVCIO") AS
  select cdgo_vhclo_srvcio,
       dscrpcion_vhclo_srvcio
  from df_s_vehiculos_servicio
order by dscrpcion_vhclo_srvcio
;

