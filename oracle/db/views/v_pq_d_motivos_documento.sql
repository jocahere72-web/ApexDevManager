
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_PQ_D_MOTIVOS_DOCUMENTO" ("ID_MTVO_DCMNTO", "ID_MTVO", "DSCRPCION_MTVO", "ID_RPRTE", "NMBRE_RPRTE", "CDGO_DCMNTO", "DSCRPCION_DCMNTO", "INDCDOR_OBLGTRIO", "DSCRPCION_INDCDOR_OBLGTRIO", "ACTVO", "DSCRPCION_ACTVO") AS
  select md.id_mtvo_dcmnto
      , m.id_mtvo
      , m.dscrpcion dscrpcion_mtvo
      , r.id_rprte
      , r.nmbre_rprte
      , d.cdgo_dcmnto
      , d.dscrpcion dscrpcion_dcmnto
      , md.indcdor_oblgtrio
      , decode(md.indcdor_oblgtrio,'S', 'Sí','N','No') dscrpcion_indcdor_oblgtrio
      , md.actvo
      , decode(md.actvo,'S', 'Sí','N','No') dscrpcion_actvo
   from pq_d_motivos_documento md
   join pq_d_motivos m
     on m.id_mtvo = md.id_mtvo
   LEFT join gn_d_reportes r
     on r.id_rprte = md.id_rprte
   join pq_d_documentos d
     on d.cdgo_dcmnto = md.cdgo_dcmnto;

