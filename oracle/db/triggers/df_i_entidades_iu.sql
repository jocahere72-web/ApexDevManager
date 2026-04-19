
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_ENTIDADES_IU" for insert or update on DF_I_ENTIDADES compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_ENTDAD is null then

				select nvl(max(ID_ENTDAD)+1, 1) into d from DF_I_ENTIDADES;
				:new.ID_ENTDAD := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_I_ENTIDADES_IU" ENABLE;

