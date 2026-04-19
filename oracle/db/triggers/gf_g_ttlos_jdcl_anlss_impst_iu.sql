
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TTLOS_JDCL_ANLSS_IMPST_IU"
	for insert or update on gf_g_ttlos_jdcl_anlss_impst
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_anlsis_impsto is null then
				:new.id_ttlo_jdcial_anlsis_impsto := sq_gf_g_ttlos_jdcl_anlss_impst.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TTLOS_JDCL_ANLSS_IMPST_IU" ENABLE;

