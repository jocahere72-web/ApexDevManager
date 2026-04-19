
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_G_NOTFCCNES_GN_G_ACTOS" ("ID_ACTO", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "CDGO_ACTO_ORGEN", "DSCRPCION_ACTO_ORGEN", "NMBRE_TBLA_ORGEN", "ID_ORGEN", "ID_UNDAD_PRDCTRA", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "ANIO", "FCHA", "FILE_NAME", "ID_USRIO", "ID_ACTO_RQRDO_NTFCCION", "FCHA_INCIO_NTFCCION", "INDCDOR_NTFCDO", "INDCDR_NTFCCION_ATMTCA", "CDGO_ESTDO", "DSCRPCION_CDGO_ESTDO", "ID_NTFCCION", "CNTDAD_NTFCCNES_DET", "CDGO_CLNTE") AS
  select a.id_acto,
	   a.nmro_acto,
       a.nmro_acto_dsplay,
       a.cdgo_acto_orgen,
       a.dscrpcion_acto_orgen,
       a.nmbre_tbla_orgen,
       a.id_orgen,
       a.id_undad_prdctra,
       a.id_acto_tpo,
       a.dscrpcion_acto_tpo,
       a.anio,
       a.fcha,
       a.file_name,
	   a.id_usrio,
	   a.id_acto_rqrdo_ntfccion,
	   a.fcha_incio_ntfccion,
       a.indcdor_ntfcdo,
       a.indcdr_ntfccion_atmtca,
       b.cdgo_estdo,
       c.dscrpcion as dscrpcion_cdgo_estdo,
       b.id_ntfccion,
       nvl(d.cntdad_ntfccnes,0) as cntdad_ntfccnes_det,
       a.cdgo_clnte
    from v_gn_g_actos a
    left join nt_g_notificaciones         b on a.id_acto    = b.id_acto
    left join nt_d_estado         c on b.cdgo_estdo = c.cdgo_estdo
    left join ( select id_ntfccion, count(*) cntdad_ntfccnes
  			  from nt_g_notificaciones_detalle
  			  group by id_ntfccion) d on b.id_ntfccion = d.id_ntfccion
    where a.indcdor_ntfccion = 'S';

