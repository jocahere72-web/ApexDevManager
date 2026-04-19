
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FUENTES_EXTERNA_IVA_IU"
	for insert or update on fi_g_fuentes_externa_iva
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_g_fuentes_externa_iva is null then
				d := sq_fi_g_fuentes_externa_iva.nextval();
				:new.id_g_fuentes_externa_iva := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_FUENTES_EXTERNA_IVA_IU" ENABLE;

