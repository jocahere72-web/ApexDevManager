
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_VEHICULOS_AVALUO_VARIA" ("ID_VHCLO_AVLUO_VRIA", "CDGO_CLNTE", "VGNCIA", "CDGO_VHCLO_VRCION_TPO", "DSCRPCION_VHCLO_VRCION_TPO", "VLOR", "TPO_OPRCION", "TPO_VLOR", "ORDEN") AS
  select a.id_vhclo_avluo_vria
       , a.cdgo_clnte
       , a.vgncia
       , a.cdgo_vhclo_vrcion_tpo
       , b.dscrpcion_vhclo_vrcion_tpo
       , a.vlor
       , a.tpo_oprcion
       , a.tpo_vlor
       , a.orden
from df_c_vehiculos_avaluo_varia  a
join df_s_vehiculos_vrcion_tpo    b on a.cdgo_vhclo_vrcion_tpo = b.cdgo_vhclo_vrcion_tpo
;

