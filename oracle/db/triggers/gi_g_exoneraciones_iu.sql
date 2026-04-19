
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_EXONERACIONES_IU"
	for insert or update on gi_g_exoneraciones
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_exnrcion is null then

				select nvl(max(id_exnrcion)+1, 1) into d
				  from gi_g_exoneraciones;
				:new.id_exnrcion := d;

			end if;

		end if;
	end before each row;
end;




/
ALTER TRIGGER "GI_G_EXONERACIONES_IU" ENABLE;

