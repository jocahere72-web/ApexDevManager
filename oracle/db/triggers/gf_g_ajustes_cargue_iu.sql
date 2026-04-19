
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_AJUSTES_CARGUE_IU"
		for insert or update on gf_g_ajustes_cargue
		compound  trigger
	before each row is
		begin
			if inserting then
				if :new.id_ajste_crgue is null then
					:new.id_ajste_crgue := sq_gf_g_ajustes_cargue.nextval;
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
ALTER TRIGGER "GF_G_AJUSTES_CARGUE_IU" ENABLE;

