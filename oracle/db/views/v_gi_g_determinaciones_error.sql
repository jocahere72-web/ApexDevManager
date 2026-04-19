
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_DETERMINACIONES_ERROR" ("ID_DTRMNCION_ERROR", "ID_DTRMNCION_LTE", "ID_DTRMNCION", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "VGNCIA", "PRDO", "CDGO_DTRMNCION_ERROR_TIP", "DSCRPCION_DTRMNCION_ERROR_TIP", "MNSJE_ERROR", "FCHA") AS
  select a.id_dtrmncion_error,
		a.id_dtrmncion_lte,
		a.id_dtrmncion,
		a.id_sjto_impsto,
		c.idntfccion_sjto,
		c.idntfccion_sjto_frmtda,
		a.vgncia,
		a.prdo,
		a.cdgo_dtrmncion_error_tip,
		b.dscrpcion						dscrpcion_dtrmncion_error_tip,
		a.mnsje_error,
		a.fcha
   from gi_g_determinaciones_error		a
   join gi_d_dtrmncnes_error_tpo		b on a.cdgo_dtrmncion_error_tip	= b.cdgo_dtrmncion_error_tip
   left join v_si_i_sujetos_impuesto	c on a.id_sjto_impsto			= c.id_sjto_impsto;

