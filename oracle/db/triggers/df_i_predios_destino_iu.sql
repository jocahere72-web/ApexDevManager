
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_PREDIOS_DESTINO_IU" for insert or update on DF_I_PREDIOS_DESTINO compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_PRDIO_DSTNO is null then

				select nvl(max(ID_PRDIO_DSTNO)+1, 1) into d from DF_I_PREDIOS_DESTINO;
				:new.ID_PRDIO_DSTNO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_I_PREDIOS_DESTINO_IU" ENABLE;

