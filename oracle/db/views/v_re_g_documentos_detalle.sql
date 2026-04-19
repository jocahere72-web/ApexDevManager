
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_DOCUMENTOS_DETALLE" ("ID_DCMNTO_DTLLE", "CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_DCMNTO", "NMRO_DCMNTO", "FCHA_DCMNTO", "CDGO_DCMNTO_TPO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "ID_MVMNTO_DTLLE", "VGNCIA", "ID_PRDO", "PRDO", "BSE_GRVBLE", "TRFA", "TXTO_TRFA", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION", "CDGO_CNCPTO_TPO", "VLOR_DBE", "VLOR_HBER", "ID_DSCNTO_RGLA", "PRCNTJE_DSCNTO", "ID_CNCPTO_RLCNAL", "CDGO_CNCPTO_RLCNAL", "DSCRPCION_RLCNAL", "CTGRIA_CNCPTO_DSCNTO", "EXPRSION_RDNDEO", "INTRES_BNCRIO", "NMRO_CTA", "CDGO_CNCPTO_TPO_CNVNIO", "FCHA_VNCMNTO", "PRCNTJE_PRTCPCION_APL", "ID_ORGEN", "CDGO_MVMNTO_ORGN") AS
  select a.id_dcmnto_dtlle
		, b.cdgo_clnte
		, b.id_impsto
		, b.id_impsto_sbmpsto
		, a.id_dcmnto
		, b.nmro_dcmnto
		, b.fcha_dcmnto
		, b.cdgo_dcmnto_tpo
		, b.id_sjto_impsto
		, b.idntfccion_sjto
		, a.id_mvmnto_dtlle
		, c.vgncia
		, c.id_prdo
		, e.prdo
		, a.bse_grvble
		, a.trfa
		, a.txto_trfa
		, a.id_cncpto
		, d.cdgo_cncpto
		, d.dscrpcion
		, a.cdgo_cncpto_tpo
		, a.vlor_dbe
		, a.vlor_hber
		, a.id_dscnto_rgla
		, a.prcntje_dscnto
		, a.id_cncpto_rlcnal
		, f.cdgo_cncpto     	cdgo_cncpto_rlcnal
		, f.dscrpcion     		dscrpcion_rlcnal
		, f.ctgria_cncpto       ctgria_cncpto_dscnto
		, a.exprsion_rdndeo
		, a.intres_bncrio
		, a.nmro_cta
		, a.cdgo_cncpto_tpo_cnvnio
		, c.fcha_vncmnto
		, a.prcntje_prtcpcion_apl
    , c.id_orgen
    , c.cdgo_mvmnto_orgn
   from re_g_documentos_detalle     a
   join v_re_g_documentos           b on a.id_dcmnto          = b.id_dcmnto
   join gf_g_movimientos_detalle    c on a.id_mvmnto_dtlle    = c.id_mvmnto_dtlle
   join df_i_conceptos              d on a.id_cncpto          = d.id_cncpto
   join df_i_periodos       		e on c.id_prdo        	  = e.id_prdo
   left join df_i_conceptos         f on a.id_cncpto_rlcnal   = f.id_cncpto
;

