
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_OFICINAS" ("ID_OFCNA", "CDGO_CLNTE", "NMBRE_OFCNA", "ID_OFCNA_PDRE", "NMBRE_OFCNA_PDRE", "ID_FNCNRIO") AS
  select
  a.id_ofcna,
  a.cdgo_clnte,
  a.nmbre_ofcna,
  a.id_ofcna_pdre,
  b.nmbre_ofcna nmbre_ofcna_pdre,
  a.id_fncnrio
from df_c_oficinas a
left join df_c_oficinas b on a.id_ofcna = b.id_ofcna_pdre;

