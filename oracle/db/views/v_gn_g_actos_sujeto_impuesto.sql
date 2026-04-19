
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_G_ACTOS_SUJETO_IMPUESTO" ("ID_ACTO_SJTO_IMPSTO", "ID_ACTO", "CDGO_CLNTE", "CDGO_ACTO_ORGEN", "DSCRPCION_ACTO_ORGEN", "NMBRE_TBLA_ORGEN", "ID_ORGEN", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "FCHA", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "CDGO_EAN", "ID_SJTO", "ID_SJTO_IMPSTO", "NMRO_IDNTFCCION", "IDNTFCCION_SJTO", "IDNTFCCION_ANTRIOR", "ID_IMPSTO", "NMBRE_IMPSTO", "CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO", "ID_SJTO_ESTDO", "DSCRPCION_SJTO_ESTDO", "ESTDO_BLQDO_SJTO_IMPSTO", "DESC_ESTDO_BLQDO_SJTO_IMPSTO", "INDCDOR_NTFCDO", "DSCRPCION_INDCDOR_NTFCDO", "FCHA_NTFCCION", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE", "ID_DCMNTO") AS
  select a.id_acto_sjto_impsto,
		a.id_acto,
		b.cdgo_clnte,
		b.cdgo_acto_orgen,
		b.dscrpcion_acto_orgen,
		b.nmbre_tbla_orgen,
		b.id_orgen,
		b.id_acto_tpo,
		b.dscrpcion_acto_tpo,
		b.nmro_acto,
		b.nmro_acto_dsplay,
		b.fcha,
		a.id_impsto_sbmpsto,
		c.cdgo_impsto_sbmpsto,
		c.nmbre_impsto_sbmpsto,
		c.cdgo_ean,
		d.id_sjto,
		a.id_sjto_impsto,
		d.nmro_idntfccion,
		d.idntfccion_sjto,
		d.idntfccion_antrior,
		d.id_impsto,
		d.nmbre_impsto,
		d.cdgo_sjto_tpo,
		d.dscrpcion_sjto_tpo,
		d.id_sjto_estdo,
		d.dscrpcion_sjto_estdo,
		d.estdo_blqdo_sjto_impsto,
		d.desc_estdo_blqdo_sjto_impsto,
		b.indcdor_ntfcdo,
		decode(b.indcdor_ntfcdo, 'S','SI','NO') as dscrpcion_indcdor_ntfcdo,
		b.fcha_ntfccion,
		b.file_blob,
		b.file_name,
		b.file_mimetype,
    b.id_dcmnto
   from gn_g_actos_sujeto_impuesto 		a
   join v_gn_g_actos 					b on a.id_acto = b.id_acto
   join v_df_i_impuestos_subimpuesto	c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto
   join v_si_i_sujetos_impuesto			d on a.id_sjto_impsto = d.id_sjto_impsto
;

