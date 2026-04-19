
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_PAGINA_WEB_IU"
  for insert or update on nt_g_pagina_web
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_pgna_web is null then
  			select nvl( max(id_pgna_web), 0 ) + 1  into d
  			from nt_g_pagina_web;
  			:new.id_pgna_web := d;
  		end if;
  	end if;
  end before each row;
end nt_g_pagina_web_iu;








/
ALTER TRIGGER "NT_G_PAGINA_WEB_IU" ENABLE;

