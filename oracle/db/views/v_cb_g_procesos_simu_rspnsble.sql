
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_SIMU_RSPNSBLE" ("ID_PRCSOS_SMU_RSPNSBLE", "ID_PRCSOS_SMU_SJTO", "CDGO_IDNTFCCION_TPO", "IDNTFCCION", "NMBRE_CMPLTO", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "PRNCPAL_S_N", "CDGO_TPO_RSPNSBLE", "PRCNTJE_PRTCPCION", "ID_PAIS_NTFCCION", "ID_MNCPIO_NTFCCION", "ID_DPRTMNTO_NTFCCION", "DRCCION_NTFCCION", "EMAIL", "TLFNO", "CLLAR", "CDGO_ORGEN_RSPNSBLE") AS
  select r.id_prcsos_smu_rspnsble as id_prcsos_smu_rspnsble,
    r.id_prcsos_smu_sjto,
    r.cdgo_idntfccion_tpo,
    r.idntfccion,
    trim(trim(r.prmer_nmbre)||' '||trim(nvl(r.sgndo_nmbre,''))||' '||trim(nvl(replace(r.prmer_aplldo,'.',''),''))||' '||trim(nvl(r.sgndo_aplldo,''))) as nmbre_cmplto,
    r.prmer_nmbre,
    r.sgndo_nmbre,
    r.prmer_aplldo,
    r.sgndo_aplldo,
    r.prncpal_s_n,
    r.cdgo_tpo_rspnsble,
    r.prcntje_prtcpcion,
    r.id_pais_ntfccion,
    r.id_mncpio_ntfccion,
    r.id_dprtmnto_ntfccion,
    r.drccion_ntfccion,
    r.email,
    r.tlfno,
    r.cllar,
    'EX' as cdgo_orgen_rspnsble
  from cb_g_procesos_simu_rspnsble r
  union
  select  r.id_prcsos_smu_rspnsbl_inx as id_prcsos_smu_rspnsble,
      r.id_prcsos_smu_sjto_inxstnte as id_prcsos_smu_sjto,
      r.cdgo_idntfccion_tpo,
      r.idntfccion,
      trim(trim(r.prmer_nmbre)||' '||trim(nvl(r.sgndo_nmbre,''))||' '||trim(nvl(replace(r.prmer_aplldo,'.',''),''))||' '||trim(nvl(r.sgndo_aplldo,''))) as nmbre_cmplto,
      r.prmer_nmbre,
      r.sgndo_nmbre,
      r.prmer_aplldo,
      r.sgndo_aplldo,
      r.prncpal_s_n,
      r.cdgo_tpo_rspnsble,
      r.prcntje_prtcpcion,
      r.id_pais_ntfccion,
      r.id_mncpio_ntfccion,
      r.id_dprtmnto_ntfccion,
      r.drccion_ntfccion,
      r.email,
      r.tlfno,
      r.cllar,
      'NE' as cdgo_orgen_rspnsble
from cb_g_prcss_simu_rspnsbl_inx r
;

