
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_PAGADORES_IU"
	for insert on re_g_pagadores
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_PGDOR is null then

                d := sq_re_g_pagadores.nextval;
				:new.ID_PGDOR := d;

			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "RE_G_PAGADORES_IU" ENABLE;

