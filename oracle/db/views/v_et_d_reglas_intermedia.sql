
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_ET_D_REGLAS_INTERMEDIA" ("ID_RGLA_INTRMDIA", "ID_CRGA", "CRCTER_INCIAL", "CRCTER_FNAL", "DSCRPCION", "CDGO_DTO_TPO", "DSCRPCION_DTO_TPO", "PSCION", "NMBRE_CLMNA", "INDCDOR_VLDA", "ID_OPRDOR_TPO", "DSCRPCION_OPRDOR_TPO", "VLOR1", "VLOR2", "FRMATO") AS
  select i.id_rgla_intrmdia,
			 i.id_crga,
			 i.crcter_incial,
			 i.crcter_fnal,
			 i.dscrpcion,
			 i.cdgo_dto_tpo,
			 a.dscrpcion_dto_tpo,
			 i.pscion,
			 i.nmbre_clmna,
			 i.indcdor_vlda,
			 i.id_oprdor_tpo,
			 b.dscrpcion  dscrpcion_oprdor_tpo,
			 i.vlor1,
			 i.vlor2,
			 i.frmato
		from et_d_reglas_intermedia i
		join et_d_datos_tipo        a on i.cdgo_dto_tpo  = a.cdgo_dto_tpo
   left join df_s_operadores_tipo   b on i.id_oprdor_tpo = b.id_oprdor_tpo;

