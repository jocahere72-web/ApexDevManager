
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_PQ_G_DOCUMENTOS_HIST" ("ID_DCMNTO_HIST", "ID_DCMNTO", "ID_SLCTUD", "ID_MTVO_DCMNTO", "CDGO_DCMNTO", "DSCRPCION", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE", "FILE_BFILE", "OBSRVCION", "FCHA", "INDCDOR_ACTLZAR", "ACTVO", "FCHA_RGSTRO", "ID_USRIO_RGSTRA") AS
  select a.id_dcmnto_hist
    , a.id_dcmnto
      , a.id_slctud
      , a.id_mtvo_dcmnto
      , c.cdgo_dcmnto
      , c.dscrpcion
      , a.file_blob
      , a.file_name
      , a.file_mimetype
      , a.file_bfile
      , a.obsrvcion
      , a.fcha
      , a.indcdor_actlzar
      , a.actvo
    , a.fcha_rgstro
    , a.id_usrio_rgstra
   from pq_g_documentos_hist   a
   join pq_d_motivos_documento   b on b.id_mtvo_dcmnto = a.id_mtvo_dcmnto
   join pq_d_documentos     c on c.cdgo_dcmnto = b.cdgo_dcmnto
;

