
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_PROCESOS_ACCION_IU"
	for insert or update on df_c_procesos_accion
	compound  trigger

	before each row is
		begin
			if inserting then
				if :new.id_prcso_accion is null then
					:new.id_prcso_accion := sq_df_c_procesos_accion.nextval;
				end if;
				:new.user_dgta := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
				:new.fcha_dgta := systimestamp;
			elsif updating then
				:new.user_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
				:new.fcha_mdfca := systimestamp;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "DF_C_PROCESOS_ACCION_IU" ENABLE;

