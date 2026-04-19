
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TI_G_REQUERIMIENTOS" ("ID_RQRMNTO", "ID_PRYCTO", "NMBRE_PRYCTO", "DSCRPCION_PRYCTO", "NMBRE", "DSCRPCION_RQRMNTO", "ID_PRCSO", "DSCRPCION_PRCSO", "INDCDOR_VBLDAD", "ID_PRRDAD", "NMBRE_PRRDAD", "PRCNTJE_AVNCE") AS
  select a.id_rqrmnto,
		a.id_prycto,
		b.nmbre nmbre_prycto,
		b.dscrpcion dscrpcion_prycto,
		a.nmbre,
		a.dscrpcion dscrpcion_rqrmnto,
		a.id_prcso,
		c.dscrpcion dscrpcion_prcso,
		a.indcdor_vbldad,
		a.id_prrdad,
		d.nmbre nmbre_prrdad,
		a.prcntje_avnce

   from ti_g_requerimientos    a
   join ti_g_proyectos         b on a.id_prycto       = b.id_prycto
   join df_s_procesos          c on a.id_prcso        = c.id_prcso
   join ti_d_prioridades       d on a.id_prrdad       = d.id_prrdad;

