
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_DETERMINACIONES_LOTE" ("ID_DTRMNCION_LTE", "CDGO_CLNTE", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "FCHA_INCIO", "FCHA_FIN", "DRCION", "ID_USRIO", "ID_TRCRO", "ID_FNCNRIO", "NMBRE_TRCRO", "IDNTFCCION", "CDGO_DTRMNCION_TPO_SLCCION", "DSCRPCION_DTRMNCION_TPO_SLCCN", "VGNCIA_DSDE", "ID_PRDO_DSDE", "PRDO_DSDE", "VGNCIA_HSTA", "ID_PRDO_HSTA", "PRDO_HSTA", "RNGO_DDA_DSDE", "RNGO_DDA_HSTA", "NMRO_RGSTRO", "NMRO_SJTO_IMPSTO_VLDOS", "CDGO_LTE_ESTDO", "ID_DCMNTO_LTE", "RGSTROS_NO_VLDOS") AS
  select a.id_dtrmncion_lte,
       a.cdgo_clnte,
       a.id_impsto,
       b.cdgo_impsto,
       b.nmbre_impsto,
       a.id_impsto_sbmpsto,
       c.cdgo_impsto_sbmpsto,
       c.nmbre_impsto_sbmpsto,
       a.fcha_incio,
	   a.fcha_fin,
	   (a.fcha_fin - a.fcha_incio)	drcion,
       a.id_usrio,
	   g.id_trcro,
	   g.id_fncnrio,
	   g.nmbre_trcro,
	   g.idntfccion,
       a.cdgo_dtrmncion_tpo_slccion,
       d.dscrpcion					dscrpcion_dtrmncion_tpo_slccn,
       a.vgncia_dsde,
       a.id_prdo_dsde,
       e.prdo 						prdo_dsde,
       a.vgncia_hsta,
       a.id_prdo_hsta,
       f.prdo 						prdo_hsta,
       a.rngo_dda_dsde,
       a.rngo_dda_hsta,
       a.nmro_rgstro,
       a.nmro_sjto_impsto_vldos ,
	   a.cdgo_lte_estdo,
	   a.id_dcmnto_lte,
	   a.nmro_rgstro - a.nmro_sjto_impsto_vldos RGSTROS_NO_VLDOS
  from gi_g_determinaciones_lote 	a
  join df_c_impuestos 				b on a.id_impsto 					= b.id_impsto
  join df_i_impuestos_subimpuesto 	c on a.id_impsto_sbmpsto 			= c.id_impsto_sbmpsto
  join gi_d_dtrmncion_tpo_slcion 	d on a.cdgo_dtrmncion_tpo_slccion 	= d.cdgo_dtrmncion_tpo_slccion
  join df_i_periodos 				e on a.id_prdo_dsde 				= e.id_prdo
  join df_i_periodos 				f on a.id_prdo_hsta 				= f.id_prdo
  join v_sg_g_usuarios				g on a.id_usrio						= g.id_usrio;

