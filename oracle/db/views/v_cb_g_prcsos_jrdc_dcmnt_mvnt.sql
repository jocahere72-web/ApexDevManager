
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PRCSOS_JRDC_DCMNT_MVNT" ("ID_PRCSOS_JRDCO_DCMNTO", "VGNCIA", "ID_PRDO", "PERIODO", "ID_CNCPTO", "CONCEPTO", "VLOR_CPTAL", "VLOR_INTRES") AS
  select a.id_prcsos_jrdco_dcmnto,
	   a.vgncia,
	   a.id_prdo,
	   d.prdo as periodo,
	   a.id_cncpto,
	   e.dscrpcion as concepto,
	   a.vlor_cptal,
	   a.vlor_intres
  from cb_g_prcsos_jrdc_dcmnt_mvnt a
  join df_i_periodos 	d	on a.id_prdo = d.id_prdo
  join df_i_conceptos	e	on a.id_cncpto = e.id_cncpto;

