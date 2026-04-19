
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_HOMOLOGA" ("ID_VHCLO_HMLGA", "VGNCIA_DSDE", "VGNCIA_HSTA", "CDGO_CLSE_ANTRIOR", "NMBRE_VHCLO_CLSE_ANT", "CDGO_CLSE_NVA", "NMBRE_VHCLO_CLSE_NVA", "ORDEN") AS
  select h.id_vhclo_hmlga,
       h.vgncia_dsde,
	   h.vgncia_hsta,
	   h.cdgo_clse_antrior,
	   (select c.dscrpcion_vhclo_clse from df_s_vehiculos_clase c where h.cdgo_clse_antrior = c.cdgo_vhclo_clse) nmbre_vhclo_clse_ant,
	   h.cdgo_clse_nva,
	   (select c.dscrpcion_vhclo_clse from df_s_vehiculos_clase c where h.cdgo_clse_nva = c.cdgo_vhclo_clse) nmbre_vhclo_clse_nva,
	   h.orden
  from df_s_vehiculos_homologa h
order by h.vgncia_dsde, h.vgncia_hsta, h.cdgo_clse_antrior, h.cdgo_clse_nva, h.orden
;

