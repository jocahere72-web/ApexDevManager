
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_TITULOS_JDCIAL_CNFGRCN_IU"
	for insert or update on gf_d_titulos_jdcial_cnfgrcn
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_cnfgrcion is null then
				:new.id_ttlo_jdcial_cnfgrcion := sq_gf_d_titulos_jdcial_cnfgrcn.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_D_TITULOS_JDCIAL_CNFGRCN_IU" ENABLE;

