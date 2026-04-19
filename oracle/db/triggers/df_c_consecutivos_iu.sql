
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_CONSECUTIVOS_IU" for insert or update on DF_C_CONSECUTIVOS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_CNSCTVO is null then

				select nvl(max(ID_CNSCTVO)+1, 1) into d from DF_C_CONSECUTIVOS;
				:new.ID_CNSCTVO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_CONSECUTIVOS_IU" ENABLE;

