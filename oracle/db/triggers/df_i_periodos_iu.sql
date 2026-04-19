
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_PERIODOS_IU" for insert or update on DF_I_PERIODOS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_PRDO is null then

				select nvl(max(ID_PRDO)+1, 1) into d from DF_I_PERIODOS;
				:new.ID_PRDO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_I_PERIODOS_IU" ENABLE;

