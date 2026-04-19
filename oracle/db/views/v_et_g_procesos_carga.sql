
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_ET_G_PROCESOS_CARGA" ("ID_PRCSO_CRGA", "ID_CRGA", "NMBRE_CRGA", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "VGNCIA", "ID_PRDO", "PRDO", "CDGO_ARCHVO_TPO", "DSCRPCION_ARCHVO_TPO", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE", "CDGO_PRCSO_ESTDO", "DSCRPCION_ESTDO_PRCSO", "CRCTER_DLMTDO", "CRCTER_FIN_LNEA", "LNEAS_ENCBZDO", "LNEAS_RSMEN", "ID_ADTRIA", "FCHA_RGSTRO", "ID_USRIO", "ID_TRCRO", "ID_FNCNRIO", "NMBRE_TRCRO", "IDNTFCCION", "INDCDOR_PRCSDO") AS
  select a.id_prcso_crga
		 , a.id_crga
		 , g.nmbre_crga
		 , a.cdgo_clnte
		 , b.nmbre_clnte
		 , a.id_impsto
		 , c.nmbre_impsto
		 , a.id_impsto_sbmpsto
		 , d.nmbre_impsto_sbmpsto
		 , a.vgncia
		 , a.id_prdo
		 , f.prdo
		 , g.cdgo_archvo_tpo
		 , g.dscrpcion_archvo_tpo
		 , a.file_blob
		 , a.file_name
		 , a.file_mimetype
		 , a.cdgo_prcso_estdo
		 , h.dscrpcion_estdo_prcso
		 , g.crcter_dlmtdo
		 , g.crcter_fin_lnea
		 , a.lneas_encbzdo
		 , a.lneas_rsmen
		 , a.id_adtria
		 , a.fcha_rgstro
		 , a.id_usrio
		 , i.id_trcro
		 , i.id_fncnrio
		 , i.nmbre_trcro
		 , i.idntfccion
		 , a.indcdor_prcsdo
	from et_g_procesos_carga 				a
	join df_s_clientes 						b	on a.cdgo_clnte 				= b.cdgo_clnte
	left join df_c_impuestos 				c	on a.id_impsto					= c.id_impsto
	left join df_i_impuestos_subimpuesto	d	on a.id_impsto_sbmpsto			= d.id_impsto_sbmpsto
	left join df_s_vigencias 				e	on a.vgncia						= e.vgncia
	left join df_i_periodos 				f	on a.id_prdo					= f.id_prdo
	join v_et_g_carga						g	on a.id_crga 					= g.id_crga
	join et_d_procesos_estado				h	on a.cdgo_prcso_estdo			= h.cdgo_prcso_estdo
	join v_sg_g_usuarios 					i   on a.id_usrio					= i.id_usrio;

