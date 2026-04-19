
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_PRSCRPCNES_VGNCS_VLDCN_IU"
  for insert or update on gf_g_prscrpcnes_vgncs_vldcn
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_vgnc_vldcn := sq_gf_g_prscrpcnes_vgncs_vldcn.nextval;
		end if;
	end before each row;
end gf_g_prscrpcnes_vgncs_vldcn_iu;






/
ALTER TRIGGER "GF_G_PRSCRPCNES_VGNCS_VLDCN_IU" ENABLE;

