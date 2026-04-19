
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TITULOS_JDCIAL_ANLSIS" ("CDGO_CLNTE", "ID_TTLO_JDCIAL_ANLSIS", "ID_TTLO_JDCIAL", "NMRO_TTLO_JDCIAL", "FCHA_CNSTTCION", "VLOR", "ID_TTLO_JDCIAL_AREA", "NMBRE_AREA", "CDGO_IDNTFCCION_TPO_DMNDDO", "IDNTFCCION_DMNDDO", "NMBRE_DMNDDO", "CDGO_ENTDAD_CNSGNNTE", "NMBRE_BNCO", "ID_BNCO_CNSGNNTE", "NMBRE_BNCO_CNSGNNTE", "CDGO_TTLO_JDCIAL_ESTDO", "DSCRPCION_TTLO_ESTDO", "ID_EMBRGO_RSLCION_GNRDORA", "INDCDOR_APLCCION", "DSCRPCION_INDCDOR_APLCCION", "ID_EMBRGO_RSLCION", "ID_ACTO_EMBRGO_RSLCION", "FCHA_ACTO_EMBRGO_RSLCION", "NMRO_ACTO_EMBRGO_RSLCION", "CDGO_MDDA_CTLAR_ESTDO", "DSCRPCION_MDDA_CTLAR_ESTDO", "CDGO_TTLO_JDCIAL_SLCTUD_TPO", "DSCRPCION_TTLO_JDCIAL_SLCTD_TP", "ID_USRIO", "IDNTFCCION", "NMBRE_TRCRO", "EMAIL", "TLFNO", "FCHA") AS
  select b.cdgo_clnte,
		a.id_ttlo_jdcial_anlsis,
		a.id_ttlo_jdcial,
		b.nmro_ttlo_jdcial,
		b.fcha_cnsttcion,
		b.vlor,
		b.id_ttlo_jdcial_area,
		b.nmbre_area,
		b.cdgo_idntfccion_tpo_dmnddo,
		b.idntfccion_dmnddo,
		b.nmbre_dmnddo,
		b.cdgo_entdad_cnsgnnte,
		b.nmbre_bnco,
		b.id_bnco_cnsgnnte,
		b.nmbre_bnco_cnsgnnte,
		b.cdgo_ttlo_jdcial_estdo,
		b.dscrpcion_ttlo_estdo,
		b.id_embrgo_rslcion 		id_embrgo_rslcion_gnrdora,
		a.indcdor_aplccion,
		decode(a.indcdor_aplccion, 'C', 'Cartera', 'M', 'Medida Cautelar') dscrpcion_indcdor_aplccion,
		a.id_embrgo_rslcion,
		d.id_acto					id_acto_embrgo_rslcion,
		d.fcha_acto					fcha_acto_embrgo_rslcion,
		d.nmro_acto					nmro_acto_embrgo_rslcion,
		e.cdgo_estdos_crtra         as cdgo_mdda_ctlar_estdo,
		e.dscrpcion					dscrpcion_mdda_ctlar_estdo,
		a.cdgo_ttlo_jdcial_slctud_tpo,
		f.dscrpcion					dscrpcion_ttlo_jdcial_slctd_tp,
		a.id_usrio,
		c.idntfccion,
		c.nmbre_trcro,
		c.email,
		c.tlfno,
		a.fcha
   from gf_g_titulos_jdcial_anlsis			a
   join v_gf_g_titulos_judicial				b on a.id_ttlo_jdcial				= b.id_ttlo_jdcial
   join v_sg_g_usuarios						c on a.id_usrio						= c.id_usrio
   left join mc_g_embargos_resolucion		d on a.id_embrgo_rslcion			= d.id_embrgos_rslcion
   left join mc_d_estados_cartera			e on a.id_estdo_crtra			    = e.id_estdos_crtra
   left join gf_d_ttlos_jdcial_slctud_tp	f on a.cdgo_ttlo_jdcial_slctud_tpo	= f.cdgo_ttlo_jdcial_slctud_tpo;

