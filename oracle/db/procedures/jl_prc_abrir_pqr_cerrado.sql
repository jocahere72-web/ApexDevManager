
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_PRC_ABRIR_PQR_CERRADO" (p_id_instncia_fljo_gnrdo number) is
begin

  update wf_g_instancias_transicion a
     set a.id_estdo_trnscion = 1
   where a.id_instncia_trnscion =
         (select max(b.id_instncia_trnscion)
            from genesys.wf_g_instancias_transicion b
           where b.id_instncia_fljo = a.id_instncia_fljo)
     and a.id_instncia_fljo = p_id_instncia_fljo_gnrdo;

  update pq_g_solicitudes t
     set t.id_estdo = 2
   where exists
   (select 1
            from v_wf_g_instancias_flujo_gnrdo g
           where g.id_instncia_fljo = t.id_instncia_fljo
             and g.id_instncia_fljo_gnrdo = p_id_instncia_fljo_gnrdo);

  update genesys.wf_g_instancias_flujo a
     set a.estdo_instncia = 'INICIADA'
   where a.id_instncia_fljo = p_id_instncia_fljo_gnrdo;

  commit;

end jl_prc_abrir_pqr_cerrado;
/

