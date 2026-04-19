
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_ACCIONES_DINAMICA_IU"
	for insert or update on gn_g_acciones_dinamica
	compound  trigger

	before each row is
		begin
			if inserting then
				if :new.id_accn_dnmca is null then
					:new.id_accn_dnmca := sq_gn_g_acciones_dinamica.nextval;
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
ALTER TRIGGER "GN_G_ACCIONES_DINAMICA_IU" ENABLE;

