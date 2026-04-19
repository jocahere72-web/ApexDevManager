
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_DESCUENTOS_CONDICION_IU"
	for insert or update on re_g_descuentos_condicion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dscnto_cndcion is null then
				:new.id_dscnto_cndcion := sq_re_g_descuentos_condicion.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "RE_G_DESCUENTOS_CONDICION_IU" ENABLE;

