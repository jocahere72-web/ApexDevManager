
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_MOVIMIENTOS_TRAZA" ("ID_MVMNTO_TRZA", "CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "VGNCIA", "ID_PRDO", "CDGO_MVNT_FNCRO_ESTDO", "INDCDOR_MVMNTO_BLQDO", "ID_MVMNTO_FNCRO", "ID_USRIO", "IDNTFCCION", "NMBRE_TRCRO", "FCHA", "CDGO_TRZA_ORGN", "DSCRIPCION", "NMBRE_TBLA", "NMBRE_CLMNA", "ID_ORGEN", "OBSRVCION") AS
  select a.id_mvmnto_trza,
		b.cdgo_clnte,
		b.id_impsto,
		b.id_impsto_sbmpsto,
		b.vgncia,
		b.id_prdo,
		b.cdgo_mvnt_fncro_estdo,
		b.indcdor_mvmnto_blqdo,
		a.id_mvmnto_fncro,
		a.id_usrio,
		c.idntfccion,
		c.nmbre_trcro,
		a.fcha,
		a.cdgo_trza_orgn,
		d.dscripcion,
		d.nmbre_tbla,
		d.nmbre_clmna,
		a.id_orgen,
		a.obsrvcion
   from gf_g_movimientos_traza 		a
   join gf_g_movimientos_financiero	b on a.id_mvmnto_fncro			= b.id_mvmnto_fncro
   join v_sg_g_usuarios  			c on a.id_usrio					= c.id_usrio
   left join gf_d_traza_origen		d on a.cdgo_trza_orgn			= d.cdgo_trza_orgn;

