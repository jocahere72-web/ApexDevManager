
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_DOCUMENTOS_RESPONSABLE" ("ID_DCMNTO_RSPNSBLE", "ID_DCMNTO", "NMRO_DCMNTO", "ID_SJTO_IMPSTO", "CDGO_IDNTFCCION_TPO", "NMTCNCO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "IDNTFCCION", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "NMBRE_RZON_SCIAL", "PRNCPAL_S_N", "DSCRPCION_PRNCPAL_S_N", "CDGO_TPO_RSPNSBLE", "PRCNTJE_PRTCPCION", "ORGEN_DCMNTO") AS
  select a.id_dcmnto_rspnsble,
		a.id_dcmnto,
		b.nmro_dcmnto,
		a.id_sjto_impsto,
		a.cdgo_idntfccion_tpo,
		c.nmtcnco_idntfccion_tpo,
		c.dscrpcion_idntfccion_tpo ,
		a.idntfccion,
		a.prmer_nmbre,
		a.sgndo_nmbre,
		a.prmer_aplldo,
		a.sgndo_aplldo,
		a.prmer_nmbre || ' ' ||a.sgndo_nmbre  || ' ' ||a.prmer_aplldo || ' ' ||a.sgndo_aplldo nmbre_rzon_scial,
		a.prncpal_s_n,
		decode (a.prncpal_s_n, 'S', 'Si', 'N', 'No') dscrpcion_prncpal_s_n,
		a.cdgo_tpo_rspnsble,
		a.prcntje_prtcpcion,
		a.orgen_dcmnto
   from re_g_documentos_responsable a
   join v_re_g_documentos			b on a.id_dcmnto			= b.id_dcmnto
   join df_s_identificaciones_tipo	c on a.cdgo_idntfccion_tpo	= c.cdgo_idntfccion_tpo;

