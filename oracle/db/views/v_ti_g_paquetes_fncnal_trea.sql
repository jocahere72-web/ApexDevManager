
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TI_G_PAQUETES_FNCNAL_TREA" ("ID_PQTE_FNCNAL_TREA", "ID_PQTE_FNCNAL", "NMBRE_PQTE_FNCNAL", "FCHA_PQTE_FNCNAL", "ID_USRIO_PQTE_FNCNAL", "USRIO_CRCION_PQTE_FNCNAL", "ID_TREA_ACTUAL_PQTE_FNCNAL", "TREA_ACTUAL_PQTE_FNCNAL", "ID_USRIO_ASG_TREA_ACT_PQT_FNCL", "USRIO_ASGND_TREA_ACTL_PQT_FNCL", "ID_PRCSO", "NMBRE_PRCSO", "DSCRPCION_PRCSO", "ID_RQRMNTO", "NMBRE_RQRMNTO", "ID_RQSTO", "NMBRE_RQSTO", "ID_TREA", "NMBRE_TREA", "ID_TREA_PDRE", "NMBRE_PADRE", "FCHA_INCIO_PLNDA", "FCHA_FIN_PLNDA", "FCHA_INCIO_REAL", "FCHA_FIN_REAL", "UNDAD_DRCION", "DRCION", "PRCNTJE_AVNCE", "ID_TREAS_ESTDO", "NMBRE_TREAS_ESTDO", "FCHA_TREA_ACTUAL_PQTE_FNCNAL", "PQTE_FNCNAL_ITRCION") AS
  select a.id_pqte_fncnal_trea,
        a.id_pqte_fncnal,
		b.nmbre						    nmbre_pqte_fncnal,
		b.fcha						    fcha_pqte_fncnal,
		b.id_usrio					    id_usrio_pqte_fncnal,
		b.nmbre_trcro		            usrio_crcion_pqte_fncnal,
		b.id_fljo_trea_orgen		    id_trea_actual_pqte_fncnal,
		b.nmbre_trea				    trea_actual_pqte_fncnal,
		b.id_usrio_fljo_trea		    id_usrio_asg_trea_act_pqt_fncl,
		b.nmbre_trcro_fljo_trea		    usrio_asgnd_trea_actl_pqt_fncl,
		c.id_prcso,
		c.nmbre_prcso,
	    c.dscrpcion_prcso,
		c.id_rqrmnto,
		c.nmbre_rqrmnto,
		c.id_rqsto,
		c.nmbre_rqsto,
		c.id_trea,
		c.nmbre_trea,
		c.id_trea_pdre,
		c.nmbre_padre,
		c.fcha_incio_plnda,
		c.fcha_fin_plnda,
		c.fcha_incio_real,
		c.fcha_fin_real,
		c.undad_drcion,
		c.drcion,
		c.prcntje_avnce,
		c.id_treas_estdo,
		c.nmbre_treas_estdo,
		b.fcha_incio			        fcha_trea_actual_pqte_fncnal,
		nvl(d.pqte_fncnal_itrcion,0) 	pqte_fncnal_itrcion

    from ti_g_paquetes_fncnal_trea  	a
    join v_ti_g_paquetes_funcional	    b on a.id_pqte_fncnal 	= b.id_pqte_fncnal
    join v_ti_g_tareas				    c on a.id_trea			= c.id_trea
    left join ti_g_pqte_fncnal_itrcion	d on a.id_pqte_fncnal 	= d.id_pqte_fncnal;

