
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_D_SANCIONES" ("ID_SNCION", "CDGO_SNCION", "DSCRPCION", "ACTVO") AS
  select a.id_sncion,
       a.cdgo_sncion,
       a.dscrpcion,
       a.actvo
from fi_d_sanciones a;

