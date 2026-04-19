
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_EDICTO_IU"
  for insert or update on nt_g_edicto
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_edcto is null then
  			select nvl( max(id_edcto), 0 ) + 1  into d
  			from nt_g_edicto;
  			:new.id_edcto := d;
  		end if;
  	end if;
  end before each row;
end nt_g_edicto_iu;








/
ALTER TRIGGER "NT_G_EDICTO_IU" ENABLE;

