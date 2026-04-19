
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_PROGRAMAS_ACTO_IU"
	for insert or update on fi_d_programas_acto
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_prgrma_acto is null then
				d := sq_fi_d_programas_acto.nextval();
				:new.id_prgrma_acto := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_PROGRAMAS_ACTO_IU" ENABLE;

