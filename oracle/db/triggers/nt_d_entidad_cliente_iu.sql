
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_D_ENTIDAD_CLIENTE_IU"
  for insert or update on nt_d_entidad_cliente
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_entdad_clnte is null then
  			select nvl( max(id_entdad_clnte), 0 ) + 1  into d
  			from nt_d_entidad_cliente;
  			:new.id_entdad_clnte := d;
  		end if;
  	end if;
  end before each row;
end nt_d_entidad_cliente_iu;








/
ALTER TRIGGER "NT_D_ENTIDAD_CLIENTE_IU" ENABLE;

