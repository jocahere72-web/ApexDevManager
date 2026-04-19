
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_CONCEPTOS_IU" for insert or update on DF_I_CONCEPTOS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_CNCPTO is null then

				select nvl(max(ID_CNCPTO)+1, 1) into d from DF_I_CONCEPTOS;
				:new.ID_CNCPTO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_I_CONCEPTOS_IU" ENABLE;

