
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_G_NOVEDADES_PREDIO_DTLLE" ("ID_NVDAD_PRDIO_DTLLE", "ID_NVDAD_PRDIO", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_MNCPIO", "NMBRE_DPRTMNTO", "ID_SJTO_IMPSTO", "ID_SJTO", "CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "ID_SJTO_ESTDO", "DSCRPCION_SJTO_ESTDO", "DRCCION", "ID_PRDIO_DSTNO_ANTRIOR", "DSCRPCION_DSTNO_ANTRIOR", "NMTCNCO_DSTNO_ANTRIOR", "ID_PRDIO_USO_SLO_ANTRIOR", "DSCRPCION_USO_SLO_ANTRIOR", "CDGO_ESTRTO_ANTRIOR", "DSCRPCION_ESTRTO_ANTRIOR", "ID_PRDIO_DSTNO_NVO", "DSCRPCION_DSTNO_NVO", "NMTCNCO_DSTNO_NVO", "ID_PRDIO_USO_SLO_NVO", "DSCRPCION_USO_SLO_NVO", "CDGO_ESTRTO_NVO", "DSCRPCION_ESTRTO_NVO", "ID_ACTO", "CDGO_NVDAD_ESTDO", "DSCRPCION_NVDAD_ESTDO", "CDGO_RSPSTA", "MNSJE_RSPSTA") AS
  select a.id_nvdad_prdio_dtlle
		, a.id_nvdad_prdio
		, b.cdgo_clnte
		, b.id_impsto
		, b.nmbre_mncpio
		, b.nmbre_dprtmnto
		, a.id_sjto_impsto
		, b.id_sjto
		, b.cdgo_sjto_tpo
		, b.dscrpcion_sjto_tpo
		, b.idntfccion_sjto
		, b.idntfccion_sjto_frmtda
		, b.id_sjto_estdo
		, b.dscrpcion_sjto_estdo
		, b.drccion
		, a.id_prdio_dstno_antrior
		, c.dscrpcion as dscrpcion_dstno_antrior
		, c.nmtcnco as nmtcnco_dstno_antrior
		, a.id_prdio_uso_slo_antrior
		, d.dscrpcion as dscrpcion_uso_slo_antrior
		, a.cdgo_estrto_antrior
		, e.dscrpcion_estrto as dscrpcion_estrto_antrior
		, a.id_prdio_dstno_nvo
		, f.dscrpcion as dscrpcion_dstno_nvo
		, f.nmtcnco as nmtcnco_dstno_nvo
		, a.id_prdio_uso_slo_nvo
		, g.dscrpcion as dscrpcion_uso_slo_nvo
		, a.cdgo_estrto_nvo
		, h.dscrpcion_estrto as dscrpcion_estrto_nvo
		, a.id_acto
		, a.cdgo_nvdad_estdo
		, i.dscrpcion as dscrpcion_nvdad_estdo
		, i.cdgo_rspsta
		, a.mnsje_rspsta
	 from si_g_novedades_predio_dtlle 	a
	 join v_si_i_sujetos_impuesto 		b on a.id_sjto_impsto 		    = b.id_sjto_impsto
	 join df_i_predios_destino 			c on a.id_prdio_dstno_antrior   = c.id_prdio_dstno
	 join df_c_predios_uso_suelo 		d on a.id_prdio_uso_slo_antrior = d.id_prdio_uso_slo
	 join df_s_estratos 				e on a.cdgo_estrto_antrior 	    = e.cdgo_estrto
	 join df_i_predios_destino 			f on a.id_prdio_dstno_nvo 	    = f.id_prdio_dstno
	 join df_c_predios_uso_suelo 		g on a.id_prdio_uso_slo_nvo     = g.id_prdio_uso_slo
	 join df_s_estratos 				h on a.cdgo_estrto_nvo 		    = h.cdgo_estrto
	 join df_s_novedades_predio_estdo	i on a.cdgo_nvdad_estdo 		= i.cdgo_nvdad_estdo;

