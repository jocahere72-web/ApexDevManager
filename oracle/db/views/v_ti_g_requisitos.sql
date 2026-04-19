
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TI_G_REQUISITOS" ("ID_RQSTO", "ID_RQRMNTO", "NMBRE_RQRMNTO", "ID_PRYCTO", "ID_PRCSO", "NMBRE_PRCSO", "NMBRE_PRYCTO", "NMBRE_RQSTO", "DSCRPCION_RQSTO", "ID_PRRDAD", "NMBRE_PRRDAD", "PRCNTJE_AVNCE", "ID_RQSTO_ESTDO", "NMBRE_RQSTO_ESTDO", "FCHA_INCIO", "ID_SFTWRE_FSE", "NMBRE_SFTWRE_FSE") AS
  select
	a.id_rqsto,
	a.id_rqrmnto,
	b.nmbre nmbre_rqrmnto,
	b.id_prycto,
	b.id_prcso,
	h.nmbre nmbre_prcso,
	f.nmbre nmbre_prycto,
	a.nmbre nmbre_rqsto,
	a.dscrpcion dscrpcion_rqsto ,
	a.id_prrdad,
	c.nmbre nmbre_prrdad,
	a.prcntje_avnce,
	a.id_rqsto_estdo,
	d.nmbre nmbre_rqsto_estdo,
	a.fcha_incio,
	a.id_sftwre_fse,
	e.nmbre nmbre_sftwre_fse

from ti_g_requisitos     		a
join ti_g_requerimientos 		b on a.id_rqrmnto 		= b.id_rqrmnto
join ti_g_proyectos				f on b.id_prycto		= f.id_prycto
join ti_d_prioridades    		c on a.id_prrdad  		= c.id_prrdad
join ti_d_requisitos_estado		d on a.id_rqsto_estdo	= d.id_rqsto_estdo
join ti_d_software_fase			e on a.id_sftwre_fse	= e.id_sftwre_fse
join df_s_procesos              h on b.id_prcso			= h.id_prcso;

