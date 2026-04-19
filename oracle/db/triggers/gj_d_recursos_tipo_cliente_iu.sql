
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_D_RECURSOS_TIPO_CLIENTE_IU"
  for insert or update on gj_d_recursos_tipo_cliente
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_rcrso_tipo_clnte is null then
  			d := sq_gj_d_recursos_tipo_cliente.nextval();
  			:new.id_rcrso_tipo_clnte := d;
  		end if;
  	end if;
  end before each row;
end gj_d_recursos_tipo_cliente_iu;


/
ALTER TRIGGER "GJ_D_RECURSOS_TIPO_CLIENTE_IU" ENABLE;

