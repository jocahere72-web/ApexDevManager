
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_D_FLUJOS_EVENTO" ("ID_FLJO_EVNTO", "ID_EVNTO", "ACTVO", "DESCRPCION_ACTIVO", "CDGO_EVNTO", "DSCRPCION_EVNTO", "ID_FLJO", "CDGO_CLNTE", "NMBRE_CLNTE", "CDGO_FLJO", "DSCRPCION_FLJO", "ID_PRCSO", "PRCSO", "ACTVO_FLJO", "DESCRPCION_ACTIVO_FLJO") AS
  select a.id_fljo_evnto
     , a.id_evnto
     , a.actvo
     , case when a.actvo = 'S' then 'Si' when a.actvo = 'N' then 'No' end descrpcion_activo
     , c.cdgo_evnto
     , c.dscrpcion dscrpcion_evnto
     , b.id_fljo
     , b.cdgo_clnte
     , b.nmbre_clnte
     , b.cdgo_fljo
     , b.dscrpcion_fljo
     , b.id_prcso
     , b.prcso
     , b.actvo actvo_fljo
     , b.descrpcion_activo descrpcion_activo_fljo
  from wf_d_flujos_evento a
  join v_wf_d_flujos b
    on a.id_fljo = b.id_fljo
  join gn_d_eventos c
    on c.id_evnto = a.id_evnto;

