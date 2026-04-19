
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DECLARACIONES_CONTROL_IU"
for insert or update on GI_G_DECLARACIONES_CONTROL compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_DCLRCION_CNTROL is null then

				d := sq_gi_g_declaraciones_control.nextval;
				:new.ID_DCLRCION_CNTROL := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GI_G_DECLARACIONES_CONTROL_IU" ENABLE;

