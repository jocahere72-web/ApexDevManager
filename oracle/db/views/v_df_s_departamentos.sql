
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_DEPARTAMENTOS" ("ID_DPRTMNTO", "ID_PAIS", "NMBRE_PAIS", "CDGO_PAIS", "CDGO_DPRTMNTO", "NMBRE_DPRTMNTO") AS
  select a.id_dprtmnto,
		a.id_pais,
		b.nmbre_pais,
		b.cdgo_pais,
		a.cdgo_dprtmnto,
		a.nmbre_dprtmnto
   from df_s_departamentos		a
   join df_s_paises				b on a.id_pais	= b.id_pais;

