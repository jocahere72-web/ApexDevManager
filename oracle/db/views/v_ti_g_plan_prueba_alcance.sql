
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TI_G_PLAN_PRUEBA_ALCANCE" ("ID_PLAN_PRBA_ALCNCE", "ID_PLAN_PRBA", "CDGO_PLAN_PRBA", "CDGO_CLNTE", "ID_EDSION", "ID_VRSION", "ID_IMPLMNTCION_TPO", "ID_PRBA_TPO", "CDGO_PRBA_TPO", "DSCRPCION_PRBA_TPO") AS
  select a.id_plan_prba_alcnce,
		a.id_plan_prba,
		b.cdgo_plan_prba,
		b.cdgo_clnte,
		b.id_edsion,
		b.id_vrsion,
		b.id_implmntcion_tpo,
		a.id_prba_tpo,
		c.cdgo_prba_tpo,
		c.dscrpcion 	dscrpcion_prba_tpo
  from ti_g_plan_prueba_alcance	a
  join ti_g_plan_prueba 		b on a.id_plan_prba = b.id_plan_prba
  join ti_d_prueba_tipo			c on a.id_prba_tpo	= c.id_prba_tpo;

