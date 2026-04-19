
  CREATE OR REPLACE EDITIONABLE PROCEDURE "ELIMINA_PQRS" as
    v_id_slctud number;
    --:id_instncia_fljo number;

begin
    for i in (
        select *
        from v_pq_g_solicitudes
        where
              nmro_rdcdo_dsplay = '2021-10000990'
            --nmro_rdcdo_dsplay is null
            --upper(nmbre_rdcdor) like '%BRUNAL%'
            --upper(nmbre_rdcdor) like '%TEST TEST%'
            --upper(nmbre_trcro) like '%MIGRA%'
            --upper(nmbre_trcro) like '%ADMINISTRADOR%'
            --id_slctud IN (29654)
    ) loop
        v_id_slctud := i.id_slctud;
        --v_id_instncia_fljo := i.id_instncia_fljo;

        delete pq_g_solicitudes_mtvo_acto
        where  id_slctud_mtvo in
                ( select c.id_slctud_mtvo
                    from pq_g_solicitudes_motivo c
                    where c.id_slctud = v_id_slctud);
        --29661
        delete pq_g_slctdes_mtvo_sjt_impst
        where  id_slctud_mtvo in
                ( select c.id_slctud_mtvo
                    from pq_g_solicitudes_motivo c
                    where c.id_slctud = v_id_slctud );

        delete pq_g_solicitudes_motivo
        where  id_slctud = v_id_slctud;

        delete pq_g_slctdes_obsrvcn_adjnto
        where id_slctd_obsrvcion in
            ( select f.id_slctd_obsrvcion
              from pq_g_solicitudes_obsrvcion f
              where f.id_slctud = v_id_slctud);

        delete pq_g_solicitudes_obsrvcion
        where  id_slctud = v_id_slctud;

        delete pq_g_solicitantes
        where  id_slctud = v_id_slctud ;

        delete pq_g_documentos
        where  id_slctud = v_id_slctud;

        delete pq_g_solicitudes
        where  id_slctud = v_id_slctud;

        elimina_flujo(i.id_instncia_fljo_gnrdo);
        elimina_flujo(i.id_instncia_fljo);


    end loop;
end;
/

