
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_TITULOS_JUDICIAL_AREA_IU"
	for insert or update on gf_d_titulos_judicial_area
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_area is null then
				:new.id_ttlo_jdcial_area := sq_gf_d_titulos_judicial_area.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_D_TITULOS_JUDICIAL_AREA_IU" ENABLE;

