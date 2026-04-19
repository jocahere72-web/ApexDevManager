
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_D_ENTIDAD_CLIENTE_MEDIO_IU"
  for insert or update on nt_d_entidad_cliente_medio
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_entdad_clnte_mdio is null then
  			select nvl( max(id_entdad_clnte_mdio), 0 ) + 1  into d
  			from nt_d_entidad_cliente_medio;
  			:new.id_entdad_clnte_mdio := d;
  		end if;
  	end if;
  end before each row;
end nt_d_entidad_cliente_medio_iu;








/
ALTER TRIGGER "NT_D_ENTIDAD_CLIENTE_MEDIO_IU" ENABLE;

