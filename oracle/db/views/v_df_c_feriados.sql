
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_FERIADOS" ("ID_FRDO", "CDGO_CLNTE", "FCHA", "ACTVO") AS
  select
  a.id_frdo,
  a.cdgo_clnte,
  a.fcha,
  a.actvo
from df_c_feriados a;

