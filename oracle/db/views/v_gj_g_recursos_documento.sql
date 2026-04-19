
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GJ_G_RECURSOS_DOCUMENTO" ("ID_RCRSO_DCMNTO", "ID_RCRSO", "ID_FLJO_TREA", "ID_PLNTLLA", "DSCRPCION_PLNTLLA", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "ID_ACTO", "ID_ACTO_TPO_GNRDO", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "DSCRPCION_ACTO_TPO_GNRDO", "ID_ACTO_RQRDO", "TXTO_DCMNTO", "ID_USRIO_GNRCION", "ID_USRIO_AUTRZA") AS
  select a.id_rcrso_dcmnto,
         a.id_rcrso,
         a.id_fljo_trea,
         a.id_plntlla,
         c.dscrpcion dscrpcion_plntlla,
         a.id_acto_tpo,
         e.dscrpcion dscrpcion_acto_tpo,
         a.id_acto,
         d.id_acto_tpo id_acto_tpo_gnrdo,
         d.nmro_acto,
         d.nmro_acto_dsplay,
         d.dscrpcion_acto_tpo dscrpcion_acto_tpo_gnrdo,
         a.id_acto_rqrdo,
         a.txto_dcmnto,
         a.id_usrio_gnrcion,
         a.id_usrio_autrza
  from gj_g_recursos_documento  a
  left join gn_d_plantillas     c on a.id_plntlla = c.id_plntlla
  left join v_gn_g_actos        d on a.id_acto = d.id_acto
  left join gn_d_actos_tipo     e on a.id_acto_tpo = e.id_acto_tpo
;

