
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_IMPUESTOS_ACTO_CONCEPTO" ("ID_IMPSTO_ACTO_CNCPTO", "ID_IMPSTO_ACTO_CNCPTO_RLCNAL", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "VGNCIA", "ID_PRDO", "PRDO", "DSCRPCION_PRDO", "ID_IMPSTO_ACTO", "NMBRE_IMPSTO_ACTO", "TPO_DIAS", "DSCRPCION_TPO_DIAS", "DIAS_MRGN_MRA", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "CDGO_CNCPTO_TPO", "ACTVO", "DSCRPCION_ACTVO", "GNRA_INTRES_MRA", "DSCRPCION_GNRA_INTRES_MRA", "ID_CNCPTO_INTRES_MRA", "CDGO_CNCPTO_INTRES_MRA", "DSCRPCION_CNCPTO_INTRES_MRA", "ID_CNCPTO_INTRES_FNCCION", "ID_CNCPTO_INTRES_VNCDO", "FCHA_VNCMNTO", "INDCDOR_TRFA_CRCTRSTCAS", "DSCRPCION_INDCDOR_TRFA_CRCTRST", "CDGO_IMPSTO_ACTO", "CDGO_PRDCDAD", "UNCO", "ORDEN", "INDCDOR_CNCPTO_OBLGTRIO", "DSCRPCION_INDCDOR_CNCPTO_OBLGTRIO") AS
  select a.id_impsto_acto_cncpto
		, a.id_impsto_acto_cncpto_rlcnal
		, a.cdgo_clnte
		, b.nmbre_clnte
		, g.id_impsto
		, g.cdgo_impsto
		, g.nmbre_impsto
		, h.id_impsto_sbmpsto
		, h.cdgo_impsto_sbmpsto
		, h.nmbre_impsto_sbmpsto
		, a.vgncia
		, a.id_prdo
		, d.prdo
		, d.dscrpcion 												dscrpcion_prdo
		, a.id_impsto_acto
		, e.nmbre_impsto_acto
		, e.tpo_dias
		, decode(e.tpo_dias,'C','Calendario','H', 'Hábiles')		dscrpcion_tpo_dias
		, e.dias_mrgn_mra
		, a.id_cncpto
		, f.cdgo_cncpto
		, f.dscrpcion 												dscrpcion_cncpto
        , f.cdgo_cncpto_tpo
		, a.actvo
		, decode (a.actvo, 'S', 'Sí', 'N','No') 					dscrpcion_actvo
		, a.gnra_intres_mra
		, decode (a.gnra_intres_mra, 'S', 'Sí', 'N','No') 			dscrpcion_gnra_intres_mra
		, a.id_cncpto_intres_mra
		, i.cdgo_cncpto 											cdgo_cncpto_intres_mra
		, i.dscrpcion												dscrpcion_cncpto_intres_mra
		, id_cncpto_intres_fnccion
		, id_cncpto_intres_vncdo
		, a.fcha_vncmnto
		, a.indcdor_trfa_crctrstcas
		, decode (a.indcdor_trfa_crctrstcas, 'S', 'Sí', 'N','No') 	dscrpcion_indcdor_trfa_crctrst
		, e.cdgo_impsto_acto
		, d.cdgo_prdcdad
		, f.unco
		, a.orden
		, a.indcdor_cncpto_oblgtrio
		, decode (a.indcdor_cncpto_oblgtrio, 'S', 'Sí', 'N','No') 	dscrpcion_indcdor_cncpto_oblgtrio
	from df_i_impuestos_acto_concepto 								a
	join df_s_clientes 			      								b	on a.cdgo_clnte 	   		= b.cdgo_clnte
	join df_s_vigencias 		      								c	on a.vgncia			   		= c.vgncia
	join df_i_periodos 			      								d	on a.id_prdo		   		= d.id_prdo
	join df_i_impuestos_acto	      								e	on a.id_impsto_acto	   		= e.id_impsto_acto
	join df_i_conceptos 		      								f	on a.id_cncpto		   		= f.id_cncpto
	join df_c_impuestos               								g on e.id_impsto         		= g.id_impsto
	join df_i_impuestos_subimpuesto   								h on e.id_impsto_sbmpsto 		= h.id_impsto_sbmpsto
	left join df_i_conceptos 		  								i	on a.id_cncpto_intres_mra   = i.id_cncpto;

