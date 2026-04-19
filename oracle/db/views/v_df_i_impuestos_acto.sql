
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_IMPUESTOS_ACTO" ("CDGO_CLNTE", "ID_IMPSTO_ACTO", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "CDGO_IMPSTO_ACTO", "NMBRE_IMPSTO_ACTO", "DSCRPCION_ACTVO", "DSCRPCION_TPO_DIAS", "DIAS_MRGN_MRA", "TXTO_BSE_GRVBLE", "DSCRPCION_LQDCION_PBLCO", "DSCRPCION_RQRE_ASCSDA", "ACTVO") AS
  select b.cdgo_clnte,
		a.id_impsto_acto,
		a.id_impsto,
		b.cdgo_impsto,
		b.nmbre_impsto,
		a.id_impsto_sbmpsto,
		c.cdgo_impsto_sbmpsto,
		c.nmbre_impsto_sbmpsto,
		a.cdgo_impsto_acto,
		a.nmbre_impsto_acto,
		decode(a.actvo,'S','Sí','N', 'No')					dscrpcion_actvo,
		decode(a.tpo_dias,'C','Calendario','H', 'Hábiles')	dscrpcion_tpo_dias,
		a.dias_mrgn_mra,
		a.txto_bse_grvble,
		decode(a.indcdor_lqdcion_pblco,'S','Sí','N', 'No')	dscrpcion_lqdcion_pblco,
		decode(a.indcdor_rqre_ascsda,'S','Sí','N', 'No')	dscrpcion_rqre_ascsda,
		a.actvo
  from df_i_impuestos_acto			a
  join df_c_impuestos				b on a.id_impsto = b.id_impsto
  join df_i_impuestos_subimpuesto	c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto;

