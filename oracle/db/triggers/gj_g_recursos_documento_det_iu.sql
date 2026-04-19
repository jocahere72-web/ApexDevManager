
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_G_RECURSOS_DOCUMENTO_DET_IU"
	for insert on gj_g_recursos_documento_det
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_rcrso_dcmnto_det is null then
				d := sq_gj_g_recursos_documento_det.nextval();
				:new.id_rcrso_dcmnto_det := d;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GJ_G_RECURSOS_DOCUMENTO_DET_IU" ENABLE;

