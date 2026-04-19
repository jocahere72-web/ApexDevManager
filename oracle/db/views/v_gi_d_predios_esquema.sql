
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_PREDIOS_ESQUEMA" ("ID_PRDIO_ESQMA", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "FCHA_INCIAL", "FCHA_FNAL", "CDGO_PRDIO_CLSFCCION", "DSCRPCION_PRDIO_CLSFCCION", "ID_PRDIO_USO_SLO", "DSCRPCION_PRDIO_USO_SLO", "ID_PRDIO_DSTNO", "DSCRPCION_PRDIO_DSTNO", "CDGO_ESTRTO", "DSCRPCION_ESTRTO", "AREA_TRRNO_MNMA", "AREA_TRRNO_MXMA", "AREA_CNSCTRDA_MNMA", "AREA_CNSCTRDA_MXMA", "BSE_MNMA", "BSE_MXMA", "LMTE_MNMA", "LMTE_MXMA", "TRFA", "TXTO_TRFA", "ID_INDCDOR_ECNMCO", "CDGO_INDCDOR_TPO", "VLOR", "ID_OBRA") AS
  select a.id_prdio_esqma
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
		 , a.id_prdio_uso_slo
		 , f.dscrpcion dscrpcion_prdio_uso_slo
		 , a.id_prdio_dstno
		 , g.dscrpcion dscrpcion_prdio_dstno
		 , a.cdgo_estrto
		 , h.dscrpcion_estrto
		 , a.area_trrno_mnma
		 , a.area_trrno_mxma
		 , a.area_cnsctrda_mnma
		 , a.area_cnsctrda_mxma
		 , pkg_gn_generalidades.fnc_ca_expresion( p_vlor      => nvl2( i.id_indcdor_ecnmco , a.bse_mnma * i.vlor , a.bse_mnma )
                                                , p_expresion => /*j.vlor*/ 'round( :valor , 2 )' ) as bse_mnma
		 , pkg_gn_generalidades.fnc_ca_expresion( p_vlor      => nvl2( i.id_indcdor_ecnmco , a.bse_mxma * i.vlor , a.bse_mxma )
                                                , p_expresion => /*j.vlor*/ 'round( :valor , 2 )' ) as bse_mxma
		 , a.bse_mnma as lmte_mnma
         , a.bse_mxma as lmte_mxma
         , a.trfa
		 , a.txto_trfa
         , a.id_indcdor_ecnmco
         , i.cdgo_indcdor_tpo
         , i.vlor
		 , a.id_obra
	from gi_d_predios_esquema 			  a
	join df_c_impuestos 				  c	on a.id_impsto 				= c.id_impsto
	join df_i_impuestos_subimpuesto 	  d	on a.id_impsto_sbmpsto 		= d.id_impsto_sbmpsto
	join df_s_clientes 					  b	on a.cdgo_clnte 			= b.cdgo_clnte
    left join df_s_predios_clasificacion  e	on a.cdgo_prdio_clsfccion	= e.cdgo_prdio_clsfccion
	left join df_c_predios_uso_suelo	  f	on a.id_prdio_uso_slo 		= f.id_prdio_uso_slo
	left join df_i_predios_destino 		  g	on a.id_prdio_dstno			= g.id_prdio_dstno
	left join df_s_estratos 			  h	on a.cdgo_estrto 			= h.cdgo_estrto
    left join df_s_indicadores_economico  i on a.id_indcdor_ecnmco      = i.id_indcdor_ecnmco;

