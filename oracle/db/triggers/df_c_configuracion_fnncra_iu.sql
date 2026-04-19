
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_CONFIGURACION_FNNCRA_IU"
	for insert or update on df_c_configuracion_fnncra
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_cnfgrcion_fnncra is null then
				:new.id_cnfgrcion_fnncra := sq_df_c_configuracion_fnncra.nextval;
			end if;
			:new.user_dgta := user;
			:new.fcha_dgta := systimestamp;
		elsif updating then
			:new.user_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
			:new.fcha_mdfca := systimestamp;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "DF_C_CONFIGURACION_FNNCRA_IU" ENABLE;

