
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_EXOGENA_RETENCIONES_IU"
	for insert on gi_g_exogena_retenciones
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_exgna_rtncion is null then
				d	:= sq_gi_g_exogena_retenciones.nextval();
				:new.id_exgna_rtncion := d;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GI_G_EXOGENA_RETENCIONES_IU" ENABLE;

