
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_VARIACION_TIP" ("CDGO_VHCLO_VRCION_TPO", "DSCRPCION_VHCLO_VRCION_TPO") AS
  select cdgo_vhclo_vrcion_tpo,
       dscrpcion_vhclo_vrcion_tpo
  from df_s_vehiculos_variacion_tip
order by dscrpcion_vhclo_vrcion_tpo
;

