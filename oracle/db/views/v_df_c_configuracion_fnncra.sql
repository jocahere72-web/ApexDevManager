
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_CONFIGURACION_FNNCRA" ("ID_CNFGRCION_FNNCRA", "CDGO_CLNTE", "CDGO_RDNDEO_EXPRSION_GNRAL", "DES_CDGO_RDNDEO_EXPRSION_GNRAL", "CDGO_RDNDEO_EXPRSION_INT_PRDO", "D_CDGO_RDNDEO_EXPRSION_INT_PRD", "CDGO_RDNDEO_EXPRSION_INT_TTAL", "D_CDGO_RDNDEO_EXPRSION_INT_TTL", "CDGO_TPO_DIAS_ANIO", "DESCRPCION_CDGO_TPO_DIAS_ANIO", "NMRO_DIAS_ANIO", "CDGO_TSA_DRIA_FRMLA", "DSCRPCION_CDGO_INTRES_MRA_FRML", "FCHA_DSDE", "FCHA_HSTA") AS
  select a.id_cnfgrcion_fnncra
		, a.cdgo_clnte
		, a.cdgo_rdndeo_exprsion_gnral
		, b.dscrpcion								des_cdgo_rdndeo_exprsion_gnral
		, a.cdgo_rdndeo_exprsion_int_prdo
		, c.dscrpcion								d_cdgo_rdndeo_exprsion_int_prd
		, a.cdgo_rdndeo_exprsion_int_ttal
		, d.dscrpcion								d_cdgo_rdndeo_exprsion_int_ttl
		, a.cdgo_tpo_dias_anio
		, decode (cdgo_tpo_dias_anio, 'FJO', 'Fijo', 'DNM', 'Dínamico') descrpcion_cdgo_tpo_dias_anio
		, case when cdgo_tpo_dias_anio = 'FJO' then
			to_char(a.nmro_dias_anio)
		   else 'Dínamico'
		  end as nmro_dias_anio
		, a.cdgo_tsa_dria_frmla
		, e.dscrpcion								dscrpcion_cdgo_intres_mra_frml
		, a.fcha_dsde
		, a.fcha_hsta
	 from df_c_configuracion_fnncra			a
	 join df_s_redondeos_expresion			b on a.cdgo_rdndeo_exprsion_gnral			= b.cdgo_rdndeo_exprsion
	 join df_s_redondeos_expresion			c on a.cdgo_rdndeo_exprsion_int_prdo		= c.cdgo_rdndeo_exprsion
	 join df_s_redondeos_expresion			d on a.cdgo_rdndeo_exprsion_int_ttal		= d.cdgo_rdndeo_exprsion
	 join df_s_tasa_diaria_formula			e on a.cdgo_tsa_dria_frmla					= e.cdgo_tsa_dria_frmla;

