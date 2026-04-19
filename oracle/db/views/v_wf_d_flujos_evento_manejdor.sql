
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_D_FLUJOS_EVENTO_MANEJDOR" ("ID_FLJO_EVNTO_MNJDOR", "FNCION", "ID_FLJO_EVNTO", "ID_FLJO", "CDGO_EVNTO", "DSCRPCION_EVNTO", "CDGO_CLNTE", "ID_FLJO_MNJDOR", "ID_FLJO_TREA", "ID_TREA", "NMBRE_TREA", "ACTVO", "DESCRPCION_ACTIVO") AS
  select a.id_fljo_evnto_mnjdor
     , a.fncion
     , b.id_fljo_evnto
     , b.id_fljo
     , b.cdgo_evnto
     , b.dscrpcion_evnto
     , b.cdgo_clnte
     , c.id_fljo id_fljo_mnjdor
     , c.id_fljo_trea
     , c.id_trea
     , c.nmbre_trea
     , c.actvo
     , c.descrpcion_activo
  from wf_d_flujos_evento_manejdor a
  join v_wf_d_flujos_evento b
    on b.id_fljo_evnto = a.id_fljo_evnto
  join v_wf_d_flujos_tarea c
    on c.id_fljo = a.id_fljo
   and c.id_fljo_trea = a.id_fljo_trea;

