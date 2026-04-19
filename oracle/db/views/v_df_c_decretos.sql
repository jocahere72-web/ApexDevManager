
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_DECRETOS" ("ID_DCRTO", "CDGO_CLNTE", "NMRO_DCRTO", "DSCRPCION", "FCHA_DCRTO", "FILE_NAME", "FILE_MIMETYPE", "FILE_BLOB") AS
  select
  a.id_dcrto,
  a.cdgo_clnte,
  a.nmro_dcrto,
  a.dscrpcion,
  a.fcha_dcrto,
  a.file_name,
  a.file_mimetype,
  a.file_blob
from df_c_decretos a;

