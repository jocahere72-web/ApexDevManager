
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_CARGOS_IU" for insert or update on DF_C_CARGOS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_CRGO is null then

				select nvl(max(ID_CRGO)+1, 1) into d from DF_C_CARGOS;
				:new.ID_CRGO := d;

			end if;
		end if;
	end before each row;

end;






/
ALTER TRIGGER "DF_C_CARGOS_IU" ENABLE;

