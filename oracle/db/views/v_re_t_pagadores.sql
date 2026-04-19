
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_T_PAGADORES" ("ID_PGDOR", "CDGO_CLNTE", "NMBRE_CLNTE", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "IDNTFCCION", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "TLFNO_1", "TLFNO_2", "TLFNO_3", "DRCCION_1", "DRCCION_2", "DRCCION_3", "EMAIL", "ID_TRCRO") AS
  select	a.id_pgdor
	, a.cdgo_clnte
	, c.nmbre_clnte
	, a.cdgo_idntfccion_tpo
	, b.dscrpcion_idntfccion_tpo
	, a.idntfccion
	, a.prmer_nmbre
	, a.sgndo_nmbre
	, a.prmer_aplldo
	, a.sgndo_aplldo
	, a.tlfno_1
	, a.tlfno_2
	, a.tlfno_3
	, a.drccion_1
	, a.drccion_2
	, a.drccion_3
	, a.email
	, a.id_trcro
from re_g_pagadores a
join df_s_identificaciones_tipo b	on	a.cdgo_idntfccion_tpo 	= b.cdgo_idntfccion_tpo
join df_s_clientes				c	on	a.cdgo_clnte			= c.cdgo_clnte;

