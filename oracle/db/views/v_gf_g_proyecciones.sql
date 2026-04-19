
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_PROYECCIONES" ("ID_PRYCCION", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "ID_SJTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "DRCCION", "ID_CNVNIO_TPO", "DSCRPCION_CNVNIO_TPO", "CDGO_SJTO_TPO", "FCHA_LMTE_ELBRCION", "NMRO_MXMO_CTAS", "FCHA_MXMA_CTAS", "NMRO_PRYCCION", "FCHA_PRYCCION", "NMRO_CTA", "CDGO_PRDCDAD_CTA", "DSCRPCION_PRDCDAD_CTA", "FCHA_PRMRA_CTA", "TTAL_PRYCCION", "VLOR_CTA_INCIAL", "FCHA_LMTE_CTA_INCIAL", "ID_DCMNTO_CTA_INCIAL", "NMRO_DCMNTO", "ID_USRIO", "IDNTFCCION_FNCNRIO", "NMBRE_FNCNRIO", "NMBRE_IMPSTO_SBMPSTO") AS
  select a.id_pryccion,
		a.cdgo_clnte,
        a.id_impsto,
        b.nmbre_impsto,
        a.id_impsto_sbmpsto,
		a.id_sjto_impsto,
		b.id_sjto,
        b.idntfccion_sjto,
		b.idntfccion_sjto_frmtda,
        b.drccion,
		a.id_cnvnio_tpo,
		c.dscrpcion						dscrpcion_cnvnio_tpo,
		c.cdgo_sjto_tpo,
		c.fcha_lmte_elbrcion,
		c.nmro_mxmo_ctas,
		c.fcha_mxma_ctas,
		a.nmro_pryccion,
		a.fcha_pryccion,
		a.nmro_cta,
		a.cdgo_prdcdad_cta,
		d.dscrpcion						dscrpcion_prdcdad_cta,
		a.fcha_prmra_cta,
		a.ttal_pryccion,
		a.vlor_cta_incial,
		a.fcha_lmte_cta_incial,
		a.id_dcmnto_cta_incial,
		f.nmro_dcmnto,
		a.id_usrio,
		e.idntfccion					idntfccion_fncnrio,
		e.nmbre_trcro					nmbre_fncnrio,
        g.nmbre_impsto_sbmpsto
   from gf_g_proyecciones		    a
   join v_si_i_sujetos_impuesto 	b on a.id_sjto_impsto 				= b.id_sjto_impsto
   join gf_d_convenios_tipo		    c on a.id_cnvnio_tpo 				= c.id_cnvnio_tpo
   join df_s_periodicidad			d on a.cdgo_prdcdad_cta				= d.cdgo_prdcdad
   join v_sg_g_usuarios  			e on a.id_usrio					    = e.id_usrio
   left join re_g_documentos 		f on a.id_dcmnto_cta_incial			= f.id_dcmnto
   join df_i_impuestos_subimpuesto  g on a.id_impsto_sbmpsto            = g.id_impsto_sbmpsto;

