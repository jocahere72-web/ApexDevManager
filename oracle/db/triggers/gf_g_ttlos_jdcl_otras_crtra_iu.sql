
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TTLOS_JDCL_OTRAS_CRTRA_IU"
	for insert or update on gf_g_ttlos_jdcl_otras_crtra
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcl_otrs_crtra is null then
				:new.id_ttlo_jdcl_otrs_crtra := sq_gf_g_ttlos_jdcl_otras_crtra.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TTLOS_JDCL_OTRAS_CRTRA_IU" ENABLE;

