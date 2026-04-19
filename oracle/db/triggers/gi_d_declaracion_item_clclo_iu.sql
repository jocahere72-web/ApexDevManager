
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DECLARACION_ITEM_CLCLO_IU" for insert or update on "GI_D_DECLARACIONES_ITEM_CLCLO" compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_DCLRCION_ITEM_CLCLO is null then
				select nvl(max(ID_DCLRCION_ITEM_CLCLO)+1, 1) into d from GI_D_DECLARACIONES_ITEM_CLCLO;
				:new.ID_DCLRCION_ITEM_CLCLO := d;
			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "GI_D_DECLARACION_ITEM_CLCLO_IU" ENABLE;

