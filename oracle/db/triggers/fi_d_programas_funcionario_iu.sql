
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_PROGRAMAS_FUNCIONARIO_IU"
	for insert or update on fi_d_programas_funcionario
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_prgrma_fncnrio is null then
				d := sq_fi_d_programas_funcionario.nextval();
				:new.id_prgrma_fncnrio := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_PROGRAMAS_FUNCIONARIO_IU" ENABLE;

