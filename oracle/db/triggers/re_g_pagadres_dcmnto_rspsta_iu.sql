
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_PAGADRES_DCMNTO_RSPSTA_IU"
	for insert or update on re_g_pagadres_dcmnto_rspsta
	compound  trigger

	before each row is
		begin
			if inserting then
				if :new.id_pgdor_dcmnto_rspsta is null then
					:new.id_pgdor_dcmnto_rspsta := sq_re_g_pagadres_dcmnto_rspsta.nextval;
				end if;
			end if;
		end before each row;
	end;




/
ALTER TRIGGER "RE_G_PAGADRES_DCMNTO_RSPSTA_IU" ENABLE;

