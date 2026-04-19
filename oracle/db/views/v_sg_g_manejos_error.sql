
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_MANEJOS_ERROR" ("ID_MNJO_ERROR", "ID_TPO_ERROR", "DSCRPCION_TPO_ERROR", "TBLE_NME", "CNSTRNT_NME", "MNSJE_ES", "MNSJE_US") AS
  select
  a.id_mnjo_error,
  a.id_tpo_error,
  b.dscrpcion_tpo_error,
  (select m.table_name from user_constraints m where m.constraint_name = a.cnstrnt_nme) tble_nme,
  a.cnstrnt_nme,
  a.mnsje_es,
  a.mnsje_us
from sg_g_manejos_error a, sg_d_tipos_error b
where a.id_tpo_error = b.id_tpo_error;

