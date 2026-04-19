
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_IMPUESTOS_SUBIMPUESTO" ("ID_IMPSTO_SBMPSTO", "CDGO_CLNTE", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "CDGO_EAN", "ACTVO", "LQDCION_MLTPLE", "INDCDOR_LQDA_MLTPLES_ACTOS") AS
  select a.id_impsto_sbmpsto,
		a.cdgo_clnte,
		a.id_impsto,
		(select m.cdgo_impsto from df_c_impuestos m where m.id_impsto = a.id_impsto) cdgo_impsto,
		(select m.nmbre_impsto from df_c_impuestos m where m.id_impsto = a.id_impsto) nmbre_impsto,
		a.cdgo_impsto_sbmpsto,
		a.nmbre_impsto_sbmpsto,
		a.cdgo_ean,
		a.actvo,
		a.lqdcion_mltple,
		a.indcdor_lqda_mltples_actos
  from df_i_impuestos_subimpuesto a
;

