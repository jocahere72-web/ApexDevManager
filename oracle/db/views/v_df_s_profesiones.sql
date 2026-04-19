
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_PROFESIONES" ("ID_PRFSION", "NMBRE_PRFSION") AS
  select id_prfsion,
       nmbre_prfsion
  from df_s_profesiones
order by nmbre_prfsion;

