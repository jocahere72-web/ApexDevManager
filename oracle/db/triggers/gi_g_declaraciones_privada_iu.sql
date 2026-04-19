
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DECLARACIONES_PRIVADA_IU"
for insert or update on GI_G_DECLARACIONES_PRIVADA compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_DCLRCION_PRVDA is null then

				d := sq_gi_g_declaraciones_privada.nextval;
				:new.ID_DCLRCION_PRVDA := d;

			end if;
		end if;
	end before each row;

end;



/
ALTER TRIGGER "GI_G_DECLARACIONES_PRIVADA_IU" ENABLE;

