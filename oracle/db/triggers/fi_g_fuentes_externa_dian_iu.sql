
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FUENTES_EXTERNA_DIAN_IU"
	for insert or update on fi_g_fuentes_externa_dian
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fnte_extrna_dian is null then
				d := sq_fi_g_fuentes_externa_dian.nextval();
				:new.id_fnte_extrna_dian := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_FUENTES_EXTERNA_DIAN_IU" ENABLE;

