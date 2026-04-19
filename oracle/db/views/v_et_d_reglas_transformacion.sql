
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_ET_D_REGLAS_TRANSFORMACION" ("ID_RGLA_TRNSFRMCION", "ID_CRGA", "NMBRE_CRGA", "CLMNA_ORGEN", "ID_OPRDOR_TPO", "DSCRPCION_OPRDOR_TPO", "VLOR_INCIAL", "VLOR_TRNSFRMDO") AS
  select a.id_rgla_trnsfrmcion,
	   a.id_crga,
	   b.nmbre_crga,
	   a.clmna_orgen,
	   a.id_oprdor_tpo,
	  (select m.dscrpcion from df_s_operadores_tipo m where m.id_oprdor_tpo = a.id_oprdor_tpo) dscrpcion_oprdor_tpo,
	   a.vlor_incial,
	   a.vlor_trnsfrmdo
  from et_d_reglas_transformacion a, et_g_carga b
 where a.id_crga = b.id_crga;

