
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_PRSCRPCNES_OBSRVCION_IU"
  for insert or update on gf_g_prscrpcnes_obsrvcion
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_obsrvcion := sq_gf_g_prscrpcnes_obsrvcion.nextval;
		end if;
		if updating then
			:new.fcha_ultma_actlzcion := systimestamp;
		end if;
	end before each row;
end gf_g_prscrpcnes_obsrvcion_iu;






/
ALTER TRIGGER "GF_G_PRSCRPCNES_OBSRVCION_IU" ENABLE;

