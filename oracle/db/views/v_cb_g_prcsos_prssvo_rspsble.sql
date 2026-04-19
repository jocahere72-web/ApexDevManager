
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PRCSOS_PRSSVO_RSPSBLE" ("ID_PRCSOS_PRSSVO_RSPNSBLE", "ID_PRCSOS_PRSSVO", "IDNTFCCION", "CDGO_IDNTFCCION_TPO", "NMTCNCO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "NMBRE_CMPLTO", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "TLFNO", "CLLAR", "EMAIL", "DRCCION_NTFCCION", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO", "ID_PAIS_NTFCCION", "NMBRE_PAIS", "CDGO_CLNTE", "CDGO_PRCSO_ESTDO", "PRNCPAL_S_N", "ACTVO") AS
  select a.id_prcsos_prssvo_rspnsble,
       a.id_prcsos_prssvo,
       a.idntfccion,
       a.cdgo_idntfccion_tpo,
       c.nmtcnco_idntfccion_tpo,
       c.dscrpcion_idntfccion_tpo,
       trim(trim(a.prmer_nmbre)||' '||trim(nvl(a.sgndo_nmbre,''))||' '||trim(nvl(replace(a.prmer_aplldo,'.',''),''))||' '||trim(nvl(a.sgndo_aplldo,''))) as nmbre_cmplto,
       a.prmer_nmbre,
       a.sgndo_nmbre,
       a.prmer_aplldo,
       a.sgndo_aplldo,
       a.tlfno,
       a.cllar,
       a.email,
       a.drccion_ntfccion,
       a.id_dprtmnto_ntfccion,
       e.nmbre_dprtmnto,
       a.id_mncpio_ntfccion,
       f.nmbre_mncpio,
       a.id_pais_ntfccion,
       d.nmbre_pais,
       b.cdgo_clnte,
       b.cdgo_prcso_estdo,
       a.prncpal_s_n,
       a.actvo
from cb_g_prcsos_prssvo_rspsble a
inner join cb_g_procesos_persuasivo b on b.id_prcsos_prssvo = a.id_prcsos_prssvo
left join df_s_identificaciones_tipo c on a.cdgo_idntfccion_tpo  = c.cdgo_idntfccion_tpo
left join df_s_paises                d on a.id_pais_ntfccion     = d.id_pais
left join df_s_departamentos         e on a.id_dprtmnto_ntfccion = e.id_dprtmnto
left join df_s_municipios            f on a.id_mncpio_ntfccion   = f.id_mncpio;

