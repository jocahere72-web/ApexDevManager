
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_D_REQUERIMIENTO_ITEM_IU"
	for insert or update on ti_d_requerimiento_item
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_rqrmnto_item is null then
				:new.id_rqrmnto_item := sq_ti_d_requerimiento_item.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "TI_D_REQUERIMIENTO_ITEM_IU" ENABLE;

