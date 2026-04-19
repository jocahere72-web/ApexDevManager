
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FISCALIZACION_SANCION_IU"
	for insert or update on fi_g_fiscalizacion_sancion
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fsclzcion_sncion is null then
				d := sq_fi_g_fiscalizacion_sancion.nextval();
				:new.id_fsclzcion_sncion := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_FISCALIZACION_SANCION_IU" ENABLE;

