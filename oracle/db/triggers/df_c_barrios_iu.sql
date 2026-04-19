
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_BARRIOS_IU"
for insert or update on DF_C_BARRIOS
compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_BRRIO is null then

				select nvl(max(ID_BRRIO)+1, 1) into d from DF_C_BARRIOS;
				:new.ID_BRRIO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_BARRIOS_IU" ENABLE;

