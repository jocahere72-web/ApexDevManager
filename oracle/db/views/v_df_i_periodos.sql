
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_PERIODOS" ("ID_PRDO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "VGNCIA", "PRDO", "DSCRPCION", "CDGO_PRDCDAD", "DSCRPCION_PRDCDAD", "INDCDOR_CRRE_LQDCION", "DSCRPCION_INDCDOR_CRR_LQDCION", "INDCDOR_INCTVCION_PRDIOS", "DSCRPCION_INDCDOR_INCTVC_PRD", "FCHA_VNCMNTO") AS
  select a.id_prdo,
		a.cdgo_clnte,
		b.nmbre_clnte,
		a.id_impsto,
		c.nmbre_impsto,
		a.id_impsto_sbmpsto,
		d.nmbre_impsto_sbmpsto,
		a.vgncia,
		a.prdo,
		a.dscrpcion,
		a.cdgo_prdcdad,
		e.dscrpcion											dscrpcion_prdcdad,
		a.indcdor_crre_lqdcion,
		decode(a.indcdor_crre_lqdcion,'S','Sí','N','No')	dscrpcion_indcdor_crr_lqdcion,
		a.indcdor_inctvcion_prdios ,
		decode(a.indcdor_inctvcion_prdios,'S','Sí','N','No')dscrpcion_indcdor_inctvc_prd,
		a.fcha_vncmnto
   from df_i_periodos				a
   join df_s_clientes				b on a.cdgo_clnte			= b.cdgo_clnte
   join df_c_impuestos				c on a.id_impsto			= c.id_impsto
   join df_i_impuestos_subimpuesto	d on a.id_impsto_sbmpsto	= d.id_impsto_sbmpsto
   join df_s_periodicidad			e on a.cdgo_prdcdad			= e.cdgo_prdcdad;

