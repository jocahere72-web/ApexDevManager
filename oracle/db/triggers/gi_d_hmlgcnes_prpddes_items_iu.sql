
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_HMLGCNES_PRPDDES_ITEMS_IU"
  for insert or update on gi_d_hmlgcnes_prpddes_items
  compound trigger
	before each row is
	begin
		if (:new.fla is null) then
			:new.fla := 1;
		end if;
		if inserting then
			:new.id_hmlgcion_prpdad_item := sq_gi_d_hmlgcnes_prpddes_items.nextval;
		end if;
	end before each row;
end gi_d_hmlgcnes_prpddes_items_iu;






/
ALTER TRIGGER "GI_D_HMLGCNES_PRPDDES_ITEMS_IU" ENABLE;

