
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JDCIAL_ANLSIS_IU"
	for insert or update on gf_g_titulos_jdcial_anlsis
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_anlsis is null then
				:new.id_ttlo_jdcial_anlsis := sq_gf_g_titulos_jdcial_anlsis.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TITULOS_JDCIAL_ANLSIS_IU" ENABLE;

