
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TI_G_PAQUETES_FNCNAL_TRZA" ("ORDEN", "ID_PQTE_FNCNAL_TRZA", "ID_PQTE_FNCNAL", "NMBRE_PQTE_FNCNAL", "ID_USRIO", "USRIO_RLZO_TREA", "CDGO_ESTDO_ACTUAL", "NMBRE_ESTDO_ACTUAL", "DSCRPCION_ESTDO_ACTUAL", "CDGO_ESTDO_ANTRIOR", "NMBRE_ESTDO_ANTRIOR", "DSCRPCION_ESTDO_ANTRIOR", "FCHA", "ID_INSTNCIA_FLJO", "ID_FLJO_TREA", "NMBRE_TREA", "OBSRVCION") AS
  select  a.orden,
		a.id_pqte_fncnal_trza,
		a.id_pqte_fncnal,
		b.nmbre nmbre_pqte_fncnal,
		a.id_usrio,
		f.nmbre_trcro usrio_rlzo_trea,
		a.cdgo_estdo_actual,
		c.nmbre nmbre_estdo_actual,
		c.dscrpcion  dscrpcion_estdo_actual,
		a.cdgo_estdo_antrior,
		d.nmbre nmbre_estdo_antrior,
		d.dscrpcion  dscrpcion_estdo_antrior,
		a.fcha,
		a.id_instncia_fljo,
		a.id_fljo_trea,
		e.nmbre_trea,
		a.obsrvcion
from ti_g_paquetes_fncnal_trza a
join ti_g_paquetes_funcional	 b on a.id_pqte_fncnal			 = b.id_pqte_fncnal
join ti_d_paquetes_estado		 c on a.cdgo_estdo_actual        = c.cdgo_estdo
left join ti_d_paquetes_estado   d on a.cdgo_estdo_antrior		 = d.cdgo_estdo
join v_wf_d_flujos_tarea  		 e on a.id_fljo_trea       	     = e.id_fljo_trea
join v_sg_g_usuarios  	  		 f on a.id_usrio				 = f.id_usrio;

