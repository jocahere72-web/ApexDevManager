
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECAUDOS_LTE_CNCLCION" ("ID_RCDO_LTE_CNCLCION", "NMRO_LTE", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_RCDO_ARCHVO_CNCLCION", "NMBRE_ARCHVO", "ESTDO_ARCHVO", "DSCRPCION_ESTDO_ARCHVO", "FCHA_CNCLCION", "FCHA_RCDO", "NMBRE_CLNTE", "ID_BNCO", "CDGO_BNCO", "NMBRE_BNCO", "ID_BNCO_CNTA", "NMRO_CNTA", "TTAL_RCDOS", "VLOR_LTE", "VLOR_TTAL_CNCPTOS", "INDCDOR_TRNSCCION") AS
  select 	a.id_rcdo_lte_cnclcion
	  , a.nmro_lte
	  , a.cdgo_clnte
	  , a.id_impsto
	  , b.nmbre_impsto
	  , a.id_rcdo_archvo_cnclcion
	  , c.nmbre_archvo
	  , c.estdo_archvo
	  , decode(c.estdo_archvo, 'IN', 'INICIADO', 'FINALIZADO') as dscrpcion_estdo_archvo
	  , a.fcha_cnclcion
	  , a.fcha_rcdo
	  , d.nmbre_clnte
	  , a.id_bnco
	  , e.cdgo_bnco
	  , e.nmbre_bnco
	  , a.id_bnco_cnta
	  , f.nmro_cnta
	  , a.ttal_rcdos
	  , a.vlor_lte
	  , a.vlor_ttal_cncptos
	  , a.indcdor_trnsccion
  from	re_g_recaudos_lte_cnclcion	a
  join	df_c_impuestos				b	on	a.id_impsto					=	b.id_impsto
  join	re_g_recaudos_archvo_cnclcn	c	on	a.id_rcdo_archvo_cnclcion	=	c.id_rcdo_archvo_cnclcion
  join	df_s_clientes				d	on	a.cdgo_clnte				=	d.cdgo_clnte
  join	df_c_bancos					e	on	a.id_bnco					=	e.id_bnco
  join	df_c_bancos_cuenta			f	on	a.id_bnco_cnta				=	f.id_bnco_cnta;

