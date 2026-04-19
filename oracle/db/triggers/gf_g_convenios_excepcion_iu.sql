
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_EXCEPCION_IU"
	for insert or update on gf_g_convenios_excepcion
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_excpcion is null then
				:new.id_cnvnio_excpcion := sq_gf_g_convenios_excepcion.nextval;
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
ALTER TRIGGER "GF_G_CONVENIOS_EXCEPCION_IU" ENABLE;

