
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DECLARACIONES_FIRMA_IU"
for insert or update on GI_G_DECLARACIONES_FIRMA compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_DCLRCION_FRMA is null then

				d := sq_gi_g_declaraciones_firma.nextval;
				:new.ID_DCLRCION_FRMA := d;

			end if;
		end if;
	end before each row;

end;





/
ALTER TRIGGER "GI_G_DECLARACIONES_FIRMA_IU" ENABLE;

