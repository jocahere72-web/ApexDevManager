
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_CONDUCTA_CONCLUYENTE_IU"
  for insert or update on nt_g_conducta_concluyente
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_cndcta_cnclynte is null then
  			select nvl( max(id_cndcta_cnclynte), 0 ) + 1  into d
  			from nt_g_conducta_concluyente;
  			:new.id_cndcta_cnclynte := d;
  		end if;
  	end if;
  end before each row;
end nt_g_conducta_concluyente_iu;







/
ALTER TRIGGER "NT_G_CONDUCTA_CONCLUYENTE_IU" ENABLE;

