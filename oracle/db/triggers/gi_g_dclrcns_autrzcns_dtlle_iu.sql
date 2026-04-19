
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DCLRCNS_AUTRZCNS_DTLLE_IU"
  for insert or update on gi_g_dclrcns_autrzcns_dtlle
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcion_autrzcion_dtlle := sq_gi_g_dclrcns_autrzcns_dtlle.nextval;
			:new.user_dgta := user;
			:new.fcha_dgta := systimestamp;
		elsif updating then
			:new.user_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
			:new.fcha_mdfca := systimestamp;
		end if;
	end before each row;
end gi_g_dclrcns_autrzcns_dtlle_iu;




/
ALTER TRIGGER "GI_G_DCLRCNS_AUTRZCNS_DTLLE_IU" ENABLE;

