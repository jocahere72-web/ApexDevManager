
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TTLOS_JDCL_DCMNT_SLCTD_IU"
	for insert or update on gf_g_ttlos_jdcl_dcmnt_slctd
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_dcmnto_slctud is null then
				:new.id_ttlo_jdcial_dcmnto_slctud := sq_gf_g_ttlos_jdcl_dcmnt_slctd.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TTLOS_JDCL_DCMNT_SLCTD_IU" ENABLE;

