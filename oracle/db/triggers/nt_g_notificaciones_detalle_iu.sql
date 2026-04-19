
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_NOTIFICACIONES_DETALLE_IU"
  for insert or update on nt_g_notificaciones_detalle
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_ntfccion_dtlle is null then
  			select nvl( max(id_ntfccion_dtlle), 0 ) + 1  into d
  			from nt_g_notificaciones_detalle;
  			:new.id_ntfccion_dtlle := d;
  		end if;
  	end if;
  end before each row;
end nt_g_notificaciones_detalle_iu;








/
ALTER TRIGGER "NT_G_NOTIFICACIONES_DETALLE_IU" ENABLE;

