
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_RENTAS_ACTO" ("DIAS_MRA", "DIAS_MRGN_MRA", "ID_RNTA_ACTO", "TPO_DIAS", "ID_RNTA", "CDGO_IMPSTO_ACTO", "DSCRPCION_TPO_DIAS", "ID_IMPSTO", "ID_IMPSTO_ACTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO", "NMBRE_IMPSTO_ACTO", "NMBRE_IMPSTO_SBMPSTO", "DSCRPCION_RQRE_ASCSDA") AS
  select a.dias_mra
		, a.dias_mrgn_mra
		, a.id_rnta_acto
		, a.tpo_dias
		, a.id_rnta
		, b.cdgo_impsto_acto
		, b.dscrpcion_tpo_dias
		, b.id_impsto
		, b.id_impsto_acto
		, b.id_impsto_sbmpsto
		, b.nmbre_impsto
		, b.nmbre_impsto_acto
		, b.nmbre_impsto_sbmpsto
		, b.dscrpcion_rqre_ascsda
	 from gi_g_rentas_acto a
	 join v_df_i_impuestos_acto b on a.id_impsto_acto = b.id_impsto_acto;

