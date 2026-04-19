
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TI_G_PAQUETES_FUNCIONAL" ("ID_PQTE_FNCNAL", "NMBRE", "OBSRVCION", "FCHA", "ID_USRIO", "IDNTFCCION", "NMBRE_TRCRO", "CDGO_ESTDO", "NMBRE_ESTDO", "DSCRPCION_ESTDO", "ID_INSTNCIA_FLJO", "ID_ESTDO_TRNSCION", "ID_FLJO_TREA_ORGEN", "NMBRE_TREA", "ID_USRIO_FLJO_TREA", "IDNTFCCION_FLJO_TREA", "NMBRE_TRCRO_FLJO_TREA", "FCHA_INCIO") AS
  select a.id_pqte_fncnal,
		a.nmbre,
		a.obsrvcion,
		a.fcha,
		a.id_usrio,
		b.idntfccion,
		b.nmbre_trcro,
		a.cdgo_estdo,
		c.nmbre nmbre_estdo,
		c.dscrpcion dscrpcion_estdo,
        a.id_instncia_fljo,
        d.id_estdo_trnscion,
        d.id_fljo_trea_orgen,
        f.nmbre_trea,
        d.id_usrio 				id_usrio_fljo_trea,
		e.idntfccion 			idntfccion_fljo_trea,
		e.nmbre_trcro			nmbre_trcro_fljo_trea,
        d.fcha_incio
   from ti_g_paquetes_funcional a
   join v_sg_g_usuarios				b on a.id_usrio = b.id_usrio
   join ti_d_paquetes_estado		c on a.cdgo_estdo = c.cdgo_estdo
   join wf_g_instancias_transicion  d on a.id_instncia_fljo = d.id_instncia_fljo and d.id_estdo_trnscion in (1,2,4)
   join v_sg_g_usuarios				e on d.id_usrio = e.id_usrio
   join v_wf_d_flujos_tarea         f on d.id_fljo_trea_orgen = f.id_fljo_trea;

