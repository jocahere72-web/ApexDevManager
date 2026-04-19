
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_PAISES_IU" for insert or update on DF_S_PAISES compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_PAIS is null then

				select nvl(max(ID_PAIS)+1, 1) into d from DF_S_PAISES;
				:new.ID_PAIS := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_S_PAISES_IU" ENABLE;

