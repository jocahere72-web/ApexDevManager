
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_TAREAS_IU"
	for insert or update on ti_g_tareas
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_trea is null then
				select nvl( max(id_trea), 0 ) + 1  into :new.id_trea
				from ti_g_tareas;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_G_TAREAS_IU" ENABLE;

