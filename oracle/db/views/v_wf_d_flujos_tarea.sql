
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_D_FLUJOS_TAREA" ("ID_FLJO_TREA", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_FLJO", "CDGO_FLJO", "DSCRPCION_FLJO", "DSCRPCION_DRCION_FLUJO", "DRCION_FLUJO", "ID_TREA", "NMBRE_TREA", "NMBRE_UP", "ACCION_TREA", "INDCDOR_ENVIAR", "DSCRPCION_INDCDOR_ENVIAR", "INDCDOR_INCIO", "DESCRPCION_INDCDOR_INCIO", "CDGO_MTDO_ASGNCION", "DSCRPCION", "UNDAD_DRCION", "TPO_DIA", "DSCRPCION_DRCION", "INDCDOR_PROCSAR_ESTDO", "DSCRPCION_PROCSAR_ESTDO", "DRCION", "ACTVO", "DESCRPCION_ACTIVO", "INDCDOR_TRNSCION_ATMTCA", "DESCRPCION_TRNSCION_ATMTCA") AS
  select a.id_fljo_trea
     , b.cdgo_clnte
     , b.nmbre_clnte
     , a.id_fljo
     , b.cdgo_fljo
     , b.dscrpcion_fljo
     , b.dscrpcion_drcion as dscrpcion_drcion_flujo
     , b.drcion as drcion_flujo
     , a.id_trea
     , c.dscrpcion_trea as nmbre_trea
     , c.nmbre_up
     , c.cdgo_accion_tpo accion_trea
     , c.indcdor_enviar
     , c.dscrpcion_indcdor_enviar
     , a.indcdor_incio
     , decode( a.indcdor_incio, 'S', 'Si', 'N', 'No') as descrpcion_indcdor_incio
     , d.cdgo_mtdo_asgncion
     , d.dscrpcion
     , a.undad_drcion
     , a.tpo_dia
     , decode(a.undad_drcion,'MN','Minutos', 'HR', 'Horas', 'DI', 'Días', 'SM', 'Semanas', 'MS', 'Meses' ) as dscrpcion_drcion
     , a.indcdor_procsar_estdo
     , decode( a.indcdor_procsar_estdo, 'S', 'Si', 'N', 'No') as dscrpcion_procsar_estdo
     , a.drcion
     , a.actvo
     , decode( a.actvo, 'S', 'Si', 'N', 'No') as descrpcion_activo
     , a.indcdor_trnscion_atmtca
     , decode( a.indcdor_trnscion_atmtca, 'S', 'Si', 'N', 'No') as descrpcion_trnscion_atmtca
  from wf_d_flujos_tarea a
  join v_wf_d_flujos b on b.id_fljo = a.id_fljo
  join v_wf_d_tareas c on c.id_trea = a.id_trea
  left join df_s_metodos_asignacion d on d.cdgo_mtdo_asgncion = a.cdgo_mtdo_asgncion;

