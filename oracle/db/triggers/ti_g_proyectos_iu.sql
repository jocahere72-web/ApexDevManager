
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_PROYECTOS_IU"
	for insert or update on ti_g_proyectos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prycto is null then
				select nvl( max(id_prycto), 0 ) + 1  into :new.id_prycto
				from ti_g_proyectos;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_G_PROYECTOS_IU" ENABLE;

