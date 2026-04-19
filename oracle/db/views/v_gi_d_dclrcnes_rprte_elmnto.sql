
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_DCLRCNES_RPRTE_ELMNTO" ("ID_DCLRCION_RPRTE_ELMNTO", "CDGO_CLNTE", "CDGO_ELMNTO", "NMBRE", "FNCION", "TPO_RTRNO", "DSCRPCION_TPO_RTRNO", "ACTVO", "DSCRPCION_ACTVO", "ACTVO_ELMNTO", "DSCRPCION_ACTVO_ELMNTO") AS
  select a.id_dclrcion_rprte_elmnto
     , a.cdgo_clnte
     , a.cdgo_elmnto
     , a.nmbre
     , b.fncion
     , b.tpo_rtrno
     , decode(b.tpo_rtrno, 'T', 'Texto', 'H', 'Html', 'R', 'Recursivo') dscrpcion_tpo_rtrno
     , a.actvo
     , decode(a.actvo, 'S', 'Sí', 'N', 'No') dscrpcion_actvo
     , b.actvo actvo_elmnto
     , decode(b.actvo, 'S', 'Sí', 'N', 'No') dscrpcion_actvo_elmnto
  from gi_d_dclrcnes_rprte_elmnto a
  join gi_d_declaraciones_elemento b
    on b.cdgo_elmnto = a.cdgo_elmnto;

