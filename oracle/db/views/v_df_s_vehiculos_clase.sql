
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_CLASE" ("CDGO_VHCLO_CLSE", "DSCRPCION_VHCLO_CLSE") AS
  select cdgo_vhclo_clse,
       dscrpcion_vhclo_clse
  from df_s_vehiculos_clase
order by dscrpcion_vhclo_clse
;

