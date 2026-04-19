
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DCLRCNES_ARHVOS_ADJNTO_IU"
  for insert or update on gi_g_dclrcnes_arhvos_adjnto
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcion_archvo_adjnto := sq_gi_g_dclrcnes_arhvos_adjnto.nextval;
			:new.user_dgta := user;
			:new.fcha_dgta := systimestamp;
		elsif updating then
			:new.user_mdfca := coalesce( sys_context('apex$session','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
			:new.fcha_mdfca := systimestamp;
		end if;
	end before each row;
end gi_g_dclrcnes_arhvos_adjnto_iu;



/
ALTER TRIGGER "GI_G_DCLRCNES_ARHVOS_ADJNTO_IU" ENABLE;

