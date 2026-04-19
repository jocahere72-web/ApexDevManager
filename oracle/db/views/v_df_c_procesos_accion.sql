
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_PROCESOS_ACCION" ("ID_PRCSO_ACCION", "CDGO_CLNTE", "CDGO_PRCSO_ACCION", "CDGO_PRCSO", "ID_EVNTO", "DSCRPCION_EVNTO", "ID_ACCION", "DSCRPCION_ACCION", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "UNDAD_PRGRMA", "ACTVO", "FCHA_RGSTRO", "USER_DGTA", "FCHA_DGTA", "USER_MDFCA", "FCHA_MDFCA") AS
  select 	a.id_prcso_accion ,
		a.cdgo_clnte,
		a.cdgo_prcso_accion,
		a.cdgo_prcso,
		a.id_evnto,
		(select dscrpcion from df_c_eventos b where b.id_evnto =  a.id_evnto) dscrpcion_evnto,
		a.id_accion,
		(select dscrpcion from df_c_acciones c where c.id_accion =  a.id_accion) dscrpcion_accion,
		a.id_impsto,
		(select nmbre_impsto from df_c_impuestos d where d.id_impsto =  a.id_impsto) nmbre_impsto,
		a.id_impsto_sbmpsto,
		(select nmbre_impsto_sbmpsto from df_i_impuestos_subimpuesto e where e.id_impsto_sbmpsto =  a.id_impsto_sbmpsto) nmbre_impsto_sbmpsto,
		a.undad_prgrma,
		a.actvo,
		a.fcha_rgstro,
		a.user_dgta,
		a.fcha_dgta,
		a.user_mdfca,
		a.fcha_mdfca
from df_c_procesos_accion a
;

