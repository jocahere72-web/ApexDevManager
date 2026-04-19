
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FISCALIZACION_EXPDNTE_IU"
	for insert or update on fi_g_fiscalizacion_expdnte
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fsclzcion_expdnte is null then
				d := sq_fi_g_fiscalizacion_expdnte.nextval();
				:new.id_fsclzcion_expdnte := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_FISCALIZACION_EXPDNTE_IU" ENABLE;

