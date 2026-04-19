
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_APLICACIONES_CLIENTE_IU"
	for insert or update on sg_g_aplicaciones_cliente
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			:new.username_digita := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
			:new.fecha_digita := systimestamp;

			if :new.id_aplccion_clnte is null then
				select nvl( max(id_aplccion_clnte), 0 ) + 1  into d
				from sg_g_aplicaciones_cliente;
				:new.id_aplccion_clnte := d;
			end if;

		elsif updating then
			:new.username_modifica := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
			:new.fecha_modifica := systimestamp;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "SG_G_APLICACIONES_CLIENTE_IU" ENABLE;

