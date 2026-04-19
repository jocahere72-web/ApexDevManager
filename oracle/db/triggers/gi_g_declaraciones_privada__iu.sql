
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DECLARACIONES_PRIVADA__IU"
for insert or update on GI_G_DECLARACIONES_PRIVADA_OL compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_DCLRCION_PRVDA_OL is null then

				d := sq_gi_g_declaraciones_privada_ol.nextval;
				:new.ID_DCLRCION_PRVDA_OL := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GI_G_DECLARACIONES_PRIVADA__IU" ENABLE;

