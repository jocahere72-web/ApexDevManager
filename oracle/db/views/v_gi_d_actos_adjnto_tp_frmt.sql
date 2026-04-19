
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_ACTOS_ADJNTO_TP_FRMT" ("ID_ACTO_ADJNTO_TPO_FRMTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_ACTO_ADJNTO_TPO", "DSCRPCION_ADJNTO_TPO", "FRMTO", "TMNO_MXMO", "ACTVO", "USER_DGTA", "FCHA_DGTA", "USER_MDFCA", "FCHA_MDFCA", "EXTNCION") AS
  select a.id_acto_adjnto_tpo_frmto
		, b.id_impsto_sbmpsto
		, c.nmbre_impsto_sbmpsto
		, a.id_acto_adjnto_tpo
		, b.dscrpcion_adjnto_tpo
		, a.frmto
		, a.tmno_mxmo
		, a.actvo
		, a.user_dgta
		, a.fcha_dgta
		, a.user_mdfca
		, a.fcha_mdfca
		, d.extncion
	 from gi_d_actos_adjnto_tp_frmt		a
	 join gi_d_actos_adjunto_tp			b on a.id_acto_adjnto_tpo 	= b.id_acto_adjnto_tpo
	 join df_i_impuestos_subimpuesto	c on b.id_impsto_sbmpsto 	= c.id_impsto_sbmpsto
	 join df_s_formatos_tipo			d on a.frmto				= d.cdgo_frmto_tpo;

