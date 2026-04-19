
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_D_MEDIO_IU"
  for insert or update on nt_d_medio
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_mdio is null then
  			select nvl( max(id_mdio), 0 ) + 1  into d
  			from nt_d_medio;
  			:new.id_mdio := d;
  		end if;
  	end if;
  end before each row;
end nt_d_medio_iu;








/
ALTER TRIGGER "NT_D_MEDIO_IU" ENABLE;

