
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_DECLARACIONES_ACTVDAD" ("ID_DCLRCION_ACTVDAD", "ID_DCLRCION", "ID_DCLRCNS_ESQMA_TRFA", "CDGO_DCLRCNS_ESQMA_TRFA", "DSCRPCION", "TRFA", "VLOR_IGRSOS_GRVDOS", "VLOR_IPSTO") AS
  select
  a.id_dclrcion_actvdad,
  a.id_dclrcion,
  a.id_dclrcns_esqma_trfa,
  b.cdgo_dclrcns_esqma_trfa,
  b.dscrpcion,
  a.trfa,
  a.vlor_igrsos_grvdos,
  a.vlor_ipsto
from gi_g_declaraciones_actvdad a
join gi_d_dclrcns_esqma_trfa b on b.id_dclrcns_esqma_trfa = a.id_dclrcns_esqma_trfa
;

