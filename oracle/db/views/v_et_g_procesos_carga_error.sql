
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_ET_G_PROCESOS_CARGA_ERROR" ("ID_PRCSO_CRGA_ERROR", "ID_PRCSO_CRGA", "ORGEN", "NMBRE_CRGA", "NMBRE_CLNTE", "NMBRE_IMPSTO", "VGNCIA", "NMERO_LNEA", "CLMNA_ORGEN", "VLDCION_ERROR") AS
  select
	a.id_prcso_crga_error,
	a.id_prcso_crga,
	a.orgen,
	b.nmbre_crga,
	b.nmbre_clnte,
	b.nmbre_impsto,
	b.vgncia,
	a.nmero_lnea,
	a.clmna_orgen,
	a.vldcion_error
from et_g_procesos_carga_error  a
join v_et_g_procesos_carga b on a.id_prcso_crga = b.id_prcso_crga
where a.id_prcso_crga = b.id_prcso_crga;

