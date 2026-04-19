
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECAUDOS_CNCPTO_CNCLCN" ("ID_RCDO_CNCPTO_CNCLCN", "ID_RCDO_LTE_CNCLCION", "NMRO_LTE", "TTAL_RCDOS", "VLOR_LTE", "CDGO_RCDO_ORGN_TPO", "ID_ORGEN", "ID_RCDO", "NMRO_DCMNTO", "NMRO_CNTROL_RCDO", "FCHA_RCDO", "FCHA_CNCLCION", "ID_CNCPTO_CNCLCION", "CDGO_CNCPTO", "NMBRE_CNCPTO", "VLOR_RCDO_CNCPTO", "VLOR_CMSION", "ID_BNCO_CNTA", "NMRO_CNTA", "ID_BNCO", "CDGO_BNCO", "INDCDOR_NTRLZA", "INDCDOR_FRMA_PGO") AS
  select a.id_rcdo_cncpto_cnclcn
       , a.id_rcdo_lte_cnclcion
       , c.nmro_lte
       , c.ttal_rcdos
       , c.vlor_lte
       , a.cdgo_rcdo_orgn_tpo
       , a.id_orgen
       , a.id_rcdo
       , a.nmro_dcmnto
       , a.nmro_cntrol_rcdo
       , a.fcha_rcdo
       , a.fcha_cnclcion
       , a.id_cncpto_cnclcion
       , d.cdgo_cncpto
       , d.nmbre_cncpto
       , a.vlor_rcdo_cncpto
       , a.vlor_cmsion
       , a.id_bnco_cnta
       , e.nmro_cnta
       , e.id_bnco
       , f.cdgo_bnco
       , a.indcdor_ntrlza
       , a.indcdor_frma_pgo
  from	re_g_recaudos_cncpto_cnclcn	a
  join	re_g_recaudos_lte_cnclcion	c	on	a.id_rcdo_lte_cnclcion	=	c.id_rcdo_lte_cnclcion
  join	df_i_conceptos_cnclcion		d	on	a.id_cncpto_cnclcion	=	d.id_cncpto_cnclcion
  join	df_c_bancos_cuenta			e	on	a.id_bnco_cnta			=	e.id_bnco_cnta
  join	df_c_bancos					f	on	e.id_bnco				=	f.id_bnco;

