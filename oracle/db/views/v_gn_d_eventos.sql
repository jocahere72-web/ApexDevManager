
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_D_EVENTOS" ("ID_EVNTO", "CDGO_EVNTO", "DSCRPCION", "ID_PRCSO", "NMBRE", "DSCRPCION_PRCSO", "ACTVO", "DSCRPCION_ACTVO", "ID_PRCSO_PDRE") AS
  select a.id_evnto
     , a.cdgo_evnto
     , a.dscrpcion
     , b.id_prcso
     , b.nmbre
     , b.dscrpcion dscrpcion_prcso
     , b.actvo
     , case when b.actvo = 'S' then 'Si' when b.actvo = 'N' then 'No' end  dscrpcion_actvo
     , b.id_prcso_pdre
  from gn_d_eventos a
  join df_s_procesos b
    on b.id_prcso = a.id_prcso;

