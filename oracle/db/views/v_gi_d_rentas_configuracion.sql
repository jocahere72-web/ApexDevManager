
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_RENTAS_CONFIGURACION" ("ID_RNTA_CNFGRCION", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "INDCDOR_USA_MXTO", "DSCRPCION_INDCDOR_USA_MXTO", "PRCNTJE_LQDCION_PRVDO", "PRCNTJE_LQDCION_PBLCO", "INDCDOR_USA_EXTRNJRO", "DSCRPCION_INDCDOR_USA_EXTRNJRO", "TPO_DIAS", "DSCRPCION_TPO_DIAS", "DIAS_MRGN_MRA", "LBEL_FCHA_EXPDCION", "ID_FLJO", "DSCRPCION_FLJO", "NMRO_DCMNTOS", "INTRVLO_DIAS", "INDCDOR_MNJA_CNTRTO_GSLNA", "DSC_INDCDOR_MNJA_CNTRTO_GSLNA", "INDCDOR_MNJA_CNTRTO_ESE", "DSC_INDCDOR_MNJA_CNTRTO_ESE", "USER_DGTA", "FCHA_DGTA", "USER_MDFCA", "FCHA_MDFCA", "USER_ULTMA_ACTLZCION", "FCHA_ULTMA_ACTLZCION") AS
  select a.id_rnta_cnfgrcion
		, a.cdgo_clnte
		, b.nmbre_clnte
		, a.id_impsto
		, c.nmbre_impsto
		, a.indcdor_usa_mxto
		, decode (a.indcdor_usa_mxto, 'S', 'S¿', 'N', 'No')					dscrpcion_indcdor_usa_mxto
		, case when a.indcdor_usa_mxto = 'S' then
			a.prcntje_lqdcion_prvdo
		  else
			0
		  end as prcntje_lqdcion_prvdo
		, case when a.indcdor_usa_mxto = 'S' then
			a.prcntje_lqdcion_pblco
		  else
			0
		  end as prcntje_lqdcion_pblco
		, a.indcdor_usa_extrnjro
		, decode (a.indcdor_usa_extrnjro, 'S', 'S¿', 'N', 'No')				dscrpcion_indcdor_usa_extrnjro
		, a.tpo_dias
		, decode (a.tpo_dias, 'C', 'Calendario', 'H', 'H¿bil')				dscrpcion_tpo_dias
		, a.dias_mrgn_mra
		, a.lbel_fcha_expdcion
		, a.id_fljo
		, d.dscrpcion_fljo
		, a.nmro_dcmntos
		, a.intrvlo_dias
		, a.indcdor_mnja_cntrto_gslna
		, decode (a.indcdor_mnja_cntrto_gslna, 'S', 'S¿', 'N', 'No')		dsc_indcdor_mnja_cntrto_gslna
		, a.indcdor_mnja_cntrto_ese
		, decode (a.indcdor_mnja_cntrto_ese, 'S', 'S¿', 'N', 'No')			dsc_indcdor_mnja_cntrto_ese
		, a.user_dgta
		, a.fcha_dgta
		, a.user_mdfca
		, a.fcha_mdfca
        , nvl(a.user_mdfca, a.user_dgta)                                    user_ultma_actlzcion
        , nvl(a.fcha_mdfca, a.fcha_dgta)                                    fcha_ultma_actlzcion
	 from gi_d_rentas_configuracion			a
	 join df_s_clientes						b on a.cdgo_clnte 				= b.cdgo_clnte
	 join df_c_impuestos					c on a.id_impsto  				= c.id_impsto
	 join wf_d_flujos                    	d on a.id_fljo					= d.id_fljo;

