
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_MENU_IMPUESTO_IU"
	for insert or update on sg_g_menu_impuesto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_mnu_impsto is null then
				:new.id_mnu_impsto := sq_sg_g_menu_impuesto.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "SG_G_MENU_IMPUESTO_IU" ENABLE;

