
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_ET_D_CNFGRCION_CRGUE_IMPSTO" ("ID_CNFGRCION_CRGUE_IMPSTO", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_IMPSTO_ACTO", "CDGO_IMPSTO_ACTO", "NMBRE_IMPSTO_ACTO", "INDCDOR_LQDAR", "INDCDOR_GNRA_DCMNTO", "INDCDOR_RGSTRA_RCDO", "MDIO_CRGUE", "ID_CRGA", "NMBRE_CRGA", "DSCRPCION_CRGA", "ACTVO", "FCHA_RGSTRO", "USER_DGTA", "FCHA_DGTA", "USER_MDFCA", "FCHA_MDFCA", "CDGO_INDCDOR_TPO", "ID_APP_NVDDES_PRSNA", "ID_APP_PAGE_NVD_PRS") AS
  select    a.id_cnfgrcion_crgue_impsto
			, a.id_impsto
			, b.cdgo_impsto
			, b.nmbre_impsto
			, a.id_impsto_sbmpsto
			, c.cdgo_impsto_sbmpsto
			, c.nmbre_impsto_sbmpsto
			, a.id_impsto_acto
			, d.cdgo_impsto_acto
			, d.nmbre_impsto_acto
			, a.indcdor_lqdar
			, a.indcdor_gnra_dcmnto
			, a.indcdor_rgstra_rcdo
			, a.mdio_crgue
			, a.id_crga
			, e.nmbre_crga
			, e.dscrpcion_crga
			, a.actvo
			, a.fcha_rgstro
			, a.user_dgta
			, a.fcha_dgta
			, a.user_mdfca
			, a.fcha_mdfca
			, a.cdgo_indcdor_tpo
			, a.id_app_nvddes_prsna
			, a.id_app_page_nvd_prs
	from et_d_cnfgrcion_crgue_impsto a  join df_c_impuestos 			b on b.id_impsto = a.id_impsto
										join df_i_impuestos_subimpuesto	c on c.id_impsto_sbmpsto = a.id_impsto_sbmpsto
								   left join df_i_impuestos_acto		d on d.id_impsto_acto = a.id_impsto_acto
								   left join et_g_carga					e on e.id_crga = a.id_crga
;

