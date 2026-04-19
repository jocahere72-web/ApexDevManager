
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_REQUERIMIENTOS_IU"
	for insert or update on ti_g_requerimientos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rqrmnto is null then
				select nvl( max(id_rqrmnto), 0 ) + 1  into :new.id_rqrmnto
				from ti_g_requerimientos;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_G_REQUERIMIENTOS_IU" ENABLE;

