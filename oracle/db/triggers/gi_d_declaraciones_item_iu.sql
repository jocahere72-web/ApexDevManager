
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DECLARACIONES_ITEM_IU" for insert or update on GI_D_DECLARACIONES_ITEM compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_DCLRCION_ITEM is null then

				select nvl(max(ID_DCLRCION_ITEM)+1, 1) into d from GI_D_DECLARACIONES_ITEM;
				:new.ID_DCLRCION_ITEM := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "GI_D_DECLARACIONES_ITEM_IU" ENABLE;

