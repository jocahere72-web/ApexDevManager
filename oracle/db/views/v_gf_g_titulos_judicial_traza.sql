
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TITULOS_JUDICIAL_TRAZA" ("CDGO_CLNTE", "ID_TTLO_JDCIAL_TRZA", "ID_TTLO_JDCIAL", "NMRO_TTLO_JDCIAL", "FCHA_CNSTTCION", "VLOR", "ID_TTLO_JDCIAL_AREA", "NMBRE_AREA", "CDGO_IDNTFCCION_TPO_DMNDDO", "IDNTFCCION_DMNDDO", "NMBRE_DMNDDO", "CDGO_ENTDAD_CNSGNNTE", "NMBRE_BNCO", "ID_BNCO_CNSGNNTE", "NMBRE_BNCO_CNSGNNTE", "CDGO_TTLO_JDCIAL_ESTDO", "DSCRPCION_TTLO_ESTDO", "ID_EMBRGO_RSLCION_GNRDORA", "CDGO_TTLO_JDCIAL_ESTDO_TRZA", "DSCRPCION_TTLO_ESTDO_TRZA", "OBSRVCION", "ID_USRIO", "IDNTFCCION", "NMBRE_TRCRO", "EMAIL", "TLFNO", "FCHA", "NMBRE_CRGO", "CDGO_TTLO_JDCIAL_MVMNTO") AS
  select b.cdgo_clnte,
		a.id_ttlo_jdcial_trza,
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
		a.cdgo_ttlo_jdcial_estdo	cdgo_ttlo_jdcial_estdo_trza,
		c.dscrpcion					dscrpcion_ttlo_estdo_trza,
		a.obsrvcion,
		a.id_usrio,
		d.idntfccion,
		d.nmbre_trcro,
		d.email,
		d.tlfno,
		a.fcha,
        d.nmbre_crgo,
        m.DSCRPCION CDGO_TTLO_JDCIAL_MVMNTO
   from gf_g_titulos_judicial_traza 		a
   join v_gf_g_titulos_judicial				b on a.id_ttlo_jdcial					= b.id_ttlo_jdcial
   join gf_d_titulos_judicial_estdo			c on a.cdgo_ttlo_jdcial_estdo			= c.cdgo_ttlo_jdcial_estdo
   join v_sg_g_usuarios						d on a.id_usrio							= d.id_usrio
   left join gf_d_ttlos_jdcial_mvmnto            m on a.cdgo_tpo_mvmnto                  = m.CDGO_TTLO_JDCIAL_MVMNTO;

