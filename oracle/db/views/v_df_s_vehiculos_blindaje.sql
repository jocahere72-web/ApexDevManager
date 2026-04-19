
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_BLINDAJE" ("CDGO_VHCLO_BLNDJE", "DSCRPCION_VHCLO_BLNDJE") AS
  select cdgo_vhclo_blndje,
       dscrpcion_vhclo_blndje
  from df_s_vehiculos_blindaje
order by dscrpcion_vhclo_blndje
;

