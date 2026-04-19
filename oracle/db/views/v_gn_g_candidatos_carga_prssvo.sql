
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_G_CANDIDATOS_CARGA_PRSSVO" ("ID_CNDDTO_CRGA_PRSSVO", "FCHA_RGSTRO", "ID_PRCSO_CRGA", "ID_PRCSO_INTRMDIA", "NMERO_LNEA", "ID_LTE_PRCSO", "ID_SJTO_PRCSO", "IDNTFCCION", "VGNCIA_DSDE", "VGNCIA_HSTA", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_PRGRMA", "PRDO_INCIAL", "PRDO_FNAL", "CDGO_PRDCDAD", "CDGO_SUBPRGRMA", "CDGO_PRCSO", "DSCRPCION_PRCSO", "ID_CRGA", "CDGO_TRBTO_ACTO", "FCHA_EXPDCION", "NMRO_RNTA") AS
  select a.id_cnddto_crga_prssvo,
       a.fcha_rgstro,
       a.id_prcso_crga,
       a.id_prcso_intrmdia,
       a.nmero_lnea,
       a.id_lte_prcso,
       a.id_sjto_prcso,
       a.idntfccion,
       a.vgncia_dsde,
       a.vgncia_hsta,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       a.cdgo_prgrma,
       a.prdo_incial,
       a.prdo_fnal,
       a.cdgo_prdcdad,
       a.cdgo_subprgrma,
       b.cdgo_prcso,
       b.dscrpcion as dscrpcion_prcso,
       b.id_crga,
       a.cdgo_trbto_acto,
       a.fcha_expdcion,
       a.nmro_rnta
  from gn_g_candidatos_carga_prssvo a
  join gn_d_codigos_proceso b
    on a.cdgo_prcso = b.cdgo_prcso;

