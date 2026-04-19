
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_PRENSA_IU"
  for insert or update on nt_g_prensa
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_prnsa is null then
  			select nvl( max(id_prnsa), 0 ) + 1  into d
  			from nt_g_prensa;
  			:new.id_prnsa := d;
  		end if;
  	end if;
  end before each row;
end nt_g_prensa_iu;








/
ALTER TRIGGER "NT_G_PRENSA_IU" ENABLE;

