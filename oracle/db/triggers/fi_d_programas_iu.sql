
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_PROGRAMAS_IU"
	for insert or update on fi_d_programas
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_prgrma is null then
				d := sq_fi_d_programas.nextval();
				:new.id_prgrma := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_PROGRAMAS_IU" ENABLE;

