
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_FUENTES_EXTERNA_CARGA_IU"
	for insert or update on fi_d_fuentes_externa_carga
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fntes_extrna_crga is null then
				d := sq_fi_d_fuentes_externa_carga.nextval();
				:new.id_fntes_extrna_crga := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_FUENTES_EXTERNA_CARGA_IU" ENABLE;

