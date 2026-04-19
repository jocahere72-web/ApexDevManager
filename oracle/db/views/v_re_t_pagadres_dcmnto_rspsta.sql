
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_T_PAGADRES_DCMNTO_RSPSTA" ("ID_PGDOR_DCMNTO_RSPSTA", "ID_PGDOR_DCMNTO", "ID_DCMNTO", "NMRO_DCMNTO", "RSPSTA", "ESTSDO_RSPSTA", "FCHA_RSPSTA") AS
  select	a.id_pgdor_dcmnto_rspsta
	  , a.id_pgdor_dcmnto
	  , b.id_dcmnto
	  , b.nmro_dcmnto
	  , a.rspsta
      , JSON_VALUE(a.rspsta, '$.paymentStatus') estsdo_rspsta
	  , a.fcha_rspsta
from 	re_t_pagadres_dcmnto_rspsta	a
join	v_re_t_pagadores_documento	b	on	b.id_pgdor_dcmnto = a.id_pgdor_dcmnto;

