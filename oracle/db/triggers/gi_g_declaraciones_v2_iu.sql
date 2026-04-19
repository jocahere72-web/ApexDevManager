
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DECLARACIONES_V2_IU"
for insert or update on gi_g_declaraciones_v2
compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dclrcion is null then

				d := sq_gi_g_declaraciones_v2.nextval;
				:new.id_dclrcion := d;

			end if;
		end if;
	end before each row;

end;


/
ALTER TRIGGER "GI_G_DECLARACIONES_V2_IU" ENABLE;

