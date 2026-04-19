
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_PROFESIONES_IU" for insert or update on DF_S_PROFESIONES compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_PRFSION is null then

				select nvl(max(ID_PRFSION)+1, 1) into d from DF_S_PROFESIONES;
				:new.ID_PRFSION := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_S_PROFESIONES_IU" ENABLE;

