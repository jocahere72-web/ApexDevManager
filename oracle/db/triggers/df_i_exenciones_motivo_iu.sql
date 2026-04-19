
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_EXENCIONES_MOTIVO_IU"
	for insert or update on df_i_exenciones_motivo
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_exncion_mtvo is null then
				:new.id_exncion_mtvo := sq_df_i_exenciones_motivo.nextval;
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
ALTER TRIGGER "DF_I_EXENCIONES_MOTIVO_IU" ENABLE;

