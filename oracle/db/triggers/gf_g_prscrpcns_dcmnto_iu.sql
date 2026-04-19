
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_PRSCRPCNS_DCMNTO_IU"
  for insert or update on gf_g_prscrpcns_dcmnto
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dcmnto := sq_gf_g_prscrpcns_dcmnto.nextval;
		end if;
	end before each row;
end gf_g_prscrpcns_dcmnto_iu;






/
ALTER TRIGGER "GF_G_PRSCRPCNS_DCMNTO_IU" ENABLE;

