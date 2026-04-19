
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_OPERACION" ("CDGO_VHCLO_OPRCION", "DSCRPCION_VHCLO_OPRCION") AS
  select cdgo_vhclo_oprcion,
       dscrpcion_vhclo_oprcion
  from df_s_vehiculos_operacion
order by dscrpcion_vhclo_oprcion
;

