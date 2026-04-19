
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_PAGADRES_DCMNTO_RSPSTA" ("ID_PGDOR_DCMNTO_RSPSTA", "ID_PGDOR_DCMNTO", "FCHA_RSPSTA", "RSPSTA") AS
  select a.id_pgdor_dcmnto_rspsta,
       a.id_pgdor_dcmnto,
       a.fcha_rspsta,
       a.rspsta
from re_g_pagadres_dcmnto_rspsta a
;

