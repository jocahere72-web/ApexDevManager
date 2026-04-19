
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_ORGANISMOS_TRANSITO" ("ID_ORGNSMO_TRNSTO", "NMBRE_ORGNSMO_TRNSTO", "DRCCION", "ID_PAIS", "NMBRE_PAIS", "ID_DPRTMNTO", "NMBRE_DPRTMNTO", "ID_MNCPIO", "NMBRE_MNCPIO") AS
  select o.id_orgnsmo_trnsto,
       o.nmbre_orgnsmo_trnsto,
	   o.drccion,
	   o.id_pais,
	   m.nmbre_pais,
	   o.id_dprtmnto,
	   m.nmbre_dprtmnto,
	   o.id_mncpio,
	   m.nmbre_mncpio
  from df_s_organismos_transito o, v_df_s_municipios m
 where o.id_mncpio = m.id_mncpio
order by o.nmbre_orgnsmo_trnsto;

