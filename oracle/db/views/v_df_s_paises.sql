
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_PAISES" ("ID_PAIS", "CDGO_PAIS", "NMBRE_PAIS") AS
  select id_pais,
		cdgo_pais,
		nmbre_pais
  from df_s_paises;

