
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_DESCUENTOS_FUNCION_IU"
	for insert or update on re_g_descuentos_funcion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dscnto_fncion is null then
				:new.id_dscnto_fncion := sq_re_g_descuentos_funcion.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "RE_G_DESCUENTOS_FUNCION_IU" ENABLE;

