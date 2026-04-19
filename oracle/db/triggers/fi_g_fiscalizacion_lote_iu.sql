
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FISCALIZACION_LOTE_IU"
	for insert or update on fi_g_fiscalizacion_lote
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fsclzcion_lte is null then
				d := sq_fi_g_fiscalizacion_lote.nextval();
				:new.id_fsclzcion_lte := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_FISCALIZACION_LOTE_IU" ENABLE;

