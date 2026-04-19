
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_IMPUESTOS_IU" for insert or update on DF_C_IMPUESTOS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_IMPSTO is null then

				select nvl(max(ID_IMPSTO)+1, 1) into d from DF_C_IMPUESTOS;
				:new.ID_IMPSTO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_IMPUESTOS_IU" ENABLE;

