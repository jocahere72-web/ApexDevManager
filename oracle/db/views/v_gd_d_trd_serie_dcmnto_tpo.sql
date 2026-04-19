
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GD_D_TRD_SERIE_DCMNTO_TPO" ("ID_TRD_SRIE_DCMNTO_TPO", "ID_TRD_SRIE", "CDGO_TRD", "ID_TRD", "ID_AREA", "CDGO_AREA", "NMBRE_AREA", "ID_PRCSO", "CDGO_PRCSO", "NMBRE_PRCSO", "ID_SRIE", "CDGO_SRIE", "NMBRE_SRIE", "ID_SBSRIE", "CDGO_SBSRIE", "NMBRE_SBSRIE", "ID_DCMNTO_TPO", "CDGO_DCMNTO_TPO", "NMBRE", "CDGO_CLNTE") AS
  select a.id_trd_srie_dcmnto_tpo
     , a.id_trd_srie
     , d.cdgo_trd
     , d.id_trd
     , d.id_area
     , d.cdgo_area
     , d.nmbre_area
     , d.id_prcso
     , d.cdgo_prcso
     , d.nmbre_prcso
     , c.id_srie
     , c.cdgo_srie
     , c.nmbre_srie
     , c.id_sbsrie
     , c.cdgo_sbsrie
     , c.nmbre_sbsrie
     , a.id_dcmnto_tpo
     , b.cdgo_dcmnto_tpo
     , b.nmbre
     , b.cdgo_clnte
  from gd_d_trd_serie_dcmnto_tpo a
  join gd_d_documentos_tipo b
    on b.id_dcmnto_tpo = a.id_dcmnto_tpo
  join v_gd_d_trd_serie c
    on c.id_trd_srie = a.id_trd_srie
  join v_gd_d_trd d
    on d.id_trd = c.id_trd;

