
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_SANCIONES" ("ID_SNCION", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "VGNCIA", "ID_PRDO", "DSCRPCION_PRDO", "CDGO_SNCION_TPO", "DSCRPCION_PRDO_CDGO_SNCION_TPO", "PRCNTJE_TRFA", "PRCNTJE_TRFA_EMPL", "PRCNTJE_TRFA_INGRSO_BRTO", "PRCNTJE_TRFA_INGRSO_BRTO_EMPL", "PRCNTJE_MXMO_IMPST_CRG", "PRCNTJE_MXMO_IMPST_CRG_EMPL", "PRCNTJE_MXMO_INGR_BRT", "PRCNTJE_MXMO_INGR_BRT_EMPL", "AUMNT_PRCNTJ_X_DCLRCN_INC_EXTM", "UNDAD_VLOR_SNCION_MNMO", "ID_INDCDOR_ECNMCO", "CDGO_INDCDOR_TPO", "VLOR_SNCION_MNMO") AS
  select
		a.id_sncion,
		a.cdgo_clnte,
		a.id_impsto,
		b.nmbre_impsto,
		a.id_impsto_sbmpsto,
		c.nmbre_impsto_sbmpsto,
		a.vgncia,
		a.id_prdo,
		d.dscrpcion dscrpcion_prdo,
		a.cdgo_sncion_tpo,
		e.dscrpcion dscrpcion_prdo_cdgo_sncion_tpo,
		a.prcntje_trfa,
        a.prcntje_trfa_empl,
        a.prcntje_trfa_ingrso_brto,
        a.prcntje_trfa_ingrso_brto_empl,
		a.prcntje_mxmo_impst_crg,
        a.prcntje_mxmo_impst_crg_empl,
        a.prcntje_mxmo_ingr_brt,
        a.prcntje_mxmo_ingr_brt_empl,
        a.aumnt_prcntj_x_dclrcn_inc_extm,
		a.undad_vlor_sncion_mnmo,
		a.id_indcdor_ecnmco,
		f.cdgo_indcdor_tpo,
		a.vlor_sncion_mnmo


 from gi_d_sanciones  					a
 join df_c_impuestos  					b on b.id_impsto 			= a.id_impsto
 join df_i_impuestos_subimpuesto		c on c.id_impsto_sbmpsto 	= a.id_impsto_sbmpsto
 join df_i_periodos   					d on d.id_prdo				= a.id_prdo
 join gi_d_sanciones_tipo				e on e.cdgo_sncion_tpo 		= a.cdgo_sncion_tpo
left join df_s_indicadores_economico	f on f.id_indcdor_ecnmco	= a.id_indcdor_ecnmco;

