
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_EXOGENA_DATOS_PRINCPAL_IU"
	for insert on gi_g_exogena_datos_princpal
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_exgna_dto_prncpal is null then
				d	:= sq_gi_g_exogena_datos_princpal.nextval();
				:new.id_exgna_dto_prncpal := d;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GI_G_EXOGENA_DATOS_PRINCPAL_IU" ENABLE;

