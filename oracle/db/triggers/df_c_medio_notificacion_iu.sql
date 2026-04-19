
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_MEDIO_NOTIFICACION_IU"
	for insert or update on df_c_medio_notificacion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_mdio_ntfccion is null then
				select nvl( max(id_mdio_ntfccion), 0 ) + 1  into d
				from df_c_medio_notificacion;
				:new.id_mdio_ntfccion := d;
			end if;
		end if;
	end before each row;
end df_c_medio_notificacion_iu;









/
ALTER TRIGGER "DF_C_MEDIO_NOTIFICACION_IU" ENABLE;

