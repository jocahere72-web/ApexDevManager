
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TITULOS_JUDICIAL_CRGDO" ("CDGO_CLNTE", "ID_TTLO_JDCIAL_CRGDO", "NMRO_TTLO", "FCHA_CNSTTCION", "VLOR", "CDGO_IDNTFCCION_TPO_DMNDO", "IDNTFCCION_DMNDO", "NMBRE_DMNDO", "NMRO_TTLO_PDRE", "CDGO_ENTDAD_CNSGNNTE", "CDGO_TTLO_JDCIAL_CRGDO_ESTDO", "DSCRPCION", "ID_PRCSO_CRGA", "FCHA_RGSTRO", "ID_USRIO", "INDCDOR_PRCSDO", "ID_CRGA", "NMBRE_CRGA", "CDGO_ARCHVO_TPO", "DSCRPCION_ARCHVO_TPO", "FILE_NAME", "CDGO_PRCSO_ESTDO", "DSCRPCION_ESTDO_PRCSO", "ID_PRCSO_INTRMDIA", "NMERO_LNEA") AS
  select c.cdgo_clnte,
		a.id_ttlo_jdcial_crgdo,
		a.nmro_ttlo,
		a.fcha_cnsttcion,
		a.vlor,
		a.cdgo_idntfccion_tpo_dmndo,
		a.idntfccion_dmndo,
		a.nmbre_dmndo,
		a.nmro_ttlo_pdre,
		a.cdgo_entdad_cnsgnnte,
		b.cdgo_ttlo_jdcial_crgdo_estdo,
		b.dscrpcion,
		c.id_prcso_crga,
		c.fcha_rgstro,
		c.id_usrio,
		c.indcdor_prcsdo,
		c.id_crga,
		c.nmbre_crga,
		c.cdgo_archvo_tpo,
		c.dscrpcion_archvo_tpo,
		c.file_name,
		c.cdgo_prcso_estdo,
		c.dscrpcion_estdo_prcso,
		a.id_prcso_intrmdia,
		a.nmero_lnea
	from gf_g_titulos_judicial_crgdo	a
	join gf_d_ttlos_jdcial_crgdo_est	b on a.cdgo_ttlo_jdcial_crgdo_estdo		= b.cdgo_ttlo_jdcial_crgdo_estdo
	join v_et_g_procesos_carga			c on a.id_prcso_crga					= c.id_prcso_crga;

