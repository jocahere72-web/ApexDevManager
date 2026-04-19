
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_DETERMINACION_SUJETO" ("ID_DTRMNCION_SJTO", "CDGO_CLNTE", "ID_DTRMNCION_LTE", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "IDNTFCCION", "ID_SJTO_IMPSTO", "CDGO_DTRMNCION_SJTO_ESTDO", "DSCRPCION_DTRMNCION_SJTO_ESTDO") AS
  select a.id_dtrmncion_sjto,
		b.cdgo_clnte,
		a.id_dtrmncion_lte,
		b.id_impsto,
		b.cdgo_impsto,
		b.nmbre_impsto,
		b.id_impsto_sbmpsto,
		b.cdgo_impsto_sbmpsto,
		b.nmbre_impsto_sbmpsto,
		a.idntfccion,
		a.id_sjto_impsto,
		a.cdgo_dtrmncion_sjto_estdo,
		c.dscrpcion					dscrpcion_dtrmncion_sjto_estdo
   from gi_g_determinacion_sujeto 	a
   join v_gi_g_determinaciones_lote	b on a.id_dtrmncion_lte				= b.id_dtrmncion_lte
   join gi_d_dtrmncion_sjto_estdo	c on a.cdgo_dtrmncion_sjto_estdo 	= c.cdgo_dtrmncion_sjto_estdo;

