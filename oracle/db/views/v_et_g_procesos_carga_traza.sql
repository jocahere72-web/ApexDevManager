
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_ET_G_PROCESOS_CARGA_TRAZA" ("ID_PRCSO_CRGA_TRZA", "ID_PRCSO_CRGA", "ORGEN", "NMBRE_CRGA", "NMBRE_CLNTE", "NMBRE_IMPSTO", "VGNCIA", "RGSTROS_PRCSDOS", "RGSTROS_EXTSOS", "RGSTROS_ERROR", "FCHA_INCIO", "FCHA_FIN", "DURACION") AS
  select
  a.id_prcso_crga_trza,
  a.id_prcso_crga,
  a.orgen,
  b.nmbre_crga,
  b.nmbre_clnte,
  b.nmbre_impsto,
  b.vgncia,
  a.rgstros_prcsdos,
  a.rgstros_extsos,
  a.rgstros_error,
  a.fcha_incio,
  a.fcha_fin,
  a.fcha_fin - a.fcha_incio duracion
from et_g_procesos_carga_traza a, v_et_g_procesos_carga b
where a.id_prcso_crga = b.id_prcso_crga;

