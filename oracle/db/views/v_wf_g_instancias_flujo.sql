
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_G_INSTANCIAS_FLUJO" ("ID_INSTNCIA_FLJO", "FCHA_INCIO", "FCHA_FIN_REAL", "FCHA_FIN_PLNDA", "FCHA_FIN_OPTMA", "ESTDO_INSTNCIA", "ID_FLJO", "CDGO_FLJO", "ID_PRCSO", "PRCSO", "DSCRPCION_FLJO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_USRIO", "NMBRE_TRCRO") AS
  select if.id_instncia_fljo,
       if.fcha_incio,
       if.fcha_fin_real,
       if.fcha_fin_plnda,
       if.fcha_fin_optma,
       if.estdo_instncia,
       f.id_fljo,
       f.cdgo_fljo,
       f.id_prcso,
       f.prcso,
       f.dscrpcion_fljo,
       f.cdgo_clnte,
       f.nmbre_clnte,
       u.id_usrio,
       u.nmbre_trcro
  from wf_g_instancias_flujo if
  join v_wf_d_flujos f
    on f.id_fljo = if.id_fljo
  join v_sg_g_usuarios u
    on u.id_usrio = if.id_usrio;

