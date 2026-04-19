
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TTLS_JDCL_DCMNT_ASCCN_IU"
	for insert or update on gf_g_ttls_jdcl_dcmnt_asccn
	compound trigger
	--d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_dcmnto_asccn is null then
				:new.id_ttlo_jdcial_dcmnto_asccn := sq_gf_g_ttls_jdcl_dcmnt_asccn.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TTLS_JDCL_DCMNT_ASCCN_IU" ENABLE;

