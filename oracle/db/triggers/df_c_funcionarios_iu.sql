
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_FUNCIONARIOS_IU" for insert or update on DF_C_FUNCIONARIOS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_FNCNRIO is null then

				select nvl(max(ID_FNCNRIO)+1, 1) into d from DF_C_FUNCIONARIOS;
				:new.ID_FNCNRIO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_FUNCIONARIOS_IU" ENABLE;

