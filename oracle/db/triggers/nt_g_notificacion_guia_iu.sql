
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_NOTIFICACION_GUIA_IU"
  for insert or update on nt_g_notificacion_guia
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_ntfccion_guia is null then
  			select nvl( max(id_ntfccion_guia), 0 ) + 1  into d
  			from nt_g_notificacion_guia;
  			:new.id_ntfccion_guia := d;
  		end if;
  	end if;
  end before each row;
end nt_g_notificacion_guia_iu;







/
ALTER TRIGGER "NT_G_NOTIFICACION_GUIA_IU" ENABLE;

