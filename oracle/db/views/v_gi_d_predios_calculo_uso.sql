
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_PREDIOS_CALCULO_USO" ("ID_PRDIO_CLCLO_USO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "FCHA_INCIAL", "FCHA_FNAL", "CDGO_PRDIO_CLSFCCION", "DSCRPCION_PRDIO_CLSFCCION", "CDGO_DSTNO_IGAC", "NMBRE_DSTNO_IGAC", "INDCDOR_CLCLO_AREA", "DSCRPCION_INDCDOR_CLCLO_AREA", "ID_PRDIO_USO_SLO", "DSCRPCION_PRDIO_USO_SLO", "AREA_TRRNO_MNMA", "AREA_TRRNO_MXMA", "AREA_CNSCTRDA_MNMA", "AREA_CNSCTRDA_MXMA", "PRCNTJE_MNMO", "VLOR_PRCNTJE_MNMO", "PRCNTJE_MXMO", "VLOR_PRCNTJE_MXMO") AS
  select a.id_prdio_clclo_uso
			  , a.cdgo_clnte
			  , b.nmbre_clnte
			  , a.id_impsto
			  , c.nmbre_impsto
			  , a.id_impsto_sbmpsto
			  , d.nmbre_impsto_sbmpsto
			  , a.fcha_incial
			  , a.fcha_fnal
			  , a.cdgo_prdio_clsfccion
			  , e.dscrpcion_prdio_clsfccion
			  , a.cdgo_dstno_igac
			  , f.nmbre_dstno_igac
			  , a.indcdor_clclo_area
			  , decode(indcdor_clclo_area, 'V', 'Valor', 'P', 'Porcentaje') dscrpcion_indcdor_clclo_area
			  , a.id_prdio_uso_slo
			  , g.dscrpcion dscrpcion_prdio_uso_slo
			  , a.area_trrno_mnma
			  , a.area_trrno_mxma
			  , a.area_cnsctrda_mnma
			  , a.area_cnsctrda_mxma
			  , a.prcntje_mnmo
			  , (a.prcntje_mnmo * 100) vlor_prcntje_mnmo
			  , a.prcntje_mxmo
			  , (a.prcntje_mxmo * 100) vlor_prcntje_mxmo
		 from gi_d_predios_calculo_uso 	 a
		 join df_s_clientes 			 b on a.cdgo_clnte 			 = b.cdgo_clnte
		 join df_c_impuestos 			 c on a.id_impsto 			 = c.id_impsto
		 join df_i_impuestos_subimpuesto d on a.id_impsto_sbmpsto	 = d.id_impsto_sbmpsto
	left join df_s_predios_clasificacion e on a.cdgo_prdio_clsfccion = e.cdgo_prdio_clsfccion
	left join df_s_destinos_igac 		 f on a.cdgo_dstno_igac 	 = f.cdgo_dstno_igac
	left join df_c_predios_uso_suelo 	 g on a.id_prdio_uso_slo 	 = g.id_prdio_uso_slo;

