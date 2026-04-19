
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_LIQUIDACIONES" ("ID_LQDCION", "ID_PRCSO_CRGA", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "VGNCIA", "ID_PRDO", "PRDO", "DSCRPCION_PRDO", "CDGO_PRDCDAD", "DSCRPCION_PRDCDAD", "CNTDAD_VCE_ANIO", "ID_SJTO_IMPSTO", "CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO", "IDNTFCCION_SJTO", "IDNTFCCION_ANTRIOR", "ID_SJTO_ESTDO", "DSCRPCION_SJTO_ESTDO", "FCHA_LQDCION", "FCHA_VNCMNTO", "CDGO_LQDCION_ESTDO", "DSCRPCION_LQDCION_ESTDO", "BSE_GRVBLE", "VLOR_TTAL", "NMRO_DCMNTO_SPRTE", "ID_DCMNTO_TPO_SPRTE", "FCHA_DCMNTO_SPRTE", "ID_LQDCION_TPO", "CDGO_LQDCION_TPO", "DSCRPCION_LQDCION_TPO", "ID_TTLO_EJCTVO", "INDCDOR_MGRDO", "INDCDOR_INTRFAZ", "ID_SJTO_SCRSAL", "NMBRE_SCRSAL", "ID_LQDCION_ANTRIOR") AS
  select a.id_lqdcion
		 , a.id_prcso_crga
		 , a.cdgo_clnte
		 , b.nmbre_clnte
		 , a.id_impsto
		 , c.nmbre_impsto
		 , a.id_impsto_sbmpsto
		 , d.nmbre_impsto_sbmpsto
		 , a.vgncia
		 , a.id_prdo
		 , f.prdo
		 , f.dscrpcion 					dscrpcion_prdo
		 , a.cdgo_prdcdad
		 , j.dscrpcion 					dscrpcion_prdcdad
		 , j.cntdad_vce_anio
		 , a.id_sjto_impsto
		 , g.cdgo_sjto_tpo
		 , g.dscrpcion_sjto_tpo
		 , g.idntfccion_sjto
		 , g.idntfccion_antrior
		 , g.id_sjto_estdo
		 , g.dscrpcion_sjto_estdo
		 , a.fcha_lqdcion
		 , f.fcha_vncmnto
		 , a.cdgo_lqdcion_estdo
		 , h.dscrpcion_lqdcion_estdo
		 , a.bse_grvble
		 , a.vlor_ttal
		 , a.nmro_dcmnto_sprte
		 , a.id_dcmnto_tpo_sprte
		 , a.fcha_dcmnto_sprte
		 , a.id_lqdcion_tpo
		 , i.cdgo_lqdcion_tpo
		 , i.dscrpcion_lqdcion_tpo
		 , a.id_ttlo_ejctvo
		 , a.indcdor_mgrdo
		 , a.indcdor_intrfaz
         , a.id_sjto_scrsal
         , (select nmbre from si_i_sujetos_sucursal s where a.id_sjto_scrsal = s.id_sjto_scrsal)  nmbre_scrsal
		 , a.id_lqdcion_antrior
	from gi_g_liquidaciones				a
	join df_s_clientes 					b	on a.cdgo_clnte 				= b.cdgo_clnte
	join df_c_impuestos 				c	on a.id_impsto					= c.id_impsto
	join df_i_impuestos_subimpuesto		d	on a.id_impsto_sbmpsto			= d.id_impsto_sbmpsto
	join df_s_vigencias 				e	on a.vgncia						= e.vgncia
	join df_i_periodos 					f	on a.id_prdo					= f.id_prdo
	join v_si_i_sujetos_impuesto		g	on a.id_sjto_impsto				= g.id_sjto_impsto
	join df_s_liquidaciones_estado		h 	on a.cdgo_lqdcion_estdo			= h.cdgo_lqdcion_estdo
	join df_i_liquidaciones_tipo		i	on a.id_lqdcion_tpo				= i.id_lqdcion_tpo
	join df_s_periodicidad				j	on a.cdgo_prdcdad				= j.cdgo_prdcdad
;

