
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_D_ACTO_MEDIO_ORDEN_IU"
  for insert or update on nt_d_acto_medio_orden
  compound trigger
  d number;

   v_id_mdio   			nt_d_acto_medio_orden.id_mdio%type;
  v_id_envio_prgrmdo   	nt_d_acto_medio_orden.id_envio_prgrmdo%type;
  v_cdgo_mdio			nt_d_medio.cdgo_mdio%type;


  before each row is
  begin
  	if inserting then
  		if :new.id_acto_mdio_orden is null then
  			select nvl( max(id_acto_mdio_orden), 0 ) + 1  into d
  			from nt_d_acto_medio_orden;
  			:new.id_acto_mdio_orden := d;
  		end if;
  	end if;

	if inserting or updating then

		select 	cdgo_mdio
		into	v_cdgo_mdio
		from 	nt_d_medio
		where 	id_mdio = :new.id_mdio;

		if v_cdgo_mdio = 'CEL' and :new.id_envio_prgrmdo is null then
			  raise_application_error(-20001, ' El medio de envio Correo Electronido debe tener un  envio programado asignado');
		end if;
	end if;

  end before each row;

end nt_d_acto_medio_orden_iu;


/
ALTER TRIGGER "NT_D_ACTO_MEDIO_ORDEN_IU" ENABLE;

