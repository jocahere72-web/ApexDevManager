
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GJ_G_RECURSOS_DETALLE" ("ID_RCRSO_DTLLE", "ID_RCRSO", "ID_FLJO_TREA", "OBSRVCION", "ID_USRIO", "NMBRE_TRCRO_USRIO", "FCHA") AS
  select  a.id_rcrso_dtlle,
          a.id_rcrso,
          a.id_fljo_trea,
          a.obsrvcion,
          a.id_usrio,
          c.nmbre_trcro nmbre_trcro_usrio,
          a.fcha
  from gj_g_recursos_detalle a
  inner join v_gj_g_recursos b on a.id_rcrso = b.id_rcrso
  inner join v_sg_g_usuarios c on a.id_usrio = c.id_usrio
;

