
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_MUNICIPIOS_IU" for insert or update on DF_S_MUNICIPIOS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_MNCPIO is null then

				select nvl(max(ID_MNCPIO)+1, 1) into d from DF_S_MUNICIPIOS;
				:new.ID_MNCPIO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_S_MUNICIPIOS_IU" ENABLE;

