
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_CARROCERIA" ("CDGO_VHCLO_CRRCRIA", "DSCRPCION_VHCLO_CRROCRIA") AS
  select cdgo_vhclo_crrcria,
       dscrpcion_vhclo_crrocria
  from df_s_vehiculos_carroceria
order by dscrpcion_vhclo_crrocria
;

