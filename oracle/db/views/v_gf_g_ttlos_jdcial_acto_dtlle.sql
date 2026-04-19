
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TTLOS_JDCIAL_ACTO_DTLLE" ("ID_TTLO_JDCIAL_DCMNTO", "ID_ACTO", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "FCHA_ACTO", "ID_TTLO_JDCIAL_SLCTUD", "CDGO_TTLO_JDCIAL_SLCTUD_TPO", "DSCRPCION", "FCHA_SLCTUD", "ID_USRIO", "IDNTFCCION", "NMBRE_TRCRO", "EMAIL", "TLFNO", "INDCDOR_SLCTUD_APRBDA", "DSCRPCION_INDCDOR_SLCTUD_APRBD", "FCHA_RSPSTA", "ID_TTLO_JDCIAL", "NMRO_TTLO_JDCIAL", "FCHA_CNSTTCION", "VLOR", "ID_TTLO_JDCIAL_AREA", "NMBRE_AREA", "CDGO_IDNTFCCION_TPO_DMNDDO", "IDNTFCCION_DMNDDO", "NMBRE_DMNDDO", "CDGO_ENTDAD_CNSGNNTE", "NMBRE_BNCO", "ID_BNCO_CNSGNNTE", "NMBRE_BNCO_CNSGNNTE", "CDGO_TTLO_JDCIAL_ESTDO", "DSCRPCION_TTLO_ESTDO", "ID_EMBRGO_RSLCION_GNRDORA") AS
  select a.id_ttlo_jdcial_dcmnto,
		a.id_acto,
		b.nmro_acto,
		b.nmro_acto_dsplay,
		b.fcha fcha_acto,
		c.id_ttlo_jdcial_slctud,
		d.cdgo_ttlo_jdcial_slctud_tpo,
		d.dscrpcion,
		d.fcha_slctud,
		d.id_usrio,
		d.idntfccion,
		d.nmbre_trcro,
		d.email,
		d.tlfno,
		d.indcdor_slctud_aprbda,
		d.dscrpcion_indcdor_slctud_aprbd,
		d.fcha_rspsta,
		e.id_ttlo_jdcial,
		e.nmro_ttlo_jdcial,
		e.fcha_cnsttcion,
		e.vlor,
		e.id_ttlo_jdcial_area,
		e.nmbre_area,
		e.cdgo_idntfccion_tpo_dmnddo,
		e.idntfccion_dmnddo,
		e.nmbre_dmnddo,
		e.cdgo_entdad_cnsgnnte,
		e.nmbre_bnco,
		e.id_bnco_cnsgnnte,
		e.nmbre_bnco_cnsgnnte,
		e.cdgo_ttlo_jdcial_estdo,
		e.dscrpcion_ttlo_estdo,
		e.id_embrgo_rslcion_gnrdora
   from gf_g_titulos_jdcial_dcmnto			a
   join gn_g_actos 							b on a.id_acto 		= b.id_acto
   join gf_g_ttlos_jdcl_dcmnt_slctd         c on a.id_ttlo_jdcial_dcmnto = c.id_ttlo_jdcial_dcmnto
   join v_gf_g_titulos_jdcial_slctud		d on c.id_ttlo_jdcial_slctud = d.id_ttlo_jdcial_slctud
   join v_gf_g_ttlos_jdcl_slctd_dtll		e on d.id_ttlo_jdcial_slctud = e.id_ttlo_jdcial_slctud;

