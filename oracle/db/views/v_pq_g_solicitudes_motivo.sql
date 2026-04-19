
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_PQ_G_SOLICITUDES_MOTIVO" ("ID_SLCTUD_MTVO", "ID_SLCTUD", "ID_MTVO", "CDGO_CLNTE", "DSCRPCION_MTVO", "INDCDOR_FCHA_RSPSTA", "ACTVO", "OBSRVCION") AS
  select s.id_slctud_mtvo,
         s.id_slctud,
         s.id_mtvo,
         m.cdgo_clnte,
         m.dscrpcion dscrpcion_mtvo,
         m.indcdor_fcha_rspsta,
         m.actvo,
         so.obsrvcion
  from pq_g_solicitudes_motivo s
  join pq_d_motivos      m  on s.id_mtvo = m.id_mtvo
  left join pq_g_solicitudes_obsrvcion so on s.id_slctud = so.id_slctud
;

