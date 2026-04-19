
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_INFORMACION_EXOGENA" ("ID_INFRMCION_EXGNA", "CDGO_CLNTE", "ID_SJTO_IMPSTO", "ID_IMPSTO", "NMBRE_IMPSTO", "VGNCIA", "ID_EXGNA_ARCHVO_TPO", "NMBRE_EXGNA_ARCHVO_TPO", "DSCRPCION_EXGNA_ARCHVO_TPO", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE", "TMNO_BLOB", "USER_DGTA", "FCHA_DGTA", "USER_MDFCA", "FCHA_MDFCA", "INDCDOR_PRCSDO", "INDCDR_CRRCCION", "ACTVO", "INDCDOR_EXTMPRNEO", "ID_PRDO", "PRDO", "DSCRPCION_PRDO") AS
  select a.id_infrmcion_exgna,
       a.cdgo_clnte,
       a.id_sjto_impsto,
       a.id_impsto,
       c.nmbre_impsto,
       a.vgncia,
       a.id_exgna_archvo_tpo,
       b.nmbre nmbre_exgna_archvo_tpo,
       b.dscrpcion dscrpcion_exgna_archvo_tpo,
       a.file_blob,
       a.file_name,
       a.file_mimetype,
       to_char(dbms_lob.getlength(a.file_blob) / 1024 / 1024,
               '999g999g999g999g990d000') || ' mb' tmno_blob,
       a.user_dgta,
       a.fcha_dgta,
       a.user_mdfca,
       a.fcha_mdfca,
       a.indcdor_prcsdo,
       a.indcdr_crrccion,
       a.actvo,
       a.indcdor_extmprneo,
       a.id_prdo,
       d.prdo,
       d.dscrpcion dscrpcion_prdo
  from gi_g_informacion_exogena a
  join df_i_exogena_archivo_tipo b
    on a.id_exgna_archvo_tpo = b.id_exgna_archvo_tpo
  join df_c_impuestos c
    on a.id_impsto = c.id_impsto
  left join df_i_periodos d
    on d.id_prdo = a.id_prdo
;

