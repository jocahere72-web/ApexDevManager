
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_AVALUO" ("ID_VHCLO_AVLUO", "MDLO", "VLOR_AVLUO", "MLJE") AS
  select a.id_vhclo_avluo,
	   a.mdlo,
	   a.vlor_avluo,
	   a.mlje
  from df_s_vehiculos_avaluo a
order by grpo
;

