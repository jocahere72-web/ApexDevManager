
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_D_CONFIGURACIONES_LOG" ("ID_CNFGRCION_LOG", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "NMBRE_UP", "TPO_UP", "NVEL_LOG") AS
  select
  a.id_cnfgrcion_log,
  a.cdgo_clnte,
  a.id_impsto,
  (select m.dscrpcion || ' [' || m.id_dfncn_impsto || ']'
   from df_i_definiciones_impuesto m
   where m.cdgo_clnte = a.cdgo_clnte
     and m.id_impsto = a.id_impsto) nmbre_impsto,
  a.nmbre_up,
  a.tpo_up,
  a.nvel_log
from sg_d_configuraciones_log a;

