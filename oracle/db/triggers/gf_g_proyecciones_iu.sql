
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_PROYECCIONES_IU"
	for insert or update on gf_g_proyecciones
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_pryccion is null then

				d := sq_gf_g_proyecciones.nextval;
				:new.id_pryccion := d;

			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "GF_G_PROYECCIONES_IU" ENABLE;

