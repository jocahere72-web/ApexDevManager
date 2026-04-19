
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_ET_G_REGLAS_GESTION" ("ID_RGLA_GSTION", "ID_CRGA", "TPO_ORGEN", "CLMNA_ORGEN", "VLOR_FJO", "NMBRE_TBLA_DSTNO", "NMBRE_CLMNA_DSTNO", "NMRO_ORDEN") AS
  select id_rgla_gstion,
       id_crga,
	   tpo_orgen,
       clmna_orgen,
	   vlor_fjo,
       nmbre_tbla_dstno,
       nmbre_clmna_dstno,
       nmro_orden
  from ET_G_REGLAS_GESTION;

