
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_DESEMBARGOS_SOLICITUD_IU"
	for insert or update on mc_g_desembargos_solicitud
	compound trigger
	v_cdgo_csal             mc_d_causales_desembargo.cdgo_csal%type;
    new_estado_slctud       mc_g_desembargos_solicitud.estado_slctud%type;
    old_estado_slctud       mc_g_desembargos_solicitud.estado_slctud%type;
    v_id_dsmbrgo_slctud     number;
    v_id_embrgos_rslcion    number;


    procedure execute_job(p_id_dsmbrgo_slctud in number)
    as
        pragma autonomous_transaction;
        v_nmbre_job  varchar2(42) := 'IT_WF_MC_' || to_char(systimestamp,'ddmmyyyyhhmissFF6');
    begin
        --CREAMOS EL JOB PARA EJECUTAR EN SEGUNDO PLANO
        begin
            dbms_scheduler.create_job ( job_name            => v_nmbre_job
                                      , job_type            => 'STORED_PROCEDURE'
                                      , job_action          => 'PKG_CB_MEDIDAS_CAUTELARES.PRC_RG_TRANSICION_DESEMBARGO'
                                      , number_of_arguments => 1
                                      , start_date          => null
                                      , repeat_interval     => null
                                      , end_date            => null
                                      , enabled             => false
                                      , auto_drop           => true
                                      , comments            => v_nmbre_job);

            --PASAMOS EL ARGUMENTO DE LA INSTANCIA DEL FLUJO AL JOBS
            dbms_scheduler.set_job_argument_value( job_name          => v_nmbre_job
                                                 , argument_position => 1
                                                 , argument_value    => p_id_dsmbrgo_slctud);

            --ACTUALIZAMOS LA FECHA DE INICIO DEL JOBS
            dbms_scheduler.set_attribute( name      => v_nmbre_job
                                        , attribute => 'start_date'
                                        , value     => current_timestamp + interval '7' second );

            --HABILITAMOS EL JOBS
            dbms_scheduler.enable(name => v_nmbre_job);
        exception
            when others then
                null;
        end;
    end execute_job;

	before each row is
	begin
        new_estado_slctud   := :new.estado_slctud;
        old_estado_slctud   := :old.estado_slctud;
        v_id_dsmbrgo_slctud := :new.id_dsmbrgo_slctud;

		if inserting then
            null;
		end if;
	end before each row;

    after statement is begin
        if updating and new_estado_slctud != old_estado_slctud
                    and new_estado_slctud = 'A' then
            begin
                execute_job(p_id_dsmbrgo_slctud => v_id_dsmbrgo_slctud);
            exception
                when others then
                    null;
            end;
        end if;
    end after statement;

end mc_g_desembargos_solicitud_iu;




/
ALTER TRIGGER "MC_G_DESEMBARGOS_SOLICITUD_IU" ENABLE;

