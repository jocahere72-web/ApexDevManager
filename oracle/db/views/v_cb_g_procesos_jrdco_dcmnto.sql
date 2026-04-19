
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_JRDCO_DCMNTO" ("ID_PRCSOS_JRDCO", "ID_INSTNCIA_FLJO", "NMRO_PRCSO_JRDCO", "CDGO_PRCSOS_JRDCO_ESTDO", "ID_PRCSO_JRDCO_LTE", "VLOR_TTAL_DDA", "FCHA", "FNCNRIO_PRCSO", "FNCNRIO_RSPNSBLE", "ID_PRCSOS_JRDCO_DCMNTO", "ID_ACTO_TPO", "FCHA_DCMNTO", "NOMBRE_ETPA", "ID_ETPA", "INDCDOR_PROCSAR_ESTDO", "ID_FLJO_TREA_ESTDO", "ESTDO_ETPA", "ESTDO_ETPA_VSBLE", "ID_USRIO", "ID_FNCNRIO_FIRMA", "NMBRE_FNCNRIO_FIRMA", "DRCCION", "ID_SJTO", "IDNTFCCION", "IDNTFCCION_ANTRIOR", "CDGO_CLNTE", "FCHA_NTFCCION", "DSCRPCION_ACTO_TPO", "INDCDOR_NTFCCION", "INDCDOR_NTFCDO", "NMRO_ACTO_DSPLAY", "NMRO_ACTO", "ID_ACTO", "FCHA_ACTO", "FILE_BLOB", "FILE_MIMETYPE", "FILE_NAME", "ID_PLNTLLA", "VLDAR_ESTDO", "ACTVO", "ID_DCMNTO") AS
  select a.id_prcsos_jrdco,
       a.id_instncia_fljo,
       a.nmro_prcso_jrdco,
       a.cdgo_prcsos_jrdco_estdo,
       a.id_prcso_jrdco_lte,
       a.vlor_ttal_dda,
       a.fcha,
       a.id_fncnrio as fncnrio_prcso,
       i.nmbre_trcro as fncnrio_rspnsble,
       c.id_prcsos_jrdco_dcmnto,
       c.id_acto_tpo,
       c.fcha_acto as fcha_dcmnto,
       d.nmbre_trea nombre_etpa,
       d.id_fljo_trea id_etpa,
       d.indcdor_procsar_estdo,
       e.id_fljo_trea_estdo,
       e.dscrpcion estdo_etpa,
       e.dscrpcion_vsble estdo_etpa_vsble,
       f.id_usrio,
       f.id_fncnrio as id_fncnrio_firma,
       f.nmbre_trcro as nmbre_fncnrio_firma,
       b.drccion,
       b.id_sjto,
       b.idntfccion_sjto idntfccion,
       b.idntfccion_antrior,
       b.cdgo_clnte,
       g.fcha_ntfccion,
       g.dscrpcion_acto_tpo,
       g.indcdor_ntfccion,
       g.indcdor_ntfcdo,
       g.nmro_acto_dsplay,
       g.nmro_acto,
       g.id_acto,
       g.fcha fcha_acto,
       g.file_blob,
       g.file_mimetype,
       g.file_name,
       h.id_plntlla,
       pkg_cb_proceso_juridico.fnc_vl_estado_inicial(d.id_fljo_trea,
                                                     e.id_fljo_trea_estdo) vldar_estdo,
       c.actvo,
       g.id_dcmnto
  from cb_g_procesos_juridico a
  join v_cb_g_procesos_juridico_sjto b
    on b.id_prcsos_jrdco = a.id_prcsos_jrdco
  join cb_g_procesos_jrdco_dcmnto c
    on a.id_prcsos_jrdco = c.id_prcsos_jrdco
  join v_wf_d_flujos_tarea d
    on c.id_fljo_trea = d.id_fljo_trea
  left join wf_d_flujos_tarea_estado e
    on d.id_fljo_trea = e.id_fljo_trea
   and c.id_estdo_trea = e.id_fljo_trea_estdo
  left join v_sg_g_usuarios f
    on f.id_fncnrio = c.funcionario_firma
  join v_sg_g_usuarios i
    on a.id_fncnrio = i.id_fncnrio
  left join v_gn_g_actos g
    on g.id_acto = c.id_acto
  left join cb_g_prcsos_jrdc_dcmnt_plnt h
    on h.id_prcsos_jrdco_dcmnto = c.id_prcsos_jrdco_dcmnto
/*where a.cdgo_prcsos_jrdco_estdo = 'A'*/
;

