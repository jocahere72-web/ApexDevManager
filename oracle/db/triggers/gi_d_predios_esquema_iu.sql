
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PREDIOS_ESQUEMA_IU" for insert or update on GI_D_PREDIOS_ESQUEMA compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_PRDIO_ESQMA is null then

				select nvl(max(ID_PRDIO_ESQMA)+1, 1) into d from GI_D_PREDIOS_ESQUEMA;
				:new.ID_PRDIO_ESQMA := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "GI_D_PREDIOS_ESQUEMA_IU" ENABLE;

