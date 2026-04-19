
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JDCL_FRCCNMNTO_IU"
	for insert or update on gf_g_titulos_jdcl_frccnmnto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_frccn is null then
				:new.id_ttlo_jdcial_frccn := sq_gf_g_titulos_jdcl_frccnmnto.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TITULOS_JDCL_FRCCNMNTO_IU" ENABLE;

