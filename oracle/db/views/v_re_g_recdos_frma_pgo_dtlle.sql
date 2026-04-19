
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECDOS_FRMA_PGO_DTLLE" ("ID_RCDO_FRMA_PGO_DTLLE", "ID_RCDO", "ID_RCDO_CNTROL", "FCHA_RCDO", "CDGO_RCDO_ORGN_TPO", "CDGO_RCDO_ESTDO", "FCHA_APLICCION", "ID_USRIO_APLCO", "NMRO_DCMNTO", "ID_RCDO_FRMA_PGO", "CDGO_FRMA_PGO", "DSCRPCION_FRMA_PGO", "VLOR_RCDO_FRMA_PGO", "ID_BNCO", "NMBRE_BNCO", "ID_BNCO_CNTA", "NMRO_CNTA", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "INDCDOR_CMPNNTE", "DSCRPCION_CMPNNTE", "VLOR_DSTRBDO", "PRCNTJE_DSTRBCION") AS
  select  a.id_rcdo_frma_pgo_dtlle,
		a.id_rcdo,
		b.id_rcdo_cntrol,
		b.fcha_rcdo,
		b.cdgo_rcdo_orgn_tpo,
		b.cdgo_rcdo_estdo,
		b.fcha_apliccion,
		b.id_usrio_aplco,
		b.nmro_dcmnto,
		a.id_rcdo_frma_pgo,
		c.cdgo_frma_pgo,
		decode(c.cdgo_frma_pgo,'EF','EFECTIVO','CH','CHEQUE','TR','TRANSFERENCIA') dscrpcion_frma_pgo,
		c.vlor_pgdo         as vlor_rcdo_frma_pgo,
		a.id_bnco,
		d.nmbre_bnco,
		a.id_bnco_cnta,
		e.nmro_cnta,
		a.id_cncpto,
		f.cdgo_cncpto,
		f.dscrpcion as dscrpcion_cncpto,
		a.indcdor_cmpnnte,
		decode(a.indcdor_cmpnnte,'CA','CAPITAL','IM','INTERES DE MORA') as dscrpcion_cmpnnte,
		a.vlor_rcddo         as vlor_dstrbdo,
		round(a.prcntje_dstrbcion,2) as prcntje_dstrbcion
from  re_g_recdos_frma_pgo_dtlle  	a
join  re_g_recaudos       			b	on  b.id_rcdo     		= a.id_rcdo
join  re_g_recaudos_forma_pago  	c	on  c.id_rcdo_frma_pgo  = a.id_rcdo_frma_pgo
										and c.id_rcdo     		= b.id_rcdo
join  df_c_bancos         			d 	on  d.id_bnco     		= a.id_bnco
join  df_c_bancos_cuenta      		e 	on  e.id_bnco     		= a.id_bnco
										and e.id_bnco_cnta    	= a.id_bnco_cnta
										and e.id_bnco     		= d.id_bnco
join  df_i_conceptos        		f 	on  f.id_cncpto     	= a.id_cncpto;

