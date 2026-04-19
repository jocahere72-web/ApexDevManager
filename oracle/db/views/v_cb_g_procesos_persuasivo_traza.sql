
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_PERSUASIVO_TRAZA" ("ID_PRCSOS_PRSSVO_TRZA", "ID_PRCSOS_SMU_SJTO", "ID_PRCSOS_SMU_LTE", "ID_SJTO", "IDNTFCCION_SJTO", "PRCSOS_PERSSVO_TRZA", "FCHA_PRCSO", "ID_USRIO", "NMBRE_TRCRO", "ID_PRCSOS_PRSSVO", "ID_PRCSO_PRSSVO_LTE") AS
  select t.id_prcsos_prssvo_trza,
       t.id_prcsos_smu_sjto,
       t.id_prcsos_smu_lte,
       t.id_sjto,
       t.idntfccion_sjto,
       t.prcsos_perssvo_trza,
       t.fcha_prcso,
       t.id_usrio,
       u.nmbre_trcro,
       t.id_prcsos_prssvo,
       t.id_prcso_prssvo_lte
  from cb_g_procesos_persuasivo_traza t
  join v_sg_g_usuarios u
    on u.id_usrio = t.id_usrio;

