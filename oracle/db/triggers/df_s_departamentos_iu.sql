
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_DEPARTAMENTOS_IU" for insert or update on DF_S_DEPARTAMENTOS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_DPRTMNTO is null then

				select nvl(max(ID_DPRTMNTO)+1, 1) into d from DF_S_DEPARTAMENTOS;
				:new.ID_DPRTMNTO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_S_DEPARTAMENTOS_IU" ENABLE;

