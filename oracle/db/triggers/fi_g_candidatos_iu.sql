
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_CANDIDATOS_IU"
	for insert or update on fi_g_candidatos
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_cnddto is null then
				d := sq_fi_g_candidatos.nextval();
				:new.id_cnddto := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_CANDIDATOS_IU" ENABLE;

