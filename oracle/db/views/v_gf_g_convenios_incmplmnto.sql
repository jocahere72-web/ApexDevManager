
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CONVENIOS_INCMPLMNTO" ("ID_CNVNIO_INCMPLMNTO", "ID_CNVNIO", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "NMRO_CNVNIO", "ID_CNVNIO_TPO", "DSCRPCION_CNVNIO_TPO", "CDGO_CNVNIO_ESTDO", "DSCRPCION_CNVNIO_ESTDO", "FCHA", "NMRO_CTA", "ID_ACTO", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "INDCDOR_NTFCDO", "DSCRPCION_INDCDOR_NTFCDO", "FCHA_NTFCCION") AS
  select a.id_cnvnio_incmplmnto,
		a.id_cnvnio,
		b.cdgo_clnte,
		b.id_impsto,
		b.nmbre_impsto,
		b.id_impsto_sbmpsto,
		b.nmbre_impsto_sbmpsto,
		b.id_sjto,
		b.idntfccion_sjto,
		b.idntfccion_sjto_frmtda,
		b.nmro_cnvnio,
		b.id_cnvnio_tpo,
		b.dscrpcion_cnvnio_tpo,
		b.cdgo_cnvnio_estdo,
		b.dscrpcion_cnvnio_estdo,
		a.fcha,
		(select listagg(nmro_cta, ', ') within group (order by nmro_cta) nmro_cta from gf_g_cnvnios_incmplmnto_cta m where a.id_cnvnio_incmplmnto = m.id_cnvnio_incmplmnto)nmro_cta,
		a.id_acto,
		c.nmro_acto,
		c.nmro_acto_dsplay ,
		c.indcdor_ntfcdo,
		decode (c.indcdor_ntfcdo, 'S','Si', 'N', 'No') dscrpcion_indcdor_ntfcdo,
		c.fcha_ntfccion
	from gf_g_convenios_incmplmnto 	a
	join v_gf_g_convenios 			b on a.id_cnvnio 			= b.id_cnvnio
	join v_gn_g_actos				c  on a.id_acto				= c.id_acto;

