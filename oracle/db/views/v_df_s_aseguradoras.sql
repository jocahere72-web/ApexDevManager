
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_ASEGURADORAS" ("ID_ASGRDRA", "IDNTFCCION", "NMBRE_ASGRDRA") AS
  select id_asgrdra,
       idntfccion,
	   nmbre_asgrdra
  from df_s_aseguradoras
order by nmbre_asgrdra;

