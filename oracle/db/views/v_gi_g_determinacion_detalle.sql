
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_DETERMINACION_DETALLE" ("ID_DTRMNCION_DTLLE", "ID_DTRMNCION", "ID_DTRMNCION_LTE", "CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "TPO_ORGEN", "ID_ORGEN", "FCHA_DTRMNCION", "ACTVO", "VGNCIA", "ID_PRDO", "PRDO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION", "CDGO_CNCPTO_TPO", "VLOR_CPTAL", "VLOR_INTRES", "TRFA", "AVLUO") AS
  select a.id_dtrmncion_dtlle,
       a.id_dtrmncion,
       b.id_dtrmncion_lte,
       b.cdgo_clnte,
       b.id_impsto,
       b.id_impsto_sbmpsto,
       b.id_sjto_impsto,
       b.tpo_orgen,
       a.id_orgen,
       b.fcha_dtrmncion,
       b.actvo,
       a.vgncia,
       a.id_prdo,
       c.prdo,
       a.id_cncpto,
       d.cdgo_cncpto,
       d.dscrpcion,
       d.cdgo_cncpto_tpo,
       a.vlor_cptal,
       a.vlor_intres,
       a.trfa,
       a.avluo
  from gi_g_determinacion_detalle    a
  join gi_g_determinaciones         b on a.id_dtrmncion = b.id_dtrmncion
  join df_i_periodos                 c on a.id_prdo         = c.id_prdo
  join df_i_conceptos                 d on a.id_cncpto     = d.id_cncpto
;

