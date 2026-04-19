
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_AJUSTES_CARGUE_LOTE" ("ID_AJS_CRG_LTE", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "FCHA_INCIO_PRCSO", "FCHA_FIN_PRCSO", "DRCION", "ID_USRIO", "ID_TRCRO", "ID_FNCNRIO", "NMBRE_TRCRO", "IDNTFCCION", "NMRO_RGSTROS", "NMRO_SJTOS_VLDOS", "NMRO_AJSTES_GNRAR", "NMRO_AJSTES_GNRDOS", "CDGO_LTE_ESTDO", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE") AS
  select 	a.id_ajs_crg_lte
			, a.id_impsto
			, b.cdgo_impsto
			, b.nmbre_impsto
			, a.id_impsto_sbmpsto
			, c.cdgo_impsto_sbmpsto
			, c.nmbre_impsto_sbmpsto
			, a.fcha_incio_prcso
			, a.fcha_fin_prcso
			, (a.fcha_fin_prcso - a.fcha_incio_prcso)	drcion
			, a.id_usrio
			, g.id_trcro
			, g.id_fncnrio
			, g.nmbre_trcro
			, g.idntfccion
			, a.nmro_rgstros
			, a.nmro_sjtos_vldos
			, a.nmro_ajstes_gnrar
			, a.nmro_ajstes_gnrdos
			, a.cdgo_lte_estdo
			, a.file_blob
			, a.file_name
			, a.file_mimetype
	from gf_g_ajustes_cargue_lote 	a
	join df_c_impuestos 				b on a.id_impsto 					= b.id_impsto
	join df_i_impuestos_subimpuesto 	c on a.id_impsto_sbmpsto 			= c.id_impsto_sbmpsto
	join v_sg_g_usuarios				g on a.id_usrio						= g.id_usrio
;

