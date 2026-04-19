
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_G_INSTANCIAS_TRANSICION_P" ("ID_INSTNCIA_TRNSCION", "ID_INSTNCIA_FLJO", "ID_FLJO_TREA_ORGEN", "NMBRE_TRNSCION_ORGEN", "ID_ESTDO_TRNSCION", "ESTDO_TRNSCION", "CLOR_TRNSCION", "FCHA_INCIO", "FCHA_FIN_PLNDA", "FCHA_FIN_OPTMA") AS
  select wit.id_instncia_trnscion,
       wit.id_instncia_fljo,
       wit.id_fljo_trea_orgen,
       wft.nmbre_trnscion as nmbre_trnscion_orgen,
       wit.id_estdo_trnscion,
       wet.estdo_trnscion,
       wet.clor_trnscion,
       wit.fcha_incio,
       wit.fcha_fin_plnda,
       wit.fcha_fin_optma
from wf_g_instancias_transicion wit
inner join wf_d_estado_transicion wet on wit.id_estdo_trnscion = wet.id_estdo_trnscion
inner join wf_d_flujos_transicion wft on wit.id_fljo_trea_orgen = wft.id_fljo_trea
--where wit.id_estdo_trnscion in (1,2)
order by  wit.id_instncia_trnscion asc;

