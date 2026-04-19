
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_CANDIDATOS_FUNCIONARIO_IU"
	for insert or update on fi_g_candidatos_funcionario
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_cnddto_fncnrio is null then
				d := sq_fi_g_candidatos_funcionario.nextval();
				:new.id_cnddto_fncnrio := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_CANDIDATOS_FUNCIONARIO_IU" ENABLE;

