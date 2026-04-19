
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECAUDOS" ("ID_RCDO", "ID_RCDO_CNTROL", "CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO", "ID_SJTO_IMPSTO", "CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "IDNTFCCION_ANTRIOR", "ID_SJTO_ESTDO", "DSCRPCION_SJTO_ESTDO", "CDGO_RCDO_ORGN_TPO", "DSCRPCION_RCDO_ORGN_TPO", "ID_ORGEN", "NMRO_DCMNTO", "FCHA_RCDO", "FCHA_INGRSO_BNCO", "VLOR", "CDGO_FRMA_PGO", "DSCRPCION_FRMA_PGO", "FCHA_APLICCION", "OBSRVCION", "CDGO_RCDO_ESTDO", "DSCRPCION_RCDO_ESTDO", "MNSJE_RSPSTA", "ID_USRIO_APLCO", "ID_CNVNIO", "ID_SLDO_FVOR", "CDGO_RCDO_ORGEN_CNTROL", "DSCRPCION_RCDO_ORGEN_CNTROL", "INDCDOR_INTRFAZ") AS
  select b.id_rcdo
	, b.id_rcdo_cntrol
	, a.cdgo_clnte
	, a.id_impsto
	, a.id_impsto_sbmpsto
	, d.id_sjto
	, b.id_sjto_impsto
	, d.cdgo_sjto_tpo
	, d.dscrpcion_sjto_tpo
	, d.idntfccion_sjto
	, d.idntfccion_sjto_frmtda
	, d.idntfccion_antrior
	, d.id_sjto_estdo
	, d.dscrpcion_sjto_estdo
	, b.cdgo_rcdo_orgn_tpo
	, c.dscrpcion as dscrpcion_rcdo_orgn_tpo
	, b.id_orgen
	, b.nmro_dcmnto
	, b.fcha_rcdo
	, b.fcha_ingrso_bnco
	, b.vlor
	, b.cdgo_frma_pgo
	, decode( b.cdgo_frma_pgo , 'EF' , 'Efectivo' , 'CH' , 'Cheque' , 'TR' , 'Transferencia' ) as dscrpcion_frma_pgo
	, b.fcha_apliccion
	, b.obsrvcion
	, b.cdgo_rcdo_estdo
	, e.dscrpcion as dscrpcion_rcdo_estdo
	, b.mnsje_rspsta
	, b.id_usrio_aplco
	, b.id_cnvnio
	, b.id_sldo_fvor
	, a.cdgo_rcdo_orgen as cdgo_rcdo_orgen_cntrol
	, f.dscrpcion as dscrpcion_rcdo_orgen_cntrol
    , b.indcdor_intrfaz
 from re_g_recaudos_control a
 join re_g_recaudos b
   on a.id_rcdo_cntrol     = b.id_rcdo_cntrol
 join re_d_recaudo_origen_tipo c
   on b.cdgo_rcdo_orgn_tpo = c.cdgo_rcdo_orgn_tpo
 join v_si_i_sujetos_impuesto d
   on b.id_sjto_impsto     = d.id_sjto_impsto
 join re_d_recaudo_estado e
   on b.cdgo_rcdo_estdo    = e.cdgo_rcdo_estdo
 join re_d_recaudo_origen f
   on a.cdgo_rcdo_orgen = f.cdgo_rcdo_orgen;

