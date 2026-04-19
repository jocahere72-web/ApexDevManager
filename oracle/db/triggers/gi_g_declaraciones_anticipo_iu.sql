
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DECLARACIONES_ANTICIPO_IU"
for insert or update on gi_g_declaraciones_anticipo
compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dclrcion_anticipo is null then

				d := sq_gi_g_declaraciones_anticipo.nextval;
				:new.id_dclrcion_anticipo := d;

			end if;
		end if;
	end before each row;

end;


/
ALTER TRIGGER "GI_G_DECLARACIONES_ANTICIPO_IU" ENABLE;

