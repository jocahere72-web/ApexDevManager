
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_G_INSTANCIAS_FLUJO_IU"
	for update on wf_g_instancias_flujo
	compound trigger
    new_estdo_instncia  wf_g_instancias_flujo.estdo_instncia%type;
    old_estdo_instncia  wf_g_instancias_flujo.estdo_instncia%type;
    v_id_instncia_fljo  wf_g_instancias_flujo.id_instncia_fljo%type;
    v_nmbre_up          clob;
    v_mscra             varchar2(100) := 'YYYY-MM-DD HH24:MI:SS.FF TZR';
    v_count             number;

    /*
	procedure execute_job(p_id_instncia_fljo in wf_g_instancias_flujo.id_instncia_fljo%type)
    as
        pragma autonomous_transaction;
        v_nmbre_job  varchar2(42) := 'IT_WF_M_E_' || to_char(systimestamp,'ddmmyyyyhhmissFF6');
    begin
        --CREAMOS EL JOB PARA EJECUTAR EN SEGUNDO PLANO
        begin
            dbms_scheduler.create_job (
                                         job_name => v_nmbre_job
                                       , job_type => 'STORED_PROCEDURE'
                                       , job_action => 'PKG_PL_WORKFLOW_1_0.PRC_RG_EJECUTAR_MANEJADOR'
                                       , number_of_arguments => 1
                                       , start_date => null
                                       , repeat_interval => null
                                       , end_date => null
                                       , enabled => false
                                       , auto_drop => true
                                       , comments => v_nmbre_job);

            --PASAMOS EL ARGUMENTO DE LA INSTANCIA DEL FLUJO AL JOBS
            dbms_scheduler.set_job_argument_value(
                                                    job_name            => v_nmbre_job
                                                  , argument_position   => 1
                                                  , argument_value      => p_id_instncia_fljo);

            --ACTUALIZAMOS LA FECHA DE INICIO DEL JOBS
            dbms_scheduler.set_attribute( name      => v_nmbre_job
                                        , attribute => 'start_date'
                                        , value     => current_timestamp + interval '10' second );

            --HABILITAMOS EL JOBS
            dbms_scheduler.enable(name => v_nmbre_job);
        exception
            when others then
                null;
        end;
    end execute_job;
	*/

	before each row is
	begin
        new_estdo_instncia := :new.estdo_instncia;
        old_estdo_instncia := :old.estdo_instncia;
        v_id_instncia_fljo := :new.id_instncia_fljo;

	end before each row;

    after statement is begin
        if updating and new_estdo_instncia = 'FINALIZADA' and new_estdo_instncia != old_estdo_instncia  then
            begin
                select count(1)
                  into v_count
                  from v_wf_d_flujos_evento_manejdor a
                  join v_wf_g_instancias_flujo_gnrdo b
                    on a.id_fljo_mnjdor         = b.id_fljo
                   and a.id_fljo                = b.id_fljo_gnrdo
                 where b.id_instncia_fljo_gnrdo = v_id_instncia_fljo;

            exception
                when others then
                    v_count := 0;
            end;
            if v_count > 0 then
                begin
                    insert into wf_g_instancias_flujo_bndja (id_instncia_fljo)
                                                     values (v_id_instncia_fljo);
                    --execute_job(p_id_instncia_fljo =>  v_id_instncia_fljo);
                exception
                    when others then
                       null;
                end;
            end if;
        end if;
    end after statement;
end;




/
ALTER TRIGGER "WF_G_INSTANCIAS_FLUJO_IU" ENABLE;

