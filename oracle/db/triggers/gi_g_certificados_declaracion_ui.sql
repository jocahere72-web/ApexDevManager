
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_CERTIFICADOS_DECLARACION_UI"
		for insert or update on gi_g_certificados_declaracion
		compound trigger
		d number;

		before each row is
		begin
			if inserting then
				:new.usrio_dgta := coalesce( sys_context('apex$session','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
				:new.fcha_dgta  := systimestamp;
				if :new.id_crtfcdo_dcl is null then
					select nvl( max(id_crtfcdo_dcl), 0 ) + 1  into d
					from gi_g_certificados_declaracion;
					:new.id_crtfcdo_dcl := d;
				end if;
			elsif updating then
				:new.usrio_mdfca := coalesce( sys_context('apex$session','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
				:new.fcha_mdfca  := systimestamp;
			end if;
		end before each row;
	end;




/
ALTER TRIGGER "GI_G_CERTIFICADOS_DECLARACION_UI" ENABLE;

