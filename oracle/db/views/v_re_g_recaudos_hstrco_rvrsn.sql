
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECAUDOS_HSTRCO_RVRSN" ("ID_RCDO_HTRCO_RVRSION", "FCHA_RVRSION", "ID_LQDCION", "NMRO_LQDCION", "CDGO_RCDO_ORGEN_TPO", "DSCRPCN_CDGO_RCDO_ORGEN_TPO", "CNSCTVO_RCDO", "ID_RCDO", "ID_ORGEN", "NMRO_DCMNTO", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_IMPSTO_ACTO", "VLOR_EFCTVO", "VLOR_CHQUE", "VLOR_RCDO", "OBSRVCION", "ID_USRIO") AS
  select	a.id_rcdo_htrco_rvrsion
	  , a.fcha_rvrsion
	  , a.id_lqdcion
	  , b.nmro_rnta 			as nmro_lqdcion
	  , a.cdgo_rcdo_orgen_tpo
	  , DECODE(a.cdgo_rcdo_orgen_tpo, 'DC', 'DOCUMENTO', 'DL', 'DECLARACION') as dscrpcn_cdgo_rcdo_orgen_tpo
	  , a.cnsctvo_rcdo
	  , a.id_rcdo
	  , a.id_orgen
	  , e.nmro_dcmnto
	  , a.id_impsto
	  , c.nmbre_impsto
	  , a.id_impsto_sbmpsto
	  , d.nmbre_impsto_sbmpsto
	  , a.id_impsto_acto
	  , a.vlor_efctvo
	  , a.vlor_chque
	  , a.vlor_rcdo
	  , a.obsrvcion
	  , a.id_usrio
from 	re_g_recaudos_hstrco_rvrsn		a
left join	gi_g_rentas					b	on	b.id_rnta				=	a.id_lqdcion
	 join	df_c_impuestos				c	on	c.id_impsto				=	a.id_impsto
	 join	df_i_impuestos_subimpuesto	d	on	d.id_impsto_sbmpsto		=	a.id_impsto_sbmpsto
											and d.id_impsto				=	c.id_impsto
	 join	re_g_documentos				e	on	e.id_dcmnto				=	a.id_orgen;

