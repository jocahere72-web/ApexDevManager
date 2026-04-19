
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_DOCUMENTOS" ("ID_DCMNTO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO", "CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "IDNTFCCION_ANTRIOR", "IDNTFCCION_ANTRIOR_FRMTDA", "ID_SJTO_ESTDO", "DSCRPCION_SJTO_ESTDO", "ID_SJTO_IMPSTO", "DRCCION", "CDGO_PSTAL", "NMRO_DCMNTO", "ID_DCMNTO_LTE", "CDGO_DCMNTO_TPO", "DSCRPCION_DCMNTO_TPO", "ID_CNVNIO", "NMRO_CTA", "FCHA_DCMNTO", "FCHA_VNCMNTO", "VLOR_TTAL_DBE", "VLOR_TTAL_HBER", "VLOR_TTAL", "VLOR_TTAL_DCMNTO", "INDCDOR_PGO_APLCDO", "DSCRPCION_INDCDOR_PGO_APLCDO", "INDCDOR_ENTRNO", "DSCRPCION_INDCDOR_ENTRNO", "INDCDOR_CNVNIO", "INDCDOR_INSLVNCIA", "INDCDOR_CLCLA_INTRES", "FCHA_CNGLA_INTRES", "TPO_GNRCION_DCMNTO", "CDGO_IDNTFCCION_TPO", "IDNTFCCION", "PRCNTJE_PRTCPCION") AS
  select a.id_dcmnto,
		a.cdgo_clnte,
		b.nmbre_clnte,
		a.id_impsto,
		c.nmbre_impsto,
		a.id_impsto_sbmpsto,
		d.nmbre_impsto_sbmpsto,
        e.id_sjto,
		e.cdgo_sjto_tpo,
		e.dscrpcion_sjto_tpo,
		e.idntfccion_sjto,
		e.idntfccion_sjto_frmtda,
		e.idntfccion_antrior,
		e.idntfccion_antrior_frmtda,
		e.id_sjto_estdo,
		e.dscrpcion_sjto_estdo,
		a.id_sjto_impsto,
		a.drccion,
		a.cdgo_pstal,
		a.nmro_dcmnto,
		a.id_dcmnto_lte,
		a.cdgo_dcmnto_tpo,
		f.dscrpcion		dscrpcion_dcmnto_tpo,
		a.id_cnvnio,
		a.nmro_cta,
		a.fcha_dcmnto,
		a.fcha_vncmnto,
		a.vlor_ttal_dbe,
		a.vlor_ttal_hber,
		a.vlor_ttal,
		a.vlor_ttal_dcmnto,
		a.indcdor_pgo_aplcdo,
        decode(a.indcdor_pgo_aplcdo, 'S','Si','N','No')					dscrpcion_indcdor_pgo_aplcdo,
		a.indcdor_entrno,
        decode(a.indcdor_entrno, 'PRVDO','PRIVADO','PBLCO','PUBLICO')	dscrpcion_indcdor_entrno,
        a.indcdor_cnvnio,
        a.indcdor_inslvncia,
        a.indcdor_clcla_intres,
        a.fcha_cngla_intres,
		a.tpo_gnrcion_dcmnto,
		a.cdgo_idntfccion_tpo,
		a.idntfccion,
		a.prcntje_prtcpcion
   from re_g_documentos       		a
   join df_s_clientes         		b on a.cdgo_clnte     		= b.cdgo_clnte
   join df_c_impuestos        		c on a.id_impsto      		= c.id_impsto
   join df_i_impuestos_subimpuesto  d on a.id_impsto_sbmpsto  	= d.id_impsto_sbmpsto
   join v_si_i_sujetos_impuesto   	e on a.id_sjto_impsto   	= e.id_sjto_impsto
   join re_d_documento_tipo     	f on a.cdgo_dcmnto_tpo  	= f.cdgo_dcmnto_tpo
;

