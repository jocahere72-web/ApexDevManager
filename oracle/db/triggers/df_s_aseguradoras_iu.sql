
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_ASEGURADORAS_IU" for insert or update on DF_S_ASEGURADORAS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_ASGRDRA is null then

				select nvl(max(ID_ASGRDRA)+1, 1) into d from DF_S_ASEGURADORAS;
				:new.ID_ASGRDRA := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_S_ASEGURADORAS_IU" ENABLE;

