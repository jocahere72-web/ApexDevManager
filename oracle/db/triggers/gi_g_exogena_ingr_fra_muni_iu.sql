
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_EXOGENA_INGR_FRA_MUNI_IU"
	for insert on gi_g_exogena_ingr_fra_muni
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_exgna_ingr_fra_muni is null then
				d	:= sq_gi_g_exogena_ingr_fra_muni.nextval();
				:new.id_exgna_ingr_fra_muni := d;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GI_G_EXOGENA_INGR_FRA_MUNI_IU" ENABLE;

