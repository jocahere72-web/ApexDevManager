
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DECLARACIONES_DETALLE__IU"
for insert or update on GI_G_DECLARACIONES_DETALLE_OL compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_DCLRCION_DTLLE_OL is null then

				d := sq_gi_g_declaraciones_detalle_ol.nextval;
				:new.ID_DCLRCION_DTLLE_OL := d;

			end if;
		end if;
	end before each row;

end;




/
ALTER TRIGGER "GI_G_DECLARACIONES_DETALLE__IU" ENABLE;

