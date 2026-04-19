
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_PERSUASVO_LTE" ("ID_PRCSO_PRSSVO_LTE", "CNSCTVO_LTE", "FCHA_LTE", "ID_FNCNRIO", "NMBRE_TRCRO") AS
  select a.id_prcso_prssvo_lte,
       a.cnsctvo_lte,
       trunc(a.fcha_lte) as fcha_lte,
       a.id_fncnrio,
       b.nmbre_trcro
  from cb_g_procesos_persuasvo_lte a
  join v_sg_g_usuarios b
    on b.id_fncnrio = a.id_fncnrio;

