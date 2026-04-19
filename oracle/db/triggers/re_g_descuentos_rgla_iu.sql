
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_DESCUENTOS_RGLA_IU"
	for insert or update on re_g_descuentos_regla
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dscnto_rgla is null then
				:new.id_dscnto_rgla := sq_re_g_descuentos_regla.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "RE_G_DESCUENTOS_RGLA_IU" ENABLE;

