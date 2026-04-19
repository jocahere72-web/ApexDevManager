
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_G_ACTOS" ("ID_ACTO", "ID_DCMNTO", "CDGO_CLNTE", "CDGO_ACTO_ORGEN", "DSCRPCION_ACTO_ORGEN", "NMBRE_TBLA_ORGEN", "ID_ORGEN", "ID_UNDAD_PRDCTRA", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "INDCDOR_NTFCCION_ACTO", "INDCDOR_NTFCCION", "INDCDR_NTFCCION_ATMTCA", "INDCDOR_NTFCDO", "NMRO_ACTO", "ANIO", "NMRO_ACTO_DSPLAY", "VLOR", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE", "FILE_BFILE", "FCHA", "ID_USRIO", "ID_RPRTE", "FCHA_INCIO_NTFCCION", "ID_ACTO_RQRDO_NTFCCION", "FCHA_NTFCCION", "ID_FNCNRIO_FRMA", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "IDNTFCCION", "NMBRE_TRCRO", "ID_OFCNA", "NMBRE_OFCNA", "ID_CRGO", "NMBRE_CRGO", "ID_DCRTO_JSTFCCION_FRMA", "DSCRPCION_DCRTO_JSTFCCION_FRMA", "FILE_BLOB_NVO", "NTFCDO_PAG_WEB", "FCHA_PBLCCION", "CDGO_ACTO_TPO") AS
  select a.id_acto,
       a.id_dcmnto,
       a.cdgo_clnte,
       a.cdgo_acto_orgen,
       b.dscrpcion dscrpcion_acto_orgen,
       b.nmbre_tbla_orgen,
       a.id_orgen,
       a.id_undad_prdctra,
       a.id_acto_tpo,
       c.dscrpcion dscrpcion_acto_tpo,
       a.indcdor_ntfccion indcdor_ntfccion_acto,
       c.indcdor_ntfccion,
       c.indcdr_ntfccion_atmtca,
       a.indcdor_ntfccion indcdor_ntfcdo,
       a.nmro_acto,
       a.anio,
       a.nmro_acto_dsplay,
       a.vlor,
       dc.file_blob,
       dc.file_name,
       dc.file_mimetype,
       dc.file_bfile,
       a.fcha,
       a.id_usrio,
       a.id_rprte,
       a.fcha_incio_ntfccion,
       a.id_acto_rqrdo_ntfccion,
       a.fcha_ntfccion,
       a.id_fncnrio_frma,
       e.cdgo_idntfccion_tpo,
       e.dscrpcion_idntfccion_tpo,
       e.idntfccion,
       e.nmbre_trcro,
       e.id_ofcna,
       e.nmbre_ofcna,
       e.id_crgo,
       e.nmbre_crgo,
       d.id_dcrto_jstfccion_frma,
       (select dscrpcion
          from df_c_decretos m
         where m.id_dcrto = d.id_dcrto_jstfccion_frma) dscrpcion_dcrto_jstfccion_frma,
       dc.file_blob_nvo,
       a.ntfcdo_pag_web,
       a.fcha_pblccion,
       c.cdgo_acto_tpo
  from gn_g_actos a
  join gn_d_actos_origen b
    on a.cdgo_acto_orgen = b.cdgo_acto_orgen
  join gn_d_actos_tipo c
    on a.id_acto_tpo = c.id_acto_tpo
  left join gn_d_actos_funcionario_frma d
    on a.id_fncnrio_frma = d.id_fncnrio
   and a.id_acto_tpo = d.id_acto_tpo
   and a.fcha between d.fcha_incio and d.fcha_fin
   and actvo = 'S'
  join v_df_c_funcionarios e
    on a.id_fncnrio_frma = e.id_fncnrio
  left join gd_g_documentos dc
    on dc.id_dcmnto = a.id_dcmnto
;

