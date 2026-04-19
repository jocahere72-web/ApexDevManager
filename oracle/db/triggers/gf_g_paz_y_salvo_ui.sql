
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_PAZ_Y_SALVO_UI"
		for insert or update on gf_g_paz_y_salvo
		compound trigger
		d number;

		before each row is
		begin
			if inserting then
				:new.usrio_dgta := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
				:new.fcha_dgta  := systimestamp;
				if :new.id_pz_slvo is null then
					d := sq_gf_g_paz_y_salvo.nextval;
					:new.id_pz_slvo := d;
				end if;
			elsif updating then
				:new.usrio_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
				:new.fcha_mdfca  := systimestamp;
			end if;
		end before each row;
	end;




/
ALTER TRIGGER "GF_G_PAZ_Y_SALVO_UI" ENABLE;

