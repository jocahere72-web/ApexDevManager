
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_CATEGORIA" ("CDGO_VHCLO_CTGTRIA", "DSCRPCION_VHCLO_CTGTRIA") AS
  select cdgo_vhclo_ctgtria,
       dscrpcion_vhclo_ctgtria
  from df_s_vehiculos_categoria
order by  dscrpcion_vhclo_ctgtria
;

