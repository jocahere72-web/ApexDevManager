
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_INFO_EXOGENA_DETALLE_IU"
	for insert on gi_g_info_exogena_detalle
	compound trigger
	d number;

		before each row is
		begin
			if inserting then
				if :new.id_info_exo_det is null then
					d	:= sq_gi_g_info_exogena_detalle.nextval();
					:new.id_info_exo_det := d;
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "GI_G_INFO_EXOGENA_DETALLE_IU" ENABLE;

