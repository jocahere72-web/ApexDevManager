
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_INFORMACION_EXOGENA_IU"
	for insert or update on gi_g_informacion_exogena
	compound trigger
	d number;

		before each row is
		begin
			if inserting then
				if :new.id_infrmcion_exgna is null then
					d := sq_gi_g_informacion_exogena.nextval();
					:new.id_infrmcion_exgna := d;
				end if;
				:new.user_dgta := user;
				:new.fcha_dgta := systimestamp;
			elsif updating then
				:new.user_mdfca := coalesce( sys_context('apex$session','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
				:new.fcha_mdfca := systimestamp;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "GI_G_INFORMACION_EXOGENA_IU" ENABLE;

