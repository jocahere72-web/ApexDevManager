
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_G_REGISTRA_RESPUESTA_IU"
	for insert on ws_g_registra_respuesta
	compound  trigger

	before each row is
		begin
			if inserting then
				if :new.id_rspsta is null then
					:new.id_rspsta := sq_ws_g_registra_respuesta.nextval;
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "WS_G_REGISTRA_RESPUESTA_IU" ENABLE;

