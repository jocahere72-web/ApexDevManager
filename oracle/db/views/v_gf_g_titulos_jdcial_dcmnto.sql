
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TITULOS_JDCIAL_DCMNTO" ("ID_TTLO_JDCIAL_DCMNTO_ASCCN", "ID_TTLO_JDCIAL_DCMNTO", "ID_TTLO_JDCIAL", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "ID_PLNTLLA", "DSCRPCION_PLNTLLA", "ID_RPRTE", "NMBRE_RPRTE", "NMBRE_PLNTLLA", "NMBRE_CNSLTA", "ID_ACTO", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "FCHA_ACTO", "DCMNTO", "FILE_BLOB", "INDCDOR_ACTO_CNFRMCION") AS
  select b.id_ttlo_jdcial_dcmnto_asccn,
       b.id_ttlo_jdcial_dcmnto,
       b.id_ttlo_jdcial,
       a.id_acto_tpo,
       e.dscrpcion             dscrpcion_acto_tpo,
       a.id_plntlla,
       c.dscrpcion             dscrpcion_plntlla,
       a.id_rprte,
       d.nmbre_rprte,
       d.nmbre_plntlla,
       d.nmbre_cnslta,
       a.id_acto,
       f.nmro_acto,
       f.nmro_acto_dsplay,
       f.fcha                  fcha_acto,
       a.dcmnto,
       f.file_blob,
       a.indcdor_acto_cnfrmcion
  from gf_g_ttls_jdcl_dcmnt_asccn b
  join gf_g_titulos_jdcial_dcmnto a on b.id_ttlo_jdcial_dcmnto = a.id_ttlo_jdcial_dcmnto
  join gn_d_plantillas c
    on a.id_plntlla = c.id_plntlla
  join gn_d_reportes d
    on a.id_rprte = d.id_rprte
  left join gn_d_actos_tipo e
    on a.id_acto_tpo = e.id_acto_tpo
  left join v_gn_g_actos f
    on a.id_acto = f.id_acto;

