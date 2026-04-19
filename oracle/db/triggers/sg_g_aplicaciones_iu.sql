
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_APLICACIONES_IU"
	for insert or update on sg_g_aplicaciones
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_aplccion is null then
				select nvl( max(id_aplccion), 0 ) + 1  into d
				from sg_g_aplicaciones;
				:new.id_aplccion := d;
			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "SG_G_APLICACIONES_IU" ENABLE;

