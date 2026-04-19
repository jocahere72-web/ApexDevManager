
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_RENTAS_SOLICITUD_TRAZA" ("ID_RNTA_SLCTUD_TRZA", "ID_RNTA", "NMRO_RNTA", "OBSRVCION", "ID_USRIO", "NMBRE_TRCRO", "FCHA", "CDGO_RNTA_ESTDO", "DSCRPCION_RNTA_ESTDO", "CDGO_RNTA_ESTDO_NVO", "DSCRPCION_RNTA_ESTDO_NVO", "ESTDO", "ID_INSTNCIA_FLJO", "ID_FLJO_TREA", "NMBRE_TREA", "ID_FLJO_TREA_NVA", "NMBRE_TREA_NVA", "TRSNCCION") AS
  select a.id_rnta_slctud_trza
		, a.id_rnta
		, b.nmro_rnta
		, a.obsrvcion
		, a.id_usrio
		, c.nmbre_trcro
		, a.fcha
		, a.cdgo_rnta_estdo
		, d.dscrpcion								dscrpcion_rnta_estdo
		, a.cdgo_rnta_estdo_nvo
		, e.dscrpcion								dscrpcion_rnta_estdo_nvo
		, d.dscrpcion || ' >> ' || e.dscrpcion		estdo
		, a.id_instncia_fljo
		, a.id_fljo_trea
		, f.nmbre_trea
		, a.id_fljo_trea_nva
		, g.nmbre_trea								nmbre_trea_nva
		, f.nmbre_trea || ' >> ' || g.nmbre_trea	trsnccion
	 from gi_g_rentas_solicitud_traza	a
	 join gi_g_rentas					b on a.id_rnta 				= b.id_rnta
	 join v_sg_g_usuarios				c on a.id_usrio				= c.id_usrio
	 join gi_d_rentas_estado			d on a.cdgo_rnta_estdo		= d.cdgo_rnta_estdo
	 join gi_d_rentas_estado			e on a.cdgo_rnta_estdo_nvo	= e.cdgo_rnta_estdo
	 left join v_wf_d_flujos_tarea		f on a.id_fljo_trea			= f.id_fljo_trea
	 left join v_wf_d_flujos_tarea		g on a.id_fljo_trea_nva		= g.id_fljo_trea;

