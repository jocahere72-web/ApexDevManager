
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_PREDIOS_USO_SUELO_IU" for insert or update on DF_C_PREDIOS_USO_SUELO compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_PRDIO_USO_SLO is null then

				select nvl(max(ID_PRDIO_USO_SLO)+1, 1) into d from DF_C_PREDIOS_USO_SUELO;
				:new.ID_PRDIO_USO_SLO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_PREDIOS_USO_SUELO_IU" ENABLE;

