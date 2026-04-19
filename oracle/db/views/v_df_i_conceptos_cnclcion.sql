
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_CONCEPTOS_CNCLCION" ("ID_CNCPTO_CNCLCION", "CDGO_CLNTE", "CDGO_CNCPTO", "NMBRE_CNCPTO", "ID_CNCPTO_SMART", "DSCRPCION_SMART", "INDCDOR_VGNCIA_ACTUAL", "DSCRPCN_INDCDR_VGNCIA_ACTL") AS
  select	a.id_cncpto_cnclcion
	  , a.cdgo_clnte
	  , a.cdgo_cncpto
	  , a.nmbre_cncpto
      , b.id_cncpto id_cncpto_smart
      , b.dscrpcion dscrpcion_smart
	  , a.indcdor_vgncia_actual
	  , decode(a.indcdor_vgncia_actual, 'S', 'SI', 'NO') as dscrpcn_indcdr_vgncia_actl
  from	df_i_conceptos_cnclcion	a
  join	df_i_conceptos				b	on	a.cdgo_clnte			=	b.cdgo_clnte
									   and 	a.id_cncpto				=	b.id_cncpto;

