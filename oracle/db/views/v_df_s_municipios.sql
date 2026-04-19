
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_MUNICIPIOS" ("ID_MNCPIO", "ID_PAIS", "CDGO_PAIS", "NMBRE_PAIS", "ID_DPRTMNTO", "CDGO_DPRTMNTO", "NMBRE_DPRTMNTO", "CDGO_MNCPIO", "NMBRE_MNCPIO") AS
  select a.id_mncpio,
		b.id_pais,
		b.cdgo_pais,
		b.nmbre_pais,
		b.id_dprtmnto,
		b.cdgo_dprtmnto,
		b.nmbre_dprtmnto,
		a.cdgo_mncpio,
		a.nmbre_mncpio
   from df_s_municipios			a
   join v_df_s_departamentos	b on a.id_dprtmnto = b.id_dprtmnto;

