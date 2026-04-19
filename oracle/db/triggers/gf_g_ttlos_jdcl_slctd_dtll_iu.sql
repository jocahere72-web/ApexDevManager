
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TTLOS_JDCL_SLCTD_DTLL_IU"
	for insert or update on gf_g_ttlos_jdcl_slctd_dtll
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_slctud_dtlle is null then
				:new.id_ttlo_jdcial_slctud_dtlle := sq_gf_g_ttlos_jdcl_slctd_dtll.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TTLOS_JDCL_SLCTD_DTLL_IU" ENABLE;

