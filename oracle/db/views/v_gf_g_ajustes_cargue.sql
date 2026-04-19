
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_AJUSTES_CARGUE" ("ID_AJSTE_CRGUE", "ID_PRCSO_CRGA", "FILE_NAME", "ID_IMPSTO", "NMBRE_IMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_IMPSTO_SBMPSTO", "IDNTFCCION_SJTO", "VGNCIA", "PRDO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "VLOR_AJSTE", "CDGO_AJSTE_MTVO", "DSCRPCION_MTVO", "ID_AJSTE_MTVO", "TPO_AJSTE", "OBSRVCION_AJSTE", "ID_SJTO_IMPSTO", "ID_AJSTE", "ESTDO", "OBSRVCION_PRCSO", "NMRO_INTNTOS", "USER_DGTA", "FCHA_DGTA", "USER_MDFCA", "FCHA_MDFCA", "FCHA_RGSTRO", "CDGO_ESTDO", "NUMRO_AJSTE") AS
  select  a.id_ajste_crgue
			, a.id_prcso_crga
			, b.file_name
			, b.id_impsto
            , b.nmbre_impsto
            , b.nmbre_impsto_sbmpsto
			, b.id_impsto_sbmpsto
			, a.idntfccion_sjto
			, a.vgncia
			, a.prdo
			, a.cdgo_cncpto
			, c.dscrpcion		dscrpcion_cncpto
			, a.vlor_ajste
			, a.cdgo_ajste_mtvo
			, d.dscrpcion		dscrpcion_mtvo
			, d.id_ajste_mtvo
			, d.tpo_ajste
			, a.obsrvcion_ajste
			, a.id_sjto_impsto
			, a.id_ajste
			, a.estdo
			, a.obsrvcion_prcso
			, a.nmro_intntos
			, a.user_dgta
			, a.fcha_dgta
			, a.user_mdfca
			, a.fcha_mdfca
			, a.fcha_rgstro
			, a.cdgo_estdo
			, e.numro_ajste
	from 	gf_g_ajustes_cargue		a
	join	v_et_g_procesos_carga   b on a.id_prcso_crga 	= b.id_prcso_crga
	join	df_i_conceptos   		c on a.cdgo_cncpto 		= c.cdgo_cncpto
									 and b.id_impsto 		= c.id_impsto
	join	gf_d_ajuste_motivo		d on a.cdgo_ajste_mtvo 	= d.cdgo_ajste_mtvo and orgen = 'A'
	left join gf_g_ajustes		    e on a.id_ajste      	= e.id_ajste and a.cdgo_ajste_mtvo 	= d.cdgo_ajste_mtvo
;

