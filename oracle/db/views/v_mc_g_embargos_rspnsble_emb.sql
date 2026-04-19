
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_EMBARGOS_RSPNSBLE_EMB" ("ID_EMBRGOS_RSPNSBLE", "ID_EMBRGOS_CRTRA", "IDNTFCCION", "DSCRPCION_IDNTFCCION_TPO", "NMTCNCO_IDNTFCCION_TPO", "NMBRE_CMPLTO", "PRNCPAL_S_N", "ACTIVO", "ID_EMBRGOS_RSLCION", "DSMBRGDO", "ID_DSMBRGOS_RSLCION") AS
  select a.id_embrgos_rspnsble,
       a.id_embrgos_crtra,
       a.idntfccion,
       b.dscrpcion_idntfccion_tpo,
       b.nmtcnco_idntfccion_tpo,
       a.prmer_nmbre || ' ' || a.sgndo_nmbre || ' ' || a.prmer_aplldo  || ' ' || a.sgndo_aplldo nmbre_cmplto,
       a.prncpal_s_n,
       a.activo,
       C.id_embrgos_rslcion,
       a.dsmbrgdo,
       a.id_dsmbrgos_rslcion
  from mc_g_embargos_responsable a
  join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo
inner join mc_g_embrgs_rslcion_rspnsbl c on C.id_embrgos_rspnsble = A.id_embrgos_rspnsble
;

