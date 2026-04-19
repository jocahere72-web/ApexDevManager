
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_D_SECUESTRES" ("ID_SCSTRE", "CDGO_CLNTE", "CDGO_IDNTFCCION_TPO", "NMTCNCO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "DRCCION", "TLFNO", "CLLAR", "EMAIL", "IDNTFCCION", "ACTVO", "NMBRE_CMPLTO") AS
  select a.id_scstre,
        a.cdgo_clnte,
        a.cdgo_idntfccion_tpo,
        b.nmtcnco_idntfccion_tpo,
        b.dscrpcion_idntfccion_tpo,
        a.drccion,
        a.tlfno,
        a.cllar,
        a.email,
        a.idntfccion,
        a.actvo,
        a.nmbre_cmplto
from mc_d_secuestres a
inner join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo;

