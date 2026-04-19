
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_MARCA" ("CDGO_VHCLO_MRCA", "DSCRPCION_VHCLO_MRCA") AS
  select cdgo_vhclo_mrca,
       dscrpcion_vhclo_mrca
  from df_s_vehiculos_marca
order by dscrpcion_vhclo_mrca
;

