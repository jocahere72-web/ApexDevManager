
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_T_PAGADORES_DOCUMENTO" ("ID_PGDOR_DCMNTO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "IDNTFCCION_ANTRIOR", "IDNTFCCION_ANTRIOR_FRMTDA", "CDGO_DCMNTO_TPO", "DSCRPCION_DCMNTO_TPO", "VLOR_TTAL_DCMNTO", "ID_DCMNTO", "NMRO_DCMNTO", "FCHA_VNCMNTO", "DSCRPCION_IDNTFCCION_TPO", "ID_PGDOR", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "TLFNO_1", "DRCCION_1", "EMAIL", "INDCDOR_ESTDO_TRNSCCION", "DSCRPCION_ESTDO_TRNSCCION", "FCHA_RGSTRO", "FCHA_MDFCCION", "INDCDOR_ESTDO_TRNSCCION2") AS
  select a.id_pgdor_dcmnto
	, a.cdgo_clnte
	, c.nmbre_clnte
	, b.id_impsto
	, b.nmbre_impsto
	, b.id_impsto_sbmpsto
	, b.nmbre_impsto_sbmpsto
	, b.id_sjto_impsto
	, b.cdgo_sjto_tpo
	, b.dscrpcion_sjto_tpo
	, b.idntfccion_sjto
	, b.idntfccion_sjto_frmtda
	, b.idntfccion_antrior
	, b.idntfccion_antrior_frmtda
	, b.cdgo_dcmnto_tpo
	, b.dscrpcion_dcmnto_tpo
	, b.vlor_ttal_dcmnto
	, a.id_dcmnto
	, b.nmro_dcmnto
	, b.fcha_vncmnto
	, c.dscrpcion_idntfccion_tpo
	, a.id_pgdor
	, c.prmer_nmbre
	, c.sgndo_nmbre
	, c.prmer_aplldo
	, c.sgndo_aplldo
    , c.tlfno_1
    , c.drccion_1
    , c.email
	, a.indcdor_estdo_trnsccion
	, decode(a.indcdor_estdo_trnsccion, 'IN', 'INICIADA', 'PE', 'PENDIENTE','AP','APROBADA','FA','FALLIDA','RE','RECHAZADA') as dscrpcion_estdo_trnsccion
	, a.fcha_rgstro
	, a.fcha_mdfccion
    , a.indcdor_estdo_trnsccion2
from re_t_pagadores_documento a
join v_re_g_documentos 	b	on	a.id_dcmnto 	= b.id_dcmnto
join v_re_t_pagadores 	c	on	a.id_pgdor 		= c.id_pgdor
							and b.cdgo_clnte	= c.cdgo_clnte;

