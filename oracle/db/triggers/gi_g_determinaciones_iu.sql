
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DETERMINACIONES_IU"
	for insert or update on gi_g_determinaciones
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dtrmncion is null then
                :new.id_dtrmncion := sq_gi_g_determinaciones.nextval;
			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "GI_G_DETERMINACIONES_IU" ENABLE;

