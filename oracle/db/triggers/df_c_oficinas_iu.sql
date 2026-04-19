
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_OFICINAS_IU" for insert or update on DF_C_OFICINAS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_OFCNA is null then

				select nvl(max(ID_OFCNA)+1, 1) into d from DF_C_OFICINAS;
				:new.ID_OFCNA := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_OFICINAS_IU" ENABLE;

