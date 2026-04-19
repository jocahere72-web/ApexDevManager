
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_COMBUSTIBLE" ("CDGO_VHCLO_CMBSTBLE", "DSCRPCION_VHCULO_CMBSTBLE") AS
  select cdgo_vhclo_cmbstble,
       dscrpcion_vhculo_cmbstble
  from df_s_vehiculos_combustible
order by dscrpcion_vhculo_cmbstble
;

