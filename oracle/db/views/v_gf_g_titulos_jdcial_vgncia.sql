
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TITULOS_JDCIAL_VGNCIA" ("ID_TTLO_JDCIAL_VGNCIA", "ID_TTLO_JDCIAL_IMPSTO", "VGNCIA", "ID_PRDO", "PRDO", "VLOR_CPTAL", "VLOR_INTRES", "VLOR_DSCTO", "VLOR_TTAL", "VLOR_TTAL_TTLO", "ID_ORGEN", "VLOR_TTAL_APLCAR", "VLOR_TTAL_APLCCION", "VLOR_DSCNTO_APLCCION", "TPO_DCMNTO", "CDGO_MVMNTO_ORGN", "FCHA_PRYCCION", "ID_INSTNCIA_FLJO", "ID_TTLO_JDCIAL", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "ID_SJTO_RSPNSBLE", "IDNTFCCION_RSPNSBLE", "NMBRE_RZON_SCIAL_RSPNSBLE", "CDGO_MVMNTO_TPO") AS
  select a.id_ttlo_jdcial_vgncia,
       a.id_ttlo_jdcial_impsto,
       a.vgncia,
       a.id_prdo,
       a.prdo,
       a.vlor_cptal,
       a.vlor_intres,
       a.vlor_dscto,
       a.vlor_ttal,
       a.vlor_ttal_ttlo,
       a.id_orgen,
       a.vlor_ttal_aplcar,
       a.vlor_ttal_aplccion,
       a.vlor_dscnto_aplccion,
       a.tpo_dcmnto,
       a.cdgo_mvmnto_orgn,
       a.fcha_pryccion,
       a.id_instncia_fljo,
       b.id_ttlo_jdcial,
       b.id_impsto,
       b.nmbre_impsto,
       b.id_impsto_sbmpsto,
       b.nmbre_impsto_sbmpsto,
       b.id_sjto_impsto,
       b.idntfccion_sjto,
       b.idntfccion_sjto_frmtda,
       b.id_sjto_rspnsble,
       b.idntfccion_rspnsble,
       b.nmbre_rzon_scial_rspnsble,
       a.cdgo_mvmnto_tpo
  from gf_g_titulos_jdcial_vgncia a
  join v_gf_g_titulos_jdcial_impsto b
    on a.id_instncia_fljo = b.id_instncia_fljo;

