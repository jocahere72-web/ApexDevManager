
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TI_G_TAREAS" ("ID_TREA", "ID_RQSTO", "ID_RQRMNTO", "NMBRE_RQRMNTO", "NMBRE_RQSTO", "DSCRPCION_RQSTO", "ID_PRCSO", "NMBRE_PRCSO", "DSCRPCION_PRCSO", "ID_PRCSO_PDRE", "NMBRE_PRCSO_PDRE", "ID_PRYCTO", "NMBRE_PRYCTO", "NMTCNCO", "NMBRE_TREA", "DSCRPCION_TREA", "CDGO_TREA_TPO", "DSCRPCION_TREA_TPO", "FCHA_INCIO_PLNDA", "FCHA_FIN_PLNDA", "FCHA_INCIO_REAL", "FCHA_FIN_REAL", "UNDAD_DRCION", "DRCION", "PRCNTJE_AVNCE", "ID_TREAS_ESTDO", "NMBRE_TREAS_ESTDO", "ID_TREA_PDRE", "NMBRE_PADRE", "ID_RSPSBLE", "NMBRE_RSPSBLE", "ORDEN") AS
  select
	a.id_trea,
	a.id_rqsto,
	f.id_rqrmnto,
	f.nmbre_rqrmnto,
	f.nmbre_rqsto,
	f.dscrpcion_rqsto,
	g.id_prcso,
	g.nmbre  nmbre_prcso,
	g.dscrpcion  dscrpcion_prcso,
    g.id_prcso_pdre,
    i.nmbre     nmbre_prcso_pdre,
	f.id_prycto,
	f.nmbre_prycto,
	a.nmtcnco,
	a.nmbre nmbre_trea,
	a.dscrpcion dscrpcion_trea,
	a.cdgo_trea_tpo,
	b.dscrpcion dscrpcion_trea_tpo,
	a.fcha_incio_plnda,
	a.fcha_fin_plnda,
	a.fcha_incio_real,
	a.fcha_fin_real,
	a.undad_drcion,
	a.drcion,
	a.prcntje_avnce,
	a.id_treas_estdo,
	c.nmbre nmbre_treas_estdo,
	a.id_trea_pdre,
	e.nmbre nmbre_padre,
	a.id_rspsble,
	d.nmbre_trcro nmbre_rspsble,
	a.orden

from  ti_g_tareas					a
join  ti_d_tareas_tipo				b on a.cdgo_trea_tpo 	= b.cdgo_trea_tpo
join  ti_d_tareas_estado			c on a.id_treas_estdo	= c.id_treas_estdo
join  v_sg_g_usuarios	 			d on a.id_rspsble		= d.id_usrio
join  v_ti_g_requisitos				f on a.id_rqsto			= f.id_rqsto
join ti_g_requerimientos 			h on f.id_rqrmnto       = h.id_rqrmnto
join  df_s_procesos                 g on h.id_prcso         = g.id_prcso
left join df_s_procesos             i on g.id_prcso_pdre    = i.id_prcso
left join  ti_g_tareas		 		e on a.id_trea_pdre		= e.id_trea;

