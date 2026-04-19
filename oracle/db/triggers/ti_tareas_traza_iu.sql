
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_TAREAS_TRAZA_IU"
	for insert or update on ti_tareas_traza
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_trea_trza is null then
				select nvl( max(id_trea_trza), 0 ) + 1  into :new.id_trea_trza
				from ti_tareas_traza;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_TAREAS_TRAZA_IU" ENABLE;

