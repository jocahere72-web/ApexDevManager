
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TTLOS_JDCL_SLCTD_DTLL" ("CDGO_CLNTE", "ID_TTLO_JDCIAL_SLCTUD_DTLLE", "ID_TTLO_JDCIAL_SLCTUD", "CDGO_TTLO_JDCIAL_SLCTUD_TPO", "DSCRPCION", "FCHA_SLCTUD", "ID_USRIO", "IDNTFCCION", "NMBRE_TRCRO", "EMAIL", "TLFNO", "INDCDOR_SLCTUD_APRBDA", "DSCRPCION_INDCDOR_SLCTUD_APRBD", "FCHA_RSPSTA", "ID_TTLO_JDCIAL", "NMRO_TTLO_JDCIAL", "FCHA_CNSTTCION", "VLOR", "ID_TTLO_JDCIAL_AREA", "NMBRE_AREA", "CDGO_IDNTFCCION_TPO_DMNDDO", "IDNTFCCION_DMNDDO", "NMBRE_DMNDDO", "CDGO_ENTDAD_CNSGNNTE", "NMBRE_BNCO", "ID_BNCO_CNSGNNTE", "NMBRE_BNCO_CNSGNNTE", "CDGO_TTLO_JDCIAL_ESTDO", "DSCRPCION_TTLO_ESTDO", "ID_EMBRGO_RSLCION_GNRDORA", "ID_INSTNCIA_FLJO", "INDCDOR_SLCTUD_CNFRMCION") AS
  select c.cdgo_clnte,
		a.id_ttlo_jdcial_slctud_dtlle,
		a.id_ttlo_jdcial_slctud,
		b.cdgo_ttlo_jdcial_slctud_tpo,
		b.dscrpcion,
		b.fcha_slctud,
		b.id_usrio,
		b.idntfccion,
		b.nmbre_trcro,
		b.email,
		b.tlfno,
		b.indcdor_slctud_aprbda,
		b.dscrpcion_indcdor_slctud_aprbd,
		b.fcha_rspsta,
		a.id_ttlo_jdcial,
		c.nmro_ttlo_jdcial,
		c.fcha_cnsttcion,
		c.vlor,
		c.id_ttlo_jdcial_area,
		c.nmbre_area,
		c.cdgo_idntfccion_tpo_dmnddo,
		c.idntfccion_dmnddo,
		c.nmbre_dmnddo,
		c.cdgo_entdad_cnsgnnte,
		c.nmbre_bnco,
		c.id_bnco_cnsgnnte,
		c.nmbre_bnco_cnsgnnte,
		c.cdgo_ttlo_jdcial_estdo,
		c.dscrpcion_ttlo_estdo,
		c.id_embrgo_rslcion				id_embrgo_rslcion_gnrdora,
        c.id_instncia_fljo,
		b.indcdor_slctud_cnfrmcion
   from gf_g_ttlos_jdcl_slctd_dtll 			a
   join v_gf_g_titulos_jdcial_slctud		b on a.id_ttlo_jdcial_slctud		= b.id_ttlo_jdcial_slctud
   join v_gf_g_titulos_judicial				c on a.id_ttlo_jdcial				= c.id_ttlo_jdcial;

