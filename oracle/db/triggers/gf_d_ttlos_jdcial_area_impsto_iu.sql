
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_TTLOS_JDCIAL_AREA_IMPSTO_IU"
	for insert or update on gf_d_ttlos_jdcial_area_impsto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_area_impsto is null then
				:new.id_ttlo_jdcial_area_impsto := sq_gf_d_ttlos_jdcial_area_impsto.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_D_TTLOS_JDCIAL_AREA_IMPSTO_IU" ENABLE;

