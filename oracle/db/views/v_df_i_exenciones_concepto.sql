
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_EXENCIONES_CONCEPTO" ("ID_EXNCION_CNCPTO", "ID_EXNCION", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "CDGO_CNCPTO_TPO", "DSCRPCION_CNCPTO_TPO", "PRCNTJE_EXNCION", "USER_DGTA", "FCHA_DGTA", "USER_MDFCA", "FCHA_MDFCA") AS
  (
select  a.id_exncion_cncpto
      , a.id_exncion
      , a.id_impsto
      , c.cdgo_impsto
      , c.nmbre_impsto
      , a.id_impsto_sbmpsto
      , d.cdgo_impsto_sbmpsto
      , d.nmbre_impsto_sbmpsto
      , a.id_cncpto
      , e.cdgo_cncpto
      , e.dscrpcion 				dscrpcion_cncpto
	  , e.cdgo_cncpto_tpo
	  , e.dscrpcion_cncpto_tpo
      , a.prcntje_exncion
      , a.user_dgta
      , a.fcha_dgta
      , a.user_mdfca
      , a.fcha_mdfca
from df_i_exenciones_concepto a
    join v_df_i_exenciones              b   on a.id_exncion = b.id_exncion
    join v_df_c_impuestos               c   on a.id_impsto = c.id_impsto
    join v_df_i_impuestos_subimpuesto   d   on a.id_impsto_sbmpsto = d.id_impsto_sbmpsto
    join v_df_i_conceptos               e   on a.id_cncpto = e.id_cncpto);

