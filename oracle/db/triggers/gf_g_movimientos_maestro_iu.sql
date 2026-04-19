
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_MOVIMIENTOS_MAESTRO_IU"
	for insert or update on gf_g_movimientos_maestro
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_mvmnto_mstro is null then

				select nvl(max(id_mvmnto_mstro)+1, 1) into d
				  from gf_g_movimientos_maestro;
				:new.id_mvmnto_mstro := d;

			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "GF_G_MOVIMIENTOS_MAESTRO_IU" ENABLE;

