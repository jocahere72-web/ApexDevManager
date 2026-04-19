
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_PRSCRPCNES_MTVOS_AJSTS_IU"
  for insert or update on gf_d_prscrpcnes_mtvos_ajsts
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_prscrpcion_mtvo_ajste := sq_gf_d_prscrpcnes_mtvos_ajsts.nextval;
		end if;
	end before each row;
end gf_d_prscrpcnes_mtvos_ajsts_iu;






/
ALTER TRIGGER "GF_D_PRSCRPCNES_MTVOS_AJSTS_IU" ENABLE;

