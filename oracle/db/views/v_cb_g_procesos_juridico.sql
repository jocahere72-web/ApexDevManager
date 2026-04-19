
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_JURIDICO" ("ID_PRCSOS_JRDCO", "NMRO_PRCSO_JRDCO", "VLOR_TTAL_DDA", "FCHA", "TPO_PLNTLLA", "ID_PRCSO_JRDCO_LTE", "ID_FLJO", "ID_INSTNCIA_FLJO", "DSCRPCION_FLJO", "ID_USRIO", "NMBRE_TRCRO", "CDGO_CLNTE", "NMBRE_CLNTE") AS
  select j.id_prcsos_jrdco,
       j.nmro_prcso_jrdco,
       j.vlor_ttal_dda,
       j.fcha,
       j.tpo_plntlla,
       j.id_prcso_jrdco_lte,
       f.id_fljo,
       f.id_instncia_fljo,
       f.dscrpcion_fljo,
       f.id_usrio,
       f.nmbre_trcro,
       f.cdgo_clnte,
       f.nmbre_clnte
  from cb_g_procesos_juridico j
  join v_wf_g_instancias_flujo f
    on f.id_instncia_fljo = j.id_instncia_fljo;

