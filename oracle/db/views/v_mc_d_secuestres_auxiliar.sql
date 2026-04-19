
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_D_SECUESTRES_AUXILIAR" ("ID_SCSTRS_AUXLR", "ID_FNCNRIO", "CDGO_CLNTE", "ACTVO", "ID_TRCRO", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "NMTCNCO_IDNTFCCION_TPO", "IDNTFCCION", "NMBRE_TRCRO") AS
  select a.id_scstrs_auxlr,
        a.id_fncnrio,
        a.cdgo_clnte,
        a.actvo,
        b.id_trcro,
        b.cdgo_idntfccion_tpo,
        b.dscrpcion_idntfccion_tpo,
        c.nmtcnco_idntfccion_tpo,
        b.idntfccion,
        b.nmbre_trcro
 from mc_d_secuestres_auxiliar a
 inner join v_df_c_funcionarios b on b.cdgo_clnte = a.cdgo_clnte
                                 and b.id_fncnrio = a.id_fncnrio
 inner join df_s_identificaciones_tipo c on c.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo;

