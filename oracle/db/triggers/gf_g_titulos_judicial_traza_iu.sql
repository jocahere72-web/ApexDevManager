
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JUDICIAL_TRAZA_IU"
	for insert or update on gf_g_titulos_judicial_traza
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_trza is null then
				:new.id_ttlo_jdcial_trza := sq_gf_g_titulos_judicial_traza.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TITULOS_JUDICIAL_TRAZA_IU" ENABLE;

