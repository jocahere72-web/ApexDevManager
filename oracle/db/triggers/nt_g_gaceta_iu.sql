
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_GACETA_IU"
  for insert or update on nt_g_gaceta
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_gcta is null then
  			select nvl( max(id_gcta), 0 ) + 1  into d
  			from nt_g_gaceta;
  			:new.id_gcta := d;
  		end if;
  	end if;
  end before each row;
end nt_g_gaceta_iu;







/
ALTER TRIGGER "NT_G_GACETA_IU" ENABLE;

