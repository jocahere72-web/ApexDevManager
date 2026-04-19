
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_CODIGOS_RESPUESTA_IU"
	for insert or update on ws_d_codigos_respuesta
	compound  trigger

	before each row is
		begin
			if inserting then
				if :new.id_cdgo_rspsta is null then
					:new.id_cdgo_rspsta := sq_ws_d_codigos_respuesta.nextval;
				end if;
			end if;
		end before each row;
	end;



/
ALTER TRIGGER "WS_D_CODIGOS_RESPUESTA_IU" ENABLE;

