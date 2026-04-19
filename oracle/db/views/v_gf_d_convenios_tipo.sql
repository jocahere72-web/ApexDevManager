
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_D_CONVENIOS_TIPO" ("ID_CNVNIO_TPO", "CDGO_CLNTE", "DSCRPCION", "CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO", "RNGO_VGNCIA", "DSCRPCION_RNGO_VGNCIA", "FCHA_LMTE_ELBRCION", "NMRO_MXMO_CTAS", "FCHA_MXMA_CTAS", "INDCDOR_CLCLA_FNCCION", "INDCDOR_CLCLA_FNCCN_SB_TTAL_K", "INDCDOR_RQRE_GRNTIA", "NMRO_CTA_MNMA_RQRE_GRNTIA", "NMRO_UVT_MNMA_RQRE_GRNTIA", "INDCDOR_EXGE_CTA_INCIAL", "CTA_INCIAL_VGNCIA_CNVNIO", "CTA_INCIAL_ABNO_TTAL_VGNCIA", "CTA_INCIAL_PRCNTJE_VGNCIA", "INDCDOR_LMTA_PRCNTJE", "LMTA_PRCNTJE_MNMO", "LMTA_PRCNTJE_MXMO", "ID_DCRTO", "DSCRPCION_DCRTO_CNVNIO", "ID_RVCTRIA_MTDO", "MTDO_RVCTRIA", "INDCDOR_PRMTE_ADCCNAR_VGNCIA", "NMRO_MXMO_ADCCNAR_VGNCIA", "INDCDOR_PRMTE_MDFCAR_NMRO_CTA", "INDCDOR_RVCTRIA_VGNCIA_FTRA", "TSA_PRFRNCIAL_EA", "INDCDOR_APLCA_DSCNTO", "INDCDOR_GNRA_ACTO_CNVNIO", "ID_ACTO_TPO_CNVNIO", "TIPO_ACTO_CNVNIO", "INDCDOR_VRFCA_DDA", "RNGO_DDA_DSDE", "RNGO_DDA_HSTA", "ACTVO") AS
  select a.id_cnvnio_tpo,
		a.cdgo_clnte,
		a.dscrpcion,
		a.cdgo_sjto_tpo,
		b.dscrpcion_sjto_tpo,
		a.rngo_vgncia,
		decode (rngo_vgncia, 'T', 'Todas', 'P','Algunas') dscrpcion_rngo_vgncia,
		a.fcha_lmte_elbrcion,
		a.nmro_mxmo_ctas,
		a.fcha_mxma_ctas,
		a.indcdor_clcla_fnccion,
		a.indcdor_clcla_fnccn_sb_ttal_k,
		a.indcdor_rqre_grntia,
		a.nmro_cta_mnma_rqre_grntia,
		a.nmro_uvt_mnma_rqre_grntia,
		a.indcdor_exge_cta_incial,
		a.cta_incial_vgncia_cnvnio,
		a.cta_incial_abno_ttal_vgncia,
		a.cta_incial_prcntje_vgncia,
		a.indcdor_lmta_prcntje,
		a.lmta_prcntje_mnmo,
		a.lmta_prcntje_mxmo,
		a.id_dcrto,
		c.dscrpcion 			dscrpcion_dcrto_cnvnio,
		a.id_rvctria_mtdo,
		e.dscrpcion mtdo_rvctria,
		a.indcdor_prmte_adccnar_vgncia,
		a.nmro_mxmo_adccnar_vgncia,
		a.indcdor_prmte_mdfcar_nmro_cta,
		a.indcdor_rvctria_vgncia_ftra,
		a.tsa_prfrncial_ea,
		a.indcdor_aplca_dscnto,
		a.indcdor_gnra_acto_cnvnio,
		a.id_acto_tpo_cnvnio,
		d.dscrpcion tipo_acto_cnvnio,
		a.indcdor_vrfca_dda,
		a.rngo_dda_dsde,
		a.rngo_dda_hsta,
		a.actvo
   from gf_d_convenios_tipo					a
   join df_s_sujetos_tipo					b on a.cdgo_sjto_tpo		= b.cdgo_sjto_tpo
   left join df_c_decretos					c on a.id_dcrto				= c.id_dcrto
   left join gn_d_actos_tipo				d on a.id_acto_tpo_cnvnio	= d.id_acto_tpo
   left join gf_d_revocatoria_metodo		e on a.id_rvctria_mtdo		= e.id_rvctria_mtdo;

