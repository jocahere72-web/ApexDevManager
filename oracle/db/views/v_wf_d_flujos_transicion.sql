
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_D_FLUJOS_TRANSICION" ("ID_FLJO_TRNSCION", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_FLJO", "CDGO_FLJO", "DSCRPCION_FLJO", "ORDEN", "NMBRE_TRNSCION", "CDGO_MTDO_ASGNCION", "ID_FLJO_TREA", "ID_TREA_ORGEN", "DSCRPCION_FLJO_TREA", "NMBRE_TREA", "NMBRE_UP", "ACCION_TREA", "INDCDOR_PROCSAR_ESTDO", "ID_FLJO_TREA_DSTNO", "ID_TREA_DSTNO", "DSCRPCION_FLJO_TREA_DSTNO", "NMBRE_TREA_DTNO", "NMBRE_UP_DTNO", "ACCION_TREA_DTNO", "PROCSAR_ESTDO_DTNO", "INDCDOR_INCIO", "CDGO_MTDO_ASGNCION_FLJO_TREA") AS
  select
  a.id_fljo_trnscion,
  b.cdgo_clnte,
  b.nmbre_clnte,
  a.id_fljo,
  b.cdgo_fljo,
  b.dscrpcion_fljo,
  a.orden,
  a.nmbre_trnscion,
  a.cdgo_mtdo_asgncion,
  a.id_fljo_trea,
  c.id_trea id_trea_orgen,
  c.dscrpcion_fljo dscrpcion_fljo_trea,
  c.nmbre_trea,
  c.nmbre_up,
  c.accion_trea,
  c.indcdor_procsar_estdo,
  a.id_fljo_trea_dstno ,
  d.id_trea id_trea_dstno,
  d.dscrpcion_fljo dscrpcion_fljo_trea_dstno,
  d.nmbre_trea nmbre_trea_dtno,
  d.nmbre_up nmbre_up_dtno ,
  d.accion_trea accion_trea_dtno,
  d.indcdor_procsar_estdo procsar_estdo_dtno,
  c.indcdor_incio,
  c.cdgo_mtdo_asgncion as cdgo_mtdo_asgncion_fljo_trea
from wf_d_flujos_transicion a, v_wf_d_flujos b, v_wf_d_flujos_tarea c, v_wf_d_flujos_tarea d
where a.id_fljo = b.id_fljo
  and a.id_fljo_trea = c.id_fljo_trea
  and a.id_fljo_trea_dstno = d.id_fljo_trea
  and b.cdgo_clnte = c.cdgo_clnte
  and c.cdgo_clnte = d.cdgo_clnte;

