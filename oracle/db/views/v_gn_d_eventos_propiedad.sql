
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_D_EVENTOS_PROPIEDAD" ("ID_EVNTO_PRPDAD", "CDGO_PRPDAD", "DSCRPCION", "ID_EVNTO", "CDGO_EVNTO", "DSCRPCION_EVNTO", "ID_PRCSO", "NMBRE_PRCSO", "DSCRPCION_PRCSO", "ACTVO", "DSCRPCION_ACTVO", "ID_PRCSO_PDRE") AS
  select a.id_evnto_prpdad
     , a.cdgo_prpdad
     , a.dscrpcion
     , b.id_evnto
     , b.cdgo_evnto
     , b.dscrpcion dscrpcion_evnto
     , b.id_prcso
     , b.nmbre nmbre_prcso
     , b.dscrpcion_prcso
     , b.actvo
     , b.dscrpcion_actvo
     , b.id_prcso_pdre
  from gn_d_eventos_propiedad a
  join v_gn_d_eventos b
     on b.id_evnto = a.id_evnto;

