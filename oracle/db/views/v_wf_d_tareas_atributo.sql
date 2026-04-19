
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_D_TAREAS_ATRIBUTO" ("ID_TREA_ATRBTO", "ID_TREA", "NMBRE_TREA", "ID_ATRBTO") AS
  select
	a.id_trea_atrbto,
	a.id_trea,
	b.nmbre_trea,
	a.id_atrbto
from wf_d_tareas_atributo a, wf_d_tareas b
where a.id_trea = b.id_trea;

