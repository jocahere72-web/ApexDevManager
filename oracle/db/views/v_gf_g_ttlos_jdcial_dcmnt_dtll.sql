
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TTLOS_JDCIAL_DCMNT_DTLL" ("ID_TTLO_JDCIAL_DCMNTO", "ID_TTLO_JDCIAL", "NMRO_TTLO_JDCIAL", "FCHA_CNSTTCION", "VLOR", "ID_TTLO_JDCIAL_AREA", "NMBRE_AREA", "CDGO_IDNTFCCION_TPO_DMNDDO", "IDNTFCCION_DMNDDO", "NMBRE_DMNDDO", "CDGO_ENTDAD_CNSGNNTE", "NMBRE_BNCO", "ID_BNCO_CNSGNNTE", "NMBRE_BNCO_CNSGNNTE", "CDGO_TTLO_JDCIAL_ESTDO", "DSCRPCION_TTLO_ESTDO", "ID_EMBRGO_RSLCION_GNRDORA", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "ID_PLNTLLA", "DSCRPCION_PLNTLLA", "ID_RPRTE", "NMBRE_RPRTE", "NMBRE_PLNTLLA", "NMBRE_CNSLTA", "ID_ACTO", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "FCHA_ACTO", "DCMNTO") AS
  select a.id_ttlo_jdcial_dcmnto,
		/*a.id_ttlo_jdcial_slctud,
		b.cdgo_ttlo_jdcial_slctud_tpo,
		b.dscrpcion,
		b.fcha_slctud,
		b.id_usrio,
		b.nmbre_trcro,
		b.indcdor_slctud_aprbda,
		b.dscrpcion_indcdor_slctud_aprbd,
		b.fcha_rspsta,	*/
		c.id_ttlo_jdcial,
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
		c.id_embrgo_rslcion_gnrdora,
		a.id_acto_tpo,
		f.dscrpcion							dscrpcion_acto_tpo,
		a.id_plntlla,
		d.dscrpcion							dscrpcion_plntlla,
		a.id_rprte,
		e.nmbre_rprte,
		e.nmbre_plntlla,
		e.nmbre_cnslta,
		a.id_acto,
		g.nmro_acto,
		g.nmro_acto_dsplay,
		g.fcha fcha_acto,
		a.dcmnto
   from gf_g_titulos_jdcial_dcmnto			a
   --join v_gf_g_titulos_jdcial_slctud 		b on a.id_ttlo_jdcial_slctud 		= b.id_ttlo_jdcial_slctud
   join v_gf_g_ttlos_jdcl_slctd_dtll		c on c.id_ttlo_jdcial_slctud		= c.id_ttlo_jdcial_slctud
   join gn_d_plantillas						d on a.id_plntlla					= d.id_plntlla
   join gn_d_reportes						e on a.id_rprte						= e.id_rprte
   left join gn_d_actos_tipo				f on a.id_acto_tpo					= f.id_acto_tpo
   left join gn_g_actos						g on a.id_acto						= g.id_acto;

