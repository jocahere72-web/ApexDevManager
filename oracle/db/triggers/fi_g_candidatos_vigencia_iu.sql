
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_CANDIDATOS_VIGENCIA_IU"
	for insert or update on fi_g_candidatos_vigencia
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_cnddto_vgncia is null then
				d := sq_fi_g_candidatos_vigencia.nextval();
				:new.id_cnddto_vgncia := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_CANDIDATOS_VIGENCIA_IU" ENABLE;

