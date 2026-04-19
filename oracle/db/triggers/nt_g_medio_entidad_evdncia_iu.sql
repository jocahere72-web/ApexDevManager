
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_MEDIO_ENTIDAD_EVDNCIA_IU"
  for insert or update on genesys.nt_g_medio_entidad_evdncia
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_ntfcion_mdio_evdncia is null then
  			select nvl( max(id_ntfcion_mdio_evdncia), 0 ) + 1  into d
  			from nt_g_medio_entidad_evdncia;
  			:new.id_ntfcion_mdio_evdncia := d;
  		end if;
  	end if;
  end before each row;
end nt_g_medio_entidad_evdncia_iu;








/
ALTER TRIGGER "NT_G_MEDIO_ENTIDAD_EVDNCIA_IU" ENABLE;

