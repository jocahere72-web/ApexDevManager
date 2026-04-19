
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_PREDIOS_DESTINO" ("ID_PRDIO_DSTNO", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "NMTCNCO", "DSCRPCION") AS
  select
  a.id_prdio_dstno,
  a.cdgo_clnte,
  a.id_impsto,
  b.nmbre_impsto,
  a.nmtcnco,
  a.dscrpcion
from df_i_predios_destino a
join df_c_impuestos       b on a.id_impsto = b.id_impsto;

