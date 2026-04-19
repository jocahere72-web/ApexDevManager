
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_DECRETOS_IU" for insert or update on DF_C_DECRETOS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_DCRTO is null then

				select nvl(max(ID_DCRTO)+1, 1) into d from DF_C_DECRETOS;
				:new.ID_DCRTO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_DECRETOS_IU" ENABLE;

