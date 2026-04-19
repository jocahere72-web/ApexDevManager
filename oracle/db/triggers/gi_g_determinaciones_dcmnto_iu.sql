
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DETERMINACIONES_DCMNTO_IU"
	for insert or update on gi_g_determinaciones_dcmnto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dtrmncion_dcmnto is null then
				:new.id_dtrmncion_dcmnto := sq_gi_g_determinaciones_dcmnto.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GI_G_DETERMINACIONES_DCMNTO_IU" ENABLE;

