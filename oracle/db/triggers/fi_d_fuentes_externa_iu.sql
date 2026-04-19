
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_FUENTES_EXTERNA_IU"
	for insert or update on fi_d_fuentes_externa
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fntes_extrna is null then
				d := sq_fi_d_fuentes_externa.nextval();
				:new.id_fntes_extrna := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_FUENTES_EXTERNA_IU" ENABLE;

