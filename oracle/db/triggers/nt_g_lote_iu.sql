
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_LOTE_IU"
  for insert or update on nt_g_lote
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_lte is null then
  			select nvl( max(id_lte), 0 ) + 1  into d
  			from nt_g_lote;
  			:new.id_lte := d;
  		end if;
  	end if;
  end before each row;
end nt_g_lote_iu;







/
ALTER TRIGGER "NT_G_LOTE_IU" ENABLE;

