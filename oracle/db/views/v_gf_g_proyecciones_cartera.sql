
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_PROYECCIONES_CARTERA" ("ID_PRYCCION_CRTRA", "ID_PRYCCION", "VGNCIA", "ID_PRDO", "PRDO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION", "VLOR_CPTAL", "VLOR_INTRES", "VLOR_TTAL", "ID_ORGEN", "CDGO_MVMNTO_ORGEN") AS
  select a.id_pryccion_crtra,
		a.id_pryccion,
		a.vgncia,
		a.id_prdo,
		b.prdo,
		a.id_cncpto,
		c.cdgo_cncpto,
		c.dscrpcion,
		a.vlor_cptal,
		a.vlor_intres,
		(a.vlor_cptal + a.vlor_intres) vlor_ttal,
        a.id_orgen,
        a.cdgo_mvmnto_orgen
   from gf_g_proyecciones_cartera a
   join df_i_periodos b on a.id_prdo = b.id_prdo
   join df_i_conceptos c on a.id_cncpto = c.id_cncpto
   order by a.vgncia, prdo, cdgo_cncpto;

