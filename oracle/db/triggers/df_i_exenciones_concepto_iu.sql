
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_EXENCIONES_CONCEPTO_IU"
	for insert or update on df_i_exenciones_concepto
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_exncion_cncpto is null then
				:new.id_exncion_cncpto := sq_df_i_exenciones_concepto.nextval;
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
ALTER TRIGGER "DF_I_EXENCIONES_CONCEPTO_IU" ENABLE;

