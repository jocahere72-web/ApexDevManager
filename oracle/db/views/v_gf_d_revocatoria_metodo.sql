
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_D_REVOCATORIA_METODO" ("ID_RVCTRIA_MTDO", "CDGO_CLNTE", "DSCRPCION", "CDGO_RVCTRIA_TPO", "DSCRPCION_RVCTRIA_TPO", "ID_ACTO_TPO_INCMPLMNTO", "DSCRPCION_ACTO_TPO_INCMPLMNTO", "NMRO_CTAS", "NMRO_DIAS_VNCMNTO", "NMRO_OFCIOS_EMTDO_RVOCAR", "INDCDOR_MSMA_CTA_OFCIO", "DSCRPCION_INDCDOR_MSMA_CTA_OFC", "ID_ACTO_TPO_RVCTRIA", "DSCRPCION_ACTO_TPO_RVCTRIA", "ACTVO") AS
  select a.id_rvctria_mtdo,
		a.cdgo_clnte,
		a.dscrpcion,
		a.cdgo_rvctria_tpo,
		b.dscrpcion					dscrpcion_rvctria_tpo,
		a.id_acto_tpo_incmplmnto,
		c.dscrpcion 				dscrpcion_acto_tpo_incmplmnto,
		a.nmro_ctas,
		a.nmro_dias_vncmnto,
		a.nmro_ofcios_emtdo_rvocar,
		a.indcdor_msma_cta_ofcio,
		decode (a.indcdor_msma_cta_ofcio, 'S', 'Sí', 'N', 'No') dscrpcion_indcdor_msma_cta_ofc,
		a.id_acto_tpo_rvctria,
		d.dscrpcion 				dscrpcion_acto_tpo_rvctria,
		a.actvo
   from gf_d_revocatoria_metodo		a
   join gf_d_revocatoria_tipo 		b on a.cdgo_rvctria_tpo			= b.cdgo_rvctria_tpo
   left join gn_d_actos_tipo		c on a.id_acto_tpo_incmplmnto	= c.id_acto_tpo
   left join gn_d_actos_tipo		d on a.id_acto_tpo_rvctria		= d.id_acto_tpo;

