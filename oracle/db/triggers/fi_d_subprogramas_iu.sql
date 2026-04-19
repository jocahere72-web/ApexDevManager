
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_SUBPROGRAMAS_IU"
	for insert or update on fi_d_subprogramas
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_sbprgrma is null then
				d := sq_fi_d_subprogramas.nextval();
				:new.id_sbprgrma := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_SUBPROGRAMAS_IU" ENABLE;

