
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_PRSSVO_DCMNTO" ("ID_PRCSOS_PRSSVO_DCMNTO", "ID_PRCSOS_PRSSVO", "NMRO_PRCSO", "FCHA_RGSTRO", "FUNCIONARIO_FIRMA", "NMBRE_TRCRO", "ID_ACTO", "NMRO_ACTO", "FCHA_ACTO", "ID_ACTO_RQRDO", "ACTVO", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "ID_PLNTLLA", "DCMNTO", "CDGO_SJTO_ORGEN", "ID_SJTO_ORGEN", "ID_PRCSO_PRSSVO_LTE") AS
  select a.id_prcsos_prssvo_dcmnto,
       a.id_prcsos_prssvo,
       b.nmro_prcso,
       a.fcha_rgstro,
       a.funcionario_firma,
       d.nmbre_trcro,
       c.id_acto,
       c.nmro_acto,
       c.fcha                    as fcha_acto,
       a.id_acto_rqrdo,
       a.actvo,
       a.id_acto_tpo,
       e.dscrpcion               as DSCRPCION_ACTO_TPO,
       a.id_plntlla,
       a.dcmnto,
       f.cdgo_sjto_orgen,
       f.id_sjto_orgen,
     --  g.email,
       b.id_prcso_prssvo_lte
  from cb_g_procesos_prssvo_dcmnto a
  join cb_g_procesos_persuasivo b
    on b.id_prcsos_prssvo = a.id_prcsos_prssvo
  left join gn_g_actos c
    on c.id_acto = a.id_acto
   and a.id_acto_tpo = c.id_acto_tpo
   and c.id_orgen=a.id_prcsos_prssvo_dcmnto
  join v_df_c_funcionarios d
    on d.id_fncnrio = a.funcionario_firma
  join gn_d_actos_tipo e
    on e.id_acto_tpo = a.id_acto_tpo
  join cb_g_procesos_persuasivo_sjto f
    on f.id_prcsos_prssvo = b.id_prcsos_prssvo;

