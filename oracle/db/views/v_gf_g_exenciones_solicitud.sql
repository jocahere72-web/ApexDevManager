
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_EXENCIONES_SOLICITUD" ("ID_EXNCION_SLCTUD", "DSCRPCION_ORGEN", "NMBRE_TBLA", "CDGO_EXNCION_ORGEN", "ID_ORGEN", "ID_SJTO_IMPSTO", "CDGO_EXNCION_ESTDO", "DSCRPCION_ESTDO", "ID_USRIO_RGSTRA", "NMBRE_TRCRO_RGSTRA", "FCHA_RGSTRO", "ID_USRIO_RSPSTA", "NMBRE_TRCRO_RSPSTA", "FCHA_RSPSTA", "OBSRVCION_RCHZO", "ID_USRIO_PRYCTA", "NMBRE_TRCRO", "FCHA_PRYCCION", "ID_AJSTE", "ID_LQDCION", "ID_DCMNTO", "NMRO_DCMNTO", "INDCDOR_PGO_APLCDO", "DSCRPCION_INDCDOR_PGO_APLCDO", "ID_ACTO", "NMRO_ACTO", "ID_PLNTLLA") AS
  (
   select a.id_exncion_slctud
		, b.dscrpcion 				dscrpcion_orgen
		, b.nmbre_tbla
        , a.cdgo_exncion_orgen
        , a.id_orgen
        , a.id_sjto_impsto
        , a.cdgo_exncion_estdo
		, c.dscrpcion				dscrpcion_estdo
        , a.id_usrio_rgstra
		, d.nmbre_trcro				nmbre_trcro_rgstra
        , a.fcha_rgstro
        , a.id_usrio_rspsta
		, e.nmbre_trcro				nmbre_trcro_rspsta
        , a.fcha_rspsta
        , a.obsrvcion_rchzo
		, a.id_usrio_prycta
		, f.nmbre_trcro
		, a.fcha_pryccion
        , a.id_ajste
        , a.id_lqdcion
        , a.id_dcmnto
		, g.nmro_dcmnto
		, g.indcdor_pgo_aplcdo
		, g.dscrpcion_indcdor_pgo_aplcdo
        , a.id_acto
        , h.nmro_Acto
		, a.id_plntlla
	 from gf_g_exenciones_solicitud 	a
	 join gf_d_exenciones_origen 		b on a.cdgo_exncion_orgen 	= b.cdgo_exncion_orgen
	 join gf_d_exenciones_estado 		c on a.cdgo_exncion_estdo 	= c.cdgo_exncion_estdo
	 left join v_sg_g_usuarios			d on a.id_usrio_rgstra		= d.id_usrio
	 left join v_sg_g_usuarios			e on a.id_usrio_rspsta		= e.id_usrio
	 left join v_sg_g_usuarios			f on a.id_usrio_prycta		= f.id_usrio
	 left join v_re_g_documentos		g on a.id_dcmnto            = g.id_dcmnto
     left join gn_g_actos              h on a.id_acto              = h.id_acto);

