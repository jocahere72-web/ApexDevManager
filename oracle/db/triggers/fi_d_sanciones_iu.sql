
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_SANCIONES_IU"
	for insert or update on fi_d_sanciones
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_sncion is null then
				d := sq_fi_d_sanciones.nextval();
				:new.id_sncion := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_SANCIONES_IU" ENABLE;

