
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DETERMINACION_DETALLE_IU"
	for insert or update on gi_g_determinacion_detalle
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dtrmncion_dtlle is null then
			:new.id_dtrmncion_dtlle := sq_gi_g_determinacion_detalle.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GI_G_DETERMINACION_DETALLE_IU" ENABLE;

