
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FUENTES_EXTERNA_IU"
	for insert or update on fi_g_fuentes_externa
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fnte_extrna is null then
				d := sq_fi_g_fuentes_externa.nextval();
				:new.id_fnte_extrna := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_FUENTES_EXTERNA_IU" ENABLE;

