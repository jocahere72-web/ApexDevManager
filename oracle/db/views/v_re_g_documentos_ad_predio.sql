
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_DOCUMENTOS_AD_PREDIO" ("ID_DCMNTO_AD_PRDIO", "ID_DCMNTO", "NMRO_DCMNTO", "CDGO_PRDIO_CLSFCCION", "DSCRPCION_PRDIO_CLSFCCION", "ID_PRDIO_USO_SLO", "DSCRPCION_PRDIO_USO_SLO", "ID_PRDIO_DSTNO", "DSCRPCION_PRDIO_DSTNO", "NMTCNCO_PRDIO_DSTNO", "NMTCNCO_DSC_PRDIO_DSTNO", "CDGO_ESTRTO", "DSCRPCION_ESTRTO", "AREA_TRRNO", "AREA_CNSTRDA", "AREA_GRVBLE", "MTRCLA_INMBLRIA") AS
  select a.id_dcmnto_ad_prdio,
		a.id_dcmnto,
		b.nmro_dcmnto,
		a.cdgo_prdio_clsfccion,
		c.dscrpcion_prdio_clsfccion,
		a.id_prdio_uso_slo,
		d.dscrpcion									dscrpcion_prdio_uso_slo,
		a.id_prdio_dstno,
		e.dscrpcion									dscrpcion_prdio_dstno,
		e.nmtcnco									nmtcnco_prdio_dstno,
		e.nmtcnco || ' ' || e.dscrpcion 			nmtcnco_dsc_prdio_dstno,
		a.cdgo_estrto,
		f.dscrpcion_estrto,
		a.area_trrno,
		a.area_cnstrda,
		a.area_grvble,
		a.mtrcla_inmblria
   from re_g_documentos_ad_predio 	a
   join v_re_g_documentos			b on a.id_dcmnto			= b.id_dcmnto
   join df_s_predios_clasificacion 	c on a.cdgo_prdio_clsfccion = c.cdgo_prdio_clsfccion
   join df_c_predios_uso_suelo		d on a.id_prdio_uso_slo 	= d.id_prdio_uso_slo
   join df_i_predios_destino		e on a.id_prdio_dstno		= e.id_prdio_dstno
   join df_s_estratos				f on a.cdgo_estrto			= f.cdgo_estrto;

