
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_ENTIDADES" ("ID_ENTDAD", "CDGO_ENTDAD_TPO", "DSCRPCION_ENTDAD_TPO", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "IDNTFCCION", "NMBRE_RZON_SCIAL", "DRCCION", "ID_PAIS", "NMBRE_PAIS", "ID_DPRTMNTO", "NMBRE_DPRTMNTO", "ID_MNCPIO", "NMBRE_MNCPIO", "EMAIL", "TLFNO", "CLLAR", "INDCDOR_MNJA_CNTRO_ESE", "DSCRPCION_INDCDOR_MNJA_CNTRO_ESE") AS
  select a.id_entdad
		, a.cdgo_entdad_tpo
		, b.dscrpcion												dscrpcion_entdad_tpo
		, a.cdgo_idntfccion_tpo
		, c.dscrpcion_idntfccion_tpo
		, a.idntfccion
		, a.nmbre_rzon_scial
		, a.drccion
		, a.id_pais
		, d.nmbre_pais
		, a.id_dprtmnto
		, d.nmbre_dprtmnto
		, a.id_mncpio
		, d.nmbre_mncpio
		, a.email
		, a.tlfno
		, a.cllar
		, indcdor_mnja_cntro_ese
		, decode(a.indcdor_mnja_cntro_ese, 'S','Si', 'N', 'No')		dscrpcion_indcdor_mnja_cntro_ese
	 from df_s_entidades				a
	 join df_s_entidades_tipo			b on a.cdgo_entdad_tpo		= b.cdgo_entdad_tpo
	 join df_s_identificaciones_tipo	c on a.cdgo_idntfccion_tpo	= c.cdgo_idntfccion_tpo
	 join v_df_s_municipios				d on a.id_mncpio			= d.id_mncpio;

