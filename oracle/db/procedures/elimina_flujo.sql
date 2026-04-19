
  CREATE OR REPLACE EDITIONABLE PROCEDURE "ELIMINA_FLUJO" (v_id_instncia_fljo number) as
    begin
        delete wf_g_instncias_trnscn_estdo
        where id_instncia_trnscion in (
            select l.id_instncia_trnscion
            from wf_g_instancias_transicion l
            where id_instncia_fljo = v_id_instncia_fljo );

        delete wf_g_instncs_trnscn_estdtca
        where id_instncia_trnscion in (
            select l.id_instncia_trnscion
            from wf_g_instancias_transicion l
            where id_instncia_fljo = v_id_instncia_fljo );

        delete wf_g_instancias_participante
        where id_fljo_trnscion = v_id_instncia_fljo;

        delete wf_g_instancias_transicion
        where id_instncia_fljo = v_id_instncia_fljo;

        delete wf_g_instncias_flj_evn_prpd
        where id_instncia_fljo_evnto in (
            select k.id_instncia_fljo_evnto
            from wf_g_instancias_flujo_evnto k
             where id_instncia_fljo = v_id_instncia_fljo);

        delete wf_g_instancias_flujo_evnto
        where id_instncia_fljo = v_id_instncia_fljo;

        delete wf_g_instancias_flujo_bndja
        where id_instncia_fljo = v_id_instncia_fljo;

        delete wf_g_instancias_flujo_gnrdo
        where id_instncia_fljo_gnrdo = v_id_instncia_fljo or id_instncia_fljo_gnrdo_hjo = v_id_instncia_fljo;

        delete wf_g_instancias_flujo
        where id_instncia_fljo = v_id_instncia_fljo;
    end;
/

