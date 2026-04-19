
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_JRDCO_RSPNSBLE" ("ID_PRCSOS_JRDCO_RSPNSBLE", "ID_PRCSOS_JRDCO", "IDNTFCCION", "CDGO_IDNTFCCION_TPO", "NMTCNCO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "NMBRE_CMPLTO", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "TLFNO", "CLLAR", "EMAIL", "DRCCION_NTFCCION", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO", "ID_PAIS_NTFCCION", "NMBRE_PAIS", "CDGO_CLNTE", "CDGO_PRCSOS_JRDCO_ESTDO", "PRNCPAL_S_N", "ACTVO") AS
  select a.id_prcsos_jrdco_rspnsble,
       a.id_prcsos_jrdco,
       a.idntfccion,
       a.cdgo_idntfccion_tpo,
       b.nmtcnco_idntfccion_tpo,
       b.dscrpcion_idntfccion_tpo,
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
       g.nmbre_dprtmnto,
       a.id_mncpio_ntfccion,
       h.nmbre_mncpio,
       a.id_pais_ntfccion,
       f.nmbre_pais,
       c.cdgo_clnte,
       c.cdgo_prcsos_jrdco_estdo,
       a.prncpal_s_n,
       a.actvo
from cb_g_procesos_jrdco_rspnsble a
inner join cb_g_procesos_juridico c on c.id_prcsos_jrdco = a.id_prcsos_jrdco
left join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo  = b.cdgo_idntfccion_tpo
left join df_s_paises                f on a.id_pais_ntfccion     = f.id_pais
left join df_s_departamentos         g on a.id_dprtmnto_ntfccion = g.id_dprtmnto
left join df_s_municipios            h on a.id_mncpio_ntfccion   = h.id_mncpio;

