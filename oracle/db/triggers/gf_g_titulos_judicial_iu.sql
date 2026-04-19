
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JUDICIAL_IU"
	for insert or update on gf_g_titulos_judicial
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial is null then
				:new.id_ttlo_jdcial := sq_gf_g_titulos_judicial.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TITULOS_JUDICIAL_IU" ENABLE;

