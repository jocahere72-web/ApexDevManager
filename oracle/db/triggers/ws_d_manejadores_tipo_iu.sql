
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_MANEJADORES_TIPO_IU"
	for insert or update on ws_d_manejadores_tipo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_mnjdr_tpo is null then

				select nvl(max(id_mnjdr_tpo)+1, 1) into d
				  from ws_d_manejadores_tipo;
				:new.id_mnjdr_tpo := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "WS_D_MANEJADORES_TIPO_IU" ENABLE;

