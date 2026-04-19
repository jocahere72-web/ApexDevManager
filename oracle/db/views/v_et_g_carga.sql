
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_ET_G_CARGA" ("ID_CRGA", "NMBRE_CRGA", "DSCRPCION_CRGA", "CDGO_ARCHVO_TPO", "DSCRPCION_ARCHVO_TPO", "CRCTER_DLMTDO", "CRCTER_FIN_LNEA", "INDCDOR_TIP_RGSTRO_IGUAL", "DSC_INDCDOR_TIP_RGSTRO_IGUAL", "TPO_RGSTRO_PRCSAR") AS
  select a.id_crga
		 , a.nmbre_crga
		 , a.dscrpcion_crga
		 , a.cdgo_archvo_tpo
		 , b.dscrpcion_archvo_tpo
		 , a.crcter_dlmtdo
		 , a.crcter_fin_lnea
		 , a.indcdor_tip_rgstro_igual
		 , decode (indcdor_tip_rgstro_igual, 'S', 'Si', 'N', 'No', null, 'No')dsc_indcdor_tip_rgstro_igual
		 , a.tpo_rgstro_prcsar
	from et_g_carga 			a
	join et_d_archivos_tipo		b	on a.cdgo_archvo_tpo	= b.cdgo_archvo_tpo;

