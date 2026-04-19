
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_RENTAS_ACTO_CONCEPTO" ("ID_RNTA_ACTO_CNCPTO", "ID_RNTA", "ID_RNTA_ACTO", "ID_PRDO", "PRDO", "DSCRPCION_PRDO", "CDGO_PRDCDAD", "VGNCIA", "ID_IMPSTO_ACTO", "CDGO_IMPSTO_ACTO", "NMBRE_IMPSTO_ACTO", "GNRA_INTRES_MRA", "FCHA_VNCMNTO", "ID_IMPSTO_ACTO_CNCPTO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "BSE_CNCPTO", "VLOR_BSE_GRVBLE", "TRFA", "TXTO_TRFA", "VLOR_TRFA", "BSE_INCIAL", "BSE_FNAL", "VLOR_LQDDO", "VLOR_INTRES", "UNCO", "ACMLDO", "ID_DCMNTO", "INDCDOR_MGRDO", "PRCNTJE_BSE_LQDCION", "FCTOR") AS
  select a.id_rnta_acto_cncpto
		, c.id_rnta
		, a.id_rnta_acto
		, b.id_prdo
		, b.prdo
		, b.dscrpcion_prdo
		, b.cdgo_prdcdad
		, b.vgncia
		, b.id_impsto_acto
		, b.cdgo_impsto_acto
		, b.nmbre_impsto_acto
		, decode(b.gnra_intres_mra,'S','Sí','N','No')gnra_intres_mra
		, a.fcha_vncmnto
		, a.id_impsto_acto_cncpto
		, b.id_cncpto
		, b.cdgo_cncpto
		, b.dscrpcion_cncpto
		, a.bse_cncpto
		, d.vlor_bse_grvble
		, a.trfa
		, a.txto_trfa
		, a.vlor_trfa
   		, a.bse_incial
		, a.bse_fnal
		, a.vlor_lqddo
		, a.vlor_intres
		, b.unco
		, decode(b.unco, 'S', 0, rownum)acmldo
		, d.id_dcmnto
        , a.indcdor_mgrdo
		, a.prcntje_bse_lqdcion
        , a.fctor
	 from gi_g_rentas_acto_concepto 		a
	 join v_df_i_impuestos_acto_concepto	b on a.id_impsto_acto_cncpto	= b.id_impsto_acto_cncpto
	 join gi_g_rentas_acto 					c on a.id_rnta_acto 			= c.id_rnta_acto
	 join gi_g_rentas 						d on c.id_rnta 					= d.id_rnta
;

