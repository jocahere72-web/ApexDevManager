
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_G_INSTANCIAS_TRANSICION_IU"
	for insert on wf_g_instancias_transicion
	compound trigger
    v_nmbre_up              varchar2(1000);
    v_id_fljo_trea_orgen    wf_g_instancias_transicion.id_fljo_trea_orgen%type;
    v_id_instncia_fljo      wf_g_instancias_transicion.id_instncia_fljo%type;

	before each row is
	begin
		v_id_fljo_trea_orgen    := :new.id_fljo_trea_orgen;
        v_id_instncia_fljo      := :new.id_instncia_fljo;

	end before each row;

    after statement is begin
        if inserting then
            begin
                select nmbre_up
                  into v_nmbre_up
                  from v_wf_d_flujos_tarea
                 where id_fljo_trea = v_id_fljo_trea_orgen
                   and accion_trea  = 'EUP';

                begin
                    v_nmbre_up := 'Begin ' || v_nmbre_up || '; end;';
                    execute immediate v_nmbre_up using v_id_instncia_fljo, v_id_fljo_trea_orgen;
                exception
                    when others then
                        null;
                end;

            exception
                when others then
                    null;
            end;
        end if;
    end after statement;
end;




/
ALTER TRIGGER "WF_G_INSTANCIAS_TRANSICION_IU" ENABLE;

