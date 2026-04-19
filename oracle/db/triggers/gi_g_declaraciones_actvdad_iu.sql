
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DECLARACIONES_ACTVDAD_IU"
for insert or update on gi_g_declaraciones_actvdad
compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dclrcion_actvdad is null then

				d := sq_gi_g_declaraciones_actvdad.nextval;
				:new.id_dclrcion_actvdad := d;

			end if;
		end if;
	end before each row;

end;


/
ALTER TRIGGER "GI_G_DECLARACIONES_ACTVDAD_IU" ENABLE;

