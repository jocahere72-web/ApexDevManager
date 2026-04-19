
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_LIQUIDACIONES_DECL_ITE_IU" for insert or update on GI_G_LIQUIDACIONES_DECL_ITEM compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_LQDCION_DCL_ITEM is null then

				select nvl(max(ID_LQDCION_DCL_ITEM)+1, 1) into d from GI_G_LIQUIDACIONES_DECL_ITEM;
				:new.ID_LQDCION_DCL_ITEM := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "GI_G_LIQUIDACIONES_DECL_ITE_IU" ENABLE;

