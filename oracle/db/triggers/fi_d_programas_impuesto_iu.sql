
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_PROGRAMAS_IMPUESTO_IU"
	for insert or update on fi_d_programas_impuesto
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_prgrma_impsto is null then
				d := sq_fi_d_programas_impuesto.nextval();
				:new.id_prgrma_impsto := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_PROGRAMAS_IMPUESTO_IU" ENABLE;

