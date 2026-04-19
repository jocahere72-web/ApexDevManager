
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_DOCUMENTOS_LOTE" ("ID_DCMNTO_LTE", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "VGNCIA_DSDE", "ID_PRDO_DSDE", "PRDO_DSDE", "VGNCIA_HSTA", "ID_PRDO_HSTA", "PRDO_HSTA", "CDGO_DCMNTO_LTE_TPO", "FCHA_VNCMNTO", "CDGO_TPO_SLCCION_PBLCION", "TPO_SLCCION_PBLCION", "OBSRVCION", "NMRO_DCMNTO_GNRDOS", "FCHA", "ID_USRIO", "NMBRE_TRCRO") AS
  select a.id_dcmnto_lte,
		a.cdgo_clnte,
		b.nmbre_clnte,
		a.id_impsto,
		c.nmbre_impsto,
		a.id_impsto_sbmpsto,
		d.nmbre_impsto_sbmpsto,
		a.vgncia_dsde,
		a.id_prdo_dsde,
		f.prdo				prdo_dsde,
		a.vgncia_hsta,
		a.id_prdo_hsta,
		g.prdo				prdo_hsta,
		a.cdgo_dcmnto_lte_tpo,
		a.fcha_vncmnto,
		a.cdgo_tpo_slccion_pblcion,
		decode (cdgo_tpo_slccion_pblcion,'ACV','Archivo','SQL','SQL')tpo_slccion_pblcion,
		a.obsrvcion,
		a.nmro_dcmnto_gnrdos,
		a.fcha,
		a.id_usrio,
		e.nmbre_trcro
   from re_g_documentos_lote  		a
   join df_s_clientes 				b	on a.cdgo_clnte 		= b.cdgo_clnte
   join df_c_impuestos 				c	on a.id_impsto			= c.id_impsto
   join df_i_impuestos_subimpuesto	d	on a.id_impsto_sbmpsto	= d.id_impsto_sbmpsto
   join v_sg_g_usuarios				e	on a.id_usrio			= e.id_usrio
   join df_i_periodos 				f	on a.id_prdo_dsde		= f.id_prdo
   join df_i_periodos 				g	on a.id_prdo_hsta		= g.id_prdo;

