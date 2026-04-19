
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_EMBARGOS_CARTERA_V2" ("ID_EMBRGOS_CRTRA", "ID_SJTO_IMPSTO", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO") AS
  select a.id_embrgos_crtra
     , a.id_sjto_impsto
     , a.id_impsto
     , a.id_impsto_sbmpsto
from mc_g_embargos_cartera_detalle a
group by a.id_embrgos_crtra
     , a.id_sjto_impsto
     , a.id_impsto
     , a.id_impsto_sbmpsto;

