
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_G_INSTANCIAS_FLUJOS" ("ID_INSTNCIA_FLJO", "ID_FLJO", "ID_PRCSO", "DSCRPCION_FLJO", "FCHA_INCIO", "FCHA_FIN_PLNDA", "FCHA_FIN_OPTMA", "FCHA_FIN_REAL", "DRCION", "DSCRPCION_DRCION", "ID_USRIO", "NMBRE_TRCRO", "NMBRE_OFCNA", "ESTDO_INSTNCIA", "CDGO_CLNTE") AS
  select wif.id_instncia_fljo,
         wif.id_fljo,
         vwf.id_prcso,
         vwf.dscrpcion_fljo,
         wif.fcha_incio,
         wif.fcha_fin_plnda,
         wif.fcha_fin_optma,
         wif.fcha_fin_real,
         vwf.drcion,
         vwf.dscrpcion_drcion,
         wif.id_usrio,
         vf.nmbre_trcro,
         vf.nmbre_ofcna,
         wif.estdo_instncia,
         vwf.cdgo_clnte
  from wf_g_instancias_flujo wif
  inner join v_wf_d_flujos        vwf on wif.id_fljo      = vwf.id_fljo
  inner join v_sg_g_usuarios      vu  on wif.id_usrio     = vu.id_usrio
  inner join v_df_c_funcionarios  vf  on vu.id_fncnrio    = vf.id_fncnrio;

