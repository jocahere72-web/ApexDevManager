
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DETERMINACION_SUJETO_IU"
	for insert or update on gi_g_determinacion_sujeto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dtrmncion_sjto is null then
			:new.id_dtrmncion_sjto := sq_gi_g_determinacion_sujeto.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GI_G_DETERMINACION_SUJETO_IU" ENABLE;

