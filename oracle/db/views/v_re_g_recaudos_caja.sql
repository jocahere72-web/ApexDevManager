
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECAUDOS_CAJA" ("ID_RCDO_CJA", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_BNCO", "NMBRE_BNCO", "BNCO_RCDDOR", "FCHA_APRTRA", "OBSRVCION", "CNTDAD_RCDOS", "VLOR_RCDOS", "CDGO_RCDO_ORGEN", "ESTDO_APRTRA", "DSCRPCION_ESTDO", "ID_USRIO", "NMBRE_USRIO", "FCHA_RGSTRO", "FCHA_CRRE") AS
  select a.id_rcdo_cja
		, a.cdgo_clnte
		, b.nmbre_clnte
		, a.id_bnco
		, c.nmbre_bnco
		, c.rcddor			as bnco_rcddor
		, a.fcha_aprtra
		, a.obsrvcion
		, a.cntdad_rcdos
		, a.vlor_rcdos
		, a.cdgo_rcdo_orgen
		, a.estdo_aprtra
		, decode(a.estdo_aprtra, 'A', 'Abierta', 'C', 'Cerrada') as dscrpcion_estdo
		, a.id_usrio
        , d.nmbre_trcro    as nmbre_usrio
		, a.fcha_rgstro
        , a.fcha_crre
from	re_g_recaudos_caja	a
join	df_s_clientes		b	on	b.cdgo_clnte 	= 	a.cdgo_clnte
join	df_c_bancos			c	on	c.id_bnco		=	a.id_bnco
join    v_sg_g_usuarios     d   on a.id_usrio       =   d.id_usrio;

