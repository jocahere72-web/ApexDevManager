
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_PROYECCIONES_CARTERA_IU"
	for insert or update on gf_g_proyecciones_cartera
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_pryccion_crtra is null then

				d := sq_gf_g_proyecciones_cartera.nextval;
				:new.id_pryccion_crtra := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_PROYECCIONES_CARTERA_IU" ENABLE;

