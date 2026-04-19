
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GD_D_TRD" ("ID_TRD", "CDGO_TRD", "CDGO_CLNTE", "ID_AREA", "CDGO_AREA", "NMBRE_AREA", "ID_PRCSO", "CDGO_PRCSO", "NMBRE_PRCSO", "FCHA") AS
  select a.id_trd
     , a.cdgo_trd
     , a.cdgo_clnte
     , a.id_area
     , b.cdgo_area
     , b.nmbre_area
     , c.id_prcso
     , c.cdgo_prcso
     , c.nmbre_prcso
     , a.fcha
  from gd_d_trd a
  join df_c_areas b
    on b.id_area = a.id_area
  join df_c_procesos c
    on c.id_prcso = a.id_prcso;

