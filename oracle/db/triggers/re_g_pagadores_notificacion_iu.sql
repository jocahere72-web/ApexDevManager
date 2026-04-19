
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_PAGADORES_NOTIFICACION_IU"
		for insert on re_g_pagadores_notificacion
		compound trigger
		d number;

		before each row is
		begin
			if inserting then
				if :new.id_pgdor_ntfccion is null then
					d := sq_re_g_pagadores_notificacion.nextval;
					:new.id_pgdor_ntfccion := d;
					:new.fcha_ntfccion := systimestamp;

				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "RE_G_PAGADORES_NOTIFICACION_IU" ENABLE;

