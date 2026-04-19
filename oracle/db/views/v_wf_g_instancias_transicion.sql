
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_G_INSTANCIAS_TRANSICION" ("TREA_ORIGEN", "ID_FLJO_TREA", "ID_TREA_ORGEN", "NMBRE_UP", "ACCION_TREA", "INDCDOR_PROCSAR_ESTDO", "CDGO_MTDO_ASGNCION", "TREA_DSTNO", "ID_FLJO_TREA_DSTNO", "ID_TREA_DSTNO", "ID_INSTNCIA_FLJO", "PDRE", "ORDEN", "ORDEN_TRNSCION", "ID_FLJO", "CDGO_FLJO", "ID_FLJO_TRNSCION", "CDGO_CLNTE") AS
  select distinct  a.nmbre_trnscion  trea_origen,
         a.id_fljo_trea,
         a.id_trea_orgen,
		 a.nmbre_up,
		 a.accion_trea,
         a.indcdor_procsar_estdo,
         a.cdgo_mtdo_asgncion,
         null trea_dstno,
         null id_fljo_trea_dstno,
         null id_trea_dstno,
         b.id_instncia_fljo,
         null pdre,
         0 orden,
         a.orden orden_trnscion,
         b.id_fljo,
         a.cdgo_fljo,
         null id_fljo_trnscion,
         a.cdgo_clnte
     from v_wf_d_flujos_transicion a
    join wf_g_instancias_flujo b
      on a.id_fljo = b.id_fljo
  where a.indcdor_incio = 'S'
union all

select a.nmbre_trea_dtno,
       a.id_fljo_trea_dstno,
       a.id_trea_dstno,
	   a.nmbre_up_dtno,
	   a.accion_trea_dtno,
       a.procsar_estdo_dtno,
       a.cdgo_mtdo_asgncion,
       a.nmbre_trnscion,
       a.id_fljo_trea,
       a.id_trea_orgen,
       b.id_instncia_fljo,
       a.id_fljo_trea,
       a.orden,
       a.orden orden_trnscion,
       b.id_fljo,
       a.cdgo_fljo,
       a.id_fljo_trnscion,
       a.cdgo_clnte
  from v_wf_d_flujos_transicion a
  join wf_g_instancias_flujo b
      on a.id_fljo = b.id_fljo order by orden;

