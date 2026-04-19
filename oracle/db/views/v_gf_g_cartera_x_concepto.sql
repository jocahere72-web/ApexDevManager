
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CARTERA_X_CONCEPTO" ("CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "ID_MVMNTO_FNCRO", "VGNCIA", "ID_PRDO", "PRDO", "CDGO_PRDCDAD", "DSCRPCION_PRDCDAD", "ID_IMPSTO_ACTO_CNCPTO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "CDGO_MVMNTO_ORGN", "ID_ORGEN", "FCHA_ULTMO_MVMNTO", "FCHA_VNCMNTO", "GNRA_INTRES_MRA", "DSCRIPCION_GNRA_INTRES_MRA", "ID_CNCPTO_INTRES_MRA", "ID_CNCPTO_INTRES_FNCCION", "ID_CNCPTO_INTRES_VNCDO", "CDGO_MVNT_FNCRO_ESTDO", "DSCRPCION_MVNT_FNCRO_ESTDO", "INDCDOR_MVMNTO_BLQDO", "DSCRPCION_INDCDOR_MVMNTO_BLQDO", "VLOR_SLDO_CPTAL", "VLOR_INTRES") AS
  select a.cdgo_clnte,
		a.id_impsto,
		a.id_impsto_sbmpsto,
		a.id_sjto_impsto,
		a.id_mvmnto_fncro,
		a.vgncia,
		a.id_prdo,
		b.prdo,
		b.cdgo_prdcdad,
		b.dscrpcion_prdcdad,
		a.id_impsto_acto_cncpto,
		a.id_cncpto,
		c.cdgo_cncpto,
		c.dscrpcion										dscrpcion_cncpto,
		a.cdgo_mvmnto_orgn,
		a.id_orgen,
		a.fcha_ultmo_mvmnto,
		a.fcha_vncmnto,
		a.gnra_intres_mra,
		decode(a.gnra_intres_mra, 'S', 'Si', 'N', 'No')	dscripcion_gnra_intres_mra,
		e.id_cncpto_intres_mra,
		e.id_cncpto_intres_fnccion,
		e.id_cncpto_intres_vncdo,
		a.cdgo_mvnt_fncro_estdo,
		d.dscrpcion										dscrpcion_mvnt_fncro_estdo,
		a.indcdor_mvmnto_blqdo,
		decode(a.indcdor_mvmnto_blqdo, 'S', 'Si', 'N', 'No') dscrpcion_indcdor_mvmnto_blqdo,
		a.vlor_sldo_cptal,
		a.vlor_intres
   from gf_g_mvmntos_cncpto_cnslddo		a
   join v_df_i_periodos					b on a.id_prdo					= b.id_prdo
   join df_i_conceptos					c on a.id_cncpto				= c.id_cncpto
   join gf_d_mvmnto_fncro_estdo			d on a.cdgo_mvnt_fncro_estdo	= d.cdgo_mvnt_fncro_estdo
   join df_i_impuestos_acto_concepto	e on a.id_impsto_acto_cncpto	= e.id_impsto_acto_cncpto;

