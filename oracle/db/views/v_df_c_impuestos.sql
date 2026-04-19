
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_IMPUESTOS" ("ID_IMPSTO", "CDGO_CLNTE", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ACTVO", "CDGO_SJTO_TPO", "INDCDOR_IDNTFCCION_ANT", "INDCDOR_NRMLZAR_CRTRA") AS
  select
  a.id_impsto,
  a.cdgo_clnte,
  a.cdgo_impsto,
  a.nmbre_impsto,
  a.actvo,
  a.cdgo_sjto_tpo,
  a.indcdor_idntfccion_ant,
  a.indcdor_nrmlzar_crtra
from df_c_impuestos a;

