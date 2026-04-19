
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_EXNCNES_SLCTUD_DTLLE" ("ID_EXNCION_SLCTUD_DTLLE", "ID_EXNCION_SLCTUD", "ID_EXNCION", "DSCRPCION_ORGEN", "NMBRE_TBLA", "ID_ORGEN", "CDGO_EXNCION_ESTDO", "DSCRPCION_ESTDO", "ID_EXNCION_CNCPTO", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "CDGO_CNCPTO_TPO", "DSCRPCION_CNCPTO_TPO", "VLOR_CNCPTO", "PRCNTJE_EXNCION", "VLOR_EXNTO") AS
  (
select 	  a.id_exncion_slctud_dtlle
		, a.id_exncion_slctud
	    , a.id_exncion
        , b.dscrpcion_orgen
		, b.nmbre_tbla
        , b.id_orgen
        , b.cdgo_exncion_estdo
		, b.dscrpcion_estdo
		, a.id_exncion_cncpto
		, c.id_impsto
		, c.cdgo_impsto
		, c.nmbre_impsto
		, c.id_impsto_sbmpsto
		, c.cdgo_impsto_sbmpsto
		, c.nmbre_impsto_sbmpsto
		, c.id_cncpto
		, c.cdgo_cncpto
		, c.dscrpcion_cncpto
		, c.cdgo_cncpto_tpo
		, c.dscrpcion_cncpto_tpo
		, a.vlor_cncpto
		, a.prcntje_exncion
		, a.vlor_exnto
from  gf_g_exncnes_slctud_dtlle a
		join v_gf_g_exenciones_solicitud	b on a.id_exncion_slctud = b.id_exncion_slctud
		join v_df_i_exenciones_concepto		c on a.id_exncion_cncpto = c.id_exncion_cncpto);

