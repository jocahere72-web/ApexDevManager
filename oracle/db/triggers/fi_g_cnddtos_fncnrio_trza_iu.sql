
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_CNDDTOS_FNCNRIO_TRZA_IU"
	for insert or update on fi_g_cnddtos_fncnrio_trza
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_cnddto_fncnrio_trza is null then
				d := sq_fi_g_cnddtos_fncnrio_trza.nextval();
				:new.id_cnddto_fncnrio_trza := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_CNDDTOS_FNCNRIO_TRZA_IU" ENABLE;

