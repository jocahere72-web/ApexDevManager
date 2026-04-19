
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_D_FUENTES_EXTERNA_CARGA" ("ID_FNTES_EXTRNA_CRGA", "ID_FNTES_EXTRNA", "DSCPCION_FNTES_EXTRNA", "ID_CRGA", "DSCPCION_CRGA", "ACTVO") AS
  select
	  a.id_fntes_extrna_crga
	, a.id_fntes_extrna
	, (select dscpcion_fntes_extrna from fi_d_fuentes_externa b where  b.id_fntes_extrna =  a.id_fntes_extrna) dscpcion_fntes_extrna
	, a.id_crga
	, (select nmbre_crga from et_g_carga c where c.id_crga = a.id_crga) dscpcion_crga
	, a.actvo
from fi_d_fuentes_externa_carga a;

