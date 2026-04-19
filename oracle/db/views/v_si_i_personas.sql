
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_I_PERSONAS" ("ID_PRSNA", "ID_SJTO", "ID_SJTO_IMPSTO", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "ID_SJTO_TPO", "NMBRE_SJTO_TPO", "TPO_PRSNA", "DSCRPCION_TPO_PRSNA", "NMBRE_RZON_SCIAL", "NMRO_RGSTRO_CMRA_CMRCIO", "FCHA_RGSTRO_CMRA_CMRCIO", "FCHA_INCIO_ACTVDDES", "NMRO_SCRSLES", "DRCCION_CMRA_CMRCIO", "CDGO_ACTVDAD", "DSCRPCION") AS
  select a.id_prsna,
       d.id_sjto,
       a.id_sjto_impsto,
       a.cdgo_idntfccion_tpo,
       b.dscrpcion_idntfccion_tpo,
       a.id_sjto_tpo,
       c.nmbre_sjto_tpo,
       a.tpo_prsna,
       decode(a.tpo_prsna, 'N', 'Natural', 'Jurídica') as dscrpcion_tpo_prsna,
       a.nmbre_rzon_scial,
       a.nmro_rgstro_cmra_cmrcio,
       a.fcha_rgstro_cmra_cmrcio,
       a.fcha_incio_actvddes,
       a.nmro_scrsles,
       a.drccion_cmra_cmrcio,
       nvl(e.cdgo_dclrcns_esqma_trfa,'NO DEFINIDA') cdgo_actvdad,
       nvl(e.dscrpcion, 'NO DEFINIDA') dscrpcion
  from si_i_personas a
  join df_s_identificaciones_tipo b
    on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo
  left join df_i_sujetos_tipo c
    on a.id_sjto_tpo = c.id_sjto_tpo
  join v_si_i_sujetos_impuesto d
    on a.id_sjto_impsto = d.id_sjto_impsto
  left join gi_d_dclrcns_esqma_trfa e
    on a.id_actvdad_ecnmca = e.id_dclrcns_esqma_trfa
;

